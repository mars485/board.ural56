<?php

/*
	Скрипт доски объявлений
	Elite-Board 2
	Тихомиров Юрий
	Санкт-Петербург
	2009 - 2010

	версия модуля: 260110
*/
if(!isset($_POST['login'])) $_POST['login'] = "";
if(!isset($_POST['submit'])) $_POST['submit'] = "";
if($_POST['login'] == $settings['admin_login'] && md5($_POST['password']) == $settings['admin_password'])
	{
	session_start();
    $_SESSION['login'] = "";
    $_SESSION['password'] = "";
	$_SESSION['admin_login'] = $_POST['login'];
	$_SESSION['admin_password'] = md5($_POST['password']);
	header("Location: ?");
    exit();
	//session_destroy();
	}

if($_POST['submit'] != "")
	{
    if(!isset($_POST['password'])) $_POST['password'] = "";
	$pass = md5($_POST['password']);
	$res = dbquery("SELECT id FROM ".PREF."users WHERE email = '".$_POST['login']."' AND pass = '".$pass."' AND email_status = 1 AND status = 2");
	$data = dbarray($res);

	if(is_numeric($data['id']))
		{
		setcookie('userid', $data['id'], ($settings['time'] + $settings['cookie_time']), "/");
		setcookie('pass', $pass, ($settings['time'] + $settings['cookie_time']), "/");
		header('Location: ?');
        exit();
		}
    }
session_start();

$_SESSION['login'] = "";
$_SESSION['password'] = "";
if(!isset($_SESSION['admin_login'])) $_SESSION['admin_login'] = "";

if($settings['user']['status'] == 2)
	{
	$panel_login = true;
	}
elseif($_SESSION['admin_login'] == $settings['admin_login'] && $_SESSION['admin_password'] == $settings['admin_password'])
	{
    $panel_login = true;
    $admin_status = true;
	}
else
	{
    $smarty->display('admin_login.html');
    exit();
	}

if(!$panel_login)
	{
	$smarty->display('admin_login.html');
	exit();
	}
?>