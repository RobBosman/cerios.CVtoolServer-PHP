<?php

require_once realpath(dirname(__FILE__) . '/php/docx/CvGenerator.class.php');

////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Here is an example-request to this PHP-script:
//
//     http://localhost:9080/cvtool/generateCvDocx.php?restTarget=cv/_account/69&locale=uk_UK&layout=Valori&jwt=[JWT
//
////////////////////////////////////////////////////////////////////////////////////////////////////

$cvGenerator = new CvGenerator();
$contentFileName = $cvGenerator->getContentFilename();
//$content = file_get_contents($contentFileName);
$docxFileName = $cvGenerator->getOutputFileName();
// Remove spaces from the file name to please FireFox.
$docxFileName = str_replace(' ', '_', $docxFileName);

clearstatcache(TRUE, $contentFileName);
if (!file_exists($contentFileName)) {
    error_log('ERROR downloading ' . $docxFileName . ': content not available.');
} else {
    // no caching
    header("Cache-Control: no-cache, no-store, max-age=0, must-revalidate, post-check=0, pre-check=0");
    header('Expires: 0');
    header("Pragma: public, no-cache");

    header('Content-Description: File Transfer');
    header('Content-Disposition: attachment; filename="' . $docxFileName . '"');
    header('Content-Type: application/vnd.openxmlformats-officedocument.wordprocessingml.document');
    header('Content-Transfer-Encoding: binary');
    header('Content-Length: ' . filesize($contentFileName));
    ob_end_flush();
    flush();
    readfile($contentFileName);
}
