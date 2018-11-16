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

	if($act == 'del')
        {
        dbquery("DELETE FROM ".PREF."rates WHERE id=".$_GET['id']);
        header("Location: ?unit=rates");
        exit();
        }
	if($act == 'save' && $_POST['submit'] != "")
		{
        $dat['value'] = str_replace(',', '.', $dat['value']);
        if(!isset($_POST['def'])) $_POST['def'] = 0;
        if($_POST['def'] == '1')
            {
            $def = "def='1',";
            dbquery("UPDATE ".PREF."rates SET def=0");
            $_POST['value'] = '1';
            }
        else
            {
            $def = "def='0',";
            }
            
		$sql = "INSERT INTO ".PREF."rates SET
				numcode='".$_POST['numcode']."',
				charcode='".$_POST['charcode']."',
				name='".$_POST['name']."',
				text='".$_POST['text']."',
				".$def."
				value='".$_POST['value']."'
				";
				dbquery($sql);
        header("Location: ?unit=rates");
		}
	}
if($exe)
	{

    if($act == "edit" && is_numeric($_GET['id']))
        {
        if($_POST['submit'] != "")
            {
            $dat['value'] = str_replace(',', '.', $dat['value']);
            if($_POST['def'] == 1)
                {
                $def = "def=1,";
                $_POST['value'] = '1';
                dbquery("UPDATE ".PREF."rates SET def=0");
                }
            else
                {
                $def = "def=0,";
                }
    		$sql = "UPDATE ".PREF."rates SET
    				numcode='".$_POST['numcode']."',
    				charcode='".$_POST['charcode']."',
    				name='".$_POST['name']."',
    				text='".$_POST['text']."',
    				".$def."
    				value='".$_POST['value']."'
                    WHERE id=".$_GET['id']."
    				";
    				dbquery($sql);
            }
            
        $dat = dbarray(dbquery("SELECT * FROM ".PREF."rates WHERE id=".$_GET['id']));
        echo "
			<div align='center' id='s123123'>
			    <form name='form' action='?unit=rates&act=edit&id=".$_GET['id']."' method='post'>
	            <FIELDSET style='width:400px;'><LEGEND>".$locale[477]."</LEGEND>
    	            <table width='100%' class='add_item'>
        	            <tr><td>".$locale[880]."</td><td><input value='".$dat['name']."' name='name' style='width:100%;'/></td><td>
        	            <tr><td>".$locale[881]."</td><td><input value='".$dat['numcode']."' name='numcode' style='width:100%;'/></td><td>
        	            <tr><td>".$locale[882]."</td><td><input value='".$dat['charcode']."' name='charcode' style='width:100%;'/></td><td>
        	            <tr><td>".hlp($locale[841]).' '.$locale[890]."</td><td><input value='".$dat['text']."' name='text' style='width:100%;'/></td><td>
        	            <tr><td>".$locale[884]."</td><td><input value='".$dat['value']."' name='value' style='width:100%;'/></td><td>
        	            <tr><td>".hlp($locale[885])." ".$locale[883]."</td><td><input ";
                        if($dat['def'] == '1')
                            {
                            echo " checked ";
                            }
                        echo " name='def' value='1' type='checkbox' /></td><td>
    	            </table>
	            <div align='center' style='margin:5px;'><input type='submit' name='submit' value=' ".$locale[837]." '></div>
	            </FIELDSET>
				</form>

			<br />
			<img src='".PATH."admin/tpl/img/hor.gif' width='500' alt='' border='0' style='vertical-align:middle; margin:4px;'>
			<br /><br /><input type='button' name='submit' onclick=\"go('?unit=rates')\" value='&larr; ".$locale[324]."'>
            </div>
        ";        
        }
    elseif($act == "")
        {  
         if($_POST['submit'] != "")
             {
                if(count($_POST) > 0)
                    {
                     foreach($_POST['value'] as $k=>$v)
                         {
                         dbquery("UPDATE ".PREF."rates SET value='".$v."' WHERE id='".$k."'");
                         }
                     echo "<div align='center'><div class='ok'>".$locale[525]."</div></div>";
                    }
             }
		echo "
		<div align='left'>
		<input type='button' value=' &rarr; ".$locale[476]."' onclick='sh(123123);'>
			<div id='s123123' style='display:none;' align='center'>
			    <form name='form' action='?unit=rates&act=save' method='post'>
	            <FIELDSET style='width:400px;'><LEGEND>".$locale[477]."</LEGEND>
    	            <table width='100%' class='add_item'>
        	            <tr><td>".$locale[880]."</td><td><input value='' name='name' style='width:100%;'/></td><td>
        	            <tr><td>".$locale[881]."</td><td><input value='' name='numcode' style='width:100%;'/></td><td>
        	            <tr><td>".$locale[882]."</td><td><input value='' name='charcode' style='width:100%;'/></td><td>
        	            <tr><td>".hlp($locale[841]).' '.$locale[890]."</td><td><input value='' name='text' style='width:100%;'/></td><td>
        	            <tr><td>".$locale[884]."</td><td><input value='' name='value' style='width:100%;'/></td><td>
        	            <tr><td>".hlp($locale[885])." ".$locale[883]."</td><td><input name='def' value='1' type='checkbox' /></td><td>
    	            </table>
	            <div align='center' style='margin:5px;'><input type='submit' name='submit' value=' ".$locale[125]." '></div>
	            </FIELDSET>
				</form>

			<br />
			<img src='".PATH."admin/tpl/img/hor.gif' width='500' alt='' border='0' style='vertical-align:middle; margin:4px;'>
			<br />
            </div>
        </div>
		";
		
            
		echo "<br /><br />
        <div align='center'>
        <form name='form' action='?unit=rates' method='post'>
		<table align='center' width='600' border='0' cellpadding='1' cellspacing='1' class='tbl'>
			<tr class='tbl_head'>
				<td width='30%'>".$locale[880]."</td>
				<td width='20%'>".$locale[881]."</td>
				<td width='10%'>".$locale[882]."</td>
				<td width='10%'>".$locale[883]."</td>
				<td width='20%'>".$locale[884]."</td>
				<td width='10%'>".$locale[275]."</td>
			</tr>
	    ";

	    $res = dbquery("SELECT * FROM ".PREF."rates");
	    while($dat = dbarray($res))
		    {
            if(isset($locale[$dat['name']])){$dat['name'] = $locale[$dat['name']];}
            if($dat['def'] == 1){$def = $locale[396];}else{$def = '<span style="color:silver;">'.$locale[397]."</span>";}
	        echo "
	        <tr>
                <td>".$dat['name']."</td>
                <td>".$dat['numcode']."</td>
                <td>".$dat['charcode']."</td>
                <td>".$def."</td>
                <td>";
                if($dat['def'] == 1)
                    {
                    echo $dat['value'];   
                    }
                else
                    {
                    echo "<input type='text' name='value[".$dat['id']."]' value='".$dat['value']."' />";
                    }
                echo "</td>

		        <td align='center'>
			        <nobr>
				        ".ico("?unit=rates&act=edit&id=".$dat['id'], 'e')."
				        ".ico("?unit=rates&act=del&id=".$dat['id'], 'd')."
				  	<nobr>
		        </td>
	        </tr>
	        ";
		    }
	    echo "
		</table><br />
        <input type='submit' name='submit' value=' ".$locale[837]." '>
        </form>
        </div>
		";

        }
    
	}
?>