<?php
$check['err'] = array();

if (strlen($_POST['name']) < 3) {
    $check['err'][] = $locale[35];
}
if (strlen($_POST['password']) < 6) {
    $check['err'][] = $locale[36];
} else {
    if ($_POST['password'] != $_POST['password1']) {
        $check['err'][] = $locale[38];
    }
}
if (strlen($_POST['email']) != "") {
    if (!email_check($_POST['email'])) {
        $check['err'][] = $locale[37];
    } else {
        if (dbrows(dbquery("SELECT id FROM " . PREF . "users WHERE email = '" . $_POST['email'] .
            "'")) > 0) {
            $check['err'][] = $locale[39];
        }
    }
} else {
    $check['err'][] = $locale[37];
}
/*if($settings['captcha'] == 1)
{
if(!captcha($settings, 'check'))
{
$check['err'][] = $locale[46];
}
}
*/

$emailstatus = 0;
if ($settings['sms'] == 1) {
    $emailstatus = 1;
}

if (!$check['err']) {
    if ($settings['default_user_balance'] == "")
        $settings['default_user_balance'] = 0;
    $pass = md5($_POST['password']);
    dbquery("INSERT INTO " . PREF . "users SET email = '" . $_POST['email'] .
        "', name='" . $_POST['name'] . "', pass='" . $pass . "', status='" . $settings['default_user_status'] .
        "', balance=" . $settings['default_user_balance'] . ", email_status=" . $emailstatus .
        ", date=" . $settings['time']);

    $res = dbquery("SELECT id FROM " . PREF . "users WHERE email = '" . $_POST['email'] . "'");
    $data = dbarray($res);
    if (is_numeric($data['id'])) {
        $link = $settings['http']."://" . $settings['site_address'] . $settings['path'] .
            "users/email_confirmation/?user_id=" . $data['id'] . "&key=" . md5($data['id'] .
            $pass . $settings['rand']);
        $vars['title'] = TITLE;
        $vars['user'] = $_POST['name'];
        $vars['link'] = "<a href='" . $link . "'>" . $link . "</a>";

        if ($emailstatus == 0) {
            if (!send_mail($_POST['email'], TITLE . ' / ' . $locale[49], $board_msg['reg_check'],
                $vars)) {
                $check['err'][] = $locale[40];
            }
        } else {
            cms_syncusers();
        }

    } else {
        $check['err'][] = $locale[40];
    }
}

if (count($check['err']) > 0) {
    echo "
	<div class='error_block' style='text-align:left;'>

	";
    foreach ($check['err'] as $v) {
        echo "<p>" . $v . "</p>";
    }
    echo "

	</div>
	";
} else {
    if ($emailstatus == 1) {
        setcookie('userid', $data['id'], ($settings['time'] + $settings['cookie_time']),
            "/");
        setcookie('pass', $pass, ($settings['time'] + $settings['cookie_time']), "/");
        echo '<script>window.location.reload();</script>';
    } else {
        echo 'ok';
    }
}
exit();
?>