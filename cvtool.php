<?php

error_reporting(E_ALL | E_NOTICE | E_WARNING | E_STRICT);

require_once realpath(dirname(__FILE__) . '/../bransom/php/Bootstrap.class.php');
Bootstrap::initConfig(dirname(__FILE__) . '/../bransom/config/config.ini');
Bootstrap::import('nl.bransom.auth.AuthHandler');
Bootstrap::import('nl.bransom.auth.OpenIDConnect.OpenIDConnect');

const REDIRECT_URL = 'https://cvtool.cerios.nl/cvtool/cvtool.php';
// const REDIRECT_URL = 'http://localhost:9080/cvtool/cvtool.php';
const HOSTED_DOMAIN = 'valori.nl';
const LEGACY_REALM = 'https://cvtool.cerios.nl/';

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
  OpenIDConnect::authenticate(REDIRECT_URL, HOSTED_DOMAIN, LEGACY_REALM);
  header("Location: CVtool.html");
}
