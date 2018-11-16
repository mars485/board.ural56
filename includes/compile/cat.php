<?php
/*
	Скрипт доски объявлений
	Elite-Board 2
	Тихомиров Юрий
	Санкт-Петербург
	2009 - 2010

	версия модуля: 070310
*/

if(!$exe)
	{
    if(substr($_SERVER['REQUEST_URI'], -1) != '/'){
       $ext = get_ext($_SERVER['REQUEST_URI']);
       if(strpos($_SERVER['REQUEST_URI'], '?') === false && !isset($_GET['page'])){
        redirect301($_SERVER['REQUEST_URI'].'/');
       }
    }
      
    $main_region = isset($second_region_id) ? $second_region_id : 0;

    $GLOBALS['main_counter'] = array();
    $main_counter_cat = array();


    
	$GLOBALS['main_counter'] = cache_get('mcs'.$main_region.'.'.$main_id);

    $cat = $main_id;
	//$mcounter = false;			
	if(!$GLOBALS['main_counter']){
		$search_cat = array();
		$GLOBALS['main_counter'] = array();
		foreach($full_list['cat'] as $v){
			if($v['parent'] == $cat){
				$GLOBALS['main_counter'][$v['id']] = 0;
				$search_cat[] = $v['id'];
			}
		}
        
        if(count($search_cat) > 0){
    		foreach($full_list['cat'] as $v){
    			if(in_array($v['parent'], $search_cat)){
    				$GLOBALS['main_counter'][$v['id']] = 0;
    				$search_cat[] = $v['id'];
    			}
    		}
        }
        
        $search_cat[] = $cat;
		$GLOBALS['main_counter'][$cat] = 0;
		
		if($main_region == 0){
			$sql = '
			SELECT COUNT(c.message) as count, c.cat FROM '.PREF.'ind_cat c
			WHERE c.cat IN('.implode(',',$search_cat).')
			GROUP by c.cat
			';
		}else{
			$sql = '
			SELECT COUNT(c.message) as count, c.cat FROM '.PREF.'ind_cat c 
			  LEFT JOIN '.PREF.'ind_region r ON (c.message = r.message)
			  WHERE  r.cat = '.$main_region.' AND c.cat IN('.implode(',',$search_cat).')
			  GROUP by c.cat
			';
		}
		$res = dbquery($sql);
		while($dat = dbarray($res)){
			$GLOBALS['main_counter'][$dat['cat']] = $dat['count'];
		}
		cache_set('mcs'.$main_region.'.'.$cat, $GLOBALS['main_counter'], 60);
	}
            
    
    $tmp = array();
    $uri = $settings['path'];
    $tmp[] = array('link' => $uri, 'name' => $settings['title'], 'count' => $counter['messages_on']);
    foreach($main['ids'] as $k=>$v){
        $uri .= $main['uri'][$k].'/';
        $tmp[] = array('link' => $uri, 'name' => $main['name'][$k], 'count' => $main_counter_cat[$main['ids'][$k]], 'cat_id' => $main['ids'][$k]);
        
    }
    $title_normal = $tmp;
    
    // текст запроса по умолчанию
    
    $cat_join = '';
    $cat_where = '';
    if(isset($main_id)){
        $isset_parent = false;
        foreach($full_list['cat'] as $tmp){
            if($tmp['parent'] == $main_id){
                $isset_parent = true;
                break;
            }
        }
        if($isset_parent){
            $cat_join = ' LEFT JOIN '.PREF.'ind_cat par_cat ON (db.id=par_cat.message)';
            $cat_where = ' AND par_cat.cat='.$main_id;
        }else{
            $cat_where = ' AND db.cat='.$main_id;
        }

    }
    
    
    $region_join = '';
    $region_where = '';
    if(isset($second_region_id)){
        $isset_parent = false;
        foreach($full_list['region'] as $tmp){
            if($tmp['parent'] == $second_region_id){
                $isset_parent = true;
                break;
            }
        }
        if($isset_parent){
            $region_join = ' LEFT JOIN '.PREF.'ind_region par_region ON (db.id=par_region.message)';
            $region_where = ' AND par_region.cat='.$second_region_id;
        }else{
            $region_where = ' AND db.region='.$second_region_id;
        }

    }
        
    $raised_order = "db.raised desc, db.date_raised desc, "; // в рубриках всегда отображаем сверху поднятые объявления
    
    $sql_select  = "db.* FROM ".PREF."db db";
    $sql_join  = $cat_join.$region_join;
    $sql_where = "db.status=1 ".$cat_where.$region_where;

    $sql_order = $raised_order." db.date_add desc ";
    $sql_limit = "LIMIT 0, ".$settings['onpage'];
    
    //делаем отбор, считаем и сортируем
    include(COREPATH.'dbfilter.php');

    $count_messages = $list_shop_count[$settings['filter']['shop']];

    if(!isset($_GET['page'])) $_GET['page'] = "";
    
    $page = $_GET['page'];
	$page_count = ceil($count_messages/$settings['onpage']);
	if($page > $page_count)		$page = $page_count;
	if($page <= 0 ) $page = 1;
	$offset = ( $page - 1 ) * $settings['onpage'];
	$sql_limit = ' LIMIT '.$offset.', '.$settings['onpage'];
	if($page_count > 0) $smarty->assign('pages', $page_count);

    // собираем запрос с заданными уловиями
    $custom_sql  = "SELECT ".$sql_select."\n";
    $custom_sql .= $sql_join."\n";
    $custom_sql .= "WHERE\n";
    $custom_sql .= $sql_where."\n";
    $custom_sql .= "ORDER by ".$sql_order."\n";
    $custom_sql .= $sql_limit;


    include(COREPATH.'messages.php');    
    
	$smarty->assign('count_cat_messages', $count_messages);
	$smarty->assign('messages', $messages);
	$smarty->assign('messages_counter', $locale[2].' '.om_number($count_messages, array($locale[3], $locale[4], $locale[5])));

	}
else
	{
	   
    echo stripslashes($cats_id[$main_id]['description']);

	$smarty->assign('tree', $tree);

	//$smarty->assign('counter', $main_counter_cat);
    if(!isset($settings['cat_type'])){
        $settings['cat_type'] = 1;
    }

	

	$smarty->display('list.html');
    $smarty->display('tree'.$settings['cat_type'].'.html');
	}
?>