<?php

require_once realpath(dirname(__FILE__) . '/../../../bransom/php/Bootstrap.class.php');
Bootstrap::initConfig(dirname(__FILE__) . '/../../../bransom/config/config.ini');
Bootstrap::import('nl.bransom.rest.RestController');

/**
 * Description of CvGenerator
 *
 * @author Rob Bosman
 */
class CvGenerator {

    const TAG_REST_TARGET = 'restTarget';
    const TAG_JWT = 'jwt';
    const TAG_LOCALE = 'locale';
    const TAG_LAYOUT = 'layout';

    private $locale;
    private $layout;
    private $accountXml;
    private $contentFilename;

    public function __construct() {
        // Determine the restTarget, language and layout.
        $restTarget = filter_input(INPUT_POST, self::TAG_REST_TARGET);
        $jwt = filter_input(INPUT_POST, self::TAG_JWT);
        $this->locale = filter_input(INPUT_POST, self::TAG_LOCALE);
        $this->layout = filter_input(INPUT_POST, self::TAG_LAYOUT);
        if ($this->locale == NULL) {
            $this->locale = 'nl_NL';
        }
        // Get the model-XML.
        $this->accountXml = $this->getXmlData($restTarget, $jwt);
        $this->generateDocx();
    }

    public function __destruct() {
        // Delete the temporary file.
        if ($this->contentFilename != NULL) {
            unlink($this->contentFilename);
        }
    }

    public function getAccountXml() {
        return $this->accountXml;
    }

    public function getOutputFileName() {
        return $this->xslTransform("file_name.xsl");
    }

    public function getContentFilename() {
        return $this->contentFilename;
    }

    private function generateDocx() {
        $hasLayout = (strlen($this->layout) > 0);
        if (!$hasLayout) {
            // use default template
            $this->layout = 'Cerios';
        }
      
        // Use the model-XML to generate several files needed to compose the DOCX document.
        $docxComponents = array();
        $docxComponents['word/_rels/document.xml.rels'] = $this->xslTransform("document.xml.rels.xsl");
        $docxComponents['word/_rels/header1.xml.rels'] = $this->xslTransform("header1.xml.rels.xsl");
        $docxComponents['word/document.xml'] = $this->xslTransform("document.xml.xsl");
        $docxComponents['word/header1.xml'] = $this->xslTransform("header1.xml.xsl");
        $docxComponents['word/footer1.xml'] = $this->xslTransform("footer1.xml.xsl");
        $docxComponents['docProps/core.xml'] = $this->xslTransform("core.xml.xsl");

        if ($hasLayout) {
            // Base64-decode images.
            $image1 = $this->xslTransform("image1.b64.xsl");
            if (($image1 != NULL) && (strlen($image1) > 0)) {
                $image1 = base64_decode($image1);
                $docxComponents['word/media/image1.jpeg'] = $image1;
            }
        }

        $this->contentFilename = $this->createTempZipFile($docxComponents, $this->getSourceFile("$this->layout/cv_template.docx"));
    }

    private function getXmlData($restTarget, $jwt) {
        // Get the model-XML from the REST server.
        $params = array('$published' => 'false');
        $restController = new RestController($params);
        $restResponse = $restController->process('GET', explode('/', $restTarget), NULL, $jwt);
        if ($restResponse->getResponseContentXml() == NULL) {
            $restResponse->respond();
            exit;
        }
        return $restResponse->getResponseContentXml();
    }

    private function xslTransform($styleSheetFileName) {
        $xslDoc = new DOMDocument();
        $xslDoc->load($this->getSourceFile("$this->layout/$this->locale/$styleSheetFileName"));
        $xsltProc = new XSLTProcessor();
        $xsltProc->importStylesheet($xslDoc);
        $xsltParams = array(
            'locale' => $this->locale,
            'layout' => $this->layout
        );
        $xsltProc->setParameter('', $xsltParams);
        return $xsltProc->transformToXML($this->accountXml);
    }

    private function createTempZipFile(array &$docxComponents, $templateCvFilename) {
        // Copy the template document to a temporary file.
        $zipFilename = @tempnam('/tmp', 'cv_');
        if (copy($templateCvFilename, $zipFilename) !== TRUE) {
            error_log("Cannot copy '$templateCvFilename' to '$zipFilename'.");
            exit("Cannot copy '$templateCvFilename' to '$zipFilename'.");
        }

        // Overwrite components in the copied DOCX (=ZIP) file with those that we just created.
        $zipCv = new ZipArchive();
        if ($zipCv->open($zipFilename, ZipArchive::CHECKCONS) !== TRUE) {
            error_log("Cannot open '$zipFilename'.");
            exit("Cannot open '$zipFilename'.");
        }
        foreach ($docxComponents as $targetLocation => $transformResult) {
            if ($transformResult != NULL) {
                $zipCv->addFromString($targetLocation, $transformResult);
            } else {
                $zipCv->deleteName($targetLocation);
            }
        }

        if ($zipCv->close() !== TRUE) {
            error_log("Error creating docx file '$zipFilename'.");
            exit("Error creating docx file '$zipFilename'.");
        }

        return $zipFilename;
    }

    private function getSourceFile($relativePath) {
        return realpath(dirname(__FILE__) . "/$relativePath");
    }
}

?>