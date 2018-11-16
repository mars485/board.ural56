<?php
$upd1 = false;
$upd2 = false;
$upd3 = false;
$res = dbquery("show create table ".PREF."db");
$dat = dbarray($res);
$ct = $dat['Create Table'];

if(strpos($ct, '`f_') !== FALSE){
    $upd1 = true;
}
if(strpos($ct, '`date_raised`') === FALSE){
    $upd3 = true;
    
}

$ct = explode("\n", $ct);
foreach($ct as $v){
    if(strpos($v, '`date_raised`') !== FALSE){
        if(strpos($v, 'DEFAULT CURRENT_TIMESTAMP') !== FALSE){
            $upd2 = true;
        }
    }
}

if($upd1){
    $colums = array();
    $res = dbquery('SHOW COLUMNS FROM '.PREF.'db');
    while($dat = dbarray($res)){
        $c = $dat['Field'];
        if(substr($c, 0, 3) == 'tag'){
            $colums[] = 'DROP `'.$c.'`';
        }elseif(substr($c, 0, 2) == 'f_'){
            $colums[] = 'DROP `'.$c.'`';
        }
        
    }
    if(count($colums) > 0){
        $sql = 'ALTER TABLE `'.PREF.'db` '.implode(",\n", $colums);
        dbquery($sql);
    }
}
if($upd2){
    $sql = "
        ALTER TABLE `".PREF."db`
        CHANGE `date_raised` `date_raised` timestamp NULL DEFAULT NULL AFTER `raised`
        ";
    dbquery($sql);
    
    $sql = "UPDATE `".PREF."db` SET date_raised = NULL WHERE raised=0";
    dbquery($sql);
}

if($upd3){
    dbquery("ALTER TABLE  `".PREF."db` ADD  `date_raised` TIMESTAMP NULL DEFAULT NULL AFTER  `raised`");
    dbquery("ALTER TABLE  `".PREF."db` ADD INDEX `date_raised_raised` (`date_raised`, `raised`)");
}
?>