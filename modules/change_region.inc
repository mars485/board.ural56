<?php
/*
	������ ����� ����������
	Elite-Board 2
	��������� ����
	�����-���������
	2009 - 2010

	������ ������: 260110
*/


if(!$exe)
	{

    $url = (isset($_GET['back'])) ? urldecode($_GET['back']) : PATH;

	if(isset($_GET['clean_region'])){
	   setcookie('region', '', time() + $settings['cookie_time'], "/");
	   setcookie('regionfix', 'true', time() + $settings['cookie_time'], "/");
	}
    
	header('Location: '.$url);

	}
?>