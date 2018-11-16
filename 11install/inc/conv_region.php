<?php

$file1 = file('../files/regions.dat');
$file2 = file('../files/subregions.dat');

dbquery("TRUNCATE TABLE `".PREF."regions`");

$sort = 10;

$regions = array();

foreach($file1 as $str)
	{
	list($name, $uri) = explode('<>', trim($str));
	$name = w2u($name);
    dbquery("INSERT INTO ".PREF."regions SET uri = '".$uri."', name='".$name."', parent=0, sort = ".$sort);
    $sort = $sort + 10;
    $l_id = dbarray(dbquery('SELECT LAST_INSERT_ID()'));
    $regions[$uri.'|'] = $l_id['LAST_INSERT_ID()'];
	}


foreach($file2 as $str)
	{
	list($skat, $uri, $name) = explode('<>', trim($str));
	$name = w2u($name);

	$res = dbquery("SELECT id FROM ".PREF."regions WHERE uri = '".$skat."' AND parent = 0");
	$dat = dbarray($res);

	if(is_numeric($dat['id']))
		{
	    dbquery("INSERT INTO ".PREF."regions SET uri = '".$uri."', name = '".$name."', parent = ".$dat['id'].", sort = ".$sort);
	    $sort = $sort + 10;
	    $l_id = dbarray(dbquery('SELECT LAST_INSERT_ID()'));
	    $regions[$skat.'|'.$uri] = $l_id['LAST_INSERT_ID()'];
		}
	}


?>