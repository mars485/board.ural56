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
	if($_POST['submit'] != "")
		{
        if(count($_POST['type']) > 0)
	        {
            foreach($_POST['type'] as $k => $v)
	            {

                $_POST['price'][$k] = str_replace(',', '.', $_POST['price'][$k]);

	                dbquery("UPDATE ".PREF."services SET
	                		type='".$_POST['type'][$k]."',
	                		price='".$_POST['price'][$k]."',
	                		min='".$_POST['min'][$k]."',
	                		max='".$_POST['max'][$k]."',
	                		name='".$_POST['name'][$k]."',
	                		field='".$_POST['field'][$k]."',
	                		tip='".$_POST['tip'][$k]."'
	                		WHERE id=".$k."
	                		");

	            }

	        }
		}

	include(COREPATH.'admin/inc/services_list.php');
    echo "
	<form name='form' action='?unit=services' method='post'>
    <table align='center' width='90%' border='0' cellpadding='1' cellspacing='1' class='tbl services'>
	    <tr class='tbl_head'>
		    <td width='100'>".$locale[255]."</td>
		    <td>".$locale[259]."</td>
		    <td>".$locale[357]."</td>
		    <td>".$locale[358]."</td>
		    <td>".$locale[359]."</td>
		    <td>".$locale[171]."</td>
		    <td>".$locale[170]."</td>
	    </tr>
	    ";

	//type price min max name field tip

	foreach($services as $k => $v)
		{
		echo "
			<tr>
				<td align='center'><input name='type[".$v['id']."]' type='text' value='".$v['type']."' size='2'></td>
				<td align='center'><input name='field[".$v['id']."]' type='text' value='".$v['field']."' size='15'></td>
				<td align='center'><input name='name[".$v['id']."]' type='text' value='".$v['name']."' size='30'></td>
				<td align='center'><input name='tip[".$v['id']."]' type='text' value='".$v['tip']."' size='50'></td>
				<td align='center'><input name='price[".$v['id']."]' type='text' value='".$v['price']."' size='5'></td>
				<td align='center'><input name='min[".$v['id']."]' type='text' value='".$v['min']."' size='5'></td>
				<td align='center'><input name='max[".$v['id']."]' type='text' value='".$v['max']."' size='5'></td>
			</tr>
		";
		}
	echo "
	</table>
	<br />
	<div align='center'><input type='submit' name='submit' value='".$locale[335]."'></div>
	</form>
    ";
	}
?>