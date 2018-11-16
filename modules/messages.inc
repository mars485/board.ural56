<?php
/*
	Скрипт доски объявлений
	Elite-Board 2
	Тихомиров Юрий
	Санкт-Петербург
	2009 - 2010

	версия модуля: 230310
*/

if(!$exe)
	{





    if(isset($_POST['commentsubmit']))
	    {
	    setcookie('user_id', md5(rand(0, 10000000)), (time() + 86400), "/");
	    }
    if(!isset($settings['default_comment_status'])) $settings['default_comment_status'] = 1;
	$message_id_str = trim($_GET['cat'][1]);
    $MessageDisabled = false;
    if(strstr($message_id_str, '-'))
	    {
        $message_id = explode('-', $message_id_str);
        $message_id = $message_id[0];
	    }
	if(is_numeric($message_id))
		{

	    $dop_sql = "WHERE id='".$message_id."'  LIMIT 0, 1";
	    include(COREPATH.'messages.php');
	    $message = $messages[0];

	    if($message['id'] != "")
		    {
		    if($message['status'] == 0)
			    {
		 	    $title_normal[1] = array('link' => $settings['patch'].MESSAGES.'/'.$message['link'], 'name' => $locale[113]);
    			header("HTTP/1.1 404 Not Found");
    			header("Status: 404 Not Found");			    
                }
		    elseif($message['status'] == 2)
			    {
                $MessageDisabled = dbarray(dbquery("SELECT * FROM ".PREF."db_disabled WHERE message='".$message['id']."'"));
                if($MessageDisabled){
                    $title_normal[1] = array('link' => $settings['path'].MESSAGES.'/'.$message['link'], 'name' => $locale[1265]);
                }else{
    		 	    $title_normal[1] = array('link' => $settings['path'].MESSAGES.'/'.$message['link'], 'name' => $locale[114]);
        			header("HTTP/1.1 404 Not Found");
        			header("Status: 404 Not Found");
                }
			    
                }
			elseif($message['status'] == 1)
				{
			    $title_normal[1] = array('link' => $settings['patch'].MESSAGES.'/'.$message['link'], 'name' => $message['title']);
			    if(!$is_bot)
				    {
				    dbquery("UPDATE ".PREF."db SET counter = counter+1 WHERE id=".$message['id']);
					}
                $check_str = $message['id'].'-'.cpu(stripslashes($message['title'])).'.html';
                if($check_str != $message_id_str || count($_GET['cat']) != 2)
    				{
				    redirect301($path.'messages/'.$check_str);
                    exit();
    				}
                if(isset($second_region['id']) && count($_GET['region']) > 0){
                    if($second_region['id'] != $message['region']){
                        $start_uri = PATH.implode('/', $second_region['uri']);
                        if(substr($_SERVER['REQUEST_URI'], 0, strlen($start_uri)) == $start_uri){
                            redirect301($path.'messages/'.$check_str);
                            exit();
                        }
                    }
                }
                $smarty->assign('message', $message);
				}
			}
		else
			{
			 header("Location: ".$settings['patch']."404/");
			exit();
			}
		}
	else
		{
	    header("Location: ".$settings['patch']."404/");
		}

	if(isset($_POST['commentsubmit']) && $settings['comment_on'] == 1)
		{
		$err = array();
		if($settings['captcha'] == 1)
			{
			if(!captcha($settings, 'check'))
				{
				$err[] = $locale[46];
				}
			}
		if($settings['comment_unreg'] == "" && !$settings['user'])
			{
		    $err[] = $locale[788];
			}
		if($_POST['comtext'] == "")
			{
		    $err[] = $locale[789];
			}
		else
			{
		    if(strlen($_POST['comtext']) > 300)
			    {
			    $err[] = $locale[789];
			    }
			if(!$settings['user'])
				{
			    if(strlen($_POST['comusername']) > 100 || strlen($_POST['comusername']) < 3)
				    {
				    $err[] = $locale[833];
				    }
				if(!email_check($_POST['comuseremail']))
				    {
				    $err[] = $locale[37];
				    }
				}
			}

		$message['comment_err'] = $err;

        $echocomform = false;

		if(count($err) == 0)
			{
			$comusername  = "";
			$comuseremail = "";
			if(!$settings['user']['id'])
				{
			    $comusername = $_POST['comusername'];
			    $comuseremail = $_POST['comuseremail'];
				}
                
		    dbquery("INSERT INTO ".PREF."comments SET date='".$settings['time']."', message_id='".$message_id."', user_id='".$settings['user']['id']."', user_name = '".$comusername."', user_email = '".$comuseremail."', text='".$_POST['comtext']."'");
			//$message['comment_success'] = ($settings['default_comment_status'] == 1) ? $locale[] : $locale[];
            }
		else
			{
		    $echocomform = true;
			}
		$message['comments_err'] = $err;
		}
	}
