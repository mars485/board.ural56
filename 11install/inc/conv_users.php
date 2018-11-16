<?php
$file = file('../files/users.dat');

$users = array();

dbquery("TRUNCATE TABLE `".PREF."users`");

foreach($file as $k => $v)
	{
	$x = explode('<>', w2u(trim($v)));	list($name, $pass, $adres, $phone, $fax, $site, $email, $date) = $x;
	//fwrite($fp, $autor.BF.md5($pass).BF.$adress.BF.$tel.BF.$faks.BF.$site.BF.$email.BF.$date.BF."\r\n");

	//$users[$name] = $x;

	list($d, $m, $y) = explode('.', $date);

	$date = @mktime(0,0,0,$d,$m,'20'.$y);

    if($email != "")
	    {
		dbquery("INSERT INTO ".PREF."users SET email='".addslashes($email)."', pass='".$pass."', date='".$date."', status=1, email_status=1, name='".addslashes($name)."', balance = '".$conf['balance']."'");
	    $l_id = dbarray(dbquery('SELECT LAST_INSERT_ID()'));
	    $users[$name]['id'] = $l_id['LAST_INSERT_ID()'];
		}



	}


?>