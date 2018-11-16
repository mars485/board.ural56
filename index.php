<?php

ini_set('display_errors', 1);
error_reporting(E_ALL & ~E_NOTICE);

require('config.php');
if(!defined('COREPATH')){
    define('COREPATH', $fullpath.'includes/compile/');
}

require(COREPATH.'core.php');

if(version_compare(phpversion(), '5.5') >= 0){
    if(isset($GLOBALS['_mysqli_link'])){
		mysqli_close($GLOBALS['_mysqli_link']);
	}
}else{
    mysql_close();
}

?>