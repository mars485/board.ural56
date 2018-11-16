<?php

function get_old_settings()
	{
	$settings = array();	include('../files/config.php');
	$settings['admin_login'] = $admin_login;
	$settings['admin_password'] = md5($admin_password);
	$settings['messages_on_ind'] = $l_mess;
	$settings['onpage'] = $gpp;
	$settings['email'] = $email_admin;
	$settings['stlb'] = $sns;
	$settings['title'] = $title;
	$settings['sendmail_days'] = $dn;
	$settings['logo'] = $logo;

	$file = file('../files/meta.dat');
    $settings['description'] = trim($file[0]);
    $settings['keywords'] = trim($file[1]);
    $settings['autor'] = trim($file[2]);
    $settings['copyright'] = trim($file[3]);

	return $settings;	}

$settings = get_old_settings();

@copy('../images/'.$settings['logo'], '../images/cat/'.$settings['logo']);

foreach($settings as $k => $v)
	{	dbquery("UPDATE ".PREF."settings SET v='".addslashes(w2u($v))."' WHERE k='".$k."'");	}

?>