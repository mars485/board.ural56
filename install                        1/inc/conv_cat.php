<?php
$file1 = file('../files/kat.dat');
$file2 = file('../files/subkat.dat');
$file3 = file('../files/subsubkat.dat');

dbquery("TRUNCATE TABLE `".PREF."cat`");

$sort = 10;

$cats = array();

foreach($file1 as $str)
	{
	list($uri, $name, $img) = explode('<>', trim($str));
	$name = w2u($name);
    dbquery("INSERT INTO ".PREF."cat SET uri = '".$uri."', name='".$name."', img='".$img."', parent=0, sort = ".$sort);
    $l_id = dbarray(dbquery('SELECT LAST_INSERT_ID()'));
    $cats[$uri.'||'] = $l_id['LAST_INSERT_ID()'];
    @copy('../images/kat/'.$img, '../images/cat/'.$img);
    $sort = $sort + 10;
	}

$skat_id = array();
foreach($file2 as $str)
	{
	list($skat, $uri, $name, $img) = explode('<>', trim($str));
	$name = w2u($name);

	$res = dbquery("SELECT id FROM ".PREF."cat WHERE uri = '".$skat."' AND parent = 0");
	$dat = dbarray($res);

	if(is_numeric($dat['id']))
		{
		$skat_id[$dat['id']] = $skat;
	    dbquery("INSERT INTO ".PREF."cat SET uri = '".$uri."', name = '".$name."', parent = ".$dat['id'].", sort = ".$sort);
	    $sort = $sort + 10;
	    $l_id = dbarray(dbquery('SELECT LAST_INSERT_ID()'));
	    $cats[$skat.'|'.$uri.'|'] = $l_id['LAST_INSERT_ID()'];
		}
	}

foreach($file3 as $str)
	{
	$dop = "";
	list($sskat, $skat, $uri, $name, $img) = explode('<>', trim($str));
	$name = w2u($name);
	if(isset($skat_id[$sskat]))
		{
		if(is_numeric($skat_id[$sskat]))
			{
			$dop = " AND parent = '".$skat_id[$sskat]."' ";
			}
		else
			{
			$dop = "";
			}
		}
	$res = dbquery("SELECT id FROM ".PREF."cat WHERE uri = '".$skat."' ".$dop);
	$dat = dbarray($res);
	if(is_numeric($dat['id']))
		{
	    dbquery("INSERT INTO ".PREF."cat SET uri = '".$uri."', name = '".$name."', parent = ".$dat['id'].", sort = ".$sort);
	    $sort = $sort + 10;
	    $l_id = dbarray(dbquery('SELECT LAST_INSERT_ID()'));
	    $cats[$sskat.'|'.$skat.'|'.$uri] = $l_id['LAST_INSERT_ID()'];
		}
	}


?>