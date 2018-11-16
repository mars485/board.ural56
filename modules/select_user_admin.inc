<?php

if(!isset($_GET['onpage'])) $_GET['onpage'] = "";
if(!isset($_GET['status'])) $_GET['status'] = "";
if(!isset($_GET['email_status'])) $_GET['email_status'] = "";
if(!isset($_GET['name'])) $_GET['name'] = "";
if(!isset($_GET['page'])) $_GET['page'] = "";
$dop_sql = "";


if($_GET['status'] == "")
	{
    $_GET['status'] = 1;
	}

if(!is_numeric($_GET['onpage']))
	{
    $_GET['onpage'] = $on_page_default;
	}



$get_str = "?unit=select_user&onpage=".$_GET['onpage']."&email_status=".$_GET['email_status']."&status=".$_GET['status']."&name=".$_GET['name'];

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

echo "
<html>

<head>
  <title>".$locale[709]."</title>
</head>
<link href='".PATH."admin/tpl/css/style.css' rel='stylesheet' type='text/css'>
<style>
div.page1
	{
	border:1px solid black;
	color:white;
	font-size:12px;
	font-family:Verdana;
	height:14px;
	padding:1px;
	margin:1px;
	font-weight:normal;
	text-align:center;
	vertical-align: middle;
	float:left;
	cursor:pointer;
	}
.sel1
	{
    background-color:#640000;
	}
.unsel1
	{
    background-color:#7A7A7A;
	}
</style>
<script type='text/javascript' src='".$settings['patch']."js/functions.js'></script>
<body>
";

	echo "
    <script type='text/javascript'>
	    function insert_user(id, name)
		    {
		    window.opener.document.getElementById('user').innerHTML = name;
		    window.opener.document.getElementById('user_id').value = id;
		    self.close();
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

	if($cond != "")
		{
	    $dop_sql = " WHERE ".$cond." ";
	    }
	$dop_sql .= "";

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

    <b>".$locale[198]."</b>:<br />
		<form name='form' action='?' method='get' id='form'>
		<input name='unit' type='hidden' value='select_user'>
		<table width='300' align='center'>
			<tr>
				<td>
					".$locale[333].":
				</td>
				<td>
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
				</td>
			</tr>
			<tr>
				<td>
					".$locale[336]." / ".$locale[21]."
				</td>
				<td>
					<input name='name' type='text' value='".$_GET['name']."'>
				</td>
			</tr>
			<tr>
				<td>
					".$locale[213]."
				</td>
				<td>
					<select size='1' name='status'>
					<option value='all' "; if($_GET['status'] == 'all'){echo ' selected ';} echo ">".$locale[204]."</option>
					<option value='0' "; if($_GET['status'] == '0'){echo ' selected ';} echo ">".$locale[373]."</option>
					<option value='1' "; if($_GET['status'] == '1'){echo ' selected ';} echo ">".$locale[336]."</option>
					<option value='2' "; if($_GET['status'] == '2'){echo ' selected ';} echo ">".$locale[367]."</option>
					</select>
				</td>
			</tr>
		</table>


	        <input type='submit' value='".$locale[335]."'>

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
		        echo "<div class='page1 ";
		        if($i == $_GET['page'])
			        {
			        echo "sel1";
			        }
			    else
				    {
			 	    echo "unsel1";
				    }
				echo "' onclick=\"go('?unit=select_user&onpage=".$_GET['onpage']."&status=".$_GET['status']."&email_status=".$_GET['email_status']."&name=".$_GET['name']."&page=".$i."')\">".$i."</div>";
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
		    <table align='center' width='99%' border='0' cellpadding='1' cellspacing='1' class='tbl'>
			    <tr class='tbl_head'>
                    <td>".$locale[336]."</td>
                    <td>".$locale[368]."</td>
                    <td>".$locale[21]."</td>
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

		echo "
		<tr>
			<td><a href='javascript:insert_user(\"".$data['id']."\", \"".$data['name']."\");'>".$data['name']."</td>
			<td>".date('d.m.Y H:i', $data['date'])."</td>
			<td>".$data['email']."</td>
		</tr>
		";
	    $i++;
		}


		echo "
			</table>
	    </form>

	    ";



echo "
</body>

</html>";
exit();
?>