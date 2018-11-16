<?php
$upd = true;
$res = dbquery("SHOW TABLES FROM `".$db_name."`");
while($dat = dbarray($res))
	{
	if($dat['Tables_in_'.$db_name] == PREF."packages")
		{
	    $upd = false; break;
		}
	}
if($upd){
    $sql = "
    CREATE TABLE IF NOT EXISTS `".PREF."packages` (
      `id` int(11) NOT NULL AUTO_INCREMENT,
      `days` int(11) NOT NULL,
      `text` varchar(200) CHARACTER SET utf8 NOT NULL,
      `service` int(11) NOT NULL,
      `sort` int(11) NOT NULL,
      PRIMARY KEY (`id`)
    ) ENGINE=InnoDB AUTO_INCREMENT=1
    ";

    dbquery($sql);
}
?>