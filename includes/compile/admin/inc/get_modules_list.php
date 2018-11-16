<?php

$modules_list = array();


$res = dbquery("SELECT cat, title FROM ".PREF."modules");
while($dat = dbarray($res))
	{
	$modules_list[$dat['cat']] = stripslashes($dat['title']);
	}

$fp = opendir(FULLPATCH.'modules/');
while(($file = readdir($fp)) !== false)
	{
	if(substr($file, -4) == '.inc' && substr($file, -10) != '_admin.inc' && substr($file, 0, 4) != 'pay_')
		{

		$fileid = str_replace('.inc', '', $file);

		$filetext = file(FULLPATCH.'modules/'.$file);
		$filetext = $filetext[0];
		$filetext = explode('//', $filetext);
        if(!isset($filetext[1])) $filetext[1] = "";
		$filetext = trim($filetext[1]);
		if($filetext == ""){$filetext = $fileid;}
		if(is_numeric($filetext))
			{
		    $filetext = $locale[$filetext];
			}
		$modules_list[$fileid] = $filetext;
		}
	}

unset($modules_list['captcha']);
unset($modules_list['change_region']);
unset($modules_list['cssjs']);
//unset($modules_list['messages']);
unset($modules_list['fav']);
unset($modules_list['delete']);
unset($modules_list['redirect']);
unset($modules_list['sitemap.xml']);
unset($modules_list['rss.xml']);

?>