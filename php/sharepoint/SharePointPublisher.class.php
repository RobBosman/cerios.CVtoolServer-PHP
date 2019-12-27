<?php

require_once realpath(dirname(__FILE__) . '/../docx/CvGenerator.class.php');
Bootstrap::import('nl.bransom.auth.OpenIDConnect.HttpUtil');
Bootstrap::import('nl.bransom.http.HttpConfig');
Bootstrap::import('nl.bransom.http.HttpResponseCodes');
Bootstrap::import('nl.bransom.http.InternetMediaTypes');

/**
 * Description of SharePointPublisher
 *
 * @author Rob Bosman
 */
class SharePointPublisher {

    // @see https://graph.microsoft.com/v1.0/sites/valorinl.sharepoint.com:/sites/Kantoor/CV_databank:/drives
    const MICROSOFT_GRAPH_URL = 'https://graph.microsoft.com/v1.0';
    const SHAREPOINT_URL = 'https://valorinl.sharepoint.com/sites/Kantoor/CV_databank';
    const SHAREPOINT_DRIVE_ID = 'b!gLiE74guVky6WpGe8UeHoQpRlL29QE1DlsiezwivnSPlIbtUWgXZQ4RgG4YWa77n'; // 'CV Databank'
    const TAG_MEDIATYPE_DOCX = 'docx';

    public function publish() {
        // Copy JWT from the request header.
        $jwt = HttpUtil::getJWTFromHeader();
        $userName = $this->getUserNameFromJwt($jwt);
        
        // Get the cv.docx from the REST server.
        $cvGenerator = new CvGenerator($jwt);
        $documentName = $cvGenerator->getOutputFileName();

        // Find the target file (and folder) in SharePoint to store the cv document.
        $searchJson = $this->findSharePointFolder($jwt, $userName, $documentName);

        // Get the id of the target folder and check if the target file already exists.
        $sharePointFolderID = NULL;
        $sharePointFileID = NULL;
        foreach ($searchJson->value as $value) {
            if (isset($value->file) && $value->name == $documentName) {
                $sharePointFileID = $value->id;
            } else if (isset($value->folder) && $value->name == $userName) {
                $sharePointFolderID = $value->id;
            }
        }
        
        // If the target file does not exist, then create a placeholder for it in SharePoint.
        if ($sharePointFileID == NULL) {
            if ($sharePointFolderID == NULL) {
                throw new Exception("Ik kan SharePoint folder '$userName' in de 'CV Databank' niet vinden."
                        . " Upload het bestand '$documentName' zelf even naar de juiste locatie in SharePoint,"
                        . " dan kan ik het de volgende keer zelf! :-)"
                        . "<a target='blank' href='" . self::SHAREPOINT_URL . "'><u>" . self::SHAREPOINT_URL . "</u></a>",
                        HttpResponseCodes::HTTP_NOT_FOUND);
            }
            $sharePointFileID = $this->createSharePointFile($jwt, $documentName, $sharePointFolderID);
        }
        
        // Upload the new cv content to SharePoint.
        $this->uploadSharePointFile($jwt, $sharePointFileID, $documentName, $cvGenerator->getContentFilename());

        return "'$documentName' is opgeslagen in SharePoint folder '$userName' in de 'CV Databank'";
    }

    private function getUserNameFromJwt($jwt) {
        $jwtParts = explode('.', $jwt);
        if (count($jwtParts) !== 3) {
          throw new UnexpectedValueException('Incorrect JWT format.');
        }
        $jwtPayload = json_decode(base64_decode($jwtParts[1]));
        return $jwtPayload->name;
    }
    
    private function findSharePointFolder($jwt, $userName, $documentName) {
        $sharePointSearchURL = self::MICROSOFT_GRAPH_URL
                . "/drives/" . self::SHAREPOINT_DRIVE_ID
                . "/root/search(q='" . urlencode($userName) . "')"
                . "?select=name,id,folder,file";
        $responseJson = NULL;
        $responseCode = $this->getUrlToJson($sharePointSearchURL, $jwt, $responseJson);
        if (!HttpResponseCodes::isSuccessCode($responseCode)) {
            throw new Exception("Er ging iets mis met de verbinding met SharePoint."
                    . " Upload het bestand '$documentName' zelf even naar de juiste locatie in SharePoint,"
                    . " zie <a target='blank' href='" . self::SHAREPOINT_URL . "'><u>" . self::SHAREPOINT_URL . "</u></a>",
                    $responseCode);
        }
        return $responseJson;
    }

