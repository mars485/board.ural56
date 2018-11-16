<?php
$file = file('../files/modules.dat');

$users = array();

dbquery("TRUNCATE TABLE `".PREF."modules`");
$types['HTML'] = 'html';
$types['TEXT'] = 'html';
$types['PHP'] = 'php';

foreach($file as $k => $v)
	{
	$x = explode('<>', w2u(trim($v)));
	list($mid,$mname,$mtype,$mnl2br,$mcontent) = $x;
	if($mid == "[!INDEX_MODULE!]"){$mid = "index";}
	$mcontent = str_replace('{br}', "\n", $mcontent);
    if($mnl2br == 'ON') $mcontent = nl2br($mcontent);

	dbquery("INSERT INTO ".PREF."modules SET title='".addslashes($mname)."', cat='".addslashes($mid)."', content='".addslashes($mcontent)."', type = '".$types[$mtype]."'");

	}
?>