else
	{
    $comments = array();
    $res = dbquery("SELECT * FROM ".PREF."comments WHERE message_id=".$message_id." ORDER by date");
    $i = 0;
    while($dat = dbarray($res))
	    {
        $dat['text'] = stripslashes(nl2br($dat['text']));
	    $comments[$i] = $dat;
        $comeditable = false;
        
	    if($dat['user_name'] == "")
		    {
	 	    $userinfo = dbarray(dbquery("SELECT id, name FROM ".PREF."users WHERE status != 0 AND id=".$dat['user_id']));
		    //if($settings['user']['id'] == $dat['user_id'] && $dat['user_id'] != 0 ){$comeditable = true;}
            }
        else
	        {
            $userinfo = false;
	        }
      //  if($settings)
 		if($settings['editable'])
                {
                $comeditable = true;
                }
        $comments[$i]['editable'] = $comeditable;
	    $comments[$i]['userinfo'] = $userinfo;
        $i++;
	    }

    $message['comments'] = $comments;
    $message['comments_count'] = count($comments);
    $message['comments_count_text'] = $locale[2]." ".om_number($message['comments_count'], array($locale[785], $locale[786], $locale[787])).'.';


    $simmessages = array();
    $word_counter = new Counter();
    $keywords = $word_counter->get_keywords($message['title'].' '.$message['title'].' '.$message['text'], $settings['deleted_keywords']);

	if($keywords != ""){
    $keywords = explode(', ', trim($keywords));
	}else{
	$keywords = array();
	}
    
    if(count($keywords) > 0)
        {
            
        array_splice($keywords, 3); 
        $keywords = implode(' ', $keywords);
		$keywords = "(MATCH (`title`, `text`) AGAINST ('".$keywords."'))";
        $childres = array();
        $childres = get_childres($message['cat'], $cats_id);
        $childres[] = $message['cat'];
        $cat_cond = make_sql('cat', $childres);     
        
        $sql = "SELECT id FROM ".PREF."db WHERE 
        (".$keywords.") AND 
        (".$cat_cond.")  ".$region_sql." AND 
        status=1 AND id != ".$message['id']." LIMIT 0,5";
        $res = dbquery($sql);
        while($dat = dbarray($res))
            {
            $simmessages[] = $dat['id'];
            }
            
        if(count($simmessages) < 5)
            {
            $sql = "SELECT id FROM ".PREF."db WHERE 
            (".$keywords.") AND 
            status=1 AND id != ".$message['id']."  LIMIT 0,5";           
            
            $res = dbquery($sql);
            while($dat = dbarray($res))
                {
                $simmessages[] = $dat['id'];
                }
            }
        }
    if(count($simmessages) > 0){
        $dop_sql = " WHERE id IN (".implode(",", $simmessages).")";
        include(COREPATH."messages.php");
        $simmessages = $messages;
    }   



    if(count($simmessages) == 0)
        {
        $simmessages = false;
        }   
    
    if(!isset($echocomform)){$echocomform = false;}
    
    $message['simmessages'] = $simmessages; 
    
    
    //upd1701080 поиск объявлений магазина
    $shopmessages = false;
    if(isset($message['shop'])){
        $count_shopmessages = 5;
        $shopmessages = array();
        //в теущей рубрике и регионе
        $dop_sql = " WHERE 
            user_id = ".$message['user_array']['id']." AND 
            cat = '".$message['cat']."' AND
            region = '".$message['region']."' AND
            id != ".$message['id']." AND
            status = 1
            LIMIT 0, 5
            ";
        include(COREPATH."messages.php");
        $shopmessages = $messages;
        $shopmessages_id = array();
        $shopmessages_id[] = $message['id'];
        if(count($shopmessages) > 0){
            foreach($shopmessages as $m){
                $shopmessages_id[] = $m['id'];
            }
        }
        //в других регионах и рубриках
        if(count($shopmessages) < $count_shopmessages){
            $limit = count($shopmessages);
            $dop_sql = " WHERE 
                user_id = ".$message['user_array']['id']." AND 
                id NOT IN (".implode(',', $shopmessages_id).") AND
                status = 1
                LIMIT 0, ".($count_shopmessages - count($shopmessages))."
                ";  
            include(COREPATH."messages.php");
            $shopmessages = array_merge($shopmessages, $messages);
        }
    }
    $message['shopmessages'] = $shopmessages;

	
    
	$smarty->assign('MessageDisabled', $MessageDisabled);
	$smarty->assign('services', $services);
	$smarty->assign('echocomform', $echocomform);
    if($message['status'] == 1 || $settings['editable'] || ($message['status'] == 2 && $MessageDisabled))
	    {
        $smarty->assign('message', $message);
       	$smarty->display('message.html');
	    }
	}
    
?>