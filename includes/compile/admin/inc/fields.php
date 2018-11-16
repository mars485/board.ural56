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

		if(isset($_POST['submit2']))
			{

			if(!isset($settings['yaapi'])){
			     dbquery("INSERT INTO ".PREF."settings SET k = 'yaapi', v = '".$_POST['yaapi']."'");
			}else{
			 	dbquery("UPDATE ".PREF."settings SET v = '".$_POST['yaapi']."' WHERE k = 'yaapi'");
			}
            
            	die("
				<script>
				document.location.href = '?unit=fields&rnd=".rand(0, 9999999)."';
				</script>
			    </body></html>
				");
			}

	if($act == 'save' && isset($_POST['submit']))
		{
        $name = save_text($_POST['name']);
        $comment = save_text($_POST['comment']);
        $type = save_text($_POST['type']);
        $type_string = save_text($_POST['type_string']);
        $req = save_text($_POST['req']);
        $hide = save_text($_POST['hide']);
        $block = save_text($_POST['block']);
        $max = save_text($_POST['max']);
        $cat = save_text($_POST['cat']);

		$values = str_replace("\r", '', $_POST['values']);
		$values = addslashes($values);
        
        $max_sort = dbarray(dbquery("SELECT MAX(sort) as m FROM ".PREF."fields"));
        $max_sort = intval($max_sort['m']) + 1;
		$sql = "INSERT INTO ".PREF."fields SET
				name='".$name."',
				comment='".$comment."',
				cat='".$cat."',
				type='".$type."',
				type_string='".$type_string."',
				req='".$req."',
				hide='".$hide."',
				max='".$max."',
				block='".$block."',
				`values`='".$values."',
				sort = ".$max_sort."
				";
				dbquery($sql);

			    $res = dbquery("SELECT LAST_INSERT_ID()");
			    $dat = dbarray($res);
				$save_id = $dat['LAST_INSERT_ID()'];

				//dbquery("ALTER TABLE ".PREF."db ADD `f_".$save_id."` TEXT NOT NULL");

        header("Location: ?unit=fields");
		}

	if($act == 'move' && is_numeric($_GET['id']))
		{
		$res = dbquery("SELECT id, sort FROM ".PREF."fields ORDER by sort");
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
				dbquery("UPDATE ".PREF."fields SET sort='".$v['n']."' WHERE id=".$v['id']);
				}
			}
		header('Location: ?unit=fields');
		exit();
		}
        elseif($act == 'savesort'){
            if(isset($_POST['data'])){
                if(is_array($_POST['data'])){
                    if(count($_POST['data']) > 0){
                        foreach($_POST['data'] as $k => $v){
                            dbquery("UPDATE ".PREF."fields SET sort='".intval($k)."' WHERE id=".intval($v));
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
	$types_fields['v'] = $locale[402];
	$types_fields['t'] = $locale[403];
	$types_fields['s'] = $locale[404];
	$types_fields['c'] = $locale[405];
	$types_fields['r'] = $locale[406];
	$types_fields['p'] = $locale[878];
	$types_fields['i'] = $locale[400];
	$types_fields['f'] = $locale[401];
	$types_fields['y'] = $locale[675];
	$types_fields['j'] = $locale[676];


	$types_string['n'] = $locale[407];
	$types_string['l'] = $locale[408];
	$types_string['t'] = $locale[409];
	$types_string['u'] = $locale[410];



	if($act == '')
    	{
		echo "
		<div align='left'>
		<input type='button' value=' &rarr; ".$locale[398]."' onclick='sh(123123);'>
        <input type='button' value='".$locale[872]."' id='savesort' disabled>
			<div id='s123123' style='display:none;' align='center'>
			    <form name='form' action='?unit=fields&act=save' method='post'>
	            <FIELDSET style='width:700px;'><LEGEND>".$locale[399]."</LEGEND>
	            <table width='100%' class='add_item'>
	            <tr><td>".hlp($locale[383])." ".$locale[382]."</td><td><input id='name' name='name' type='text' value='' style='width:100%;'></td></tr>
	            <tr><td>".hlp($locale[385])." ".$locale[384]."</td><td><textarea name='comment' rows='3'  style='width:100%;' wrap='on'></textarea></td></tr>
	            <tr><td>".hlp($locale[671])." ".$locale[17]."</td><td>
	            ".ajax_select('cat', 'cat', 0)."
	            </td></tr>


		            <tr><td>".hlp($locale[388])." ".$locale[389]."</td><td>
	                <select size='1' name='type'>
	                ";
	                foreach($types_fields as $k => $v)
		                {
	                    echo "<option value='".$k."'>".$v."</option>";
		                }
	                echo "
					</select>
		            </td></tr>
	            <tr><td>".hlp($locale[391])." ".$locale[390]."</td><td>
	                <select size='1' name='type_string'>
	                <option value=''>".$locale[364]."</option>
	                ";
	                foreach($types_string as $k => $v)
		                {
	                    echo "<option value='".$k."'>".$v."</option>";
		                }
	                echo "
					</select>
	            </td></tr>
	            <tr><td>".hlp($locale[387])." ".$locale[411]."</td><td><textarea name='values' rows='10'  style='width:100%;' wrap='on'></textarea></td></tr>
	            <tr><td>".hlp($locale[412])." ".$locale[413]."</td><td><input name='max' type='text' value='' size='6'></td></tr>
	            <tr><td>".hlp($locale[393])." ".$locale[392]."</td><td>
	            <input name='req' type='radio' value='1'> ".$locale[396]."<br />
	            <input name='req' type='radio' value='2' checked> ".$locale[397]."
	            </td></tr>
	             <tr><td>".hlp($locale[395])." ".$locale[394]."</td><td>
	            <input name='hide' type='radio' value='1'> ".$locale[396]."<br />
	            <input name='hide' type='radio' value='0' checked> ".$locale[397]."
	            </td></tr>
	             <tr><td>".hlp($locale[777])." ".$locale[776]."</td><td>
	            <input name='block' type='radio' value='1' checked> ".$locale[396]."<br />
	            <input name='block' type='radio' value='0' > ".$locale[397]."
	            </td></tr>
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
		<form name='form2' action='?unit=fields' method='post'>
		<table align='center' cellpadding='0' cellspacing='0'  border='0' cellpadding='1' cellspacing='1' class='tbl fields_sort'>
		  <thead>
        	<tr class='tbl_head'>
				<td width='15%'>".hlp($locale[383])." ".$locale[382]."</td>
				<td width='20%'>".hlp($locale[385])." ".$locale[384]."</td>
				<td width='10%'>".hlp($locale[388])." ".$locale[389]."</td>
				<td width='10%'>".hlp($locale[391])." ".$locale[390]."</td>
				<td width='10%'>".hlp($locale[387])." ".$locale[386]."</td>
				<td width='15%'>".hlp($locale[671])." ".$locale[17]."</td>

				<td width='5%'>".hlp($locale[393])." ".$locale[392]."</td>
				<td width='5%'>".hlp($locale[395])." ".$locale[394]."</td>
				<td width='5%'>".hlp($locale[412])." ".$locale[413]."</td>
				<td width='5%'>".hlp($locale[777])." ".$locale[776]."</td>
				<td width='10%'>".$locale[338]."</td>
			</tr>
          </thead>
          <tbody>
	    ";
	    $res = dbquery("SELECT * FROM ".PREF."fields ORDER by sort");
	    while($dat = dbarray($res))
		    {
	        $values = explode_string($dat['values'], "\n");
	        $values_str = "";
	        if(count($values) > 0)
		        {
		        foreach($values as $v)
			        {
		            $values_str .= '<li>'.$v.'</li>';
			        }
		        }
		    if($dat['req'] == 1){$dat['req'] = $locale[396];}else{$dat['req'] = $locale[397];}
		    if($dat['hide'] == 1){$dat['hide'] = $locale[396];}else{$dat['hide'] = $locale[397];}
		    if($dat['block'] == 1){$dat['block'] = $locale[396];}else{$dat['block'] = $locale[397];}

		    if($dat['cat'] != 0)
			    {
				$ct = get_array_linenav($dat['cat'], $cats_id);

		        foreach($ct as $k => $v)
			        {
		            $ct[$k] = "<a href='../search/?add_cat=".$v['id']."' target='_blank'>".stripslashes($v['name'])."</a>";
			        }

		        $ct = implode(' / ', $ct);
	            }
	      	else
		      	{
	    	    $ct = $locale[449];
		      	}
            if(!isset($settings['yaapi'])) $settings['yaapi'] = "";    
            if(!isset($types_string[$dat['type_string']])) $types_string[$dat['type_string']] = "";
            if(!isset($types_fields[$dat['type']])) $types_fields[$dat['type']] = "";
	        echo "
	        <tr data-id=".$dat['id'].">
		        <td>".stripslashes($dat['name'])."</td>
		        <td>".stripslashes($dat['comment'])."</td>
		        <td>".$types_fields[$dat['type']]."</td>
		        <td>".$types_string[$dat['type_string']]."</td>
		        <td>".$values_str."</td>
		        <td>".$ct."</td>
		        <td align='center'><b>".$dat['req']."<b></b></b></td>
		        <td align='center'><b>".$dat['hide']."<b></b></b></td>
		        <td align='center'><b>".$dat['max']."<b></b></b></td>
		        <td align='center'><b>".$dat['block']."<b></b></b></td>
		        <td align='center'>
			        <nobr>
				        ".ico("?unit=fields&act=edit&id=".$dat['id'], 'e')."
				        ".ico("?unit=fields&act=del&id=".$dat['id'], 'd')."
				        ".ico("?unit=fields&act=move&id=".$dat['id']."&up", 'up')."
				        ".ico("?unit=fields&act=move&id=".$dat['id']."&down", 'down')."
				  	<nobr>
		        </td>
	        </tr>
	        ";
		    }
	    echo "
          </tbody>
		</table>
		<!--div align='center'>
			<form name='form' action='?unit=fields' method='post'>
				<div align='center' ";
                if($settings['yaapi'] == ""){
                    echo "style='background-color:#FFE6E6; font-size:12px; border:1px solid red; margin:10px; padding:10px; width:500px;'";                    
                }else{
                    echo "style='background-color:#D5FFD5; font-size:12px; border:1px solid green; margin:10px; padding:10px; width:500px;'";                                        
                }
                
                echo ">
				<b>".$locale[677]."</b><br />(".$locale[678]."):<br /><br />
                ".$locale[679]." <input name='yaapi' type='text' value='".$settings['yaapi']."' size='90%'>
				<input type='submit' name='submit2' value='".$locale[34]."'>
				</div>
			</form>
		</div-->
		";


		}
	elseif($act == 'edit' && is_numeric($_GET['id']))
		{
		if(isset($_POST['submit']))
			{
            if($_POST['submit'] != "")
                {
    		    if(!isset($_POST['name'])) $_POST['name'] = "";
    		    if(!isset($_POST['comment'])) $_POST['comment'] = "";
    		    if(!isset($_POST['type'])) $_POST['type'] = "";
    		    if(!isset($_POST['type_string'])) $_POST['type_string'] = "";
    		    if(!isset($_POST['req'])) $_POST['req'] = "";
    		    if(!isset($_POST['hide'])) $_POST['hide'] = "";
    		    if(!isset($_POST['block'])) $_POST['block'] = "";
    		    if(!isset($_POST['max'])) $_POST['max'] = "";
    		    if(!isset($_POST['cat'])) $_POST['cat'] = "";
    		    if(!isset($_POST['values'])) $_POST['values'] = "";
    
    	        $name = save_text($_POST['name']);
    	        $comment = save_text($_POST['comment']);
    	        $type = save_text($_POST['type']);
    	        $type_string = save_text($_POST['type_string']);
    	        $req = save_text($_POST['req']);
    	        $hide = save_text($_POST['hide']);
    	        $block = save_text($_POST['block']);
    	        $max = save_text($_POST['max']);
    	        $cat = save_text($_POST['cat']);
                
    			$values = str_replace("\r", '', $_POST['values']);
    			$values = addslashes($values);
    
    			$sql = "UPDATE ".PREF."fields SET
    					name='".$name."',
    					cat='".$cat."',
    					comment='".$comment."',
    					type='".$type."',
    					type_string='".$type_string."',
    					req='".$req."',
    					hide='".$hide."',
    					max='".$max."',
    					block='".$block."',
    					`values`='".$values."'
    					WHERE id=".$_GET['id']."
    					";
    			dbquery($sql);
    			echo "<div align='center'><div class='ok'>".$locale[351]."</div></div>";
    			}
            }



		$data = dbarray(dbquery("SELECT * FROM ".PREF."fields WHERE id=".$_GET['id']));
		echo "

			<div align='center'>
			    <form name='form' action='?unit=fields&act=edit&id=".$_GET['id']."' method='post'>
	            <FIELDSET style='width:95%;'><LEGEND>".$locale[399]."</LEGEND>
	            <table width='100%' class='add_item'>
	            <tr><td width=50%>".hlp($locale[383])." ".$locale[382]."</td><td><input id='name' name='name' type='text' value='".stripslashes($data['name'])."' style='width:100%;'></td></tr>
	            <tr><td>".hlp($locale[385])." ".$locale[384]."</td><td><textarea name='comment' rows='3'  style='width:100%;' wrap='on'>".str_replace('<br />', "\n", stripslashes($data['comment']))."</textarea></td></tr>
	            <tr><td>".hlp($locale[671])." ".$locale[17]."</td><td>
                ".ajax_select('cat', 'cat', $data['cat'])."
	            </td></tr>
		            <tr><td>".hlp($locale[388])." ".$locale[389]."</td><td>
	                <select size='1' name='type'>
	                ";
	                foreach($types_fields as $k => $v)
		                {
	                    echo "<option value='".$k."'";
	                    if($data['type'] == $k){echo " selected ";}
	                    echo ">".$v."</option>";
		                }
	                echo "
					</select>
		            </td></tr>
	            <tr><td>".hlp($locale[391])." ".$locale[390]."</td><td>
	                <select size='1' name='type_string'>
	                <option value=''>".$locale[364]."</option>
	                ";
	                foreach($types_string as $k => $v)
		                {
	                    echo "<option value='".$k."'";
	                    if($data['type_string'] == $k){echo " selected ";}
	                    echo ">".$v."</option>";
		                }
	                echo "
					</select>
	            </td></tr>
	            <tr><td>".hlp($locale[387])." ".$locale[411]."</td><td><textarea name='values' rows='10'  style='width:100%;' wrap='on'>".stripslashes($data['values'])."</textarea></td></tr>
	            <tr><td>".hlp($locale[412])." ".$locale[413]."</td><td><input name='max' type='text' value='".stripslashes($data['max'])."' size='6'></td></tr>
	            <tr><td>".hlp($locale[393])." ".$locale[392]."</td><td>
	            <input name='req' type='radio' value='1'"; if($data['req'] == 1){echo ' checked ';} echo "> ".$locale[396]."<br />
	            <input name='req' type='radio' value='2'"; if($data['req'] == 2){echo ' checked ';} echo "> ".$locale[397]."
	            </td></tr>
	             <tr><td>".hlp($locale[395])." ".$locale[394]."</td><td>
	            <input name='hide' type='radio' value='1'"; if($data['hide'] == 1){echo ' checked ';} echo "> ".$locale[396]."<br />
	            <input name='hide' type='radio' value='0'"; if($data['hide'] == 0){echo ' checked ';} echo "> ".$locale[397]."
	            </td></tr>
	             <tr><td>".hlp($locale[777])." ".$locale[776]."</td><td>
	            <input name='block' type='radio' value='1'"; if($data['block'] == 1){echo ' checked ';} echo "> ".$locale[396]."<br />
	            <input name='block' type='radio' value='0'"; if($data['block'] == 0){echo ' checked ';} echo "> ".$locale[397]."
	            </td></tr>
                
	            </table>
	            <div align='center' style='margin:5px;'><input type='submit' name='submit' value=' ".$locale[335]." '></div>
	            </FIELDSET>
				</form>
		<br /><br /><input type='button' name='submit' onclick=\"go('?unit=fields')\" value='&larr; ".$locale[324]."'>
		</div>
		";
		}
	elseif($act == 'del' && is_numeric($_GET['id']))
		{

		dbquery("DELETE FROM ".PREF."fields WHERE id = ".$_GET['id']);
		//dbquery("ALTER TABLE ".PREF."db DROP f_".$_GET['id']);

		echo "
		<script>
		setTimeout(\"document.location.href='?unit=fields'\",1000);
		</script>
		<center><div class='ok'>".$locale[325]."</div></center>
		";
		}
	}

?>