<?php
$users_onpage = 20;


if(!$exe)
    {
    $title_normal[1] = array('link' => $settings['path'].'userinfo/', 'name' => $locale[304]);
    if(is_numeric($_GET['cat'][1]))
        {
        $id = $_GET['cat'][1];
        $res = dbquery("SELECT * FROM ".PREF."users WHERE id=".$id." AND status >= 1");
        $userinfo = dbarray($res);

        if($userinfo['id'] != '')
            {
            
            $title_normal[2] = array('link' => $settings['path'].$_GET['cat'][0].'/'.$id.'/', 'name' => $userinfo['name']);            
            }
        else
            {
            header("Location: ".$settings['path']."404/");  
            }
        }

    }
else
    {
    if(is_numeric($id))
        {
    	$dop_sql = 'WHERE user_id = '.$userinfo['id'].' AND status=1 ORDER by date_add desc';
        if(!isset($_GET['page'])) $_GET['page'] = "";
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
       
        $userinfo['count_messages'] = $count_messages;    
        $smarty->assign('user', $userinfo);
        $smarty->display('userinfo.html');
        }
    else
        {
        $sql = "SELECT name, id FROM ".PREF."users WHERE status > 0 ORDER by name";
    	$page = $_GET['page'];
    	$limit = "";
        $count_messages = dbrows(dbquery($sql));
    	$page_count = ceil($count_messages/$users_onpage);
    	if($page > $page_count)
    		{
    		$page = $page_count;
    		}
    	if($page <= 0 )
    		{
    		$page = 1;
    		}
    	$offset = ( $page - 1 ) * $users_onpage;
    	$limit = " LIMIT ".$offset.", ".$users_onpage;
    	if($page_count > 0)
    		{
    		$smarty->assign('pages', $page_count);
    		}
    
    	$sql .= $limit;
       
                
        $allusers = array();
        $res = dbquery($sql);
        while($dat = dbarray($res))
            {
            $dat['messages'] = dbrows(dbquery("SELECT id FROM ".PREF."db WHERE user_id=".$dat['id']." AND status=1"));
            $allusers[] = $dat;
            }
            
    	$smarty->assign('messages_counter', $locale[2].' '.om_number($count_messages, array($locale[769], $locale[770], $locale[771])));

        $smarty->assign('allusers', $allusers);
        $smarty->display('users_list.html');
        }
    }


	
?>