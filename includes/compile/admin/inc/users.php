<?php
/*
	Скрипт доски объявлений
	Elite-Board 2
	Тихомиров Юрий
	Санкт-Петербург
	2009 - 2010

	версия модуля: 140210
*/

if(!$exe)
	{
	if(!isset($_GET['status']))
		{
	    $_GET['status'] = 0;
		}
        
	if(!isset($_GET['onpage'])) $_GET['onpage'] = "";
	if(!isset($_GET['email_status'])) $_GET['email_status'] = "";
	if(!isset($_GET['name'])) $_GET['name'] = "";

	if(!is_numeric($_GET['onpage']))
		{
	    $_GET['onpage'] = $on_page_default;
		}

	$get_str = "?unit=users&onpage=".$_GET['onpage']."&email_status=".$_GET['email_status']."&status=".$_GET['status']."&name=".$_GET['name'];

	if($_POST['submit'] != "" && $_POST['status'] != "")
		{
	    if(is_array($_POST['check']) && count($_POST['check']) > 0)
		    {
	 	    foreach($_POST['check'] as $k => $v)
		 	    {
	 		    if(is_numeric($k) && $v == 'ON')
		 		    {
		 		    if(is_numeric($_POST['status']))
			 		    {

		 			    dbquery("UPDATE ".PREF."users SET status=".$_POST['status']." WHERE id=".$k);

			 		    }
					elseif($_POST['status'] == 'delete')
						{
					    dbquery("DELETE FROM ".PREF."users WHERE id=".$k);
						}
		 		    }
		 	    }

			header('Location: '.$get_str);
		    }
		}
	}
if($exe)
	{
	echo "
    <script type='text/javascript'>
	    function select_all()
		    {
			for (i = 0; i < ".$_GET['onpage']."; i++)
				{
				if(document.getElementById('check' + i))
					{
					if(document.getElementById('check' + i).checked == true)
						{
			            document.getElementById('check' + i).checked = false;
						}
					else
						{
					    document.getElementById('check' + i).checked = true;
						}
					}
				}
		    }
    </script>
	";


	$cond = array();

	if(is_numeric($_GET['status']))
		{
	    $cond[] = "status=".$_GET['status']."";
		}
	if(is_numeric($_GET['email_status']))
		{
	    $cond[] = "email_status=".$_GET['email_status']."";
		}

	if($_GET['name'] != "")
		{
	    $cond[] = "(LOWER(`name`) LIKE '%".strtolower_utf8($_GET['name'])."%' OR LOWER(`email`) LIKE '%".strtolower_utf8($_GET['name'])."%')";
		}


    $cond = implode(' AND ', $cond);
    $dop_sql = "";
	if($cond != "")
		{
	    $dop_sql = " WHERE ".$cond." ";
	    }

    
    if(!isset($_GET['page'])) $_GET['page'] = "";
    $page = $_GET['page'];
    $limit = "";
    $count_messages = dbrows(dbquery("SELECT id FROM ".PREF."users ".$dop_sql));
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
	$limit = " ORDER by date desc LIMIT ".$offset.", ".$_GET['onpage'];

	//$page_count

    $dop_sql .= $limit;

	$sql = "SELECT * FROM ".PREF."users ".$dop_sql;

	$status_text[0] = $locale[366];
	$status_text[1] = $locale[336];
	$status_text[2] = $locale[367];

	$status_email[0] = $locale[373];
	$status_email[1] = $locale[372];

	$mods_array = array();
	foreach($modules as $v)
		{
	    $mods_array[$v['id']] = '&rarr;&nbsp;'.$v['name'];
		}

	echo "
    <div align='center'>

    <div id='form_h'>".$locale[198]."</div>
		<form name='form' action='?' method='get' id='form'>
		<input name='unit' type='hidden' value='users'>
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
			<div id='razdel_form'></div>
			".$locale[336]." / ".$locale[21].": <input name='name' type='text' value='".$_GET['name']."'>
			<div id='razdel_form'></div>
			".$locale[213]."
			<select size='1' name='status'>
			<option value='all' "; if($_GET['status'] == 'all'){echo ' selected ';} echo ">".$locale[204]."</option>
			<option value='0' "; if($_GET['status'] == '0'){echo ' selected ';} echo ">".$locale[366]."</option>
			<option value='1' "; if($_GET['status'] == '1'){echo ' selected ';} echo ">".$locale[336]."</option>
			<option value='2' "; if($_GET['status'] == '2'){echo ' selected ';} echo ">".$locale[367]."</option>
			</select>

	        <div id='razdel_form'></div>

	        <input type='submit' value='".$locale[335]."'>

			</div>
		</form>


	    <table border='0' width='100%' class='border_no'>
	    <tr><td align='center' style='font-size:13px;'>
	    ".$locale[2]." <b>".$count_messages."</b>
	    </td></tr>
	    <tr><td>
	    ";
	    if($page_count > 1)
		    {
		    echo "
		    <div style='width:90%;width:90%; display: table; margin-bottom: 20px;	margin-left: -5px; margin-top: 20px; '>
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
				echo "' onclick=\"go('?unit=users&onpage=".$_GET['onpage']."&status=".$_GET['status']."&email_status=".$_GET['email_status']."&name=".$_GET['name']."&page=".$i."')\">".$i."</div>";
			    }
		    echo "
		    </div>
		    ";
		    }

