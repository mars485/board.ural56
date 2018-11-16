<?php
if(preg_match("/[0-9a-z_]+@[0-9a-z_^\.]/i", $_POST['email']))
	{
   	$res = dbquery("SELECT id, name, pass, email FROM ".PREF."users WHERE email = '".$_POST['email']."'");
    $data = dbarray($res);
    if(is_numeric($data['id']))
	    {
		$link = "http://".$settings['site_address'].$settings['patch']."users/password_recovery/?user_id=".$data['id']."&key=".md5($data['id'].$data['pass'].$settings['rand']);
		$vars['title'] = TITLE;
		$vars['user'] = $data['name'];
		$vars['link'] = "<a href='".$link."'>".$link."</a>";

		if(send_mail($data['email'], TITLE.' / '.$locale[52], $board_msg['password_recovery'], $vars))
			{
			echo "\n<center><div class='ok' style='width:90%;'>".$locale[53]."</div></center>\n";
			}
		else
			{
		    echo "\n<center><div class='error_block'>".$locale[40]."</div></center>\n";
			}
	    }
	else
		{
		echo "\n<center><div class='error_block'>".$locale[56]."</div></center>\n";
		}
	}
else
	{
	echo "\n<center><div class='error_block'>".$locale[37]."</div></center>\n";

	}
exit();
?>