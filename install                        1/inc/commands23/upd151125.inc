<?php
$upd = true;
$res = dbquery("SHOW TABLES FROM `".$db_name."`");
while($dat = dbarray($res))
	{
	if($dat['Tables_in_'.$db_name] == PREF."db_disabled")
		{
	    $upd = false; break;
		}
	}
if($upd){
    $sql = "
    CREATE TABLE IF NOT EXISTS `".PREF."db_disabled` (
      `id` int(11) NOT NULL AUTO_INCREMENT,
      `user` int(11) NOT NULL,
      `message` int(11) NOT NULL,
      PRIMARY KEY (`id`)
    ) ENGINE=MyISAM DEFAULT CHARSET=utf8;
    ";
    dbquery($sql);
}

?>