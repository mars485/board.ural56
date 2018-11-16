<?php
function getemailfromphone2($login)
	{
	global $settings;
	$return = $login;
    if($settings['sms'] == 1)
	    {
		$n = "";
		for($i = 0; $i < strlen($login); $i++)
			{
			if(is_numeric($login{$i}))
				{
			    $n .= $login{$i};
				}
			}
		if($n != "")
			{
			$res = dbquery("SELECT email FROM ".PREF."users WHERE phone='".$n."'  AND status != 0");
			$dat = dbarray($res);
			if($dat['email'] != "")
				{
			    $return = $dat['email'];
				}
		    }
	    }
	return $return;
	}
$pass = md5($_POST['password']);
$res = dbquery("SELECT * FROM ".PREF."users WHERE email = '".getemailfromphone2($_POST['login'])."' AND pass = '".$pass."'  AND status != 0");
$data = dbarray($res);
if(is_numeric($data['id']))
	{
    if($data['email_status'] == 1){
    	setcookie('userid', $data['id'], ($settings['time'] + $settings['cookie_time']), "/");
    	setcookie('pass', $pass, ($settings['time'] + $settings['cookie_time']), "/");
    
        $settings['user'] = $data;
        $user_counter = dbrows(dbquery("SELECT * FROM ".PREF."db WHERE user_id='".$data['id']."' AND status=1"));
        $smarty->assign('user_counter', om_number($user_counter, array($locale[3], $locale[4], $locale[5])));
    
    	$smarty->assign('settings', $settings);
    	$smarty->display('block_user.html');
    }else{
        echo '
        <script>
        document.location.href="'.$settings['patch'].'email_confirmation/?show_notice&email='.base64_encode($data['email']).'";
        </script>';
    }


	}
elseif($settings['cms'] == 1)
		{
        $pass = cms_get_hash($_POST['password']);
        $res = dbquery("SELECT * FROM ".PREF."users WHERE email = '".getemailfromphone2($_POST['login'])."' AND cms_hash = '".$pass."' AND email_status = 1 AND status != 0");
        $data = dbarray($res);     
        if($data){
            if(!isset($_SESSION)){
                session_start();
            }
            $_SESSION['userid'] = $data['cms_id'];
            $_SESSION['password'] = $data['cms_hash'];
        }
        $settings['user'] = $data;
        $user_counter = dbrows(dbquery("SELECT * FROM ".PREF."db WHERE user_id='".$data['id']."' AND status=1"));
        $smarty->assign('user_counter', om_number($user_counter, array($locale[3], $locale[4], $locale[5])));
    
    	$smarty->assign('settings', $settings);
    	$smarty->display('block_user.html');
        }
else
	{
	echo 'error';
	}

exit();

?>