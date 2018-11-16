<?php

/*
	Скрипт доски объявлений
	Elite-Board 2
	Тихомиров Юрий
	Санкт-Петербург
	2009 - 2010

	версия модуля: 260110
*/

if($exe)
	{
    if(!isset($_GET['clean'])) $_GET['clean'] = "";
    if(!isset($_GET['onpage'])) $_GET['onpage'] = "";
    if(!isset($_GET['page'])) $_GET['page'] = "";
    $dop_sql = "";
    if($_GET['clean'] == 'true')
	    {
        dbquery("TRUNCATE TABLE `".PREF."counter_pages`");
        dbquery("TRUNCATE TABLE `".PREF."counter_ip`");
        dbquery("UPDATE `".PREF."counter_vars` SET value=0");
        echo "
        <div align='center'>
        <div align='center' class='ok'>".$locale[351]."</div>
			<script>
			setTimeout(\"document.location.href='?unit=stat'\",1000);
			</script>
        </div>
        ";
	    }
	else
		{
		if(!is_numeric($_GET['onpage']))
			{
		    $_GET['onpage'] = $on_page_default;
			}
	    $page = $_GET['page'];
	    $limit = "";
	    $count_messages = dbrows(dbquery("SELECT id FROM ".PREF."counter_pages ".$dop_sql));
		$page_count = ceil($count_messages/$_GET['onpage']);
		if($page > $page_count)
			{
			$page = $page_count;
			}
		if($page <= 0 )
			{
			$page = 1;
			}
		$offset = ( $page - 1 ) * $_GET['onpage'];
		$limit = " LIMIT ".$offset.", ".$_GET['onpage'];

	    $dop_sql .= $limit;

		$sql = "SELECT * FROM ".PREF."counter_pages ORDER by counter desc ".$dop_sql;


		echo "
		<form name='form' action='?' method='get' id='form'>
		<input name='unit' type='hidden' value='stat'>
		    <div align='center'>
			    <div class='sort'>
					".$locale[333].":
					<select size='1' name='onpage'>
					<option "; if($_GET['onpage'] == 5){echo ' selected ';} echo "value='5'>5</option>
					<option "; if($_GET['onpage'] == 15){echo ' selected ';} echo "value='15'>15</option>
					<option "; if($_GET['onpage'] == 30){echo ' selected ';} echo "value='30'>30</option>
					<option "; if($_GET['onpage'] == 60){echo ' selected ';} echo "value='60'>60</option>
					<option "; if($_GET['onpage'] == 100){echo ' selected ';} echo "value='100'>100</option>
					<option "; if($_GET['onpage'] == 150){echo ' selected ';} echo "value='150'>150</option>
					<option "; if($_GET['onpage'] == 200){echo ' selected ';} echo "value='200'>200</option>
					<option "; if($_GET['onpage'] == 300){echo ' selected ';} echo "value='300'>300</option>
					</select>
					<img src='".PATH."admin/tpl/img/vert.gif' width='5' alt='' border='0' style='vertical-align:middle;'>
					<input type='submit' value='".$locale[335]."'>
				</div>
			</div>
		</form>

	    <table width='200' align='center'  class='tbl' style='width: 300px;'>
			<tr><td style='width:90%;'>".$locale[221]."</td><td align='right' style='width:10%;'>".$counter['hosts_today']."</td></tr>
			<tr><td style='width:90%;'>".$locale[222]."</td><td align='right' style='width:10%;'>".$counter['hits_today']."</td></tr>
			<tr><td style='width:90%;'>".$locale[223]."</td><td align='right' style='width:10%;'>".$counter['hosts_all']."</td></tr>
			<tr><td style='width:90%;'>".$locale[225]."</td><td align='right' style='width:10%;'>".$counter['hits_all']."</td></tr>
	    </table>
	    <br /><br /><br />
	    <table border='0' width='100%'>
	    <tr><td align='center' style='font-size:13px;'>
	    ".$locale[2]." <b>".$count_messages."</b>
	    </td></tr>";
	    /*
	    echo "
	    <tr><td>
	    ";
	    if($page_count > 1)
		    {
		    echo "
		    <div style='width:90%;'>
		    <div class='page unsel' >".$locale[140].":</div>
		    ";
		    for($i=1; $i <= $page_count; $i++)
			    {
		        echo "<div class='page ";
		        if($i == $_GET['page'])
			        {
			        echo "sel";
			        }
			    else
				    {
			 	    echo "unsel";
				    }
				echo "' onclick=\"go('?unit=stat&page=".$i."')\">".$i."</div>";
			    }
		    echo "
		    </div>
		    ";
		    }

	    echo "
	    </td></tr>
	    </table>

	    <br /><br />
        ";

        echo "
	    <table align='center' width='90%' border='0' cellpadding='1' cellspacing='1' class='tbl'>
		    <tr class='tbl_head'>
			    <td>".$locale[140]."</td>
			    <td width='50'>".$locale[427]."</td>
		    </tr>
		";

		$res = dbquery($sql);

		while($data = dbarray($res))
			{
			echo "
				<tr>
					<td><a href='".$data['page']."' target='_blank'>".$data['page']."</a></td>
					<td>".$data['counter']."</td>
				</tr>
			";
			}

        */

		echo "
		</table>";

		echo"

		<div align='right'><input type='button' value='".$locale[597]."'  onclick=\"if(confirm('".$locale[43]."')){go('?unit=stat&clean=true');}\"></div>
		";
		}
	}

?>