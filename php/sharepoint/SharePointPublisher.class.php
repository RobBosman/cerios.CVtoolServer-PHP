<?php

require_once realpath(dirname(__FILE__) . '/../docx/CvGenerator.class.php');
Bootstrap::import('nl.bransom.http.HttpConfig');
Bootstrap::import('nl.bransom.http.HttpResponseCodes');
Bootstrap::import('nl.bransom.http.InternetMediaTypes');

/**
 * Description of SharePointPublisher
 *
 * @author Rob Bosman
 */
class SharePointPublisher {

    const MICROSOFT_GRAPH_URL = 'https://graph.microsoft.com/v1.0';
    const SHAREPOINT_DRIVE_ID = 'b!gLiE74guVky6WpGe8UeHoQpRlL29QE1DlsiezwivnSPlIbtUWgXZQ4RgG4YWa77n'; // 'CV Databank'
    
    const SHAREPOINT_HOST = 'devbox.cerios.nl';
    const SHAREPOINT_SITE = 'cv';
    const SHAREPOINT_USERNAME = 'CVtool';
    const SHAREPOINT_PASSWORD = 'cvtool';
    const TAG_MEDIATYPE_DOCX = 'docx';

    public function publish() {
        // Copy JWT from the request header.
        $jwt = NULL;
        $httpHeaders = getallheaders();
        if (isset($httpHeaders['Authorization']) && strpos($httpHeaders['Authorization'], 'Bearer ') === 0) {
            $jwt = substr($httpHeaders['Authorization'], strlen('Bearer '));
        }
        
        // Get the cv.docx from the REST server.
        $cvGenerator = new CvGenerator();
        $documentName = $cvGenerator->getOutputFileName();

        // Find the target folder in SharePoint to store the cv document.
        $name = 'Rob Bosman';
        $sharePointSearchURL = self::MICROSOFT_GRAPH_URL . "/drives/" . self::SHAREPOINT_DRIVE_ID . "/root/search(q='$name')?select=name,id,folder,file";
        $responseJson = NULL;
        $responseCode = $this->invokeUrlToJson($sharePointSearchURL, $jwt, $responseJson);
        if (!HttpResponseCodes::isSuccessCode($responseCode)) {
//            // Error accessing the SharePoint server. Silently ignore this error.
//            return "The SharePoint server is not available; skipped copying the document to SharePoint.";
            throw new Exception("Error accessing SharePoint. Response:\n$responseJson", HttpResponseCodes::HTTP_NOT_FOUND);
        }
        
        
        throw new Exception("Success accessing SharePoint! Response:\n$responseJson", HttpResponseCodes::HTTP_NOT_IMPLEMENTED);
        return "Uploaden naar SharePoint werkt nog even niet :-(";
        
        
        // Check if SharePoint is available.
        // GET http://SHAREPOINT_HOST/sharepoint/service/cmis/p/Sites/
        $responseXml = NULL;
        $sharepointPathUrl = 'https://' . self::SHAREPOINT_HOST . '/sharepoint/service/cmis/p/Sites/';
        $responseCode = $this->invokeUrlToXml($sharepointPathUrl, $responseXml, self::SHAREPOINT_USERNAME,
                self::SHAREPOINT_PASSWORD);
        if (!HttpResponseCodes::isSuccessCode($responseCode)) {
            // The SharePoint server is not available. Silently ignore this error.
            return "The SharePoint server is not available; skipped copying the document to SharePoint.";
        }


        // Get the XML data to determine the (directory) name of the business unit.
        $accountXml = $cvGenerator->getAccountXml();
        $businessunitDir = $this->getBusinessunitDir($accountXml);
        // Check if the 'business-unit-dir' exists in the given site in the CMIS repository.
        // GET http://SHAREPOINT_HOST/sharepoint/service/cmis/p/Sites/SHAREPOINT_SITE/documentLibrary/$businessunitDir/
        if (strlen($businessunitDir) > 0) {
            $sharepointPathUrl .= str_replace(' ', '%20', $businessunitDir) . '/';
            $responseCode = $this->invokeUrlToXml($sharepointPathUrl, $responseXml, self::SHAREPOINT_USERNAME,
                    self::SHAREPOINT_PASSWORD);
            if (!HttpResponseCodes::isSuccessCode($responseCode)) {
                // The 'business-unit-dir' is not found. This is a fatal error!
                throw new Exception("Cannot access directory '$businessunitDir' in the site '" . self::SHAREPOINT_SITE
                        . "' of SharePoint.", HttpResponseCodes::HTTP_NOT_FOUND);
            }
        }

        // Check if the document exists.
        // GET http://SHAREPOINT_HOST/sharepoint/service/cmis/p/Sites/SHAREPOINT_SITE/documentLibrary/$businessunitDir/$docxFileName
        $responseXml = NULL;
        $sharepointDocumentUrl = $sharepointPathUrl . str_replace(' ', '%20', $documentName);
        $responseCode = $this->invokeUrlToXml($sharepointDocumentUrl, $responseXml, self::SHAREPOINT_USERNAME,
                self::SHAREPOINT_PASSWORD);
        if ($responseCode == HttpResponseCodes::HTTP_NOT_FOUND) {
            // Create the document.
            $base64Content = base64_encode(file_get_contents($cvGenerator->getContentFilename()));
            $mediaType = InternetMediaTypes::getTypeOfTag(self::TAG_MEDIATYPE_DOCX);
            $atom = '<?xml version="1.0" encoding="UTF-8"?>' . <<<EOT
<atom:entry
    xmlns:cmis="http://docs.oasis-open.org/ns/cmis/core/200908/"
    xmlns:cmism="http://docs.oasis-open.org/ns/cmis/messaging/200908/"
    xmlns:atom="http://www.w3.org/2005/Atom"
    xmlns:app="http://www.w3.org/2007/app"
    xmlns:cmisra="http://docs.oasis-open.org/ns/cmis/restatom/200908/">
    <atom:title>{$documentName}</atom:title>
    <atom:summary>{$documentName}</atom:summary>
    <cmisra:content>
        <cmisra:mediatype>{$mediaType}</cmisra:mediatype>
        <cmisra:base64>{$base64Content}</cmisra:base64>
    </cmisra:content>
    <cmisra:object>
        <cmis:properties>
            <cmis:propertyId propertyDefinitionId="cmis:objectTypeId">
                <cmis:value>cmis:document</cmis:value>
            </cmis:propertyId>
        </cmis:properties>
    </cmisra:object>
</atom:entry>
EOT;
            // POST http://SHAREPOINT_HOST/sharepoint/service/cmis/p/Sites/SHAREPOINT_SITE/documentLibrary/$businessunitDir/children
            // POST the document to SharePoint.
            $url = "$sharepointPathUrl/children";
            $curl = curl_init($url);
            HttpConfig::setHttpProxy($curl, $url);
            curl_setopt($curl, CURLOPT_RETURNTRANSFER, TRUE);
            curl_setopt($curl, CURLOPT_SSL_VERIFYPEER, FALSE);
            curl_setopt($curl, CURLOPT_SSL_VERIFYHOST, FALSE);
            curl_setopt($curl, CURLOPT_POST, 1);
            curl_setopt($curl, CURLOPT_POSTFIELDS, $atom);
            curl_setopt($curl, CURLOPT_HTTPHEADER, array(
                'Authorization: Basic ' . base64_encode(self::SHAREPOINT_USERNAME . ':' . self::SHAREPOINT_PASSWORD),
                "Content-Type: application/atom+xml;type=entry",
                "Content-Length: " . strlen($atom)));
            $responseContent = curl_exec($curl);
            $responseError = curl_error($curl);
            $responseCode = curl_getinfo($curl, CURLINFO_HTTP_CODE);
            curl_close($curl);
            if (!HttpResponseCodes::isSuccessCode($responseCode)) {
                // Something went wrong!
                throw new Exception("Error updating document '$businessunitDir/$documentName'"
                        . " at SharePoint (response code $responseCode): $responseError", $responseCode);
            }
        } else if ($responseCode == HttpResponseCodes::HTTP_OK) {
            // The document already exists, so overwrite it.
            // PUT http://SHAREPOINT_HOST/sharepoint/service/cmis/p/Sites/SHAREPOINT_SITE/documentLibrary/$businessunitDir/$documentName/content?overwriteFlag=true
            // Replace the document content in SharePoint.

            // Create a temporary file and fill it with the 'content-to-put'.
            $contentFileName = $cvGenerator->getContentFilename();
            $contentFileSize = strlen(file_get_contents($contentFileName));
            $contentFileHandle = fopen($contentFileName, "r");

            $url = "$sharepointDocumentUrl/content?overwriteFlag=true";
            $curl = curl_init($url);
            HttpConfig::setHttpProxy($curl, $url);
            curl_setopt($curl, CURLOPT_RETURNTRANSFER, TRUE);
            curl_setopt($curl, CURLOPT_SSL_VERIFYPEER, FALSE);
            curl_setopt($curl, CURLOPT_SSL_VERIFYHOST, FALSE);
            curl_setopt($curl, CURLOPT_CUSTOMREQUEST, "PUT");
            curl_setopt($curl, CURLOPT_PUT, 1);
            curl_setopt($curl, CURLOPT_INFILE, $contentFileHandle);
            curl_setopt($curl, CURLOPT_INFILESIZE, $contentFileSize);
            curl_setopt($curl, CURLOPT_HTTPHEADER, array(
                'Authorization: Basic ' . base64_encode(self::SHAREPOINT_USERNAME . ':' . self::SHAREPOINT_PASSWORD),
                'Content-Type: ' . InternetMediaTypes::getTypeOfTag(self::TAG_MEDIATYPE_DOCX)));
            $responseContent = curl_exec($curl);
            $responseError = curl_error($curl);
            $responseCode = curl_getinfo($curl, CURLINFO_HTTP_CODE);
            curl_close($curl);

            fclose($contentFileHandle);

            if (!HttpResponseCodes::isSuccessCode($responseCode)) {
                // Something went wrong!
                throw new Exception("Error updating document '$businessunitDir/$documentName'"
                        . " at SharePoint (response code $responseCode): $responseError", $responseCode);
            }
        } else {
            // Something went wrong!
            throw new Exception("Error accessing document '$businessunitDir/$documentName' at SharePoint"
                    . " (response code $responseCode).", $responseCode);
        }

        // Respond the good news!
        $sharepointDirUrl = 'http://' . self::SHAREPOINT_HOST . '/share/page/site/' . self::SHAREPOINT_SITE
                . "/documentlibrary#filter=path|/$businessunitDir";
        return "Het document '$documentName' staat nu ook op <a href='$sharepointDirUrl'>SharePoint</a>.";
    }

