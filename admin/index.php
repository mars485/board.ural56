<?php

require('conf.php');
require('../config.php');

if(!defined('COREPATH')){
    define('COREPATH', $fullpath.'includes/compile/');
}

require(COREPATH.'admin/index.php');

if(version_compare(phpversion(), '5.5') >= 0){
    if(isset($GLOBALS['_mysqli_link'])){
		@mysqli_close($GLOBALS['_mysqli_link']);
	}
}else{
    @mysql_close();
}


?>