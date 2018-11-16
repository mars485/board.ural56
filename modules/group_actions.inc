<?php
	$DaysCount = 30;
    if(isset($_GET['id'])){
        $arr = $_GET['id'];
        if(count($arr) > 0){
    		if($settings['editable']){
    		    $dop = "";
    		}else{
    		    $dop .= " AND user_id = ".$settings['user']['id'];
   			}
            foreach($arr as $id){
                if(is_numeric($id)){
            		$message_array = dbarray(dbquery("SELECT * FROM ".PREF."db WHERE id = ".$id." ".$dop));
            		if($message_array){
                        $r = $message_array['date_del'] - $settings['time'];
                        if($r < $DaysCount * 86400){
                            $message_array['date_del'] = $settings['time'] + $DaysCount * 86400;
                        }
                        
                        if($message_array['status'] == 2){
                            exit('restore') ;
                            /*
                            if($settings['pay_funct'] == 2 || $settings['pay_funct'] == 3){
                                echo "Denied";
                            }else{

                                dbquery("UPDATE ".PREF."db SET status = ".$settings['default_message_status'].", date_del = '".$message_array['date_del']."' WHERE id = ".$id);
                    			if($settings['default_message_status'] == '1'){
                                    edit_cat_counter('+1', $message_array['cat'], $message_array['region'], $message_array['id']);
                                    echo '+';
                                }                                  
                            }
                            */
                        }else{

                            dbquery("UPDATE ".PREF."db SET status = 2 WHERE id = ".$id);
                			if($settings['default_message_status'] == '1'){
                                edit_cat_counter('-1', $message_array['cat'], $message_array['region'], $message_array['id']);
                                echo '-';
                            }                             
                        }

                        
                        
           			}   
                }
            }
        }
    }
    
    exit();
?>