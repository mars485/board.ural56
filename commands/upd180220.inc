<?php
    
    $upd = cache_get('upd180220');

    if(!$upd){
        $dat = dbarray(dbquery("show create table ".PREF."payments"));
        $upd = strstr($dat['Create Table'], '`action`') ? false : true; 
        if($upd){
            dbquery("ALTER TABLE `".PREF."payments` ADD `action` varchar(255) COLLATE 'utf8_general_ci' NOT NULL");
        }
        $dat = dbarray(dbquery("show create table ".PREF."packages"));
        $upd = strstr($dat['Create Table'], '`price`') ? false : true; 
        if($upd){
            dbquery("ALTER TABLE `".PREF."packages` ADD `price` float NOT NULL DEFAULT '0' AFTER `service`");
            $res = dbquery("SELECT pkg.*, srv.price as srvprice
                            FROM ".PREF."packages pkg
                            LEFT JOIN ".PREF."services srv ON (pkg.service=srv.id)");
            while($dat = dbarray($res)){
                dbquery("UPDATE ".PREF."packages SET price='".round($dat['srvprice']*$dat['days'], 2)."' WHERE id=".$dat['id']);
            }
        }
        $upd = cache_set('upd180220', true, 86400);
        
    }
    
?>