<?php // 142
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
	$settings['title'] = $locale[142];
	$find = false;
    $err = false;
    $pay = false;
    $free_prolong = false;
	if(is_numeric($_GET['message']))
		{
		$res = dbquery("SELECT * FROM ".PREF."timing order by sort");
		$timing = array();
		while($dat = dbarray($res))
			{
			$timing[] = $dat;
			$timing_id[$dat['id']] = $dat;
			}
		$message_array = dbarray(dbquery("SELECT * FROM ".PREF."db WHERE id = ".$_GET['message']." AND status=1")); // AND sendmail=1
		if($message_array['id'] != "")
			{
            if(md5($message_array['id'].$settings['rand']) == $_GET['key'])
	            {
				$title_normal[1] = array('link' => $settings['patch'].'prolongation/', 'name' => $settings['title']);
				$title_normal[2] = array('link' => $settings['patch'].'prolongation/', 'name' => stripslashes($message_array['title']));
                $find = true;
	   			}
                
            if($settings['pay_funct'] == 2 || $settings['pay_funct'] == 3){
                $pay = true;
                if(!$settings['user']){
                    $err[] = 'Пожалуйста, авторизуйтесь!';
                    $free_prolong = false;
                }elseif($settings['pay_funct'] == 3){
                    
                    if($settings['user']['counter'] >= $settings['num_limit']){
                        $free_prolong = false;
                    }else{
                        $free_prolong = true;
                    }
                }else{
                    $free_prolong = true;
                }
                if($free_prolong) $pay = false;
                $smarty->assign('Currency', $currency_names[$settings['currency']]['name2']);   
                if($_POST['submit_prolong'] != ""){
                    $active_days = $_POST['active_days'];
                    $dat = dbarray(dbquery("SELECT price FROM ".PREF."services WHERE type='a'"));
                    $price = $dat['price'];
                    $amount = $active_days * $price;
                    if($amount != $_POST['active_service']  || $amount <= 0){
                        $err[] = $locale[636];
                    }elseif($amount > $settings['user']['balance']){
                        $err[] = '<a href="'.PATH.'users/pay/">'.$locale[180].'</a>';
                    }else{
                        update_balance($settings['user']['id'], 'o', $amount, $locale[142]);
                        $date_del = $message_array['date_del'] + ( $active_days * 86400 );
    				    dbquery("UPDATE ".PREF."db SET date_del=".$date_del.", sendmail=0 WHERE id=".$message_array['id']);
    				    header('Location: '.$settings['patch'].'prolongation/success/');
                        exit();
                    }
                    
                }
             
            }else{
                $free_prolong = true;
                if($message_array['sendmail'] == 0) $find = false; //fix 150519
            } 
            
            if($free_prolong){
                if($message_array['sendmail'] == 0) $find = false; //fix 150810
                if($_POST['submit_prolong'] != "" && is_numeric($_POST['timing'])){
    	               $pay = false;
    	               $err = false;
            				if($timing_id[$_POST['timing']]['id'] != "")
            					{
            				    $date_del = $message_array['date_del'] + ( $timing_id[$_POST['timing']]['days'] * 86400 );
            				    dbquery("UPDATE ".PREF."db SET date_del=".$date_del.", sendmail=0 WHERE id=".$message_array['id']);
            				    header('Location: '.$settings['patch'].'prolongation/success/');
            				    exit();
            					}
            	}
            }
                    
                
			}
		}
	if(!$find)
		{
		$title_normal[1] = array('link' => $settings['patch'].'prolongation/', 'name' => $settings['title']);
		//$title_normal[2] = array('link' => $settings['patch'].'prolongation/', 'name' => $locale[143]);
		}

	}
else
	{
    
	if($find)
		{
	    $smarty->assign('timing', $timing);
        $smarty->assign('pay', $pay);
        $smarty->assign('err', $err);
        
        $smarty->display('prolongation.html');


	    $dop_sql =  "WHERE id = ".$message_array['id']." LIMIT 0,1";
	    include(COREPATH.'messages.php');
		$smarty->assign('messages', $messages);
		$smarty->assign('messages_counter', $locale[144]);
	    $smarty->display('list.html');
		}
	elseif($_GET['cat'][1] == 'success')
		{
		echo "
		<center><div class='ok'>".$locale[147]."</div></center>
		";
		}
	else
		{
		echo "
		<center><div class='error'><b>".$locale[143]."</b></div></center>
		";
		}
	}

?>