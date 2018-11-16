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
	if($act == 'move' && is_numeric($_GET['id']))
		{
		$res = dbquery("SELECT id, sort FROM ".PREF."nav ORDER by sort");
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
				dbquery("UPDATE ".PREF."nav SET sort='".$v['n']."' WHERE id=".$v['id']);
				}
			}
		header('Location: ?unit=nav');
		exit();
		}
        
        if($act == 'savesort'){
            if(isset($_POST['data'])){
                if(is_array($_POST['data'])){
                    if(count($_POST['data']) > 0){
                        foreach($_POST['data'] as $k => $v){
                            dbquery("UPDATE ".PREF."nav SET sort='".intval($k)."' WHERE id=".intval($v));
                        }
                    }
                }
            }
            echo 'ok';
            exit();
		}


	if($act == 'save' && $_POST['submit'] != "")
		{
        $name = $_POST['name'];
        $url = $_POST['url'];
        $status = $_POST['status'];
        if($_POST['seporator'] == '1'){$url = 'seporator';}
        $max_sort = dbarray(dbquery("SELECT MAX(sort) as m FROM ".PREF."nav"));
        $max_sort = intval($max_sort['m']) + 1;
		$sql = "INSERT INTO ".PREF."nav SET
				name='".$name."',
				url='".$url."',
				status='".$status."',
				sort = ".$max_sort."
				";
				dbquery($sql);
        header("Location: ?unit=nav");
		}



	function make_select_link()
		{
		  global $settings, $full_list;
		  $r = '';
            if(count($full_list['cat']) > 0){
                foreach($full_list['cat'] as $v){
                    if($v['parent'] == 0)
                    $r .= '<option value="'.$settings['path'].$v['uri'].'/">'.$v['name'].'</option>';
                }
            }
            if(count($full_list['region']) > 0){
                foreach($full_list['region'] as $v){
                    if($v['parent'] == 0)
                    $r .= '<option value="'.$settings['path'].$v['uri'].'/">'.$v['name'].'</option>';
                }
            }
            return $r;
		}

	}
