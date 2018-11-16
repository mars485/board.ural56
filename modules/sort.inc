<?php

$link = explode("/", $_SERVER['REQUEST_URI']);
$link = array_pop($link);
redirect301(PATH.'search/'.$link);
exit();

?>