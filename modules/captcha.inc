<?php
/*
	������ ����� ����������
	Elite-Board 2
	��������� ����
	�����-���������
	2009 - 2010

	������ ������: 260110
*/

if(!SessionCheck()){
    session_start();
}
captcha($settings, 'make_image');
exit;
?>