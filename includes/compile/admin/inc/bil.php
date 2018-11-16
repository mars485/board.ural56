<?php


if($exe)
	{

	include(FULLPATH.'billing/currency.php');
	include(COREPATH.'bil.php');

	if($act == "")
		{
		if($_POST['submit1'] != "")
			{
			if(count($_POST['id']) > 0)
				{
			    foreach($_POST['id'] as $k => $v)
				    {
				    $v = $_POST['status'][$v];
				    if($v != 1){$v = 0;}
                    
		    	    dbquery("UPDATE ".PREF."billing SET status=".$v." WHERE id=".$k);
				    }
				}
				else{dbquery("UPDATE ".PREF."billing SET status=0");}
				die("
				<script>
				document.location.href = '?unit=bil&rnd=".rand(0, 9999999)."';
				</script>
			    </body></html>
				");
			}
		if($_POST['submit2'] != "")
			{

			dbquery("UPDATE ".PREF."settings SET v = '".$_POST['currency']."' WHERE k = 'currency'");
				die("
				<script>
				document.location.href = '?unit=bil&rnd=".rand(0, 9999999)."';
				</script>
			    </body></html>
				");
			}

		echo "

		<form name='frm' action='?unit=bil' method='post'>

		<div align='center'>
			<table align='center' width='90%' border='0' cellpadding='1' cellspacing='1' class='tbl'>
				<tr class='tbl_head'>
					<td>".$locale[641]."</td>
					<td>".$locale[645]."</td>
					<td>".$locale[656]."</td>
					<td width='5'>".$locale[213]."</td>
					<td width='5'>".$locale[275]."</td>
				<tr>
		";            //pr($billing);
		foreach($billing as $dat)
			{


			$cur_name = "";

			$supported = false;
            foreach($dat['cur'] as $k=>$v)
	            {
                if($k == $settings['currency']){$cl = 'green'; $supported = true;}else{$cl = 'silver';}
                $cur_name .= '<li style=\'color:'.$cl.';\'>'.$currency_names[$k]['name1'].'</li>';
	            }
            if(!$supported){$cur_name .= '<div class="error">'.$locale[665].'</div>';}

			echo "
			<tr>
				<td><input name='id[".$dat['id']."]' type='hidden' value='".$dat['id']."'>".hlp($dat['descr'])."&nbsp;".$dat['name']."</td>
				<td><a href='".$dat['site']."'>".$dat['site']."</a></td>
				<td><ul>".$cur_name."</ul></td>
				<td><input name='status[".$dat['id']."]' type='checkbox' value='1'";
				if($dat['status'] == 1){echo ' checked ';}
				echo "></td>
				<td>".ico('?unit=bil&act=edit&id='.$dat['id'], 'e')."</td>

			<tr>
			";
			}
		echo "
			<tr><td colspan='5' align='center'><input type='submit' value='".$locale[34]."' name='submit1'></td></tr>
			</table>
		</div>

	    </form>
		<br /><br />
		<center>
			<form name='form' action='?unit=bil' method='post'>
				<div align='center' style='background-color:#FFE6E6; font-size:12px; border:1px solid red; margin:10px; padding:10px; width:500px;'>
				<b>".$locale[650]."</b><br />(".$locale[651]."):<br /><br />
				<select size='1' name='currency'>
				";
				foreach($currency_names as $k => $v)
					{
				    echo "<option value='".$k."'";
				    if($k == $settings['currency'])
					    {
					    echo " selected ";
					    }
				    echo ">".$v['name1']."</option>\n";
					}

				echo "
				</select>
				<input type='submit' name='submit2' value='".$locale[34]."'>
				</div>
			</form>
		<center>
		";
		}

	if($act == 'edit' && is_numeric($_GET['id']))
		{
        $id = $_GET['id'];
        if($_POST['submit'] != "")
	        {
            unset($_POST['submit']);
            $sql = "UPDATE ".PREF."billing SET ";
            $i = 0;
            unset($_POST['post_filter']);
            unset($_POST['login']);
            unset($_POST['password']);
            foreach($_POST as $k => $v)
	            {
	            $i++;
                $sql .= $k." = '".$v."'";
                if(count($_POST) != $i)
	                {
                    $sql .= ', ';
	                }
                $sql .= "\n";
	            }
	        $sql .= " WHERE id=".$id;
	        //pr($sql);
	        dbquery($sql);
	        }

	    foreach($billing as $v)
		    {
	 	    if($id == $v['id'])
		 	    {
	 		    $abilling = $v;
		 	    }
		    }

		$form = array();
		$res = dbquery("SELECT * FROM ".PREF."billing WHERE id=".$id);
		$dat = dbarray($res);

		eval($abilling['php_1']);
        //pr($form);
		echo "
		<form  id='s123123' name='frm' action='?unit=bil&act=edit&id=".$id."' method='post'>
		<table width='500' style='width:500px;' class='add_item' align='center'>
		<tr><td colspan='2' class='nameopt'>".$abilling['name']."</td></tr>
		";
        foreach($form as $field)
	        {
	        if(is_numeric($field['help'])){$field['help'] = $locale[$field['help']];}
	        if(is_numeric($field['name'])){$field['name'] = $locale[$field['name']];}


			echo "
			<tr>
				<td>".hlp($field['help'])." ".$field['name']."</td>
				<td>";
				if($field['type'] == 'input')
					{
				    echo "<input name='".$field['id']."' type='text' value='".$dat[$field['id']]."' style='width:100%;'>";
					}
				elseif($field['type'] == 'textarea')
					{
				    echo "<textarea name='".$field['id']."' rows='5' style='width:100%;'>".$dat[$field['id']]."</textarea>";
					}

				echo "</td>
			</tr>
			";
	        }
	    echo "
	    <tr><td colspan='2' align='center'><input style='border-radius: 0;    line-height: 10px;' type='submit' name='submit' value='".$locale[335]."' ></td></tr>
	    </table>
        </form>
		<br /><br />
		<center>
		<input type='button' name='submit' onclick=\"go('?unit=bil')\" value='&larr; ".$locale[324]."'>
        </center>
	    ";


		}

	}

?>