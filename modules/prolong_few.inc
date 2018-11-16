<?php // 1091

if(!$exe)
	{
	$settings['title'] = $locale[1091];
    $title_normal[1] = array('link' => $_SERVER['REQUEST_URI'], 'name' => $settings['title']);

	$res = dbquery("SELECT * FROM ".PREF."timing order by sort");
	$timing = array();
	while($dat = dbarray($res))
		{
		$timing[] = $dat;
		$timing_id[$dat['id']] = $dat;
		}
	$message_array = dbarray(dbquery("SELECT email, user_id FROM ".PREF."db WHERE id = ".$_GET['message'])); // AND sendmail=1
    $prolong_messages = array();
    if($message_array){
        
        
        
        
        $id_sql = "";
        if($message_array['user_id'] != 0 && $message_array['user_id'] != ""){
            $user = dbarray(dbquery("SELECT email, name FROM ".PREF."users WHERE id = '".$message_array['user_id']."'"));
            $id_sql .= "user_id=".$user_id;
            $message_array['email'] = $user['email'];
        }
        $time_plus = (isset($customconfig['prolong_mail_overtime'])) ? $customconfig['prolong_mail_overtime'] : 86400;
        $dop_sql = "
                            WHERE 
                                date_del < ".( $settings['time'] + ( $settings['sendmail_days'] * 86400 ) + $time_plus)." AND 
                                status = 1 AND 
                                active = 0 AND 
                                (user_id=".$message_array['user_id']." OR email = '".$message_array['email']."')
                                ";

        
        if(isset($_POST['msg']) && isset($_POST['timing'])){
            if(is_array($_POST['msg']) && isset($timing_id[$_POST['timing']]['id'])){
                $msg = array();
                if(count($_POST['msg']) > 0){
                    foreach($_POST['msg'] as $v){
                        if(is_numeric($v)){
                            $msg[] = $v;
                        }
                    }
                }
                if(count($msg) > 0){

                    $msg = implode(',', $msg);
    			    $date_del = $timing_id[$_POST['timing']]['days'] * 86400;
    			    dbquery("UPDATE ".PREF."db SET date_del=date_del+".$date_del.", sendmail=0 
                                    ".$dop_sql."
                                    AND id IN(".$msg.")
                                ");

                }
            }
    	}
              
        $messages = array();
        
        include(COREPATH.'/messages.php');  
        $prolong_messages = $messages;
    }


	}
else
	{
   
   

    
    $smarty->assign('messages', $prolong_messages);
	$smarty->assign('messages_counter', $locale[144]); 
    $smarty->assign('err', $err);   
    $smarty->assign('timing', $timing);
    $smarty->display('prolong_few.html');

	}

?>