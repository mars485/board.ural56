<?php
/*
	������ ����� ����������
	Elite-Board 2
	��������� ����
	�����-���������
	2009 - 2010

	������ ������: 260110
*/

session_start();

unset($_SESSION['login']);
unset($_SESSION['password']);

setcookie('userid', "",  (time() + 31536000), "/");
setcookie('pass', "", (time() + 31536000), "/");

session_destroy();

header('Location: index.php');
?>
