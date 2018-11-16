<?php

$paches = array();
$paches[] = 'uploads/images/ts/';
$paches[] = 'uploads/images/tb/';
$paches[] = 'uploads/images/';
$paches[] = 'uploads/';
$paches[] = 'uploads/files/';
$paches[] = 'uploads/files/file/';
$paches[] = 'uploads/files/flash/';
$paches[] = 'uploads/files/image/';
$paches[] = 'uploads/files/media/';

$dirsize = 0;

if($calc_dirsize)
	{
	foreach($paches as $v)
		{
	    $filelist = get_file_list($v);
	    if(count($filelist) > 0)
		    {
	        foreach($filelist as $file)
		        {
	            $dirsize = $dirsize + filesize(FULLPATCH.$v.$file);
		        }
		    }
		}
	}

$dirsize = vs($dirsize);

$ccize = 0;

if($calc_dirsize)
	{
	$filelist = get_file_list('smarty/cache/');
	if(count($filelist) > 0)
		{
		foreach($filelist as $file)
			{
			$ccize = $ccize + filesize(FULLPATCH.'smarty/cache/'.$file);
			}
		}
    }
$ccize = vs($ccize);

$safemode = 'safe_mode';
if (@ini_get($safemode) or strtolower(@ini_get($safemode)) == "on")
	{
	$safemode = $locale[612];
	}
else
	{
    $safemode = $locale[613];
	}

$infoblock = array();

$infoblock[] = array('k' => $locale[607], 'v' => getenv("SERVER_NAME"));
$infoblock[] = array('k' => $locale[608], 'v' => phpversion());
$infoblock[] = array('k' => $locale[609], 'v' => mysql_get_server_info_u());
$infoblock[] = array('k' => $locale[610], 'v' => date("d.m.Y H:i:s"));
$infoblock[] = array('k' => $locale[611], 'v' => $safemode);
if($calc_dirsize)
	{
	$infoblock[] = array('k' => $locale[606], 'v' => $dirsize);
	$infoblock[] = array('k' => $locale[614], 'v' => $ccize);
	}
$smarty->assign('infoblock', $infoblock);
?>