<?php

if(!$exe)
	{
	$tag = urldecode($_GET['cat'][1]);
	$tag = addslashes($tag);

    $res = dbquery("SELECT * FROM ".PREF."tags WHERE word = '".$tag."'");
    $__tag = dbarray($res);

	if($__tag['id'] != "")
		{
		$settings['title'] = $locale[696].' &laquo;'.$tag.'&raquo;';
		$title_normal[1] = array('link' => $settings['patch'].$cat.'/'.$_GET['cat'][1].'/', 'name' => $settings['title']);

        if(isset($second_region['id']) && count($_GET['region']) > 0){
            $start_uri = PATH.implode('/', $second_region['uri']);
            if(substr($_SERVER['REQUEST_URI'], 0, strlen($start_uri)) == $start_uri){
                redirect301($path.$_GET['cat'][0].'/'.$_GET['cat'][1].'/');
                exit();
            }
        }
		}
	else
		{
		header("HTTP/1.1 404 Not Found");
		header("Status: 404 Not Found");
		exit();
		}
	}
else
	{
    $dop_sql = "WHERE 
        id IN (SELECT message FROM ".PREF."db_tags WHERE tag=".$__tag['id'].")
        AND status=1
    ORDER by date_add desc";

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

	$smarty->assign('get_str', '?'.$get[1]);
	$smarty->assign('messages', $messages);
	$smarty->assign('messages_counter', $locale[2].' '.om_number($count_messages, array($locale[3], $locale[4], $locale[5])));
	$smarty->display('list.html');

	}
?>