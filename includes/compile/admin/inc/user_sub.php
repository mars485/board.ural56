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

if(!isset($_GET['sub_id'])) $_GET['sub_id'] = "";

$save_mess = "";

if($_POST['submit'] != "")
	{
	if(is_numeric($_POST['cat']))
		{
	    dbquery("INSERT INTO ".PREF."subscribe SET cat=".$_POST['cat'].", user_id = ".$_GET['id']." ");
		}
	}
if(is_numeric($_GET['sub_id']))
	{
	dbquery("DELETE FROM ".PREF."subscribe WHERE id = ".$_GET['sub_id']." ");
	}



echo "<html>

<head>
    <meta charset='".$locale['charset']."'>
	<title>".$locale[118]."</title>
	<meta http-equiv='pragma' content='no-cache'>
	<link href='".PATH."admin/tpl/css/style.css' rel='stylesheet' type='text/css'>
	<script type='text/javascript' src='".$settings['patch']."js/tip.js'></script>
</head>

<body style='background-color: #EFEFEF;'>
<div id='mess' class='tip'></div>
<form name='form' action='?user_sub&id=".$_GET['id']."' method='post'>
";
$res = dbquery("SELECT * FROM ".PREF."subscribe WHERE user_id=".$_GET['id']);

echo "  <br /><div align='center'><b>".$locale[118]."</b></div><br />
	<table width='100%' align='center' border='0' cellpadding='1' cellspacing='1' class='tbl'>
";
$err = true;
while($data = dbarray($res))
	{
	$ct = get_array_linenav($data['cat'], $cats_id);

       foreach($ct as $k => $v)
        {
           $ct[$k] = "<a href='../sort/?cat_id=".$v['id']."' target='_blank'>".stripslashes($v['name'])."</a>";
        }

       $ct = implode(' / ', $ct);

	echo "
			<tr>
				<td>".$ct."</td>
				<td width='14'>
				<input type='button' value='X' onclick=\"document.location.href='?user_sub&id=".$_GET['id']."&sub_id=".$data['id']."'\">
				</td>
			</tr>
	";
	$err = false;
	}

echo "
	</table>
	";
if($err){echo "<div align='center'><div class='ok' style='width:80%;'>".$locale[455]."</div></div>";}
	echo "
<br /><br />
<div align='center'>".$locale[124].":</div>
	<select size='1' name='cat'>
	".make_select('cat', $cats_id, 'none', $substr, ' / ')."
	</select>

<input type='submit' name='submit' value='".$locale[124]."'>
</form>

".$save_mess."

</body>

</html>";

?>