<?php
/*
	Скрипт доски объявлений
	Elite-Board 2
	Тихомиров Юрий
	Санкт-Петербург
	2009 - 2010

	версия модуля: 041013
*/
$DaysCount = 30;

if(!$exe)
	{
	$settings['title'] = $locale[981];
    $messages = array();
	$id_array = false;
    $err = false;
    if(isset($_GET['id'])){
        if(is_array($_GET['id'])){
            if(count($_GET['id']) > 0){
                foreach($_GET['id'] as $id){
                    if(is_numeric($id)){
                        $id_array[] = $id;
                    }
                }
            }
        }
    }elseif(is_numeric($_GET['cat'][1])){
        $id_array = array($_GET['cat'][1]);
    }
	if($id_array){
	    $dop .= " AND user_id = ".$settings['user']['id']." AND status=2";
        if(!isset($_POST['debit'])){
    		
            foreach($id_array as $id){
        		$message_array = dbarray(dbquery("SELECT * FROM ".PREF."db WHERE id = ".$id." ".$dop));
                
        		if($message_array){
                    if($settings['pay_funct'] == 2 || ($settings['pay_funct'] == 3 && $settings['user']['counter'] >= $settings['num_limit'])){
                        $messages[$message_array['id']] = $message_array;
                    }else{
                        $r = $message_array['date_del'] - $settings['time'];
                        if($r < $DaysCount * 86400){
                            $message_array['date_del'] = $settings['time'] + $DaysCount * 86400;
                        }
            			$mid = $id;
            			$title_normal[1] = array('link' => $settings['patch'].$cat.'/'.$mid, 'name' => $settings['title']);
                        $check = $message_array;
            			for($i = 0; $i < 10; $i++)
            				{
            			    if($check['tag'.$i] != "" && $check['tag'.$i] != 0)
            				    {
            				    dbquery("UPDATE ".PREF."tags SET counter=counter+1 WHERE id=".$check['tag'.$i]." ");
            				    }
            				}
                        dbquery("UPDATE ".PREF."db SET status = ".$settings['default_message_status'].", date_del = '".$message_array['date_del']."' WHERE id = ".$mid);
            			$settings['user']['counter']++;
                        if($settings['default_message_status'] == '1')
            				{
                            edit_cat_counter('+1', $check['cat'], $check['region'], $mid);
                            }
                    }
                    
        		}
                $smarty->assign('messages', $messages);
            }
        }else{
            $active_days = $_POST['active_days'];
            $dat = dbarray(dbquery("SELECT price FROM ".PREF."services WHERE type='a'"));
            $price = $dat['price'];
            $amount = $active_days * $price * count($id_array);
            if($amount != ($_POST['active_service'] * count($id_array))  || $amount == 0 || $amount < 0){
                $err[] = $locale[636];
            }elseif($amount > $settings['user']['balance']){
                $err[] = '<a href="'.PATH.'users/pay/">'.$locale[180].'</a>';
            }else{
                
                update_balance($settings['user']['id'], 'o', $amount, $locale[142]);
                foreach($id_array as $id){
            		$message_array = dbarray(dbquery("SELECT * FROM ".PREF."db WHERE id = ".$id." ".$dop));
            		if($message_array){

                            $message_array['date_del'] = $settings['time'] + $active_days * 86400;
                			$mid = $id;
                			$title_normal[1] = array('link' => $settings['patch'].$cat.'/'.$mid, 'name' => $settings['title']);
                            $check = $message_array;
                			for($i = 0; $i < 10; $i++)
                				{
                			    if($check['tag'.$i] != "" && $check['tag'.$i] != 0)
                				    {
                				    dbquery("UPDATE ".PREF."tags SET counter=counter+1 WHERE id=".$check['tag'.$i]." ");
                				    }
                				}
                            dbquery("UPDATE ".PREF."db SET status = ".$settings['default_message_status'].", date_del = '".$message_array['date_del']."' WHERE id = ".$mid);
                			$settings['user']['counter']++;
                            if($settings['default_message_status'] == '1')
                				{
                                edit_cat_counter('+1', $check['cat'], $check['region'], $mid);
                                }
            		}
                    $smarty->assign('messages', $messages);
                }
                
                
            }
            

            
            
        }

    }

		//{header("Location: ".$settings['patch']."404/");}

	}
else
	{
    $smarty->assign('err', $err);
    $smarty->assign('Currency', $currency_names[$settings['currency']]['name2']);
    $smarty->display('restored.html');
    
    if(count($messages) > 0){
		$smarty->assign('messages_counter', $locale[144]);
	    $smarty->display('list.html');
    }

	}


?>