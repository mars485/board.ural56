<?php

$payment = $_GET['cat'][1];
$page = $_GET['cat'][2];

if($payment == "" || $page == "") exit();

if(!$exe && $page == 'result' && $payment != "")
	{    $abilling = $billing[$payment];
    if($abilling['id'] == "") die();

    eval($abilling['php_2']);

     exit();	}
elseif($exe)
	{

	if($page == 'success')
		{

		echo "
		<center>
		<div class='ok'>
		".$locale[227]."
		&rarr;&nbsp;<a href='".$settings['path']."users/'>".$locale[41]."</a>
		</div>
		</center>
		";

		}
	elseif($page == 'fail')
		{
		echo "<center>";
		echo "<div class='error'>You have refused payment.</div>";
		echo "</center>";
		}
	}
?>