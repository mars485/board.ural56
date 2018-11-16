<?php
/*
	Скрипт доски объявлений
	Elite-Board 2
	Тихомиров Юрий
	Санкт-Петербург
	2009 - 2010

	версия модуля: 260110
*/

session_start();

unset($_SESSION['login']);
unset($_SESSION['password']);

setcookie('userid', "",  (time() + 31536000), "/");
setcookie('pass', "", (time() + 31536000), "/");

session_destroy();

header('Location: index.php');
?>
