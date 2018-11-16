<?php // 244
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
	$settings['title'] = $locale[244];
	$title_normal[1] = array('link' => $settings['patch'].$cat.'/', 'name' => $settings['title']);

 	$notepad_notes = explode(',', $_COOKIE['notes']);
 	foreach($notepad_notes as $k=>$v){
	 	if(!is_numeric($v))
		 	unset($notepad_notes[$k]);
 	}
    $ids = array();
    if(count($notepad_notes) > 0){
        $res = dbquery("SELECT id FROM ".PREF."db WHERE id IN (".implode(',', $notepad_notes).") AND status=1");
        while($dat = dbarray($res)){
            $ids[] = $dat['id'];
        }
    }
    $notepad_notes = $ids;
    setcookie('notes', implode(',', $notepad_notes), time() + $settings['cookie_time'], '/');
	}
if($exe)
	{

	if(count($notepad_notes) > 0)
		{
		if(!isset($_GET['page'])) $_GET['page'] = "";
		$cond = 'id IN ('.implode(',', $notepad_notes).')';
		$dop_sql = 'WHERE ('.$cond.') AND status=1 ORDER by date_add';
		$page = $_GET['page'];
		$limit = "";
		$count_messages = dbrows(dbquery("SELECT id FROM ".PREF."db ".$dop_sql));
		$page_count = ceil($count_messages/$settings['onpage']);
		if($page > $page_count)
			{
			$page = $page_count;
			}
		if($page <= 0 )
			{
			$page = 1;
			}
		$offset = ( $page - 1 ) * $settings['onpage'];
		$limit = " LIMIT ".$offset.", ".$settings['onpage'];
		if($page_count > 0)
			{
			$smarty->assign('pages', $page_count);
			}

		$dop_sql .= $limit;

		include(COREPATH."messages.php");

        if(!isset($get[1])) $get[1] = "";

		$smarty->assign('get_str', '?'.$get[1]);
		$smarty->assign('messages', $messages);
		$smarty->assign('messages_counter', $locale[2].' '.om_number($count_messages, array($locale[3], $locale[4], $locale[5])));
		$smarty->display('list.html');
		}
	}
?>