if($exe)
	{
    include(COREPATH.'admin/inc/get_modules_list.php');
	$mods_html = "";
	$res = dbquery("SELECT cat, title FROM ".PREF."modules");
	while($dat = dbarray($res))
		{
		$mods_html .= "<option value='".$settings['patch'].$dat['cat']."/'>".stripslashes($dat['title'])."</option>";
		}
    foreach($modules_list as $k => $v){
        if($k != $v){
    	    $mods_html .=  "<option value='".$settings['patch'].$k."/'>".$v."</option>";        
        }
	}
	$types_status[0] = $locale[463];
	$types_status[8] = $locale[465];
	$types_status[9] = $locale[464];
	$types_status[2] = $locale[466];
	$types_status[1] = $locale[467];

	echo "
	<script language=JavaScript type=text/javascript>
	function PasteURL(pageURL)
		{
		document.getElementById('link').value = pageURL.options[pageURL.selectedIndex].value;
		document.getElementById('name').value = pageURL.options[pageURL.selectedIndex].text;
		}
	</script>
	";

	if($act == "")
		{
		echo "
		<div align='left '>
		<input type='button' value=' &rarr; ".$locale[460]."' onclick='sh(123123);'>
        <input type='button' value='".$locale[872]."' id='savesort' disabled>
			<div id='s123123' style='display:none;' align='center'>
			    <form name='form' action='?unit=nav&act=save' method='post'>
	            <FIELDSET style='width:500px;'><LEGEND>".$locale[461]."</LEGEND>
	            <table width='100%' class='add_item'>
	            <tr><td>".$locale[468]."</td><td>
	            								<input name='seporator' type='radio' value='0' checked> ".$locale[469]."<br />
	            								<input name='seporator' type='radio' value='1'> ".$locale[462]."<br />
	            								</td></tr>
	            <tr><td>".$locale[457]."</td><td><input id='name' name='name' type='text' value='' style='width:100%;'></td></tr>
	            <tr><td>".$locale[469]."</td><td><input id='link' name='url' type='text' value='' style='width:100%;'><br /><a href='#' onclick='sh(1111);'>[".$locale[339]."]</td></tr>

                <tr><td colspan='2' style='width:100%;' align='center'>
	                <div id='s1111' style='display:none;'>
	                    <select size='1' onChange='PasteURL(this)'>
						<option value=''>".$locale[470]."</option>
						";
						echo $mods_html;
						echo make_select_link();
						echo "
						</select>
	                </span>
                </td></tr>

	            <tr><td>".$locale[459]."</td><td>
	            <select size='1' name='status'>

	            								";
	            								foreach($types_status as $k => $v)
		            								{
	            								    echo "<option value='".$k."'>".$v."</option>";
		            								}
	            								echo "
	            								</td></tr>
				</select>
	            </table>
	            <div align='center' style='margin:5px;'><input type='submit' name='submit' value=' ".$locale[125]." '></div>
	            </FIELDSET>
				</form>

			<br />
			<img src='".PATH."admin/tpl/img/hor.gif' width='500' alt='' border='0' style='vertical-align:middle; margin:4px;'>
			<br />
		</div>
		";

		echo "<br /><br />
		<table align='center' width='90%' border='0' cellpadding='1' cellspacing='1' class='tbl fields_sort'>
		  <thead>
        	<tr class='tbl_head'>
				<td width='40%'>".$locale[457]."</td>
				<td width='30%'>".$locale[458]."</td>
				<td width='20%'>".$locale[459]."</td>
				<td width='10%'>".$locale[275]."</td>
			</tr>
          </thead>
          <tbody>
	    ";

	    $res = dbquery("SELECT * FROM ".PREF."nav ORDER by sort");
	    while($dat = dbarray($res))
		    {
	        echo "
	        <tr data-id=".$dat['id'].">
	  		";
	  		if($dat['url'] == 'seporator')
		  		{
	 		    echo "<td colspan='3' style='background-color:#F3F3F3; text-align:center;'>".$locale[462]."</td>";
		  		}
			else
				{
	  			echo "
		        <td>".stripslashes($dat['name'])."</td>
		        <td>".stripslashes($dat['url'])."</td>
		        <td>".$types_status[$dat['status']]."</td>
		        ";
				}
		  	echo "
		        <td align='center'>
			        <nobr>
				        ".ico("?unit=nav&act=edit&id=".$dat['id'], 'e')."
				        ".ico("?unit=nav&act=del&id=".$dat['id'], 'd')."
				        ".ico("?unit=nav&act=move&id=".$dat['id']."&up", 'up')."
				        ".ico("?unit=nav&act=move&id=".$dat['id']."&down", 'down')."
				  	<nobr>
		        </td>
	        </tr>
	        ";
		    }
	    echo "
          </tbody>
		</table>
		";
		}
	elseif($act == 'edit' && is_numeric($_GET['id']))
		{
		if($_POST['submit'] != "")
			{

	        $name = $_POST['name'];
	        $url = $_POST['url'];
	        $status = $_POST['status'];
	        if($_POST['seporator'] == '1'){$url = 'seporator';}

			$sql = "UPDATE ".PREF."nav SET
					name='".$name."',
					url='".$url."',
					status='".$status."'
					WHERE id=".$_GET['id'];
					dbquery($sql);
		    echo "<div align='center' ><div class='ok'>".$locale[351]."</div></div>";
			}


		$data = dbarray(dbquery("SELECT * FROM ".PREF."nav WHERE id=".$_GET['id']));
		echo "
		<div align='center'  class='sort navi'>
			    <form name='form' action='?unit=nav&act=edit&id=".$_GET['id']."' method='post'>
	            <FIELDSET style='width:500px;'><LEGEND>".$locale[461]."</LEGEND>
	            <table width='100%' class='add_item'>
	            <tr><td>".$locale[468]."</td><td>
		<input "; if($data['url'] != 'seporator'){echo 'checked';} echo " name='seporator' type='radio' value='0'> ".$locale[469]."<br />
		<input "; if($data['url'] == 'seporator'){echo 'checked';} echo " name='seporator' type='radio' value='1'> ".$locale[462]."<br />
	            								</td></tr>
	            <tr><td>".$locale[457]."</td><td><input id='name' name='name' type='text' value='".stripslashes($data['name'])."' style='width:100%;'></td></tr>
	            <tr><td>".$locale[469]."</td><td><input id='link' name='url' type='text' value='".stripslashes($data['url'])."' style='width:100%;'><br /><a href='#' onclick='sh(1111);'>[".$locale[339]."]</td></tr>

                <tr><td colspan='2' style='width:100%;' align='center'>
	                <div id='s1111' style='display:none;'>
	                    <select size='1' onChange='PasteURL(this)'>
						<option value=''>".$locale[470]."</option>
						";
						echo $mods_html;
						echo make_select_link();
						echo "
						</select>
	                </span>
                </td></tr>

	            <tr><td>".$locale[459]."</td><td>
	            <select size='1' name='status'>

	            								";
	            								foreach($types_status as $k => $v)
		            								{
	            								    echo "<option value='".$k."'";
	            								    if($k == $data['status']){echo ' selected ';}
	            								    echo ">".$v."</option>";
		            								}
	            								echo "
	            								</td></tr>
				</select>
	            </table>
	            <div align='center' style='margin:5px;'><input type='submit' name='submit' value=' ".$locale[335]." '></div>
	            </FIELDSET>
				</form>
		<br /><br /><input type='button' name='submit' onclick=\"go('?unit=nav')\" value='&larr; ".$locale[324]."'>
		</div>
		";
		}
	elseif($act == 'del' && is_numeric($_GET['id']))
		{

		dbquery("DELETE FROM ".PREF."nav WHERE id = ".$_GET['id']);

		echo "
		<script>
		setTimeout(\"document.location.href='?unit=nav'\",1000);
		</script>
		<center><div class='ok'>".$locale[325]."</div></center>
		";
		}
	}
?>