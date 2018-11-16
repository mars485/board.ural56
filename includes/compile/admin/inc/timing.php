<?php

/*
	Скрипт доски объявлений
	Elite-Board 2
	Тихомиров Юрий
	Санкт-Петербург
	2009 - 2010

	версия модуля: 260110
*/

if(!$exe)
	{
	if($act == 'save' && $_POST['submit'] != "")
		{
		$sql = "INSERT INTO ".PREF."timing SET
				days='".$_POST['days']."',
				text='".$_POST['text']."',
				sort = 10000000
				";
				dbquery($sql);
        header("Location: ?unit=timing");
		}	if($act == 'move' && is_numeric($_GET['id']))
			{
			$res = dbquery("SELECT id, sort FROM ".PREF."timing ORDER by sort");
			$n = 1;
			while($dat = dbarray($res))
				{
			    $fav[$n]['id'] = $dat['id'];
			    $fav[$n]['n'] = $n;
			    if($dat['id'] == $_GET['id']){$start = $n;}
				$n ++;
				}

			$newfav = array();

		   	if(isset($_GET['up']))
		    	{
		 		$fav[($start - 1)]['n'] = $start;
		 		$fav[$start]['n'] = $start - 1;
		    	}

		   	if(isset($_GET['down']))
		    	{
		 		$fav[($start + 1)]['n'] = $start;
		 		$fav[$start]['n'] = $start + 1;
		    	}

			foreach($fav as $v)
				{
				if($v['n'] != "" && $v['id'] != "")
					{
					dbquery("UPDATE ".PREF."timing SET sort='".$v['n']."' WHERE id=".$v['id']);
					}
				}
			header('Location: ?unit=timing');
			exit();
			}	}
if($exe)
	{
	if($act == "")
		{
		echo "
		<div align='left'>
		<input type='button' value=' &rarr; ".$locale[476]."' onclick='sh(123123);'>
			<div id='s123123' style='display:none;' align='center'>
			    <form name='form' action='?unit=timing&act=save' method='post'>
	            <FIELDSET style='width:500px;'><LEGEND>".$locale[477]."</LEGEND>
	            <table width='100%' class='add_item'>
				<tr><td>".hlp($locale[473])." ".$locale[472]."</td><td><input name='days' type='text' value='' style='width:100%'></td></tr>
				<tr><td>".hlp($locale[475])." ".$locale[474]."</td><td><input name='text' type='text' value='' style='width:100%'></td></tr>
	            </table>
	            <div align='center' style='margin:5px;'><input type='submit' name='submit' value=' ".$locale[125]." '></div>
	            </FIELDSET>
				</form>

			<br />
			<img src='".PATH."admin/tpl/img/hor.gif' width='500' alt='' border='0' style='vertical-align:middle; margin:4px;'>
			<br /><br /><br />
		</div>
		";

	    echo "
	    <div align='center'>
		<table align='center' width='500' border='0' cellpadding='1' cellspacing='1' class='tbl'>
			<tr class='tbl_head'>
				<td width='100'>".hlp($locale[473])." ".$locale[472]."</td>
				<td width='300'>".hlp($locale[475])." ".$locale[474]."</td>
				<td width='100'>".$locale[275]."</td>
			</tr>
		";
		$res = dbquery("SELECT * FROM ".PREF."timing ORDER by sort");
		while($dat = dbarray($res))
			{
			echo "
				<tr>
					<td>".$dat['days']."</td>
					<td>".stripslashes($dat['text'])."</td>
					<td align='center'>
							".ico("?unit=timing&act=edit&id=".$dat['id'], 'e')."
					        ".ico("?unit=timing&act=del&id=".$dat['id'], 'd')."
					        ".ico("?unit=timing&act=move&id=".$dat['id']."&up", 'up')."
					        ".ico("?unit=timing&act=move&id=".$dat['id']."&down", 'down')."
					</td>
				</tr>
			";
			}
		echo "
		</table>
	    ";
	    }
	elseif($act == 'del' && is_numeric($_GET['id']))
		{

		dbquery("DELETE FROM ".PREF."timing WHERE id = ".$_GET['id']);

		echo "
		<script>
		setTimeout(\"document.location.href='?unit=timing'\",1000);
		</script>
		<center><div class='ok'>".$locale[325]."</div></center>
		";
		}

    elseif($act == 'edit' && is_numeric($_GET['id']))
    	{
		if($_POST['submit'] != "")
			{
			$sql = "UPDATE ".PREF."timing SET
					days='".$_POST['days']."',
					text='".$_POST['text']."'
					WHERE id=".$_GET['id'];
					dbquery($sql);
		    echo "<div align='center'><div class='ok'>".$locale[351]."</div></div>";
			}

        $data = dbarray(dbquery("SELECT * FROM ".PREF."timing WHERE id=".$_GET['id']));
		echo "
		<div align='center'>

			    <form name='form' action='?unit=timing&act=edit&id=".$_GET['id']."' method='post'>
	            <FIELDSET style='width:500px;'><LEGEND>".$locale[477]."</LEGEND>
	            <table width='100%' class='add_item'>
				<tr><td>".hlp($locale[473])." ".$locale[472]."</td><td><input name='days' type='text' value='".$data['days']."' style='width:100%'></td></tr>
				<tr><td>".hlp($locale[475])." ".$locale[474]."</td><td><input name='text' type='text' value='".$data['text']."' style='width:100%'></td></tr>
	            </table>
	            <div align='center' style='margin:5px;'><input type='submit' name='submit' value=' ".$locale[335]." '></div>
	            </FIELDSET>
				</form>
		<br /><br /><input type='button' name='submit' onclick=\"go('?unit=timing')\" value='&larr; ".$locale[324]."'>

		</div>
		";
		}	}

?>