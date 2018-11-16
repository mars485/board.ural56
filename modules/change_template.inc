<?php
if($_GET['template'] != "")
	{	setcookie('template', $_GET['template'], (time() + 31536000), '/');
	if($_SERVER['HTTP_REFERER'] == "")
		{
	    $ref = $settings['patch'];
		}
	else
		{
	    $ref = $_SERVER['HTTP_REFERER'];
		}
	header('Location: '.$ref);	}
exit();
?>