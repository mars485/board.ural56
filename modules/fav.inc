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
	$fav = 1;
    if(is_numeric($_GET['id']))
	    {
        if(!isset($_COOKIE['notes'])) $_COOKIE['notes'] = "";
        $notes = explode(',', $_COOKIE['notes']);
        $key = array_search($_GET['id'], $notes);
        if($key !== false){
            unset($notes[$key]);
            $fav = 1;
        }else{
            $notes[] = $_GET['id'];
            foreach($notes as $k=>$v){
                if(!is_numeric($v)) unset($notes[$k]);
            }
            $fav = 2;
        }
        $ids = array();
        if(count($notes) > 0){
            $res = dbquery("SELECT id FROM ".PREF."db WHERE id IN (".implode(',', $notes).") AND status=1");
            while($dat = dbarray($res)){
                $ids[] = $dat['id'];
            }
        }  
        $notes = implode(',', $ids);
        setcookie('notes', $notes, time() + $settings['cookie_time'], '/');
	    }
	echo $fav;
	die();
	}

?>