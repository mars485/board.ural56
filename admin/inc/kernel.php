<?php
$_SERVER['REQUEST_URI'] = str_replace("\'", '', $_SERVER['REQUEST_URI']);
$_SERVER['REQUEST_URI'] = str_replace("'", '', $_SERVER['REQUEST_URI']);
$_SERVER['REQUEST_URI'] = str_replace('%27', '', $_SERVER['REQUEST_URI']);
?>