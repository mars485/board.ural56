<?php
    $res = dbquery("show create table ".PREF."users_shop");
    $dat = dbarray($res);
    $upd = false;
    
    if(strpos($dat['Create Table'], '`worktime`') === FALSE){
            $upd = true;
    }

    if($upd){
        $sql = "
                ALTER TABLE `".PREF."users_shop`
                ADD `worktime` text COLLATE 'utf8_general_ci' NOT NULL,
                ADD `site` varchar(200) COLLATE 'utf8_general_ci' NOT NULL AFTER `worktime`;
            ";
        dbquery($sql);
    }

?>