<?php

$settings = array();
$res = dbquery("SELECT * FROM ".PREF."settings");
while($dat = dbarray($res))
	{
    $settings[$dat['k']] = stripslashes($dat['v']);
	}
$board_msg = array();
$result = dbquery("SELECT type, text FROM ".PREF."msg");
while($data = dbarray($result)){
	$board_msg[$data['type']] = $data['text'];
}
include('../admin/conf.php');

$fullpath = realpath('../').'/';
define('FULLPATH', $fullpath);

$files = get_file_list('inc/commands23/');
sort($files);
if(count($files) > 0){
    foreach($files as $f){
        $out = "";
        ob_start();
        include('inc/commands23/'.$f);
        $out = ob_get_contents();
        ob_end_clean();
        if($out != ""){
            echo "<div class='choice'>".$out."</div>";
        }
        $cn++;
    }
}

$files = get_file_list(FULLPATH.'commands/');

if(count($files) > 0){
    foreach($files as $f){
        if(substr($f, 0, 3) == 'upd'){
            $f = FULLPATH.'commands/'.$f;
            if(substr($_SERVER['HTTP_HOST'], 0, 4) != 'dev.')
            unlink($f);
        }
    }
}
$cn++;

$isset_search_block = dbarray(dbquery("SELECT * FROM `".PREF."blocks_db` WHERE `html` LIKE '%%block_search%%'"));
if(!$isset_search_block){
    dbquery("
        INSERT INTO `".PREF."blocks_db` 
         SET html = '%block_search%', name = '".$locale[61]."'
    ");      
    $insert_id = dbarray(dbquery("SELECT LAST_INSERT_ID() as id"));
    $insert_id = $insert_id['id'];
    dbquery("
        INSERT INTO `".PREF."blocks_places` 
         SET place = 'l', `status`=1, `from`=0, `to`=0, `link`=".$insert_id.", `reg`=1, `cat`=0, `region`=0, `sort`=2
    ");
    $cn++;
}

if(file_exists(FULLPATH.'version.ver')){
    @unlink(FULLPATH.'version.ver');
    $cn++;
}


$add_settings = array();
$add_settings['approve_text'] = 'НЕ ПРОВЕРЕНО! Это объявление ещё не проверено модератором сайта. Администрация не несет ответственности за содержание, достоверность и точность материалов, опубликованных пользователями.';
$add_settings['closed_info'] = 'Сайт закрыт на обслуживание. Приносим извинения за временные неудобства!';
$add_settings['license_text'] = 'Все материалы, добавляемые на сайт, становятся собственностью сайта и администрация сайта имеет право использовать все тексты и медиа материалы в своих нуждах. Вся ответственность за содержание объявлений в полном объёме возлагается на авторов объявлений. Администрация сайта оставляет за собой право удалять и редактировать объявление без уведомления автора объявления и без объяснения причин.
Вы согласны получать смс и/или email сообщения от администрации сайта. 
Вы подтверждаете свое согласие на обработку персональных данных: сбор, систематизацию, накопление, хранение, уточнение (обновление, изменение), использование, передачу, блокирование, обезличивание, уничтожение. Срок действия Вашего согласия является неограниченным.

К публикации запрещается:
- информация, нарушающая законы Российской Федерации;
- одинаковые объявления;
- объявления содержащие заведомо ложную информацию.';
foreach($add_settings as $k=>$v){
    $set = dbarray(dbquery("SELECT * FROM ".PREF."settings WHERE `k`='".$k."'"));
    if($set){
        if(trim($set['v']) == ""){
            dbquery("UPDATE ".PREF."settings SET `v`='".addslashes($v)."' WHERE id=".$set['id']);
        }
    }else{
        dbquery("INSERT INTO ".PREF."settings SET `v`='".addslashes($v)."', `k`='".$k."'");
    }
    
}
$cn++;

?>