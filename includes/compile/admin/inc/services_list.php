<?php
/*
	Скрипт доски объявлений
	Elite-Board 2
	Тихомиров Юрий
	Санкт-Петербург
	2009 - 2010

	версия модуля: 260110
*/

$services = array();
$slk = $settings['license_key'];
$hth = getenv('HTTP_HOST');
$res = dbquery("SELECT * FROM ".PREF."services ");
while($dat = dbarray($res))
	{
	$services[$dat['type']] = $dat;
	$services[$dat['type']]['word_min'] = om_number($dat['min'], array($locale[173], $locale[174], $locale[175]));
	$services[$dat['type']]['word_max'] = om_number($dat['max'], array($locale[173], $locale[174], $locale[175]));

	if(is_numeric($dat['name']))
		{	    $services[$dat['type']]['name'] = $locale[$dat['name']];
	    $services[$dat['type']]['tip'] = $locale[$dat['tip']];
		}
	}

//dbquery("UPDATE ".PREF."users SET balance=balance-1 WHERE id=".$settings['user']['id']);
?>