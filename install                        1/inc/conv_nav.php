<?php


$file = file('../files/menu.dat');

$sort = 10;

dbquery("TRUNCATE TABLE `".PREF."nav`");

foreach($file as $k => $v)
	{
	$x = explode('<>', w2u(trim($v)));
	if(!isset($x[0])) $x[0] = "";
	if(!isset($x[1])) $x[1] = "";
	if(!isset($x[2])) $x[2] = "";
	list($type, $name, $href) = $x;
	if($type == 'r')
		{	    $href = '/'.$href;		}
    $name = strip_tags($name);
    $name = addslashes($name);
	if($type == 'h')
		{	    dbquery("INSERT INTO `".PREF."nav` SET url = 'seporator', sort=".$sort);		}
	else
		{	    dbquery("INSERT INTO `".PREF."nav` SET name = '".$name."', url = '".$href."', sort=".$sort);		}

	$sort = $sort + 10;
	}


dbquery("INSERT INTO `".PREF."nav` (`status`, `name`, `url`, `sort`) VALUES (0, '', 'seporator', ".$sort.")");
$sort = $sort + 10;
dbquery("INSERT INTO `".PREF."nav` (`status`, `name`, `url`, `sort`) VALUES (9, 'Регистрация', '/users/register/', ".$sort.")");
$sort = $sort + 10;
dbquery("INSERT INTO `".PREF."nav` (`status`, `name`, `url`, `sort`) VALUES (8, 'Личный кабинет', '/users/', ".$sort.")");
$sort = $sort + 10;
dbquery("INSERT INTO `".PREF."nav` (`status`, `name`, `url`, `sort`) VALUES (8, 'Заказать услугу', '/users/order/', ".$sort.")");
$sort = $sort + 10;
dbquery("INSERT INTO `".PREF."nav` (`status`, `name`, `url`, `sort`) VALUES (2, 'Панель администрирования', '/admin/', ".$sort.")");
$sort = $sort + 10;
?>