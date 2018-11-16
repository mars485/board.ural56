<?php  //157
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
    $user = "";
	$email = false;
	if(is_numeric($_GET['userid']) && $_GET['userid'] != 0)
		{
	    $email = dbarray(dbquery("SELECT email, name FROM ".PREF."users WHERE id=".$_GET['userid']));
	    $user = $email['name'];
        $email = $email['email'];
		}
    if(!isset($_GET['messageid'])) $_GET['messageid'] = "";
	if(is_numeric($_GET['messageid']) && $_GET['messageid'] != 0)
		{
		if(!$email)
			{
		    $email = dbarray(dbquery("SELECT email, user_id, user FROM ".PREF."db WHERE id=".$_GET['messageid']));
		    $user = $email['user'];
            $email = $email['email'];
		    }
	    $dop_sql = "WHERE id='".$_GET['messageid']."' LIMIT 0, 1";
	    include(COREPATH.'messages.php');
	    $message = $messages[0];
		}       
    if(!isset($_GET['comment_id'])) $_GET['comment_id'] = "";

	if(is_numeric($_GET['comment_id']))
		{
		if(!$email)
			{
		    $dat = dbarray(dbquery("SELECT user_email, user_id FROM ".PREF."comments WHERE id=".$_GET['comment_id']));
		    $email = $dat['user_email'];
            if($email == "")
                {
                $email = dbqrray(dbquery("SELECT email, name FROM ".PREF."users WHERE id=".$dat['user_id']));
                $user = $email['name'];
                $email = $email['email'];
                }
		    }
	    $dop_sql = "WHERE id='".$_GET['messageid']."' LIMIT 0, 1";
	    include(COREPATH.'messages.php');
	    $message = $messages[0];
		}       
    if($email)
	    {
        if(!isset($_GET['tpl'])) $_GET['tpl'] = "";
        if(!isset($board_msg[$_GET['tpl']])) $board_msg[$_GET['tpl']] = "";
        if($_GET['tpl'] != "" && $board_msg[$_GET['tpl']] != "")
            {
            $tpl = $_GET['tpl'];
            }
        else
            {
            $tpl = 'reply';
            }
	    $err = array();
	    $send = false;
	    if(isset($_POST['submit']))
		    {
	        if($_POST['name'] == ""){$err[] = $locale[151];}
	        if($_POST['email'] == ""){$err[] = $locale[152];}
	        elseif(!preg_match("/[0-9a-z_]+@[0-9a-z_^\.]/i", $_POST['email']))
				{
				$err[] = $locale[37];
				}
	        if($_POST['message'] == ""){$err[] = $locale[153];}
			if($settings['captcha'] == 1)
				{
				if(!captcha($settings, 'check'))
					{
					$err[] = $locale[46];
					}
				}


			if(count($err) == 0)
				{
			    $vars['message_title'] = stripslashes($message['title']);
			    $vars['message_link'] = 'http://'.$settings['site_address'].$settings['patch'].MESSAGES.'/'.$message['id'].'-'.cpu($message['title'], $locale['symb']).'.html';
			    $vars['name'] = $_POST['name'];
			    $vars['email'] = $_POST['email'];
			    $vars['title'] = TITLE;
                if(is_array($user)){
                    $user = $user['name'];
                }
			    $vars['user'] = $user;
			    $vars['message'] = $_POST['message'];
			    send_mail($email, TITLE.' / '.$locale[154], stripslashes($board_msg[$tpl]), $vars, $_POST['email']);
			    $send = true;
				}
		    }
		$smarty->assign('send', $send);
		$smarty->assign('err', $err);

		$smarty->display('popup_sendmail.html');
	    }
	}
exit();
?>