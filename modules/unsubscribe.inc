<?php // 244
/*
	Скрипт доски объявлений
	Elite-Board 2
	Тихомиров Юрий
	Санкт-Петербург
	2009 - 2010

	версия модуля: 260110
*/

if(!$exe){
	$settings['title'] = $locale[1059];
	$title_normal[1] = array('link' => $settings['patch'].$cat.'/', 'name' => $locale[1059]);
}
if($exe){
    $err = true;
    if(isset($_GET['email']) && isset($_GET['key'])){
        $email = base64_decode($_GET['email']);
        if(email_check($email) && md5($email.$settings['rand']) == $_GET['key']){
            dbquery("DELETE FROM ".PREF."mailing_queue WHERE email='".$email."'");
            if(!dbarray(dbquery("SELECT * FROM ".PREF."mailing_unsubscribe WHERE email='".$email."'"))){
                dbquery("INSERT INTO  ".PREF."mailing_unsubscribe SET email='".$email."'");
                echo "
                    <div class='ok alert alert-success'>".$locale[1061]."</div>
                ";
                
            }
        $err = false;
        }
    }
    if($err){
        echo "
            <div class='error alert alert-error'>".$locale[1060]."</div>
        ";
    }

}
?>