<?php

$smstimeout = 300;	// � ������� ������ ������� ��������� ���������� ��������� ��������
$smsiplimit = 5;	// ���������� ��������� � ������ ip � �����



$num = $_GET['num'];
$n = "";
for($i = 0; $i < strlen($num); $i++)
	{
	if(is_numeric($num{$i}))
		{
	}

if($n != "" && strlen($n) <= 15)
	{
	$dat = dbarray($res);

	if($dat['id'] != "")
		{
		exit($locale[814]);

if(strlen($n) > 15)
	{
else
	{

	$countip = dbrows(dbquery("SELECT id FROM ".PREF."smscode WHERE ip='".$settings['ip']."' AND time >  ".($settings['time'] -  86400) ." AND time  < ".$settings['time']));

	//die($countip." | SELECT id FROM ".PREF."smscode WHERE ip='".$settings['ip']."' AND time >  ".($settings['time'] -  86400));

	if($countip > $smsiplimit)
		{


	function generate_code()
		{
		$code = rand(1000, 9999);
		do
			{
			$code = rand(1000, 9999);
			}
		while(isset_key($code));
		return $code;
		}
	function isset_key($code)
	    {
        if($count == 0)
	        {
	    else
		    {
	$code = generate_code();

	$res = dbquery("SELECT * FROM ".PREF."smscode WHERE num='".$n."'");
	$dat = dbarray($res);
	if($dat['id'] != "")
		{
		if(($settings['time'] - $dat['time']) < $smstimeout && $dat['time'] > 0)
			{
	else
		{
		dbquery("INSERT INTO ".PREF."smscode SET num='".$n."', ip='".$settings['ip']."', status='none', code=".$code);
		}
	$msg = $settings['sms_text'];
	$msg = str_replace('%code%', $code, $msg);

	$ssms = sendsms($msg, '+'.$num);
	if(!$ssms)
		{
		}
	else
		{
		dbquery("UPDATE ".PREF."smscode SET status='".$ssms."', time='".$settings['time']."' WHERE num=".$n);
	        {
	    else
		    {


    //sendsms('');
exit();
?>