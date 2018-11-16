<?php
/*
	Скрипт доски объявлений
	Elite-Board 2
	Тихомиров Юрий
	Санкт-Петербург
	2009 - 2010

	версия модуля: 260110
*/

if(!$exe)
	{


	$module = false;

	$result = dbquery("SELECT * FROM ".PREF."modules WHERE cat='".$_GET['cat'][0]."'");
	$count = dbrows($result);
	if($count > 0)
		{
		$module = dbarray($result);
		}

	if($module)
		{


		foreach($module as $k => $v)
			{
			if($v != "" && $k != "")
				{
				$settings[$k] = $v;
				}
			}
		}
	$cat = $_GET['cat'][0];

	if(!isset($module['content']))
		{


		$cat = str_replace('..', '', $cat);
		$cat = str_replace('/', '', $cat);
		$cat = str_replace(':', '', $cat);
		$cat = str_replace('"', '', $cat);
		$cat = str_replace("'", '', $cat);
		$cat = str_replace('`', '', $cat);

		$mfile = FULLPATCH.'modules/'.$cat.'.inc';

		if($settings['title'] != TITLE && $settings['title'] != "")
			{
			$title_normal[] = array('link' => $settings['patch_region'].$cat.'/', 'name' => $locale[112]);
			}

	    define('MFILE', $mfile);

		if(@file_exists(MFILE) && substr(MFILE, -10) != '_admin.inc')
			{
		    include(MFILE);
		    $module = true;
			}
		else
			{
			header("HTTP/1.1 404 Not Found");
			header("Status: 404 Not Found");
			$title_normal[] = array('link' => $settings['patch_region'].'404/', 'name' => $locale[112]);
            $module = false;
            $modtype = '404';
			}
		}
	else
		{
	    $title_normal[] = array('link' => $settings['patch_region'].$cat.'/', 'name' => $settings['title']);
		}
	}
else
	{
	if(isset($module['content']))
		{
	    if($module['type'] == 'html')
		    {
	 	    echo stripslashes($module['content']);
		    }
		elseif($module['type'] == 'php')
			{
		    eval(stripslashes($module['content']));
			}
		}
	else
		{

		if(@file_exists(MFILE))
			{
		    include(MFILE);
			}
		}
	}


?>