    private function getUrlToJson($url, $jwt, &$downloadedJson) {
        error_reporting(E_ERROR);

        $curl = curl_init($url);
        HttpConfig::setHttpProxy($curl, $url);
        curl_setopt($curl, CURLOPT_CONNECTTIMEOUT, 5); // 5 seconds
        curl_setopt($curl, CURLOPT_RETURNTRANSFER, TRUE);
        curl_setopt($curl, CURLOPT_SSL_VERIFYPEER, TRUE);
        curl_setopt($curl, CURLOPT_SSL_VERIFYHOST, 2);
        curl_setopt($curl, CURLOPT_HTTPHEADER, array(
            "Authorization: Bearer $jwt",
            "Accept: application/json"));
        $downloadedContent = curl_exec($curl);
        $responseError = curl_error($curl);
        $responseCode = curl_getinfo($curl, CURLINFO_HTTP_CODE);
        curl_close($curl);
        
        $lastError = error_get_last();
        error_reporting(E_ALL);
        if ((isset($lastError['message'])) and (stripos($lastError['message'], 'magic_quotes_gpc') === FALSE)) {
            throw new Exception("Er ging iets mis met de verbinding met SharePoint: $responseError - " . $lastError['message'],
                    HttpResponseCodes::HTTP_INTERNAL_SERVER_ERROR);
        }

        if (HttpResponseCodes::isSuccessCode($responseCode)) {
            $downloadedJson = json_decode($downloadedContent);
        }
        return $responseCode;
    }
    
    private function createSharePointFile($jwt, $documentName, $sharePointFolderID) {
        // Create a place-holder for the cv document.
        $sharePointAddURL = self::MICROSOFT_GRAPH_URL
                . "/drives/" . self::SHAREPOINT_DRIVE_ID
                . "/items/$sharePointFolderID/children";
        $postJson = "{'name':'$documentName','file':{}}";
        $responseJson = NULL;
        $responseCode = $this->postUrlToJson($sharePointAddURL, $jwt, $postJson, $responseJson);
        if (!HttpResponseCodes::isSuccessCode($responseCode)) {
            throw new Exception("Er ging iets mis bij het aanmaken van het document '$documentName' in SharePoint."
                    . " Upload het bestand '$documentName' zelf even naar de juiste locatie in SharePoint,"
                    . " zie <a target='blank' href='" . self::SHAREPOINT_URL . "'><u>" . self::SHAREPOINT_URL . "</u></a>",
                    $responseCode);
        }
        // Get the ID of the newly created SharePoint document.
        if (!isset($responseJson->id)) {
            throw new Exception("Er is iets misgegaan bij het aanmaken van het document '$documentName' in SharePoint."
                    . " Upload het bestand '$documentName' zelf even naar de juiste locatie in SharePoint,"
                    . " zie <a target='blank' href='" . self::SHAREPOINT_URL . "'><u>" . self::SHAREPOINT_URL . "</u></a>",
                    $responseCode);
        }
        return $responseJson->id;
    }

    private function postUrlToJson($url, $jwt, $postJson, &$downloadedJson) {
        error_reporting(E_ERROR);

        $curl = curl_init($url);
        HttpConfig::setHttpProxy($curl, $url);
        curl_setopt($curl, CURLOPT_CONNECTTIMEOUT, 5); // 5 seconds
        curl_setopt($curl, CURLOPT_RETURNTRANSFER, TRUE);
        curl_setopt($curl, CURLOPT_SSL_VERIFYPEER, TRUE);
        curl_setopt($curl, CURLOPT_SSL_VERIFYHOST, 2);
        curl_setopt($curl, CURLOPT_POSTFIELDS, $postJson);
        curl_setopt($curl, CURLOPT_HTTPHEADER, array(
            "Authorization: Bearer $jwt",
            "Content-Type: application/json",
            "Content-Length: " . strlen($postJson),
            "Accept: application/json"));
        $downloadedContent = curl_exec($curl);
        $responseError = curl_error($curl);
        $responseCode = curl_getinfo($curl, CURLINFO_HTTP_CODE);
        curl_close($curl);
        
        $lastError = error_get_last();
        error_reporting(E_ALL);
        if ((isset($lastError['message'])) and (stripos($lastError['message'], 'magic_quotes_gpc') === FALSE)) {
            throw new Exception("Er ging iets mis met de verbinding met SharePoint: $responseError - " . $lastError['message'],
                    HttpResponseCodes::HTTP_INTERNAL_SERVER_ERROR);
        }

        if (HttpResponseCodes::isSuccessCode($responseCode)) {
            $downloadedJson = json_decode($downloadedContent);
        }
        return $responseCode;
    }
    
