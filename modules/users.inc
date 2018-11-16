<?php //522
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
	if(!$settings['user'] && !isset($_GET['cat'][1]))
		{
		header('Location: '.$settings['patch'].'users/login/');
		die();
		}
    if(!isset($settings['update_days'])) $settings['update_days'] = 7;
    if(!isset($settings['update_allow'])) $settings['update_allow'] = 0;
	$settings['title'] = $locale[41] ;
    if(!isset($_GET['cat'][1])) $_GET['cat'][1] = "";
	$act = $_GET['cat'][1];
	$title_normal[1] = array('link' => $settings['patch'].$cat.'/', 'name' => $locale[835]);
	if($act == 'subscribe')
		{
	    $title_normal[2] = array('link' => $settings['patch'].$cat.'/'.$act.'/', 'name' => $locale[62]);
		}
	if($act == 'state')
		{
	    $title_normal[2] = array('link' => $settings['patch'].$cat.'/'.$act.'/', 'name' => $locale[63]);
		}
	if($act == 'pay')
		{
	    $title_normal[2] = array('link' => $settings['patch'].$cat.'/'.$act.'/', 'name' => $locale[64]);
		}
	if($act == 'order')
		{
	    $title_normal[2] = array('link' => $settings['patch'].$cat.'/'.$act.'/', 'name' => $locale[65]);
		}
	if($act == 'orders')
		{
	    $title_normal[2] = array('link' => $settings['patch'].$cat.'/'.$act.'/', 'name' => $locale[209]);
		}
	if($act == "")
		{
	    $title_normal[1] = array('link' => $settings['patch'].$cat.'/', 'name' => $locale[835]);
		}

    if($act == 'info')
	    {
        if(isset($_POST['submit_registr']))
	        {
	        $check = array();
	        $check['err'] = array();
	        $pass = $settings['user']['pass'];
	        $n = "";

            if($settings['sms'] == 1 && ($settings['user'] && $_POST['phone'] != ""))
	            {
	         	$check['phone'] = $_POST['phone'];
	         	$check['stcode'] = $_POST['stcode'];
				if($_POST['phone'] != "")
					{
					$num = $_POST['stcode'].$_POST['phone'];
					$n = "";
					for($i = 0; $i < strlen($num); $i++)
						{
						if(is_numeric($num{$i}))
							{
						    $n .= $num{$i};
							}
						}
					if(strlen($n) > 15)
						{
						$check['err'][] = $locale[809];
						}
					else
						{
					    $res = dbquery("SELECT code FROM ".PREF."smscode WHERE num = '".$n."'");
					    $dat = dbarray($res);
						if($dat['code'] != $_POST['code'] || $_POST['code'] == "")
							{
						    $check['err'][] = $locale[815];
							}
						}
					}
				else
					{
			        $check['err'][] = $locale[806];
					}
	            }


	        if($_POST['name'] != "" && $_POST['name'] != $settings['user']['name'])
		        {
	            if(strlen($_POST['name']) < 3)
		            {
	                $check['err'][] = $locale[35];
		            }
		      	else
			      	{
		 		    dbquery("UPDATE ".PREF."users SET name='".$_POST['name']."'  WHERE id = ".$settings['user']['id']."");
		 		    $settings['user']['name'] = $_POST['name'];
		      		}
		        }
            if(!isset($_POST['password'])) $_POST['password'] = "";
		    if($_POST['password'] != "" && count($check['err']) == 0 )
			    {
	            if(strlen($_POST['password']) < 6)
		            {
	                $check['err'][] = $locale[36];
		            }
		        else
			        {
		     	    if($_POST['password'] != $_POST['password1'])
			     	    {
		     		    $check['err'][] = $locale[38];
			     	    }
			 		else
				 		{
					    dbquery("UPDATE ".PREF."users SET pass='".md5($_POST['password'])."'  WHERE id = ".$settings['user']['id']."");
					    $pass = md5($_POST['password']);
					    header("Location: ".$settings['patch']."users/");
				 		}
			        }
		        }

		    if($n != "" && count($check['err']) == 0 )
			    {
  				dbquery("UPDATE ".PREF."users SET phone='".$n."'  WHERE id = ".$settings['user']['id']."");
  				$settings['user']['phone'] = $n;
				}

            if($_POST['email'] != "" && count($check['err']) == 0 && $_POST['email'] != $settings['user']['email'])
	            {
			    $emailstatus = 0;
			    if($settings['sms'] == 1)
				    {
				    $emailstatus = 1;
				    }

	            if(!email_check($_POST['email']))
		            {
	                $check['err'][] = $locale[37];
	                }
	          	else
		          	{
	        	    if(dbrows(dbquery("SELECT id FROM ".PREF."users WHERE email = '".$_POST['email']."' AND id != ".$settings['user']['id']." ")) > 0)
		        	    {
	        		    $check['err'][] = $locale[39];
		        	    }
		       		else
			       		{
	                    dbquery("UPDATE ".PREF."users SET email='".$_POST['email']."', email_status=".$emailstatus."  WHERE id = ".$settings['user']['id']."");
                        if($emailstatus == 0)
				       		{
						    $link = $settings['http']."://".$settings['site_address'].$settings['patch']."users/email_confirmation/?user_id=".$settings['user']['id']."&key=".md5($settings['user']['id'].$pass.$settings['rand']);
		                    $vars['title'] = TITLE;
		                    $vars['user'] = $settings['user']['name'];
		                    $vars['link'] = "<a href='".$link."'>".$link."</a>";

		                    if(send_mail($_POST['email'], TITLE.' / '.$locale[131], $board_msg['reg_check'], $vars))
			                    {
							    header('location: '.$settings['http'].'://'.$settings['path'].$cat.'/register/success/');
							    }
							else
								{
							    $check['err'][] = $locale[40];
								}
	                        }else{
	                           cms_syncusers();
	                        }
					    }
		          	}
	            }

            if($settings['captcha'] == 1)
	            {
                if(!captcha($settings, 'check'))
	                {
                    $check['err'][] = $locale[46];
	                }
	            }

	        if(count($check['err']) == 0)
		        {
	     	    header('location: '.$settings['patch'].$cat.'/info/');
	     	    exit;
		        }
                 
	        }
	    }


    if($act == 'register')
	    {
        $title_normal[2] = array('link' => $settings['patch'].$cat.'/'.$act.'/', 'name' => $locale[25]);

		$check = $_POST;
		$check['err'] = false;

	    if($_POST['submit_registr'] != "")
		    {
            if($settings['sms'] == 1)
	            {
                $num = "";
				if($_POST['phone'] != "")
					{
					$num = $_POST['stcode'].$_POST['phone'];
					$n = "";
					for($i = 0; $i < strlen($num); $i++)
						{
						if(is_numeric($num{$i}))
							{
						    $n .= $num{$i};
							}
						}
					if(strlen($n) > 15)
						{
						$check['err'][] = $locale[809];
						}
					else
						{
					    $res = dbquery("SELECT code FROM ".PREF."smscode WHERE num = '".$n."'");
					    $dat = dbarray($res);
						if($dat['code'] != $_POST['code'] || $_POST['code'] == "")
							{
						    $check['err'][] = $locale[815];
							}
						}
					}
				else
					{
			        $check['err'][] = $locale[806];
					}
	            }
            if(strlen($_POST['name']) < 3)
	            {
                $check['err'][] = $locale[35];
	            }
            if(strlen($_POST['password']) < 6)
	            {
                $check['err'][] = $locale[36];
	            }
	        else
		        {
	     	    if($_POST['password'] != $_POST['password1'])
		     	    {
	     		    $check['err'][] = $locale[38];
		     	    }
		        }
            if(strlen($_POST['email']) != "")
	            {
	            if(!email_check($_POST['email']))
		            {
	                $check['err'][] = $locale[37];
	                }
	          	else
		          	{
	        	    if(dbrows(dbquery("SELECT id FROM ".PREF."users WHERE email = '".$_POST['email']."'")) > 0)
		        	    {
	        		    $check['err'][] = $locale[39];
		        	    }
		          	}
	            }
	        else
		        {
	     	    $check['err'][] = $locale[37];
		        }
            if($settings['captcha'] == 1)
	            {
                if(!captcha($settings, 'check'))
	                {
                    $check['err'][] = $locale[46];
	                }
	            }


		    if(!$check['err'])
			    {
			    if($settings['default_user_balance'] == "")$settings['default_user_balance'] = 0;
			    $pass = md5($_POST['password']);
			    $emailstatus = 0;
			    if($settings['sms'] == 1)
				    {
				    $emailstatus = 1;
				    }

			    dbquery("INSERT INTO ".PREF."users SET email = '".$_POST['email']."', name='".$_POST['name']."', pass='".$pass."', status='".$settings['default_user_status']."', balance=".$settings['default_user_balance'].", email_status=".$emailstatus.", date=".$settings['time'].", phone='".$n."'");

			    if($emailstatus == 1)
				    {
                    cms_syncusers();
				    header('location: '.$settings['patch'].$cat.'/register/ok/');
				    exit();
				    }
				else
					{
			    	$res = dbquery("SELECT id FROM ".PREF."users WHERE email = '".$_POST['email']."'");
				    $data = dbarray($res);
				    if(is_numeric($data['id']))
					    {
					    $link = $settings['http']."://".$settings['site_address'].$settings['patch']."users/email_confirmation/?user_id=".$data['id']."&key=".md5($data['id'].$pass.$settings['rand']);
	                    $vars['title'] = TITLE;
	                    $vars['user'] = $_POST['name'];
	                    $vars['link'] = "<a href='".$link."'>".$link."</a>";

	                    if(send_mail($_POST['email'], TITLE.' / '.$locale[49], $board_msg['reg_check'], $vars))
		                    {
						    header('location: '.$settings['patch'].$cat.'/register/success/');
						    }
						else
							{
						    $check['err'][] = $locale[40];
							}
					    /*
					    setcookie('userid', $data['id'], ($settings['time'] + 31536000), "/");
					    setcookie('pass', $pass, ($settings['time'] + 31536000), "/");
					    header('location: '.$settings['patch'].$cat.'/');
					    */
					    }

					}
			    }
		    }
           
	    }
    if($act == 'email_confirmation')
	    {
        if(is_numeric($_GET['user_id']))
	        {
	    	$res = dbquery("SELECT * FROM ".PREF."users WHERE id = '".$_GET['user_id']."'");
		    $data = dbarray($res);
		    if(md5($data['id'].$data['pass'].$settings['rand']) == $_GET['key'])
			    {
				dbquery("UPDATE ".PREF."users SET email_status = 1 WHERE id = '".$_GET['user_id']."'");
        		setcookie('userid', $data['id'], ($settings['time'] + $settings['cookie_time']), "/");
        		setcookie('pass', $data['pass'], ($settings['time'] + $settings['cookie_time']), "/");
                if($settings['pay_funct'] == 3) $settings['default_message_status'] = 0;
                $res = dbquery("SELECT * FROM ".PREF."db_disabled WHERE user='".$data['id']."'");
                while($dat = dbarray($res)){
                    dbquery("UPDATE ".PREF."db SET status='".$settings['default_message_status']."' WHERE status=2 AND user_id='".$data['id']."'");
                    dbquery("DELETE FROM ".PREF."db_disabled WHERE id=".$dat['id']);
                    if($settings['default_message_status'] == 1){
                        $msg = dbarray(dbquery("SELECT id, cat, region FROM ".PREF."db WHERE id=".$dat['message']));
                        if($msg){
                            edit_cat_counter('+1', $msg['cat'], $msg['region'], $msg['id']);
                        }
                    }
                    $save_id = $dat['message'];
                    include(COREPATH.'subscribe.php');
                }
                
				header('location: '.$settings['patch'].$cat.'/email_confirmation/success/');
                }
    		else
	    		{
	    		header('location: '.$settings['patch'].$cat.'/email_confirmation/error/');
	    		}
	        }
	    }
    if($act == 'exit')
		{
		setcookie('userid', "",  ($settings['time'] + 31536000), "/");
		setcookie('pass', "", ($settings['time'] + 31536000), "/");
        //session_destroy();
		header('location: '.$settings['patch'].$cat.'/login/');
		}

	}




