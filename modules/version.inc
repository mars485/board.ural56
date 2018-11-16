<?php
header("Content-type: text/plain");
$dat = dbarray(dbquery("SELECT version FROM ".PREF."version WHERE module=''"));
exit($dat['version']);
?>