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

if($_POST['date_del'] != "")
	{
	list($Y, $m, $d) = explode('-', trim($_POST['date_del']));
	$savetime = mktime(0, 0, 0, $m, $d, $Y);
	dbquery("UPDATE ".PREF."db SET date_del='".$savetime."' WHERE id=".$_GET['id']);
	$save_mess = "
	<div align='center'>
	<div class='ok'>".$locale[351]."</div>
	</div>
	";
	}
echo "<html>

<head>
    <meta charset='".$locale['charset']."'>
	<title>".$locale[142]."</title>
	<meta http-equiv='pragma' content='no-cache'>
	<link href='".PATH."admin/tpl/css/style.css' rel='stylesheet' type='text/css'>
	";

echo "
	<script type='text/javascript' src='".$settings['patch']."js/jquery.js'></script>
	<link type='text/css' rel='stylesheet' href='".$settings['patch']."css/calendar/jscal2.css' />
	<link type='text/css' rel='stylesheet' href='".$settings['patch']."css/calendar/border-radius.css' />
	<link type='text/css' rel='stylesheet' href='".$settings['patch']."css/calendar/".$calendar_theme."/".$calendar_theme.".css' />
	<script src='".$settings['patch']."js/calendar/jscal2.js'></script>
	<script src='".$settings['patch']."js/calendar/lang/".$calendar_lang.".js'></script>

	<script type=\"text/javascript\" language=\"javascript\" charset=\"utf-8\">
	// <![CDATA[
	$(document).ready( function () {
		var FROM_CAL = Calendar.setup({
			inputField: \"date_del\",
          	dateFormat: \"%Y-%m-%d\",
          	trigger: \"date_del\",
          	bottomBar: false,
          	date: Calendar.intToDate(".date("Ymd")."),
          	min: Calendar.intToDate(10001130),
          	onSelect: function() {
				var date = Calendar.intToDate(this.selection.get());
                END_CAL.args.min = date;

                FROM_CAL.hide();
                END_CAL.redraw();
                END_CAL.focus();
          	}
  		});

	});

	// ]]>
	</script>\n";

	echo "
</head>

<body style='background-color: #EFEFEF;'>
<div id='errors' align='center'></div>
";

$time = dbarray(dbquery("SELECT date_del FROM ".PREF."db WHERE id=".$_GET['id']));

echo "
	<table border='0' width='100%' height='100%'>
		<tr>
			<td valign='top' align='center'>
				<form id='form-zayavka' name='frm' action='?prolong&id=".$_GET['id']."' method='post'>
                	<b>".$locale[355]."</b>
                	<br /><br />
                	<input name='date_del' id='date_del' type='text' value='".date('Y', $time['date_del'])."-".date('m', $time['date_del'])."-".date('d', $time['date_del'])."' size='10' style='font-size:14px;'>
                	<input type='submit' name='submit' value='".$locale[335]."' style='font-size:14px;'>
                	<br /><br />".$save_mess."
				</form>
			</td>
		</tr>
	</table>
";


echo "
</body>

</html>";

?>