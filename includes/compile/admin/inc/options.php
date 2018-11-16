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

require(COREPATH.'services.php');

echo "<html>

<head>
    <meta charset='".$locale['charset']."'>
	<title>".$locale[345]."</title>
	<meta http-equiv='pragma' content='no-cache'>
	<link href='".PATH."admin/tpl/css/style.css' rel='stylesheet' type='text/css'>
	<script type='text/javascript' src='".$settings['patch']."js/tip.js'></script>
</head>

<body style='background-color: #EFEFEF;'>
";

if(isset($_POST['submit2'])){
    if(dbquery("UPDATE ".PREF."db SET counter='".$_POST['counter']."' WHERE id=".$_GET['id'])){
    	echo "
    	<center><div align='center' class='ok' style='width:200px;'>".$locale[351]."</div></center>
    	";
    }
}

if($_POST['submit'] != "" && is_numeric($_GET['id']))
	{
	foreach($services as $k => $v)
		{
		$res = dbquery("SELECT * FROM ".PREF."orders WHERE message_id=".$_GET['id']." AND type = '".$k."' AND time_end = (SELECT MAX(time_end) FROM ".PREF."orders WHERE message_id=".$_GET['id']." AND type = '".$k."')");
		$dat = dbarray($res);
        
		$user = dbarray(dbquery("SELECT user_id FROM ".PREF."db WHERE id=".$_GET['id']));
        if($user['user_id'] == 0){$user['user_id'] = "";}

        $time_end = ($_POST['days'][$k] * 86400) + $settings['time'];
        if($time_end <= $settings['time'])
	        {
            $time_end = 0;
	        }
        if($_POST['status'][$k] == 'ON')
	        {
            $status = 1;
            
	        }
	    else
		    {
	 	    $status = 0;
		    }

//id user_id time_end days type message_id status
		if($dat['id'] != "")
			{
		    dbquery("UPDATE ".PREF."orders SET days='".$_POST['days'][$k]."', time_end='".$time_end."', status=".$status.$dopsql." WHERE id=".$dat['id']);
            }
		elseif($status == 1 && $_POST['days'][$k] > 0)
			{
		    dbquery("INSERT INTO ".PREF."orders SET message_id=".$_GET['id'].", user_id='".$user['user_id']."', days='".$_POST['days'][$k]."', time_end='".$time_end."', status=".$status.", type='".$k."'");
            dbquery("UPDATE ".PREF."db SET ".$v['field']."=".$status." WHERE id=".$_GET['id']);
			}
		if($status == 0)
			{
		    dbquery("UPDATE ".PREF."db SET ".$v['field']."=".$status." WHERE id=".$_GET['id']);
			}
            
            if($v['field'] == 'raised'){
                if($status == 1){
                    $tmp = 'CURRENT_TIMESTAMP';
                }else{
                    $tmp = 'NULL';
                }
                dbquery("UPDATE ".PREF."db SET date_raised=".$tmp." WHERE id=".intval($_GET['id']));
            }
		}
	echo "
	<center><div align='center' class='ok' style='width:200px;'>".$locale[351]."</div></center>
	";
	}

$message = dbarray(dbquery("SELECT * FROM ".PREF."db WHERE id=".$_GET['id']));

echo "
<div id='mess' class='tip' style='width:150px;'></div>
	<table border='0' width='100%' height='100%'>
		<tr>
			<td valign='middle' align='left'>
<form name='form1' action='?options&id=".$_GET['id']."' method='post'>
<table border='0' width='100%' border='0' cellpadding='1' cellspacing='1' class='tbl'>
<tr class='tbl_head'>
<td>".hlp($locale[348])."&nbsp;<b>".$locale[346]."</b></td>
<td>".hlp($locale[349])."&nbsp;<b>".$locale[213]."</b></td>
<td>".hlp($locale[350])."&nbsp;<b>".$locale[347]."</b></td>
</tr>
";

foreach($services as $k => $v)
	{

	$res = dbquery("SELECT * FROM ".PREF."orders WHERE message_id=".$_GET['id']." AND type = '".$k."' AND time_end = (SELECT MAX(time_end) FROM ".PREF."orders WHERE message_id=".$_GET['id']." AND type = '".$k."')");
	$dat = dbarray($res);

    $days = $dat['time_end'] - $settings['time'];

    if($days < 0){$days = 0;}
    $days = round($days / 86400);



    echo "
    <tr><td width='80%'>".$v['name']."</td><td><input name='status[".$k."]' type='checkbox' value='ON'";

	if($dat['status'] == 1)
		{
        echo " checked ";
		}
       elseif($dat['time_end'] < $settings['time'] && $dat['days'] > 0)
        {
        $days = $dat['days'];
        }
    echo "></td>
    <td><input name='days[".$k."]' type='text' value='".$days."' size='4'></td>
    </tr>
    ";
	}

echo "

<tr><td colspan='3' align='center'><input type='submit' name='submit' value='".$locale[335]."'></td></tr>
				</table>
				</form>

                
                <form name='form2' action='?options&id=".$_GET['id']."' method='post'>
                    <table border='0' width='100%' border='0' cellpadding='1' cellspacing='1' class='tbl'>
                        <tr class='tbl_head'>
                            <td><b>".$locale[991]."</b></td>
                        </tr>
                        <tr>
                            <td>
                            <input type=text name=counter value='".$message['counter']."'>
                            <input type='submit' name='submit2' value='".$locale[335]."'>
                            </td>
                        </tr>
                    </table>
                </form>
                
			</td>
		</tr>
	</table>
";


echo "
</body>

</html>";

?>