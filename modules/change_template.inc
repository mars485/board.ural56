<?php

	{
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