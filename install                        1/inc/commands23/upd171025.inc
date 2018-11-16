<?php
    $dat = dbarray(dbquery("show create table ".PREF."seo"));
    $upd = strstr($dat['Create Table'], '`sort`') ? false : true;                                  
    
    if($upd){
        dbquery('ALTER TABLE `'.PREF.'seo` ADD `sort` int NOT NULL');
        dbquery("UPDATE ".PREF."seo SET url=CONCAT(url, '%') WHERE `nonstrict`=1");
    }
?>