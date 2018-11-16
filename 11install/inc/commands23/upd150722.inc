<?php
$upd = true;
$res = dbquery("SHOW TABLES FROM `".$db_name."`");
while($dat = dbarray($res))
	{
	if($dat['Tables_in_'.$db_name] == PREF."mailing_unsubscribe")
		{
	    $upd = false; break;
		}
	}
if($upd){
    $sql = "
    CREATE TABLE IF NOT EXISTS `".PREF."mailing_unsubscribe` (
    `id` int(11) NOT NULL AUTO_INCREMENT,
    `email` varchar(100) NOT NULL,
    PRIMARY KEY (`id`)
    ) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=10
    ";

    dbquery($sql);
}

?>