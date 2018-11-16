<?php

/////////////рубрики доски объявлений, таблица cat
//id
//uri		идентификатор mod_rewrite
//name		название
//parent	родитель, ссылка на id
//sort		индекс для сортировки

if(!$exe)
	{


	$title = array(0 => array('name' => TITLE, 'link' => $settings['patch']));

    $main_region = isset($second_region_id) ? $second_region_id : 0;
	


    $GLOBALS['main_counter'] = cache_get('mcs'.$main_region.'.0');
    //$GLOBALS['main_counter'] = false;
    if(!$GLOBALS['main_counter']){
        $GLOBALS['main_counter'] = array();
        $search_cat = array();
        foreach($full_tree['cat']['cat'] as $v){
            $GLOBALS['main_counter'][$v['id']] = 0;
            if(isset($v['cat'])){
                foreach($v['cat'] as $vv){
                    $GLOBALS['main_counter'][$vv['id']] = 0;
                    $search_cat[] = $vv['id'];
                }
            }
            $search_cat[] = $v['id'];
        }
        if($main_region == 0){
            $sql = '
              SELECT COUNT(c.message) as count, c.cat as cat FROM '.PREF.'ind_cat c 
              WHERE cat IN ('.implode(',', $search_cat).')
              GROUP by cat
            ';
        }else{
    		$sql = '
              SELECT COUNT(c.message) as count, c.cat FROM '.PREF.'ind_cat c 
              LEFT JOIN '.PREF.'ind_region r ON (c.message = r.message)
              WHERE  r.cat = '.$main_region.' AND c.cat IN ('.implode(',', $search_cat).')
              GROUP by c.cat
            ';
        }

        $res = dbquery($sql);
        while($dat = dbarray($res)){
            $GLOBALS['main_counter'][$dat['cat']] = $dat['count'];
        }
        cache_set('mcs'.$main_region.'.0', $GLOBALS['main_counter'], 60);
    }

	$main_counter_cat = array();
    
	}
else
	{

        $tree = $full_tree['cat']['cat'];
        $smarty->assign('tree', $tree);

        $smarty->display('tree'.$settings['ind_type'].'.html');

    if($settings['messages_on_ind'] > 0)
	    {

        if($settings['raised_on_ind'] == 1)
	        {
            $raised_order = "raised desc, date_raised desc, ";
	        }
        else
	        {
            $raised_order = "";
	        }

        // текст запроса по умолчанию
        $cat_join = '';
        $cat_where = '';
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
    
        
        
        $sql_select  = "db.* FROM ".PREF."db db";
        $sql_join  = $region_join;
        $sql_where = "db.status=1 ".$region_where;
        $sql_order = $raised_order." db.date_add desc ";
        $sql_limit = "LIMIT 0, ".$settings['messages_on_ind'];

        //делаем отбор, считаем и сортируем
        include(COREPATH.'dbfilter.php');

        // собираем запрос с заданными уловиями
        $custom_sql  = "SELECT ".$sql_select."\n";
        $custom_sql .= $sql_join."\n";
        $custom_sql .= "WHERE\n";
        $custom_sql .= $sql_where."\n";
        $custom_sql .= "ORDER by ".$sql_order."\n";
        $custom_sql .= $sql_limit;

	    include(COREPATH."messages.php");

		$smarty->assign('messages', $messages);
		$smarty->assign('messages_counter', $locale[116]);
		$smarty->display('list.html');
	    }
	}

?>