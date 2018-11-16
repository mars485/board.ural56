<?php
            array_shift($categories_array);
            
            $shop_categories = '';
            
            $shop = stripslashes_recursive($shop);
            $cpu_name = implode('-', $arr);
            //если ошибка в адресе, перенаправляем на правильный
            if($cpu_name != cpu($shop['name'])){
                redirect301($settings['path'].$cat.'/'.$shop_id.'-'.cpu($shop['name']).'/');
                exit();
            }
            $title_normal[2] = array('link' => $settings['path'].$cat.'/'.$_GET['cat'][1].'/', 'name' => $shop['name']);


            
            //определяем текущую и дочерние рубрики
            if(count($categories_array) > 0){
                $shop_categories = array();
                $second_category = get_array_id($cats_id, $categories_array, 0, 0, true);
                //формируем хлебные крошки
                if(isset($second_category['id'])){
                    $shop_categories = get_childres($second_category['id'], $cats_id);
                    $shop_categories[] = $second_category['id'];
                    $shop_parent_cats = get_parents($second_category['id'], $cats_id);
                    if(count($shop_parent_cats) > 0){
                        $shop_parent_cats = array_reverse($shop_parent_cats);
                    }
                    $shop_parent_cats[] = $second_category['id'];
                    $l = array($shop_id.'-'.cpu($shop['name']));
                    foreach($shop_parent_cats as $v){
                        $l[] = $cats_id[$v]['uri'];
                        $title_normal[] = array('link' => $settings['path'].$cat.'/'.implode('/', $l).'/', 
                                                'name' => $cats_id[$v]['name']);
                    }
                }
                if(count($shop_categories) > 0){
                    $shop_categories = 'AND cat IN ('.implode(',', $shop_categories).')';
                }else{
                    $shop_categories = "";
                }
            }



            parse_info($shop);
             
            // общая часть запроса на объявления магазина
            $sql = " WHERE status=1 AND user_id=".$shop['user_id']." 
                        ".$shop_categories." 
                        ".$shop_regions." ";
            // запрос количества объявлений         
            $count_messages = dbarray(dbquery("SELECT COUNT(*) as count FROM ".PREF."db shop ".$sql." "));
            $count_messages = $count_messages['count'];
            $page = $_GET['page'];
            $page_count = ceil($count_messages/$shop_onpage);
            if($page > $page_count){
            	$page = $page_count;
           	}
            if($page <= 0 ){
            	$page = 1;
            }
            $offset = ($page - 1) * $shop_onpage;
            $limit = " LIMIT ".$offset.", ".$shop_onpage;
            if($page_count > 0) $smarty->assign('pages', $page_count);
	         
            $count_text = om_number($count_messages, array($locale[3], $locale[4], $locale[5]));
            $count_num = $count_messages;
            $order = " ORDER by raised desc, date_raised desc, date_add desc ";
            // запрос на список объявлений
            $custom_sql = "SELECT * FROM ".PREF."db shop ".$sql.$order.$limit."";

            include(COREPATH.'messages.php');

            $shop['messages'] = $messages;
            if($shop['map'] != ""){
                $shop['point'] = explode(',', $shop['map']);
            }
            

            $sql = "SELECT cat, COUNT(*) as count FROM ".PREF."db shop
                        WHERE status=1 AND user_id=".$shop['user_id']." 
                        ".$shop_categories."
                        ".$shop_regions."
                        GROUP by cat
                        ";

            

            list($shop_tree, $main_counter_cat) = shop_get_tree($sql);
            
            $weeks = array('',$locale[1250],$locale[1251],$locale[1252],$locale[1253],$locale[1254],$locale[1255],$locale[1256],$locale[1257]);
            unset($weeks[0]);
            $worktime = ($shop['worktime'] == "") ? array() : @unserialize(stripslashes($shop['worktime']));
            $worktime_list = array();
            $start_week = false;
            foreach($worktime as $k=>$v){
                $text = get_week_text($v);
                if(!$start_week) $start_week = $k;
                if($text != get_week_text($worktime[($k+1)])){
                    $str = $weeks[$start_week];
                    if($start_week != $k){
                        $str .= '-'.$weeks[$k];
                    }
                    $str .= ': '.$text;
                    $worktime_list[] = $str;
                    $start_week = false;
                }
            }
            
            $shop['worktime_list'] = $worktime_list;

            $shop['tree'] = $shop_tree;
            
            //задаём корневой путь для рубрик
            $settings['path_rel'] = PATH.$cat.'/'.$shop_id.'-'.cpu($shop['name']).'/';
?>