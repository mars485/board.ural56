<?php
$upd = true;
$res = dbquery("SHOW TABLES FROM `".$db_name."`");
while($dat = dbarray($res)){
	if($dat['Tables_in_'.$db_name] == PREF."users_shop"){
	    $upd = false; break;
	}
}
if($upd){
    $sql = "
    CREATE TABLE `".PREF."users_shop` (
      `id` int(11) NOT NULL AUTO_INCREMENT,
      `user_id` int(11) NOT NULL,
      `name` varchar(150) NOT NULL DEFAULT '',
      `description` text NOT NULL,
      `delivery` text NOT NULL,
      `payment` text NOT NULL,
      `phone1` varchar(20) NOT NULL DEFAULT '',
      `phone2` varchar(20) NOT NULL DEFAULT '',
      `addr` varchar(150) NOT NULL DEFAULT '',
      `map` varchar(150) NOT NULL DEFAULT '',
      `region` int(11) NOT NULL DEFAULT '0',
      `cat` int(11) NOT NULL DEFAULT '0',
      `status` tinyint(1) NOT NULL DEFAULT '1',
      `status_pay` tinyint(1) NOT NULL DEFAULT '1',
      `next_pay` date NOT NULL DEFAULT '1970-01-01',
      PRIMARY KEY (`id`)
    ) ENGINE=MyISAM DEFAULT CHARSET=utf8;
    ";
    dbquery($sql);
}

?>