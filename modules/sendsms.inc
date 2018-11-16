<?php

$smstimeout = 300;	// ¬ течении какого времени разрешить отправл€ть сообщение повторно
$smsiplimit = 5;	//  оличество сообщение с одного ip в сутки



$num = $_GET['num'];
$n = "";
for($i = 0; $i < strlen($num); $i++)
	{
	if(is_numeric($num{$i}))
		{	    $n .= $num{$i};		}
	}

if($n != "" && strlen($n) <= 15)
	{	$res = dbquery("SELECT id FROM ".PREF."users WHERE phone = '".$n."' ");
	$dat = dbarray($res);

	if($dat['id'] != "")
		{
		exit($locale[814]);		}	}

if(strlen($n) > 15)
	{	echo $locale[809];	}
else
	{

	$countip = dbrows(dbquery("SELECT id FROM ".PREF."smscode WHERE ip='".$settings['ip']."' AND time >  ".($settings['time'] -  86400) ." AND time  < ".$settings['time']));

	//die($countip." | SELECT id FROM ".PREF."smscode WHERE ip='".$settings['ip']."' AND time >  ".($settings['time'] -  86400));

	if($countip > $smsiplimit)
		{	    die($locale[823]);		}
    include(FULLPATH.'modules/smsfunctions.php');

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
	    {        $count = dbrows(dbquery("SELECT id FROM ".PREF."smscode WHERE code='".$code."'"));
        if($count == 0)
	        {            return false;	        }
	    else
		    {	 	    return true;		    }	    }
	$code = generate_code();

	$res = dbquery("SELECT * FROM ".PREF."smscode WHERE num='".$n."'");
	$dat = dbarray($res);
	if($dat['id'] != "")
		{
		if(($settings['time'] - $dat['time']) < $smstimeout && $dat['time'] > 0)
			{		    die($locale[822]);			}	    $code = $dat['code'];		}
	else
		{
		dbquery("INSERT INTO ".PREF."smscode SET num='".$n."', ip='".$settings['ip']."', status='none', code=".$code);
		}
	$msg = $settings['sms_text'];
	$msg = str_replace('%code%', $code, $msg);

	$ssms = sendsms($msg, '+'.$num);
	if(!$ssms)
		{		echo $locale[813];
		}
	else
		{
		dbquery("UPDATE ".PREF."smscode SET status='".$ssms."', time='".$settings['time']."' WHERE num=".$n);        if($ssms > 0)
	        {	        echo 'ok';	        }
	    else
		    {	 	    echo 'Error status: '.$ssms;		    }		}


    //sendsms('');	}
exit();
?>