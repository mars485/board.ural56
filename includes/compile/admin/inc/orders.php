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
	require_once(COREPATH.'services.php');
	if(!isset($_GET['status']))
		{
	    $_GET['status'] = 0;
		}
	if(!isset($_GET['onpage'])) $_GET['onpage'] = "";
	if(!isset($_GET['user_id'])) $_GET['user_id'] = "";

	if(!is_numeric($_GET['onpage']))
		{
	    $_GET['onpage'] = $on_page_default;
		}

	$get_str = "?unit=orders&user_id=".$_GET['user_id']."&onpage=".$_GET['onpage']."&status=".$_GET['status'];

	if(isset($_POST['submit']) && isset($_POST['status']))
		{
	    if(is_array($_POST['check']) && count($_POST['check']) > 0)
		    {
	 	    foreach($_POST['check'] as $k => $v)
		 	    {
	 		    if(is_numeric($k) && $v == 'ON')
		 		    {
		 		    if(is_numeric($_POST['status']))
			 		    {

		 			    dbquery("UPDATE ".PREF."orders SET status=".$_POST['status']." WHERE id=".$k);

		 			    $date_del = dbarray(dbquery("SELECT * FROM ".PREF."orders WHERE id=".$k));
		 			    if($_POST['status'] == 1 && $date_del['time_end'] < $settings['time'])
			 			    {
			 			    $d_time = $settings['time'] + ($date_del['days'] * 86400);
                            
                            $dat2 = dbarray(dbquery("SELECT MAX(time_end) as time_end FROM ".PREF."orders WHERE type = '".$date_del['type']."' AND message_id = '".$date_del['message_id']."'")); 
                            if($dat2){
                                if($dat2['time_end'] > $settings['time']){
                                    $time_end = $dat2['time_end'] + (86400 * $date_del['days']);
                                }
                            }
                            dbquery("UPDATE ".PREF."orders SET time_end='".$d_time."' WHERE id=".$k);
			 			    }
                        dbquery("UPDATE ".PREF."db SET ".$services[$date_del['type']]['field']."=".$_POST['status']." WHERE id=".$date_del['message_id']);

			 		    }
					elseif($_POST['status'] == 'delete')
						{
						$date_del = dbarray(dbquery("SELECT * FROM ".PREF."orders WHERE id=".$k));
					    dbquery("DELETE FROM ".PREF."orders WHERE id=".$k);
                        dbquery("UPDATE ".PREF."db SET ".$services[$date_del['type']]['field']."=0 WHERE id=".$date_del['message_id']);

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
	if(is_numeric($_GET['user_id']))
		{
	    $cond[] = "user_id=".$_GET['user_id']."";
		}


    $cond[] = "type != 'a'";


    $cond = implode(' AND ', $cond);

	if($cond != "")
		{
	    $dop_sql = " WHERE ".$cond." ";
	    }
	$dop_sql .= "";

    if(!isset($_GET['page'])) $_GET['page'] = "";
    $page = $_GET['page'];
    $limit = "";
    $count_messages = dbrows(dbquery("SELECT id FROM ".PREF."orders ".$dop_sql));
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

	//$page_count

    $dop_sql .= $limit;

	$sql = "SELECT * FROM ".PREF."orders ".$dop_sql;

	$status_text[0] = $locale[219];
	$status_text[1] = $locale[214];








	echo "
    <div align='center'>

    <b>".$locale[198]."</b>:<br />
		<form name='form' action='?' method='get' id='form'>
		<input name='unit' type='hidden' value='orders'>
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
			".$locale[213]."
			<select size='1' name='status'>
			<option value='all' "; if($_GET['status'] == 'all'){echo ' selected ';} echo ">".$locale[204]."</option>
			<option value='0' "; if($_GET['status'] == '0'){echo ' selected ';} echo ">".$locale[219]."</option>
			<option value='1' "; if($_GET['status'] == '1'){echo ' selected ';} echo ">".$locale[214]."</option>
			</select>

	       <div id='razdel_form'></div>
	        <input type='submit' value='".$locale[335]."'>

			</div>
		</form>


	    <table border='0' width='100%'>
	    <tr><td align='center' style='font-size:13px;'>
	    ".$locale[2]." <b>".$count_messages."</b>
	    </td></tr>
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
				echo "' onclick=\"go('?unit=orders&onpage=".$_GET['onpage']."&status=".$_GET['status']."&user_id=".$_GET['user_id']."&page=".$i."')\">".$i."</div>";
			    }
		    echo "
		    </div>";
		    }
	    echo "
	    </td></tr>
	    </table>


	    <form name='form2' action='".$get_str."' method='post'>
		    <table align='center' width='90%' border='0' cellpadding='1' cellspacing='1' class='tbl'>
			    <tr class='tbl_head'>
				    <td width='15%'>".$locale[336]."</td>
				    <td width='35%'>".$locale[210]."</td>
				    <td width='10%'>".$locale[362]."</td>
	                <td width='10%'>".$locale[14]."</td>
				    <td width='20%'>".$locale[363]."</td>
				    <td width='15%'>".$locale[213]."</td>
				    <td width='2%' style='text-align: center;'>
					<i onclick=\"select_all();\" onmouseover=\"Tip(this, '".$locale[339]."')\" onmouseout=\"UnTip(this)\"  class='fa fa-plus-square'></i></td>
				    <td align='center' width='2%'>
					<i onmouseover=\"Tip(this, '".$locale[365]."')\" onmouseout=\"UnTip(this)\"  class='fa fa-calendar-check-o'></i>
					</td>
			    </tr>
			    ";





	$res = dbquery($sql);
	$i = 0;
	while($data = dbarray($res))
		{

		$usr = "";
		$msg = "";
		$tmd = "";
		if(is_numeric($data['user_id']) && $data['user_id'] != 0)
			{
		    $res2 = dbquery("SELECT name, id FROM ".PREF."users WHERE id = ".$data['user_id']." ");
		    $user = dbarray($res2);
		    if($user['name'] != "")
			    {
			    $usr = "<a href='?unit=orders&onpage=".$_GET['onpage']."&status=".$_GET['status']."&user_id=".$user['id']."'>".$user['name']."<a>";
				}
		    }
		else
			{
		    $usr = false;
			}

		if(is_numeric($data['message_id']) && $data['message_id'] != 0)
			{
		    $res2 = dbquery("SELECT id, title, user FROM ".PREF."db WHERE id = ".$data['message_id']." ");
		    $mess = dbarray($res2);
		    $msg = "<a href='../messages/".$mess['id']."-".cpu($mess['title'], $locale['symb']).".html' target='_blank'>".$mess['title'].'</a>';
		    if(!$usr)
			    {
			    $usr = $mess['user'];
			    }
		    }

		if($data['time_end'] == 0 || $data['time_end'] == "")
			{
		    $tmd = $locale[364];
			}
		else
			{
		    $tmd = date('d.m.Y H:i', $data['time_end']);
			}

		echo "
		<tr>
			<td>".$usr."</td>
			<td>".$msg."</td>
			<td>".$data['days']."</td>
			<td>".$tmd."</td>
			<td>".$services[$data['type']]['name']."</td>
			<td>".$status_text[$data['status']]."</td>
			<td align='center'><input id='check".$i."' name='check[".$data['id']."]' type='checkbox' value='ON'></td>
			<td align='center'>
			<i onmouseover=\"Tip(this, '".$locale[365]."')\" onmouseout=\"UnTip(this)\"  onclick=\"popup('?prolong_order&id=".$data['id']."', 400, 300);\" class='fa fa-calendar-check-o'></i></td>
		</tr>
		";
	    $i++;
		}



			    echo "
			</table>
	</div>

	    <div align='center' class='tab_fut_a'><br /><br />
	    <a href='javascript:select_all();'>".$locale[341]."</a>
	    <br /><br />
	    ".$locale[342].":
		<select size='1' name='status'>
			<option value='1'>".$locale[214]."</option>
			<option value='0'>".$locale[219]."</option>
			<option value='delete'>".$locale[344]."</option>
		</select>
		<input type='submit' name='submit' value='".$locale[335]."'>
	    </div>
	    </form>

	";
	}
?>