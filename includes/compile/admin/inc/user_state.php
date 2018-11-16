<?php

/*
	Скрипт доски объявлений
	Elite-Board 2
	Тихомиров Юрий
	Санкт-Петербург
	2009 - 2010

	версия модуля: 260110
*/

if(!is_numeric($_GET['id'])){die();}
if(!isset($_GET['del'])) $_GET['del'] = "";

$save_mess = "";


if(is_numeric($_GET['del']))
	{
	dbquery("DELETE FROM ".PREF."pay WHERE id = ".$_GET['del']." ");
	}


$res = dbquery("SELECT * FROM ".PREF."pay WHERE user_id=".$_GET['id']." ORDER by time desc");


echo "<html>

<head>
    <meta charset='".$locale['charset']."'>
	<title>".$locale[63]."</title>
	<meta http-equiv='pragma' content='no-cache'>
	<link href='".PATH."admin/tpl/css/style.css' rel='stylesheet' type='text/css'>
	<script type='text/javascript' src='".$settings['patch']."js/tip.js'></script>
	<script type='text/javascript' src='".$settings['patch']."js/functions.js'></script>
</head>

<body style='background-color: #EFEFEF;'>
<br />
<div align='center'><b>".$locale[63]."</b></div>
<br />
<table width='100%' align='center' border='0' cellpadding='1' cellspacing='1' class='tbl'>
	<tr class='tbl_head'>
		<td>".$locale[189]."</td>
		<td>".$locale[190]."</td>
		<td>".$locale[191]."</td>
		<td>".$locale[197]."</td>
		<td>".$locale[192]."</td>
		<td>".$locale[201]."</td>
	</tr>
";

while($dat = dbarray($res))
	{

	if($dat['type'] == 'i'){$status = $locale[193];}
	elseif($dat['type'] == 'p'){$status = $locale[194];}
	elseif($dat['type'] == 'o'){$status = $locale[195];}
	elseif($dat['type'] == 'm'){$status = $locale[196];}
	elseif($dat['type'] == 'e'){$status = 'ERROR!';}

	echo "
	<tr>
		<td>".date('d.m.Y H:i', $dat['time'])."</td>
		<td>".$status."</td>
		<td>".$dat['pay']."</td>
		<td>".$dat['rest']."</td>
		<td>".$dat['comments']."</td>
		<td align='center'>
		".ico("?user_state&del=".$dat['id']."&id=".$_GET['id'], 'd')."
		</td>
	</tr>
	";
	}

echo "
</table>

</body>

</html>";

?>