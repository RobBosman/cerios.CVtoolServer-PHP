<?php

require_once realpath(dirname(__FILE__) . '/../docx/CvGenerator.class.php');
Bootstrap::import('nl.bransom.http.HttpConfig');
Bootstrap::import('nl.bransom.http.HttpResponseCodes');
Bootstrap::import('nl.bransom.http.InternetMediaTypes');

/**
 * Description of AlfrescoPublisher
 *
 * @author Rob Bosman
 */
class AlfrescoPublisher {

    const ALFRESCO_HOST = 'devbox.cerios.nl';
    const ALFRESCO_SITE = 'cv';
    const ALFRESCO_USERNAME = 'CVtool';
    const ALFRESCO_PASSWORD = 'cvtool';
    const TAG_MEDIATYPE_DOCX = 'docx';

    public function publish() {
        // Get the cv.docx from the REST server.
        $cvGenerator = new CvGenerator();
        $documentName = $cvGenerator->getOutputFileName();
        // Strip-off everything between brackets (date, locale and layout).
        $i = strrpos($documentName, '(');
        if ($i > 0) {
            $documentName = substr($documentName, 0, $i);
        }
        $documentName = trim($documentName);


        // Check if Alfresco is available.
        // GET http://ALFRESCO_HOST/alfresco/service/cmis/p/Sites/
        $responseXml = NULL;
        $alfrescoPathUrl = 'http://' . self::ALFRESCO_HOST . '/alfresco/service/cmis/p/Sites/';
        $responseCode = $this->invokeUrlToXml($alfrescoPathUrl, $responseXml, self::ALFRESCO_USERNAME,
                self::ALFRESCO_PASSWORD);
        if (!HttpResponseCodes::isSuccessCode($responseCode)) {
            // The Alfresco server is not available. Silently ignore this error.
            return "The Alfresco server is not available; skipped copying the document to Alfresco.";
        }


        // Get the XML data to determine the (directory) name of the business unit.
        $accountXml = $cvGenerator->getAccountXml();
        $businessunitDir = $this->getBusinessunitDir($accountXml);
        // Check if the 'business-unit-dir' exists in the given site in the CMIS repository.
        // GET http://ALFRESCO_HOST/alfresco/service/cmis/p/Sites/ALFRESCO_SITE/documentLibrary/$businessunitDir/
        if (strlen($businessunitDir) > 0) {
            $alfrescoPathUrl .= str_replace(' ', '%20', $businessunitDir) . '/';
            $responseCode = $this->invokeUrlToXml($alfrescoPathUrl, $responseXml, self::ALFRESCO_USERNAME,
                    self::ALFRESCO_PASSWORD);
            if (!HttpResponseCodes::isSuccessCode($responseCode)) {
                // The 'business-unit-dir' is not found. This is a fatal error!
                throw new Exception("Cannot access directory '$businessunitDir' in the site '" . self::ALFRESCO_SITE
                        . "' of Alfresco.", HttpResponseCodes::HTTP_NOT_FOUND);
            }
        }

        // Check if the document exists.
        // GET http://ALFRESCO_HOST/alfresco/service/cmis/p/Sites/ALFRESCO_SITE/documentLibrary/$businessunitDir/$docxFileName
        $responseXml = NULL;
        $alfrescoDocumentUrl = $alfrescoPathUrl . str_replace(' ', '%20', $documentName);
        $responseCode = $this->invokeUrlToXml($alfrescoDocumentUrl, $responseXml, self::ALFRESCO_USERNAME,
                self::ALFRESCO_PASSWORD);
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
            // POST http://ALFRESCO_HOST/alfresco/service/cmis/p/Sites/ALFRESCO_SITE/documentLibrary/$businessunitDir/children
            // POST the document to Alfresco.
            $url = "$alfrescoPathUrl/children";
            $curl = curl_init($url);
            HttpConfig::setHttpProxy($curl, $url);
            curl_setopt($curl, CURLOPT_RETURNTRANSFER, TRUE);
            curl_setopt($curl, CURLOPT_SSL_VERIFYPEER, FALSE);
            curl_setopt($curl, CURLOPT_SSL_VERIFYHOST, FALSE);
            curl_setopt($curl, CURLOPT_POST, 1);
            curl_setopt($curl, CURLOPT_POSTFIELDS, $atom);
            curl_setopt($curl, CURLOPT_HTTPHEADER, array(
                'Authorization: Basic ' . base64_encode(self::ALFRESCO_USERNAME . ':' . self::ALFRESCO_PASSWORD),
                "Content-Type: application/atom+xml;type=entry",
                "Content-Length: " . strlen($atom)));
            $responseContent = curl_exec($curl);
            $responseError = curl_error($curl);
            $responseCode = curl_getinfo($curl, CURLINFO_HTTP_CODE);
            curl_close($curl);
            if (!HttpResponseCodes::isSuccessCode($responseCode)) {
                // Something went wrong!
                throw new Exception("Error updating document '$businessunitDir/$documentName'"
                        . " at Alfresco (response code $responseCode): $responseError", $responseCode);
            }
        } else if ($responseCode == HttpResponseCodes::HTTP_OK) {
            // The document already exists, so overwrite it.
            // PUT http://ALFRESCO_HOST/alfresco/service/cmis/p/Sites/ALFRESCO_SITE/documentLibrary/$businessunitDir/$documentName/content?overwriteFlag=true
            // Replace the document content in Alfresco.

            // Create a temporary file and fill it with the 'content-to-put'.
            $contentFileName = $cvGenerator->getContentFilename();
            $contentFileSize = strlen(file_get_contents($contentFileName));
            $contentFileHandle = fopen($contentFileName, "r");

            $url = "$alfrescoDocumentUrl/content?overwriteFlag=true";
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
                'Authorization: Basic ' . base64_encode(self::ALFRESCO_USERNAME . ':' . self::ALFRESCO_PASSWORD),
                'Content-Type: ' . InternetMediaTypes::getTypeOfTag(self::TAG_MEDIATYPE_DOCX)));
            $responseContent = curl_exec($curl);
            $responseError = curl_error($curl);
            $responseCode = curl_getinfo($curl, CURLINFO_HTTP_CODE);
            curl_close($curl);

            fclose($contentFileHandle);

            if (!HttpResponseCodes::isSuccessCode($responseCode)) {
                // Something went wrong!
                throw new Exception("Error updating document '$businessunitDir/$documentName'"
                        . " at Alfresco (response code $responseCode): $responseError", $responseCode);
            }
        } else {
            // Something went wrong!
            throw new Exception("Error accessing document '$businessunitDir/$documentName' at Alfresco"
                    . " (response code $responseCode).", $responseCode);
        }

        // Respond the good news!
        $alfrescoDirUrl = 'http://' . self::ALFRESCO_HOST . '/share/page/site/' . self::ALFRESCO_SITE
                . "/documentlibrary#filter=path|/$businessunitDir";
        return "Het document '$documentName' staat nu ook op <a href='$alfrescoDirUrl'>Alfresco</a>.";
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

    private function getBusinessunitDir(&$modelDoc) {
        $xslDoc = new DOMDocument();
        $xslDoc->load(realpath(dirname(__FILE__) . "/filter-businessunit_naam.xsl"));
        $xsltProc = new XSLTProcessor();
        $xsltProc->importStylesheet($xslDoc);
        return $xsltProc->transformToXML($modelDoc);
    }
}

?>