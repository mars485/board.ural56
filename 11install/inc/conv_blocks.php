<?php
dbquery("TRUNCATE TABLE `".PREF."blocks_db`");
dbquery("TRUNCATE TABLE `".PREF."blocks_places`");


dbquery("INSERT INTO `".PREF."blocks_db`(`name`, `html`, `parent`) VALUES ('Личный кабинет', '<p>%block_user%</p>', '')");
$l_id = dbarray(dbquery('SELECT LAST_INSERT_ID()')); $s_blocks['block_user'] = $l_id['LAST_INSERT_ID()'];

dbquery("INSERT INTO `".PREF."blocks_db`(`name`, `html`, `parent`) VALUES ('Навигация', '%block_nav%', '')");
$l_id = dbarray(dbquery('SELECT LAST_INSERT_ID()')); $s_blocks['block_nav'] = $l_id['LAST_INSERT_ID()'];

dbquery("INSERT INTO `".PREF."blocks_db`(`name`, `html`, `parent`) VALUES ('Облако тегов', '%block_tags%', '')");
$l_id = dbarray(dbquery('SELECT LAST_INSERT_ID()')); $s_blocks['block_tags'] = $l_id['LAST_INSERT_ID()'];

dbquery("INSERT INTO `".PREF."blocks_db`(`name`, `html`, `parent`) VALUES ('Статистика', '%block_counter%', '')");
$l_id = dbarray(dbquery('SELECT LAST_INSERT_ID()')); $s_blocks['block_counter'] = $l_id['LAST_INSERT_ID()'];

dbquery("INSERT INTO ".PREF."blocks_places SET link = '".$s_blocks['block_user']."', sort = 1, cat = '0', place='r'");
dbquery("INSERT INTO ".PREF."blocks_places SET link = '".$s_blocks['block_nav']."', sort = 2, cat = '0', place='l'");
dbquery("INSERT INTO ".PREF."blocks_places SET link = '".$s_blocks['block_tags']."', sort = 3, cat = '0', place='r'");
dbquery("INSERT INTO ".PREF."blocks_places SET link = '".$s_blocks['block_counter']."', sort = 4, cat = '0', place='r'");


$blocks = array();

$file = file('../files/prom_db.dat');
foreach($file as $k => $v)
	{
	$x = explode('<>', w2u($v));
	dbquery("INSERT INTO ".PREF."blocks_db SET name='".addslashes($x[0])."', html='".addslashes($x[1])."' ");
	$l_id = dbarray(dbquery('SELECT LAST_INSERT_ID()'));
    $blocks[$k] = $l_id['LAST_INSERT_ID()'];
	}

$banner_id = array();
$banner_id[1] = 't';
$banner_id[2] = 't';
$banner_id[3] = 'b';
$banner_id[4] = 'm';


$file = file('../files/prom_places.dat');
$sort = 10;
foreach($file as $v)
	{
	$x = explode('<>', $v);
	$places = $x[2];
	$places = explode('|', $places);
	$places = $places[0];
	$places = explode('/', $places);
	$pl_id = "";
	for($i = 0; $i < 3; $i++)
		{
		if(isset($places[$i]))
			{			$pl_id .= $places[$i];
			}
		if($i != 2)
		    {		    $pl_id .= '|';
		  	}		}
	if(isset($cats[$pl_id]))
		{
		$cat = $cats[$pl_id];
		}
	else
		{
		$cat = "";
		}
	if($cat == ""){$cat = 0;}
	dbquery("INSERT INTO ".PREF."blocks_places SET place='".$banner_id[$x[1]]."', reg = 1, status = 1, link = '".$blocks[$x[0]]."', sort=".$sort.", cat='".$cat."'");
    $sort = $sort + 10;
	}
$file = file('../files/blocks.dat');

$banner_id = array();
$banner_id['t'] = 'h';
$banner_id['b'] = 'f';
$banner_id['l'] = 'l';
$banner_id['r'] = 'r';

foreach($file as $v)
	{
	list($name_bl, $cod, $status, $bid, $tip, $nl2br, $bl_st) = explode('<>',w2u($v));

		if(
		!strstr($cod, 'REGION') &&
		!strstr($cod, 'STAT') &&
		!strstr($cod, 'REG') &&
		!strstr($cod, 'MENU') &&
		!strstr($cod, 'MENU') &&
		!strstr($cod, 'SEARCH') &&
		$tip == 'HTML'
		)
			{
			if($nl2br == 'ON')
				{			    $cod = nl2br($cod);				}
			if($bl_st == 'bl_off')
				{			    $bl_st = 0;				}
			else
				{			    $bl_st = 1;				}
			$cod = str_replace('{br}', "\n", $cod);
		    dbquery("INSERT INTO ".PREF."blocks_db SET name='".addslashes($name_bl)."', html='".addslashes($cod)."' ");
			$l_id = dbarray(dbquery('SELECT LAST_INSERT_ID()'));
			
			if(isset($cats[$bid.'||']))
				{
				$cat = $cats[$bid.'||'];
				}
			else
				{
				$cat = "";
				}
			if($cat == ""){$cat = 0;}
			dbquery("INSERT INTO ".PREF."blocks_places SET place='".$banner_id[$status]."', reg = 1, status = ".$bl_st.", link = '".$l_id['LAST_INSERT_ID()']."', sort=".$sort.", cat='".$cat."'");
		    $sort = $sort + 10;			}
	}

?>