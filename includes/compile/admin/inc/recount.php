<?php

$active = '';
//if($settings['active_service'] == 1)
//	{
//	$active = ' AND active=1 ';
//	}

$counter = $_GET['counter'];
if(!isset($messages_cycle))
	{
	$messages_cycle = 50;
	}

if($counter == "")
	{
	$counter = 0;
	}

$messages = dbrows(dbquery("SELECT id FROM ".PREF."db WHERE status=1 "));

$act = $_GET['act'];


if($act == "")
	{
	$body = "
	<input type='button' value='".$locale[751]."' onclick=\"document.location.href='?recount&act=clean'\">
	";
	$meta = "";
	}
elseif($act == 'clean')
	{
	dbquery("TRUNCATE ".PREF."counter_cr");
    dbquery("UPDATE ".PREF."tags SET counter=0");
	$body = $locale[753];
	$meta = "<meta http-equiv='Refresh' CONTENT='3; URL=?recount&act=calc&counter=0'>";
	}
elseif($act == 'calc')
	{
	$c = round(($counter/$messages) * 100);
	if($c > 100 || (($counter + $messages_cycle) > $messages)){$c = 100;}
    $body = "
    ".$locale[754]." ".$c."%
    ";
    $res = dbquery("SELECT id, cat, region FROM ".PREF."db WHERE status=1  LIMIT ".$counter.", ".$messages_cycle);
    //pr("SELECT id, cat, region FROM ".PREF."db WHERE status=1 ".$active." LIMIT ".$counter.", ".$messages_cycle);
    while($dat = dbarray($res))
		{
		edit_cat_counter('+1', $dat['cat'], $dat['region'], $dat['id']);
		}
	$body .= "
	<table border='0' width='98%' align='center' style='border:1px solid black;'>
	<tr>
	<td height='20' width='".$c."%' style='background-color:#C0C0C0;'>&nbsp;</td>
	<td height='20'  width='".(100 - $c)."%' style='background-color:white;'>&nbsp;</td>
	</tr>
	</table>
	";
    $meta = "<meta http-equiv='Refresh' CONTENT='3; URL=?recount&act=calc&counter=".($counter + $messages_cycle)."'>";

	if(($counter + $messages_cycle) > $messages)
		{
		$body .= "
		<br />
		<div align='center'>".$locale[752]."</div>
		<br />
		<div align='center'><input type='button' value='".$locale[11]."' onClick='self.close();'></div>
		";
		$meta = "";
		}
	}

echo "
<html>
<head>
  <meta charset='".$locale['charset']."'>
  <title></title>
  ".$meta."
</head>
<body>
<div align='center'>
<br /><br />
".$body."
</div>
</body>
</html>
";
?>