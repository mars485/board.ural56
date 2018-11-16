<?php
    $res = dbquery("show create table ".PREF."db");
    $dat = dbarray($res);
    $approve_text  = "НЕ ПРОВЕРЕНО! Это объявление ещё не проверено модератором сайта.\n";
    $approve_text .= "Администрация не несет ответственности за содержание,\n";
    $approve_text .= "достоверность и точность материалов, опубликованных пользователями.\n";

       
    $upd = strstr($dat['Create Table'], '`approved`') ? false : true;                                  
    
    if($upd){
        $approve_text = "";
        dbquery("ALTER TABLE `".PREF."db` ADD `approved` INT( 1 ) NOT NULL DEFAULT '0' AFTER `sendmail` ");
        dbquery("UPDATE ".PREF."db SET approved=1");
        if(!isset($settings['approve_text'])){
            dbquery("INSERT INTO ".PREF."settings SET k='approve_text', v='".$approve_text."'");
        }
    }
?>