<?php
$new_board_msg = array();
$new_board_msg['email_update']['comments'] = '1102';
$new_board_msg['email_update']['text'] = '
<p>Здравствуйте, %user%!</p>

<p>Истек срок действия услуги %service% для объявления %message_title% на сайте %title%:</p>
<p>Для повторного заказа услуги пройдите по ссылке:</p>

<p>%link%</p>

<p>--</p>

<p>%unsubscribe%</p>
';
$new_board_msg['del_mess_all']['comments'] = '1090';
$new_board_msg['del_mess_all']['text'] = '
<p>Здравствуйте, %user%!</p>

<p>Истекает срок публикации Ваших объявлений на сайте %title%:</p>
%messages%
<p>Для продления срока публикации объявлений пройдите по ссылке:</p>

<p>%link%</p>

<p>--</p>

<p>%unsubscribe%</p>
';

foreach($new_board_msg as $type=>$msg){
    if(!isset($board_msg[$type])){
        $dat = dbarray(dbquery("SELECT id FROM ".PREF."msg WHERE type='".$type."'"));
        if(!$dat){
            $sql = "INSERT INTO ".PREF."msg SET 
                text='".addslashes($msg['text'])."', 
                comments='".addslashes($msg['comments'])."',  
                type='".$type."'";
            dbquery($sql);
        }
    }
}



?>