//email pass date status  email_status  actions    name    balance


	    echo "
	    </td></tr>
	    </table>

	    <form name='form2' action='".$get_str."' method='post'>
		    <table align='center' width='90%' border='0' cellpadding='1' cellspacing='1' class='tbl' id='tbl_users'>
			    <tr class='tbl_head'>
                    <td>".hlp($locale[935])." ".$locale[336]."</td>
                    <td>".$locale[368]."</td>
                    <td>".$locale[21]."</td>
                    <td>".$locale[361]."</td>
                    <td>".$locale[369]."</td>
                    <td>".$locale[371]."</td>
                    <td>".$locale[370]."</td>
				    <td width='2%' align='center'>
					<i  onclick=\"select_all();\" onmouseover=\"Tip(this, '".$locale[339]."')\" onmouseout=\"UnTip(this)\"  class='fa fa-plus-square'></i></td>
					<td align='center'>
					<i onmouseover=\"Tip(this, '".$locale[340]."')\" onmouseout=\"UnTip(this)\"  class='fa fa-cog'></i>
					<td align='center'><i class='fa fa-envelope-o'  onmouseover=\"Tip(this, '".$locale[454]."')\" onmouseout=\"UnTip(this)\" ></i></td>
					<td align='center'><i onmouseover=\"Tip(this, '".$locale[63]."')\" onmouseout=\"UnTip(this)\" class='fa fa-pencil-square-o'></i></td>
			    </tr>
			    <tr>
			    </tr>
			";


	$res = dbquery($sql);
	$i = 0;
	while($data = dbarray($res))
		{
        $actions = explode_string($data['actions'], '|');
        foreach($actions as $k => $v)
	        {
            $actions[$k] = $mods_array[$v];
	        }

        $actions = implode('<br>', $actions);

        $height = '500';
        if($data['status'] != 2)
	        {
            $height = '200';
	        }
        if(!isset($_GET['user_id'])) $_GET['user_id'] = "";
		echo "
		<tr>
			<td><a href='?unit=edit&user_id=".$data['id']."&status=all&approved=all'>".$data['name']."</a> (".dbrows(dbquery("SELECT id FROM ".PREF."db WHERE user_id=".$data['id']." AND status=1")).")</td>
			<td>".date('d.m.Y H:i', $data['date'])."</td>
			<td>".$data['email']."</td>
			<td><a href='?unit=users&user_id=".$_GET['user_id']."&onpage=".$_GET['onpage']."&email_status=".$data['email_status']."&status=".$_GET['status']."'>".$status_email[$data['email_status']]."</a></td>
			<td>".$status_text[$data['status']]."</td>
			<td>".$data['balance']."</td>
			<td>".$actions."</td>
			<td align='center'><input id='check".$i."' name='check[".$data['id']."]' type='checkbox' value='ON'></td>
			<td align='center'><i  onmouseover=\"Tip(this, '".$locale[340]."')\" onmouseout=\"UnTip(this)\"  onclick=\"popup('?user_opt&id=".$data['id']."', 300, ".$height.");\"  class='fa fa-cog'></i></td>
			<td align='center'><i  onmouseover=\"Tip(this, '".$locale[454]."')\" onmouseout=\"UnTip(this)\"  class='fa fa-envelope-o'  onclick=\"popup('?user_sub&id=".$data['id']."', 500, 400);\"></i></td>
			<td align='center'><i onmouseover=\"Tip(this, '".$locale[63]."')\" onmouseout=\"UnTip(this)\" onclick=\"popup('?user_state&id=".$data['id']."', 500, 400);\" class='fa fa-pencil-square-o'></i></td>
		</tr>
		";
	    $i++;
		}


		echo "
			</table>
	    <div align='center'  class='tab_fut_a'><br /><br />
	    <a href='javascript:select_all();'>".$locale[341]."</a>
	    <br /><br />
	    ".$locale[342].":
		<select size='1' name='status'>
			<option value='1'>".$locale[336]."</option>
			<option value='2'>".$locale[367]."</option>
			<option value='0'>".$locale[366]."</option>
			<option value='delete'>".$locale[344]."</option>
		</select>
		<input type='submit' name='submit' value='".$locale[335]."'>
	    </div>
	    </form>

	    ";




	}

?>