    private function uploadSharePointFile($jwt, $sharePointFileID, $documentName, $contentFilename) {
        $sharePointUploadURL = self::MICROSOFT_GRAPH_URL
                . "/drives/" . self::SHAREPOINT_DRIVE_ID
                . "/items/$sharePointFileID/content";
        $responseJson = NULL;
        $responseCode = $this->putUrlToJson($sharePointUploadURL, $jwt, $contentFilename, $responseJson);
        if (!HttpResponseCodes::isSuccessCode($responseCode)) {
            if ($responseCode == HttpResponseCodes::HTTP_LOCKED) {
                $errorMag = "Ik kan het document '$documentName' niet uploaden naar SharePoint, omdat het huidige SharePoint document vergrendeld is."
                        . " Upload het bestand zelf even naar de juiste locatie in SharePoint,"
                        . " zie <a target='blank' href='" . self::SHAREPOINT_URL . "'><u>" . self::SHAREPOINT_URL . "</u></a>"
                        . "Of probeer het later nog eens, want meestal wordt zo'n vergrendeling na 10 minuten vanzelf verwijderd.";
            } else {
                $errorMag = "Er ging iets mis bij het uploaden van het document '$documentName' naar SharePoint."
                        . " Upload het bestand '$documentName' zelf even naar de juiste locatie in SharePoint,"
                        . " zie <a target='blank' href='" . self::SHAREPOINT_URL . "'><u>" . self::SHAREPOINT_URL . "</u></a>";
            }
            throw new Exception($errorMag, $responseCode);
        }
    }

    private function putUrlToJson($url, $jwt, $contentFileName, &$downloadedJson) {
        error_reporting(E_ERROR);
        
        // Create a temporary file and fill it with the 'content-to-put'.
        $contentFileSize = strlen(file_get_contents($contentFileName));
        $contentFileHandle = fopen($contentFileName, "r");

        $curl = curl_init($url);
        HttpConfig::setHttpProxy($curl, $url);
        curl_setopt($curl, CURLOPT_CONNECTTIMEOUT, 5); // 5 seconds
        curl_setopt($curl, CURLOPT_RETURNTRANSFER, TRUE);
        curl_setopt($curl, CURLOPT_SSL_VERIFYPEER, TRUE);
        curl_setopt($curl, CURLOPT_SSL_VERIFYHOST, 2);
        curl_setopt($curl, CURLOPT_PUT, 1);
        curl_setopt($curl, CURLOPT_INFILE, $contentFileHandle);
        curl_setopt($curl, CURLOPT_INFILESIZE, $contentFileSize);
        curl_setopt($curl, CURLOPT_HTTPHEADER, array(
            "Authorization: Bearer $jwt",
            'Content-Type: ' . InternetMediaTypes::getTypeOfTag(self::TAG_MEDIATYPE_DOCX),
            "Content-Length: $contentFileSize",
            "Accept: application/json"));
        $downloadedContent = curl_exec($curl);
        $responseError = curl_error($curl);
        $responseCode = curl_getinfo($curl, CURLINFO_HTTP_CODE);
        curl_close($curl);
        
        fclose($contentFileHandle);
        
        $lastError = error_get_last();
        error_reporting(E_ALL);
        if ((isset($lastError['message'])) and (stripos($lastError['message'], 'magic_quotes_gpc') === FALSE)) {
            throw new Exception("Er ging iets mis met de verbinding met SharePoint: $responseError - " . $lastError['message'],
                    HttpResponseCodes::HTTP_INTERNAL_SERVER_ERROR);
        }

        if (HttpResponseCodes::isSuccessCode($responseCode)) {
            $downloadedJson = json_decode($downloadedContent);
        }
        return $responseCode;
    }
}