    private function invokeUrlToXml($url, &$downloadedXml, $username = NULL, $password = NULL) {
        error_reporting(E_ERROR);

        $curl = curl_init($url);
        HttpConfig::setHttpProxy($curl, $url);
        curl_setopt($curl, CURLOPT_CONNECTTIMEOUT, 2); // 2 seconds
        curl_setopt($curl, CURLOPT_RETURNTRANSFER, TRUE);
        curl_setopt($curl, CURLOPT_SSL_VERIFYPEER, FALSE);
        curl_setopt($curl, CURLOPT_SSL_VERIFYHOST, FALSE);
        if (($username != NULL) && ($password != NULL)) {
            curl_setopt($curl, CURLOPT_HTTPHEADER, array('Authorization: Basic '
                . base64_encode("$username:$password")));
        }
        $downloadedContent = curl_exec($curl);
        $responseError = curl_error($curl);
        $responseCode = curl_getinfo($curl, CURLINFO_HTTP_CODE);
        curl_close($curl);

        $lastError = error_get_last();
        error_reporting(E_ALL);
        if ((isset($lastError['message'])) and (stripos($lastError['message'], 'magic_quotes_gpc') === FALSE)) {
            throw new Exception("Error invoking URL - " . $lastError['message'],
                    HttpResponseCodes::HTTP_INTERNAL_SERVER_ERROR);
        }
        
        if (HttpResponseCodes::isSuccessCode($responseCode)){
            $downloadedXml = new DOMDocument();
            $downloadedXml->loadXML($downloadedContent);
        }
        return $responseCode;
    }

