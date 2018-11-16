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
	  if($settings['user'] || $settings['editable']){
	$settings['title'] = $locale[137];
	$act = $_GET['cat'][1];

	if(is_numeric($act))
		{
		if($settings['editable'])
			{
		    $dop = "";
			}
		else
			{
		    $dop .= " AND user_id = ".$settings['user']['id'];
			}


		$message_array = dbarray(dbquery("SELECT * FROM ".PREF."db WHERE id = ".$act." ".$dop));
		if($message_array)
			{
			$mid = $act;
			$title_normal[1] = array('link' => $settings['patch'].$cat.'/'.$mid, 'name' => $settings['title']);


            $check = $message_array;
			for($i = 0; $i < 10; $i++)
				{
			    if($check['tag'.$i] != "" && $check['tag'.$i] != 0)
				    {
				    dbquery("UPDATE ".PREF."tags SET counter=counter-1 WHERE id=".$check['tag'.$i]." ");
				    }
				}
            dbquery("UPDATE ".PREF."db SET status = 2 WHERE id = ".$mid);
            edit_cat_counter('-1', $message_array['cat'], $message_array['region'], $message_array['id']);
			}else{header("Location: ".$settings['patch']."404/");exit();}
		}else{header("Location: ".$settings['patch']."404/");exit();}
	  }else{header("Location: ".$settings['patch']."404/");exit();}


	}
else
	{

	       $smarty->display('deleted.html');

    
	}


?>