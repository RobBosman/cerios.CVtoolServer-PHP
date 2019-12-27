<?php

error_reporting(E_ALL | E_NOTICE | E_WARNING | E_STRICT);

require_once realpath(dirname(__FILE__) . '/php/sharepoint/SharePointPublisher.class.php');

////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Here is an example-request to this PHP-script:
//
// http://localhost:9080/cvtool/publishToSharePoint.php?restTarget=cv/_account/69&locale=nl_NL&layout=Valori
//
////////////////////////////////////////////////////////////////////////////////////////////////////

try {
    $publisher = new SharePointPublisher();
    $responseContent = $publisher->publish();
    $responseCode = HttpResponseCodes::HTTP_OK;
    $responseMessage = HttpResponseCodes::getMessage($responseCode);
    header("HTTP/1.1 $responseCode $responseMessage", true, $responseCode);
    echo $responseContent;
} catch (Exception $e) {
    $responseContent = $e->getMessage();
    $responseCode = $e->getCode();
    if (!HttpResponseCodes::isErrorCode($responseCode)) {
        // Ensure that an error code is responded.
        $responseCode = HttpResponseCodes::HTTP_INTERNAL_SERVER_ERROR;
    }
    error_log("ERROR - $responseCode: $responseContent");
    
    // For some reason setting the header with an error response code gives an "Error #2032" error at the client.
    // So let's just return '200 OK' and wrap the real code and message in the response text.
    $responseMessage = HttpResponseCodes::getMessage($responseCode);
    echo "$responseCode|$responseMessage|$responseContent";
}