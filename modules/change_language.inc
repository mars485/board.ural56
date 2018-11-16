<?php
if($_GET['language'] != "")
	{	setcookie('language', $_GET['language'], (time() + 31536000), '/');
	if($_SERVER['HTTP_REFERER'] == "")
		{	    $ref = $settings['patch'];		}
	else
		{	    $ref = $_SERVER['HTTP_REFERER'];		}
	header('Location: '.$ref);	}
exit();
?>