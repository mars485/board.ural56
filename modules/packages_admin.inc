<?php //1051


if(!$exe)
	{
	if($act == 'save' && $_POST['submit'] != "")
		{
        $price = str_replace(',', '.', $_POST['price']);
        if(!is_numeric(str_replace('.', '', $_POST['price']))){
            $price = 0;
        }
		$sql = "INSERT INTO ".PREF."packages SET
				days='".$_POST['days']."',
				text='".$_POST['text']."',
				service='".$_POST['service']."',
                price='".$price."',
				sort = ".dbrows(dbquery("SELECT id FROM ".PREF."packages"))."
				";
				dbquery($sql);
        header("Location: ?unit=packages");
		}
	if($act == 'move' && is_numeric($_GET['id']))
			{
			$res = dbquery("SELECT id, sort FROM ".PREF."packages ORDER by sort");
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
					dbquery("UPDATE ".PREF."packages SET sort='".$v['n']."' WHERE id=".$v['id']);
					}
				}
			header('Location: ?unit=packages');
			exit();
			}
        if($act == 'savesort'){
            if(isset($_POST['data'])){
                if(is_array($_POST['data'])){
                    if(count($_POST['data']) > 0){
                        foreach($_POST['data'] as $k => $v){
                            dbquery("UPDATE ".PREF."packages SET sort='".intval($k)."' WHERE id=".intval($v));
                        }
                    }
                }
            }
            echo 'ok';
            exit();
    	}
	}
if($exe)
	{
	if(!isset($currency_names)) include(FULLPATH.'billing/currency.php');
	if($act == "")
		{
		echo "
		<div align='left'>
		<input type='button' value=' &rarr; ".$locale[476]."' onclick='sh(123123);'>
        <input type='button' value='".$locale[872]."' id='savesort' disabled>
			<div id='s123123' style='display:none;' align='center'>
			    <form name='form' action='?unit=packages&act=save' method='post'>
	            <FIELDSET style='width:500px;'><LEGEND>".$locale[477]."</LEGEND>
	            <table width='100%' class='add_item'>
				<tr><td>".$locale[350]."</td><td><input required name='days' type='text' value='' style='width:100%'></td></tr>
				<tr><td>".$locale[1052]."</td><td><input required name='text' type='text' value='' style='width:100%'></td></tr>
				<tr><td>".$locale[185]."</td><td><input required name='price' type='text' value='' style='width:100px;'> ".$currency_names[$settings['currency']]['name2']."</td></tr>
				<tr><td>".$locale[182]."</td><td>
                <select name='service'>
                ";
                $res = dbquery("SELECT * FROM ".PREF."services");
                $services1 = array();
                while($dat = dbarray($res)){
                        $services1[$dat['id']] = $dat;
                        echo "<option value='".$dat['id']."'>".$dat['name']."</option>";
                    }
                echo "
                </select>
                </td></tr>
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
		<table align='center' width='100%' border='0' cellpadding='1' cellspacing='1' class='tbl fields_sort'>
			<tr class='tbl_head'>
				<td>".$locale[350]."</td>
				<td>".$locale[1052]."</td>
				<td>".$locale[182]."</td>
				<td>".$locale[185]."</td>
				<td>".$locale[275]."</td>
			</tr>
		";
		$res = dbquery("SELECT * FROM ".PREF."packages ORDER by service, sort");
		while($dat = dbarray($res))
			{
			 
			echo "
				<tr data-id=".$dat['id'].">
					<td>".$dat['days']."</td>
					<td>".stripslashes($dat['text'])."</td>
					<td>".$services1[$dat['service']]['name']."</td>
					<td>".$dat['price']."</td>
					<td align='center'>
							".ico("?unit=packages&act=edit&id=".$dat['id'], 'e')."
					        ".ico("?unit=packages&act=del&id=".$dat['id'], 'd')."
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

		dbquery("DELETE FROM ".PREF."packages WHERE id = ".$_GET['id']);

		echo "
		<script>
		setTimeout(\"document.location.href='?unit=packages'\",1000);
		</script>
		<center><div class='ok'>".$locale[325]."</div></center>
		";
		}

    elseif($act == 'edit' && is_numeric($_GET['id']))
    	{
		if($_POST['submit'] != "")
			{
            $price = str_replace(',', '.', $_POST['price']);
            if(!is_numeric(str_replace('.', '', $_POST['price']))){
                $price = 0;
            }			 
			$sql = "UPDATE ".PREF."packages SET
					days='".$_POST['days']."',
					text='".$_POST['text']."',
					service='".$_POST['service']."',
                    price='".$price."'
					WHERE id=".$_GET['id'];
					dbquery($sql);
		    echo "<div align='center'><div class='ok'>".$locale[351]."</div></div>";
			}

        $data = dbarray(dbquery("SELECT * FROM ".PREF."packages WHERE id=".$_GET['id']));
		echo "
		<div align='center'>

			    <form name='form' action='?unit=packages&act=edit&id=".$_GET['id']."' method='post'>
	            <FIELDSET style='width:500px;'><LEGEND>".$locale[477]."</LEGEND>
	            <table width='100%' class='add_item'>
				<tr><td>".$locale[350]."</td><td><input name='days' type='text' value='".$data['days']."' style='width:100%'></td></tr>
				<tr><td>".$locale[1052]."</td><td><input name='text' type='text' value='".$data['text']."' style='width:100%'></td></tr>
				<tr><td>".$locale[185]."</td><td><input required name='price' type='text' value='".$data['price']."' style='width:100px;'> ".$currency_names[$settings['currency']]['name2']."</td></tr>
				<tr><td>".$locale[182]."</td><td>
                <select name='service'>
                ";
                $res = dbquery("SELECT * FROM ".PREF."services");
                while($dat = dbarray($res)){
                        echo "<option value='".$dat['id']."'";
                        if($dat['id'] == $data['service']) echo ' selected';
                        echo ">".$dat['name']."</option>";
                    }
                echo "
                </select>
                </td></tr>
	            </table>
	            <div align='center' style='margin:5px;'><input type='submit' name='submit' value=' ".$locale[335]." '></div>
	            </FIELDSET>
				</form>
        		<br /><br />
                <input type='button' name='submit' onclick=\"go('?unit=packages')\" value='&larr; ".$locale[324]."'>

		</div>
		";
		}
	}

?>