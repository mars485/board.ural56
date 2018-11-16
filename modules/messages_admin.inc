<?php  //   309
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
        if(count($_POST['text']) > 0)
	        {
            foreach($_POST['text'] as $k => $v)
	            {

	                dbquery("UPDATE ".PREF."msg SET
	                		text='".addslashes($__POST['text'][$k])."'
	                		WHERE id=".$k."
	                		");
	            }

	        }
		}





    echo "
	<form name='form' action='?unit=messages' method='post'>
	<div style='text-align:center; width:90%;'>
    ";
	$result = dbquery("SELECT * FROM ".PREF."msg");
	while($data = dbarray($result))
		{
		if(is_numeric($data['comments']))
			{
			$data['comments'] = $locale[$data['comments']];
			}

		echo "
        <br />
		<p align='center'><b>".$data['comments']."</b></p>
		<textarea class='ckeditor' name='text[".$data['id']."]'>".stripslashes($data['text'])."</textarea>";
        echo "
        <div align='center'>
        ".$fck."
        </div>
        ";
		}

    echo "
    <br /><br />
	<div align='center'><input style='font-size:13px;' type='submit' name='submit' value='".$locale[335]."'></div>
	<input name='post_filter' type='hidden' value='false'>
	</form>
    ";
	}
?>