if($exe)
	{
	$in_array = array(
                '', 
                'subscribe',
                'state',
                'pay',
                'order',
                'orders',
                'info',
                'deleted',
                'moderated',
                'update',
                'shop'
                );
    if(in_array($act, $in_array) && $settings['user'])
	    {

	    $panel_right = "";
	    $panel_title = "";

        $usercounter = array();
        $sql = "
            SELECT 
             (SELECT COUNT(*) FROM ".PREF."db WHERE status = 1 AND user_id = ".$settings['user']['id'].") as `all`,
             (SELECT COUNT(*) FROM ".PREF."db WHERE status = 0 AND user_id = ".$settings['user']['id'].") as `mod`,
             (SELECT COUNT(*) FROM ".PREF."db WHERE status = 2 AND user_id = ".$settings['user']['id'].") as `del`,
             (SELECT COUNT(*) FROM ".PREF."db WHERE date_add < ".($settings['time'] - 86400*$settings['update_days'])." AND user_id = ".$settings['user']['id'].") as `upd`
        ";

        $usercounter = dbarray(dbquery($sql));
        foreach($usercounter as $k=>$v){
            if($v == null) $usercounter[$k] = 0;
        }
        /*
        $usercounter['all'] = dbrows(dbquery("SELECT id FROM ".PREF."db WHERE status = 1 AND user_id = ".$settings['user']['id']."  ")); //опубликовано объявлений
        $usercounter['mod'] = dbrows(dbquery("SELECT id FROM ".PREF."db WHERE status = 0 AND user_id = ".$settings['user']['id']."  ")); //удалено
        $usercounter['del'] = dbrows(dbquery("SELECT id FROM ".PREF."db WHERE status = 2 AND user_id = ".$settings['user']['id']."  ")); //на модерации
        */
        
        $smarty ->assign('usercounter', $usercounter);
        if(!isset($_POST['id'])) $_POST['id'] = "";
        
        $statuses = array();
        $statuses[''] =             array('status' => 1);
        $statuses['moderated'] =    array('status' => 0);
        $statuses['deleted'] =      array('status' => 2);
        
        if(array_key_exists($act, $statuses)){
			$dop_sql = "WHERE user_id = ".$settings['user']['id']." AND status=".$statuses[$act]['status']." ORDER by date_add desc  ";
			
            if(!isset($_GET['page'])) $_GET['page'] = '';
            $page = $_GET['page'];
            $limit = '';
            $count_messages = dbrows(dbquery('SELECT id FROM '.PREF.'db '.$dop_sql));
        	$page_count = ceil($count_messages/$settings['onpage']);
        	if($page > $page_count){
        		$page = $page_count;
       		}
        	if($page <= 0 ){
        		$page = 1;
       		}
        	$offset = ( $page - 1 ) * $settings['onpage'];
        	$limit = ' LIMIT '.$offset.', '.$settings['onpage'];
        	if($page_count > 0){
        		$smarty->assign('pages', $page_count);
       		}
            $dop_sql .= $limit;
            $panel_title = $locale[61];
			include(COREPATH.'messages.php');
			$smarty->assign('messages', $messages);
			$smarty->assign('messages_counter', $locale[2].' '.om_number($count_messages, array($locale[3], $locale[4], $locale[5])));
			$panel_right = $smarty->fetch('list.html');
        }
        elseif($act == "info")
		    {
            $check['name'] = $settings['user']['name'];
            $check['email'] = $settings['user']['email'];
            $smarty->assign('ps1', $locale[129]);
            $smarty->assign('ps2', $locale[130]);

            $smarty->assign('tip_email', $locale[127]);
            $smarty->assign('check', $check);

			$panel_right = $smarty->fetch('users_registr.html');
		    }
	    elseif($act == "subscribe")
		    {
            if(!isset($_POST['submit_subscribe'])) $_POST['submit_subscribe'] = "";
            if(isset($_POST['add_cat'])) $_COOKIE['add_cat'] = $_POST['add_cat'];
		    if($_POST['submit_subscribe'] != "")
			    {
				$result = dbquery("SELECT * FROM ".PREF."subscribe WHERE user_id = ".$settings['user']['id']." ");
				$count = dbrows($result);
				if($count < $settings['max_subscribe'] && is_numeric($_COOKIE['add_cat']))
					{
				    dbquery("INSERT INTO ".PREF."subscribe SET cat=".$_COOKIE['add_cat'].", user_id = ".$settings['user']['id']." ");
					}
			    }
            elseif($_POST['id'] != "")
	            {
                if(is_numeric($_POST['id']))
	                {
                    dbquery("DELETE FROM ".PREF."subscribe WHERE user_id= ".$settings['user']['id']." AND id = ".$_POST['id']." ");
	                }
	            }
			$panel_title = $locale[118];

			$result = dbquery("SELECT * FROM ".PREF."subscribe WHERE user_id = ".$settings['user']['id']." ");
			$count = dbrows($result);
            $subsc = array();
            if($count > 0)
	            {
                while($dat = dbarray($result))
	                {
                    $subsc[] = array('id' => $dat['id'], 'cat' => get_array_linenav($dat['cat'], $cats_id));
	                }
	            }

            $counter_backup = $counter;
            $smarty->assign('counter', $locale[2].' '.om_number($count, array($locale[120], $locale[121], $locale[122])).' '.$settings['max_subscribe'].' '.$locale[123]);
			$smarty->assign('subsc', $subsc);

			$panel_right = $smarty->fetch('users_subscribe.html');
            
            $counter = $counter_backup;
            $smarty->assign('counter', $counter);
		    }

        elseif($act == "order")
	        {
	           if(isset($_GET['message_id'])){
	               $sql_messageById1 = '(id = '.intval($_GET['message_id']).' AND status=1) OR ';   
	               $sql_messageById2 = ' id='.intval($_GET['message_id']).' desc, ';
                   echo '
                   <script>
                    var ScrollToFromGl = '.intval($_GET['message_id']).';
                   </script>
                   ';
               }else{
	               $sql_messageById1 = '';   
	               $sql_messageById2 = '';
               }
	        
			$dop_sql = "WHERE ".$sql_messageById1."
                    (user_id = ".$settings['user']['id']." AND status=1)
                    ORDER by ".$sql_messageById2." date_add desc";      

            if(!isset($_GET['page'])) $_GET['page'] = '';
            $page = $_GET['page'];
            $limit = '';
            $count_messages = dbarray(dbquery('SELECT COUNT(*) as cnt FROM '.PREF.'db WHERE (user_id = '.$settings['user']['id'].' AND status=1) '.$sql_messageById));
            $count_messages = $count_messages['cnt'];
        	$page_count = ceil($count_messages/$settings['onpage']);
        	if($page > $page_count){
        		$page = $page_count;
       		}
        	if($page <= 0 ){
        		$page = 1;
       		}
        	$offset = ( $page - 1 ) * $settings['onpage'];
        	$limit = ' LIMIT '.$offset.', '.$settings['onpage'];
        	if($page_count > 0){
        		$smarty->assign('pages', $page_count);
       		}
            $dop_sql .= $limit;
            $panel_title = $locale[61];
			include(COREPATH.'messages.php');
			$smarty->assign('messages', $messages);
			$smarty->assign('messages_counter', $locale[2].' '.om_number($count_messages, array($locale[3], $locale[4], $locale[5])));
		    $smarty->assign('services_packages', $services_packages);
		    $panel_right = $smarty->fetch('users_order.html');               
               
            /*
            $error = false;
            $order = false;
            $count = false;
            $submit = false;
            $messages = array();
            
			//$res = dbquery("SELECT id, date_add, title FROM ".PREF."db WHERE user_id=".$settings['user']['id']." AND status=1");
			//while($dat = dbarray($res))
			//	{
			//	$messages[$dat['id']] = $dat;
			//	}

            
            if(!isset($_GET['message_id'])) $_GET['message_id'] = "";
            if(!isset($_POST['message_id'])) $_POST['message_id'] = "";
            if(is_numeric($_GET['message_id']))
	            {
                $message_id = $_GET['message_id'];
	            }
	        elseif(is_numeric($_POST['message_id']))
		        {
	     	    $message_id = $_POST['message_id'];
		        }
            else
	            {
                $message_id = false;
	            }

            $dop_sql = "
                    WHERE 
                        (user_id=".$settings['user']['id']." ".(($message_id) ? " OR id=".intval($message_id) : "").") 
                        AND status=1
                        ";
            include(COREPATH."messages.php");


            if(isset($_POST['submit_calc']) || isset($_POST['submit_order']) || isset($_POST['submit_order_ok']))
	            {
                $_POST['days'] = str_replace(' ', '', $_POST['days']);
                $_POST['days'] = str_replace(',', '.', $_POST['days']);
                $m = array();
                if(count($messages) > 0){
                    foreach($messages as $v){
                        $m[$v['id']] = $v;
                    }
                }
                $messages = $m;
	            if($services[$_POST['service']]['id'] != "" && $messages[$_POST['message_id']]['id'] != ""  && is_numeric($_POST['days']))
		            {
	         	    if($_POST['days'] > $services[$_POST['service']]['max'] || $_POST['days'] < $services[$_POST['service']]['min'])
		         	    {
	         		    $count = '<font style="color:red;">'.$locale[178].'</font>';
	         		    $error = '<font style="color:red;">('.$locale[179].')</font>';
		         	    }
		        	else
			        	{
		   			    $count = $_POST['days'] * $services[$_POST['service']]['price'];
		   			    if($count >  $settings['user']['balance'])
			   			    {
		   				    $count = '<b>'.$count.'</b> <font style="color:red;">&larr; '.$locale[180].'</font>';
			   			    }
			 			else
				 			{
						    $submit = true;
				 			}
			        	}
			        }
				else
					{
				
	                $count = '<font style="color:red;">'.$locale[178].'</font>';
	                $error = '';
	                }
	            }
            if(is_numeric($count) && isset($_POST['submit_order']) && $submit)
	            {
                $order = true;
	            }
	        if(is_numeric($count) && isset($_POST['submit_order_ok']) && $submit)
		        {
	     	    $panel_right .= "<div align='center'><div class='ok'>".$locale[186].' ';

	     	    if($settings['default_order_status'] == 0)
		     	    {
	     		    $panel_right .= $locale[187];
	     		    $time_end = 0;
		     	    }
		    	else
		     	    {
	     		    $panel_right .= $locale[188];
	     		    $time_end = $settings['time'] + (86400 * $_POST['days']);
		     	    }

	     	    $panel_right .= "!</div></div>";
                $dat = dbarray(dbquery("SELECT MAX(time_end) as time_end FROM ".PREF."orders WHERE type = '".$_POST['service']."' AND message_id = '".$_POST['message_id']."'")); 
                if($dat){
                    if($dat['time_end'] > $settings['time']){
                        $time_end = $dat['time_end'] + (86400 * $_POST['days']);
                    }
                }
	     	    $sql = "INSERT INTO ".PREF."orders SET user_id = '".$settings['user']['id']."', time_end = '".$time_end."', days = '".$_POST['days']."', type = '".$_POST['service']."', message_id = '".$_POST['message_id']."', status = '".$settings['default_order_status']."'";
	     	    update_balance($settings['user']['id'], 'o', $count, $services[$_POST['service']]['name']);
	     	    dbquery($sql);
                $dopsql = '';
                if($_POST['service'] == 'r') $dopsql = ", date_raised=CURRENT_TIMESTAMP ";
                $sql = "UPDATE ".PREF."db SET ".$services[$_POST['service']]['field']."=1 ".$dopsql." WHERE id=".intval($_POST['message_id']);
                dbquery($sql);
		        }
	        else
		        {
				$smarty->assign('submit', $submit);
				$smarty->assign('order', $order);
		        $smarty->assign('services', $services);
		        $smarty->assign('messages', $messages);
			    $smarty->assign('error', $error);
			    $smarty->assign('count', $count);
			    $smarty->assign('services_packages', $services_packages);
			    $panel_right = $smarty->fetch('users_order.html');
			    }
            */
	        }
        elseif($act == "state")
	        {
	     	$state = array();
            $res = dbquery("SELECT * FROM ".PREF."pay WHERE user_id=".$settings['user']['id']." ORDER by time desc");
            while($dat = dbarray($res))
	            {
                $state[] = $dat;
	            }
	        $smarty->assign('state', $state);
	        $panel_right = $smarty->fetch('users_state.html');
	        }
        elseif($act == "orders")
	        {
	     	$orders = array();
            $res = dbquery("SELECT * FROM ".PREF."orders WHERE user_id=".$settings['user']['id']." ");
            while($dat = dbarray($res))
	            {
                $orders[$dat['id']] = $dat;
                $res2 = dbquery("SELECT date_add, title FROM ".PREF."db WHERE id=".$dat['message_id']." ");
                $dat2 = dbarray($res2);
                $orders[$dat['id']]['message'] = $dat2;
                $orders[$dat['id']]['number'] = om_number($dat['days'], array($locale[173], $locale[174], $locale[175]));
	            }
	        $smarty->assign('services', $services);
	        $smarty->assign('orders', $orders);
	        $panel_right = $smarty->fetch('users_orders.html');
	        }
        elseif($act == "update" && $settings['update_allow'] == 1)
	        {
            if(isset($_POST['msg'])){
                $msgs = array();
                if(is_array($_POST['msg'])){
                    if(count($_POST['msg']) > 0){
                        foreach($_POST['msg'] as $v){
                            if(is_numeric($v)){
                                $msgs[] = $v;
                            }
                        }
                    }
                }
                $sql = "UPDATE ".PREF."db SET date_add=".$settings['time']." WHERE id IN(".implode(',', $msgs).") AND date_add < ".($settings['time'] - 86400*$settings['update_days'])." AND user_id = ".$settings['user']['id'];
                dbquery($sql);
                echo "
                <p>".$locale[1099]."</p>
                <script>document.location.href='?notice';</script>
                ";
            }else{
                $dop_sql = "WHERE status=1 AND date_add < ".($settings['time'] - 86400*$settings['update_days'])." AND user_id = ".$settings['user']['id'];
                
                if(!isset($_GET['page'])) $_GET['page'] = '';
                $page = $_GET['page'];
                $limit = '';
                $count_messages = dbrows(dbquery('SELECT id FROM '.PREF.'db '.$dop_sql));
            	$page_count = ceil($count_messages/$settings['onpage']);
            	if($page > $page_count){
            		$page = $page_count;
           		}
            	if($page <= 0 ){
            		$page = 1;
           		}
            	$offset = ( $page - 1 ) * $settings['onpage'];
            	$limit = ' LIMIT '.$offset.', '.$settings['onpage'];
            	if($page_count > 0){
            		$smarty->assign('pages', $page_count);
           		}
                $dop_sql .= $limit;
            
                include(COREPATH . 'messages.php');
    			$smarty->assign('messages', $messages);
    			$smarty->assign('messages_counter', $locale[2].' '.om_number($count_messages, array($locale[3], $locale[4], $locale[5])));
    			$smarty->assign('infotext', $locale[1096].' '.om_number($settings['update_days'], array($locale[173], $locale[174], $locale[175])).'. '.$locale[1097]);
    	        $panel_right = $smarty->fetch('users_update.html');
            }

	        }
        elseif($act == "pay")
	        {
            if(!isset($_GET['id'])) $_GET['id'] = "";
            if($is_billing)
	            {
	            if(is_numeric($_GET['id']) && $billing[$_GET['p']]['status'] == 1)
		            {
                    $res = dbquery("SELECT amount FROM ".PREF."payments WHERE id=".$_GET['id']);
					$dat = dbarray($res);
                    if(!isset($dat['status']))   $dat['status'] = "";
                    if(!isset($billing['code'])) $billing['code'] = "";
                    
                    if($dat['status'] == 0)
	                    {
						$abilling = $billing[$_GET['p']];

		         	    $num = $dat['amount'];
		         	    $code = stripslashes($billing['code']);

						$comment = $locale[667].' '.$settings['user']['name'];
						if(strlen($comment) > 255)
							{
							$comment = 'userid'.$settings['user']['id'];
							}

						$pay = array();
						$pay['amount'] = $num;
						$pay['order'] = $_GET['id'];
						$pay['comment'] = $comment;
						$pay['currency'] = $abilling['cur'][$settings['currency']];

						$smarty->assign('abilling', $abilling);
						$smarty->assign('pay', $pay);

						$panel_right .= "\r\n<p align='center'>".$locale[664].": <b>".$abilling['name']."</b>, ".$locale[666].": ".$num." ".$currency_names[$settings['currency']]['name2']."</p>\r\n";

						$file = make_template_file($abilling['html_1']);
	                    $panel_right .= $smarty->fetch($file);
	                    unlink($file);
	                    }
		            }
		      	else
			      	{
					if(isset($_POST['num']))
						{
						$num = trim(str_replace(',', '.', $_POST['num']));
						if(is_numeric(str_replace('.', '', $num)) && $num != 0 && $num != "")
							{
							$go = true;
							$num = round($num, 2);
							$payment_id = make_payment($num, $settings['user']['id']);
							$smarty->assign('payment_id', $payment_id);
							}
						else
							{
					        $err = true;
							}
						}
                    if(!isset($go)) $go = "";
                    if(!isset($err)) $err = "";
                    if(!isset($num)) $num = "";
					$smarty->assign('go', $go);
					$smarty->assign('err', $err);
					$smarty->assign('Count', $num);
		            $smarty->assign('Currency', $currency_names[$settings['currency']]['name2']);

		            $panel_right = $smarty->fetch('users_pay.html');
		            }
	            }
            else
	            {
                $panel_right = $board_msg['pay_none'];
	            }


	        }
        elseif($act == "shop"){
            include(FULLPATH.'modules/users_shop.php');
        }

		$smarty->assign('panel_title', $panel_title);
	    $smarty->assign('panel_right', $panel_right);
	    $smarty->assign('usercounter', $usercounter);

		$smarty->display('users_panel.html');
	    }


    //////////////////////////////////////////////////////////////////

    elseif($act == 'register')
	    {
	      
        if($_GET['cat'][2] == 'success')
	        {
            echo "\n<center><div class='ok'>".$locale[48]."</div></center>\n";
	        }
	    elseif($_GET['cat'][2] == 'ok')
	        {
            echo "\n<center><div class='ok'>".$locale[817]."</div></center>\n";
	        }
	    else
		    {
            $smarty->assign('ps1', $locale[31]);
            $smarty->assign('ps2', $locale[30]);

	        $smarty->assign('tip_email', $locale[27]);
	        $smarty->assign('check', $check);
		 	$smarty->display('users_registr.html');
	        }
	    }
    elseif($act == 'email_confirmation')
		{
        if($_GET['cat'][2] == 'success')
	        {
	        echo "\n<center><div class='ok'>".$locale[50]."</div></center>\n";
	        }
        if($_GET['cat'][2] == 'error')
	        {
	        echo "\n<center><div class='error'>".$locale[51]."</div></center>\n";
	        }
		}
    elseif($act == 'password_recovery')
		{

		if($_POST['email'] != "")
			{
			if(($settings['captcha'] == 1 && captcha($settings, 'check')) || $settings['captcha'] == 0)
				{
				if(email_check($_POST['email']))
					{
			    	$res = dbquery("SELECT id, name, pass, email FROM ".PREF."users WHERE email = '".$_POST['email']."'");
				    $data = dbarray($res);
				    if(is_numeric($data['id']))
					    {
						$link = $settings['http']."://".$settings['site_address'].$settings['patch']."users/password_recovery/?user_id=".$data['id']."&key=".md5($data['id'].$data['pass'].$settings['rand']);
						$vars['title'] = TITLE;
						$vars['user'] = $data['name'];
						$vars['link'] = "<a href='".$link."'>".$link."</a>";

						if(send_mail($data['email'], TITLE.' / '.$locale[52], $board_msg['password_recovery'], $vars))
							{
							echo "\n<center><div class='ok'>".$locale[53]."</div></center>\n";
							}
						else
							{
						    echo "\n<center><div class='error'>".$locale[40]."</div></center>\n";
							}
					    }
					else
						{
						echo "\n<center><div class='error'>".$locale[56]."</div></center>\n";
						}
					}
				else
					{
					echo "\n<center><div class='error'>".$locale[37]."</div></center>\n";

					}
				}
			elseif($settings['captcha'] == 1 && !captcha($settings, 'check'))
				{
			    echo "\n<center><div class='error'>".$locale[46]."</div></center>\n";
				}
			}
		if($_GET['key'] != "")
			{
	        if(is_numeric($_GET['user_id']))
		        {
		    	$res = dbquery("SELECT id, email, pass FROM ".PREF."users WHERE id = '".$_GET['user_id']."'");
			    $data = dbarray($res);

			    if(md5($data['id'].$data['pass'].$settings['rand']) == $_GET['key'])
				    {
				    $newpassword = make_password(6);
					dbquery("UPDATE ".PREF."users SET pass='".md5($newpassword)."' WHERE id = '".$_GET['user_id']."'");
					$smarty->assign('newpassword', $newpassword);
					$smarty->display('users_password_recovery_success.html');
	                }
		        }
			}
		else
			{
			$smarty->display('users_password_recovery.html');
			}
		}
    elseif(!$settings['user']  && !isset($act))
        {
        if($settings['onpage_users'] == "")
            {
            $settings['onpage_users'] = 20;
            }

        $dop_sql = ' WHERE status >= 1 AND email_status=1 ORDER by name';
        $page = $_GET['page'];
        $limit = '';
        $count_messages = dbrows(dbquery('SELECT id FROM '.PREF.'users '.$dop_sql));
    	$page_count = ceil($count_messages/$settings['onpage_users']);
    	if($page > $page_count)
    		{
    		$page = $page_count;
    		}
    	if($page <= 0 )
    		{
    		$page = 1;
    		}
    	$offset = ( $page - 1 ) * $settings['onpage_users'];
    	$limit = ' LIMIT '.$offset.', '.$settings['onpage_users'];
    	if($page_count > 0)
    		{
    		$smarty->assign('pages', $page_count);
    		}

        $dop_sql .= $limit;
        $allusers = array();
        $res = dbquery("SELECT * FROM ".PREF."users ".$dop_sql);
        while($dat = dbarray($res))
            {
            $count = dbrows(dbquery('SELECT id FROM '.PREF.'db WHERE status = 1 AND user_id = '.$dat['id'].'  '));
            $dat['messages'] = $count;
            $allusers[$dat['id']] = $dat;
            }

        $smarty->assign('allusers', $allusers);
    	$smarty->assign('messages_counter', $locale[2].' '.om_number($count_messages, array($locale[769], $locale[770], $locale[771])));
        $smarty->display('users_list.html');

        }
	else
		{
	    $smarty->display('users_login.html');
		}
	}
?>