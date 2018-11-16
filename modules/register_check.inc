<?php

$type = $_GET['type'];
$val1 = $_GET['val1'];
$val2 = $_GET['val2'];

$err = "ok";

if($type == 'u')
	{
	if(strlen($val1) < 3)
		{
		$err = $locale[35];
		}
	}
elseif($type == 'e')
	{
	if(strlen($val1) != "")
		{
		if(!preg_match("/[0-9a-z_]+@[0-9a-z_^\.]/i", $val1))
			{
			$err = $locale[37];
			}
		else
			{
			if(dbrows(dbquery("SELECT id FROM ".PREF."users WHERE email = '".$val1."'")) > 0)
				{
				$err = $locale[39];
				}
			}
		}
	else
		{
		$err = $locale[37];
		}
	}
elseif($type == 'p1')
	{
	if(strlen($val1) < 6)
		{
		$err = $locale[36];
		}
	}
elseif($type == 'p2')
	{
	if($val1 != $val2)
		{
		$err = $locale[38];
		}
	}
else
	{	$err = "err";	}

echo $err;

exit();
?>