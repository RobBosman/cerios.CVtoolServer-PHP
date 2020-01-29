<?php

error_reporting(E_ALL | E_NOTICE | E_WARNING | E_STRICT);

require_once realpath(dirname(__FILE__) . '/../bransom/php/Bootstrap.class.php');
Bootstrap::initConfig(dirname(__FILE__) . '/../bransom/config/config.ini');
Bootstrap::import('nl.bransom.auth.AuthHandler');
Bootstrap::import('nl.bransom.auth.OpenIDConnect.OpenIDConnect');

const OPENID_SCOPE = 'openid Sites.ReadWrite.All Files.ReadWrite';
const OPENID_DOMAIN = 'valori.nl';

$server = filter_input_array(INPUT_SERVER);
$OPENID_REDIRECT_URL = (isset($server['HTTPS']) ? 'https' : 'http') . '://' . $server['HTTP_HOST'] . '/cvtool/cvtool.php';

$appName = filter_input(INPUT_GET, 'getAuthorization');
if (isset($appName)) {
    $jwt = OpenIDConnect::getParkedJWT();
    if ($jwt != NULL) {
        $accountId = AuthHandler::getSignedInAccountId($appName, $jwt);
    } else {
        $accountId = '';
    }
    header('Content-type: text/plain');
    echo "$jwt|$accountId";
} else {
    OpenIDConnect::authenticate($OPENID_REDIRECT_URL, OPENID_SCOPE, OPENID_DOMAIN);
    header("Location: CVtool.html");
}
