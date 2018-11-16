<?php
    $res = dbquery("show create table ".PREF."db");
    $dat = dbarray($res);
    $upd = false;
    $ct = $dat['Create Table'];
    $ct = explode("\n", $ct);
    foreach($ct as $v){
        if(strpos($v, '`date_raised`') !== FALSE){
            if(strpos($v, 'DEFAULT CURRENT_TIMESTAMP') !== FALSE){
                $upd = true;
            }
        }
    }

    
                          
    
    if($upd){
        $sql = "
            ALTER TABLE `".PREF."db`
            CHANGE `date_raised` `date_raised` timestamp NULL DEFAULT NULL AFTER `raised`
            ";
        dbquery($sql);
        
        $sql = "UPDATE `".PREF."db` SET date_raised = NULL WHERE raised=0";
        dbquery($sql);
    }
?>