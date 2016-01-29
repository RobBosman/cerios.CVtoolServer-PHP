<?php

error_reporting(E_ALL | E_NOTICE | E_WARNING | E_STRICT);

require_once realpath(dirname(__FILE__) . '/../bransom/php/Bootstrap.class.php');
Bootstrap::initConfig(dirname(__FILE__) . '/../bransom/config/config.ini');
Bootstrap::import('nl.bransom.auth.AuthHandler');
Bootstrap::import('nl.bransom.auth.OpenIDConnect.OpenIDConnect');

const CLIENT_ID = '168737055478-dltl1ivb4me00mdbnhodedg80ic5dvrh.apps.googleusercontent.com';
const CLIENT_SECRET = 'sD0uJyM-qO3yiKYaPenCL_UX';
//const REDIRECT_URL = 'https://cvtool.cerios.nl/cvtool/cvtool.php';
const REDIRECT_URL = 'http://localhost:9080/cvtool/cvtool.php';
const HOSTED_DOMAIN = 'cerios.nl';
const LEGACY_REALM = 'https://cvtool.cerios.nl/';

$appName = filter_input(INPUT_GET, 'getAuthorization');
if (isset($appName)) {
    $jwt = OpenIDConnect::getParkedJWT();
    if ($jwt != NULL) {
        $accountId = AuthHandler::getSignedInAccountId($appName, $jwt);
        header('Content-type: text/plain');
        echo "$jwt|$accountId";
    }
} else {
    $openIDConnect = new OpenIDConnect(CLIENT_ID, CLIENT_SECRET);
    $openIDConnect->authenticate(REDIRECT_URL, HOSTED_DOMAIN, LEGACY_REALM);
    header("Location: CVtool.html");
}
