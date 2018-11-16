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


$save_mess = "";
if(!isset($_POST['email_status'])) $_POST['email_status'] = "";
if(!isset($_POST['module'])) $_POST['module'] = "";
if(!isset($_POST['phone'])) $_POST['phone'] = "";
if(!isset($_POST['balance'])) $_POST['balance'] = "";
if(!isset($_POST['pay'])) $_POST['pay'] = "";

if($_POST['submit'] != "")
	{
	$_sql = "UPDATE ".PREF."users SET ";
    if(is_array($_POST['module']) && count($_POST['module']) > 0)
	    {
	 	$_modules = array();
     	foreach($_POST['module'] as $k => $v)
	     	{
     	    if($v == 'ON')
	     	    {
     	  	    $_modules[] = $k;
	     	    }
	     	}
	   	if(count($_modules) > 0)
		   	{
		   	$_sql .= "actions='".implode_string($_modules, '|')."', ";

		   	}
	    }else{
	       $_sql .= "actions='', ";
	    }

	$_sql .= " email_status = ";

	if($_POST['email_status'] == 'ON')
		{
	    $_sql .= "1, ";
		}
	else
		{
	    $_sql .= "0, ";
		}

	if($_POST['phone'] != "")
		{
		$_sql .= " phone = ".$_POST['phone'].", ";
	    }

	if($_POST['balance'] != "")
		{
		$_POST['balance'] = str_replace(',', '.', $_POST['balance']);
	    $_sql .= " balance = '".$_POST['balance']."'";
	    if($_POST['pay'] == 'ON')
		    {
	        $old = $_POST['balance_old'];
	        $new = $_POST['balance'];
	        if($old == ''){$old = 0;}
			// type - тип операции i(n) - поступление средств, o(ut) - списание средств, p(lus) - ручное зачисление средств, m(inus) - ручное списание средств
            $count = false;
            if($old < $new)
	            {
                $count = round(($new - $old), 2);
                $type = 'p';
	            }
            elseif($old > $new)
	            {
                $count = round(($old - $new), 2);
	            $type = 'm';
	            }
	        if($count)
		        {
				update_balance($_GET['id'], $type, $count, $_POST['comments']);
			    }
		    }
		}
    else
	    {
        $_sql .= " balance = '0'";
	    }

	if($_POST['pass'] != "")
		{
	    $_sql .= ", pass = '".md5($_POST['pass'])."' ";
		}

	$_sql .= " WHERE id=".$_GET['id'];

	dbquery($_sql);

	$save_mess = "
	<div align='center'>
	<div class='ok' style='width:80%;'>".$locale[351]."</div>
	</div>
	";
	}

$res = dbquery("SELECT * FROM ".PREF."users WHERE id=".$_GET['id']);
$data = dbarray($res);

echo "<html>

<head>
    <meta charset='".$locale['charset']."'>
	<title>".$locale[340]."</title>
	<meta http-equiv='pragma' content='no-cache'>
	<link href='".PATH."admin/tpl/css/style.css' rel='stylesheet' type='text/css'>
    <meta http-equiv='content-type' content='text/html; charset=".$locale['charset']."'>

	<script type='text/javascript' src='".$settings['patch']."js/functions.js'></script>
	<script type='text/javascript' src='".$settings['patch']."js/tip.js'></script>

	<script type='text/javascript'>
		function sh(id)
			{
			var klappText = document.getElementById('s' + id);
			if (klappText.style.display == 'none')
				{
				klappText.style.display = 'block';
				}
			else
				{
				klappText.style.display = 'none';
				}
			}
	</script>


</head>

<body style='background-color: #EFEFEF;'>

<div id='mess' class='tip'></div>
<form name='form' action='?user_opt&id=".$_GET['id']."' method='post'>
";

if($data['status'] == 2)
	{
	echo "
	<div align='center'>".hlp($locale[375])." <b>".$locale[370]."</b></div>
	<br />
	<table width='100%' align='center' border='0' cellpadding='1' cellspacing='1' class='tbl'>
	";
	$actions = explode_string($data['actions'], '|');
	foreach($modules as $k => $v)
		{
		echo "
		<tr>
			<td><input name='module[".$v['id']."]' type='checkbox' value='ON'";
			if(in_array($v['id'], $actions))
				{
				echo " checked";
				}
			echo "></td>
			<td>".($v['name'] == '' ? $v['id'] : $v['name'])."</td>
		</tr>
		";
		}

	echo "
	</table>
    <br />
	";
	}

echo "
<div align='center'><b>".$locale[340]."</b></div>
<br />


	<table width='100%' align='center' border='0' cellpadding='1' cellspacing='1' class='tbl'>
		<tr>
			<td>".$locale[361]."</td>
			<td><input style='vertical-align:middle;'  name='email_status' type='checkbox' value='ON'";
if($data['email_status'] == 1)
	{
	echo " checked";
	}
echo ">&nbsp;".$locale[372]."</td>
		</tr>
";

if($settings['sms'] == 1)
	{
	echo "
			<tr>
				<td width='50%'>".hlp($locale[827])." ".$locale[826]."</td>
				<td width='50%'><input name='phone' type='text' value='".$data['phone']."' size='15'></td>
			</tr>
	";
	}

echo "
		<tr>
			<td width='50%'>".$locale[158]."</td>
			<td width='50%'><input name='balance' type='text' value='".$data['balance']."' size='6'></td>
		</tr>
		<tr>
			<td>".hlp($locale[599])." ".$locale[598]."</td>
				<td>
				<input name='pay' type='checkbox' onclick='sh(5)' value='ON'>
				<input name='balance_old' type='hidden' value='".$data['balance']."'>
				<div id='s5' style='display:none;'>".$locale['192'].":
					<input name='comments' type='text' value='' >
				</div>
				</td>
		</tr>
		<tr>
			<td>".hlp($locale[129])." ".$locale[374]."</td>
			<td><input name='pass' type='text' value='' size='15'></td>
		</tr>
	</table>
<br />
<div align='center'><input type='submit' name='submit' value='".$locale[335]."'></div>

</form>

".$save_mess."

</body>

</html>";

?>