    private function invokeUrlToJson($url, $jwt, &$downloadedJson) {
        error_reporting(E_ERROR);

        $curl = curl_init($url);
        HttpConfig::setHttpProxy($curl, $url);
        curl_setopt($curl, CURLOPT_CONNECTTIMEOUT, 5); // 5 seconds
        curl_setopt($curl, CURLOPT_RETURNTRANSFER, TRUE);
        curl_setopt($curl, CURLOPT_SSL_VERIFYPEER, FALSE);
        curl_setopt($curl, CURLOPT_SSL_VERIFYHOST, FALSE);
        if ($jwt != NULL) {
            curl_setopt($curl, CURLOPT_HTTPHEADER, array("Authorization: Bearer $jwt"));
        }
        $downloadedContent = curl_exec($curl);
        $responseError = curl_error($curl);
        $responseCode = curl_getinfo($curl, CURLINFO_HTTP_CODE);
        curl_close($curl);

        $lastError = error_get_last();
        error_reporting(E_ALL);
        if ((isset($lastError['message'])) and (stripos($lastError['message'], 'magic_quotes_gpc') === FALSE)) {
            throw new Exception("Error invoking URL - " . $lastError['message'],
                    HttpResponseCodes::HTTP_INTERNAL_SERVER_ERROR);
        }
        
        if (HttpResponseCodes::isSuccessCode($responseCode)){
            $downloadedJson = $downloadedContent;
        }
        return $responseCode;
    }

    private function getBusinessunitDir(&$modelDoc) {
        $xslDoc = new DOMDocument();
        $xslDoc->load(realpath(dirname(__FILE__) . "/filter-businessunit_naam.xsl"));
        $xsltProc = new XSLTProcessor();
        $xsltProc->importStylesheet($xslDoc);
        return $xsltProc->transformToXML($modelDoc);
    }
}

?>