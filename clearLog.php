<?php

$logFile = "../error.log";
file_put_contents($logFile, "");
usleep(250000);
header("Location: $logFile");
exit;

?>