<?php
            $shops = array();
            
            $shop_categories = '';
            
            // определяем текущую и дочерние рубрики
            if(count($categories_array) > 0){
                $shop_categories = array();
                $second_category = get_array_id($cats_id, $categories_array, 0, 0, true);
                //формируем хлебные крошки

                if(isset($second_category['id'])){
                    if($second_category['id'] != ""){
                        $shop_categories = get_childres($second_category['id'], $cats_id);
                        $shop_categories[] = $second_category['id'];
                        $shop_parent_cats = get_parents($second_category['id'], $cats_id);
                        if(count($shop_parent_cats) > 0){
                            $shop_parent_cats = array_reverse($shop_parent_cats);
                        }
                        $shop_parent_cats[] = $second_category['id'];
                        $l = array();
                        foreach($shop_parent_cats as $v){
                            $l[] = $cats_id[$v]['uri'];
                            $title_normal[] = array('link' => $settings['path'].$cat.'/'.implode('/', $l).'/', 
                                                    'name' => $cats_id[$v]['name']);
                        }
                    }else{
                        //upd1701190
                        header("HTTP/1.1 404 Not Found");
                        header("Status: 404 Not Found");
                        $title_normal[] = array('link' => $settings['path'], 
                                                'name' => $locale[112]);
                        $modtype = 404;
                    }

                }
                if(count($shop_categories) > 0){
                    $shop_categories = 'AND shop.cat IN ('.implode(',', $shop_categories).')';
                }else{
                    $shop_categories = "";
                }
            }


            //upd170216
            $shop_payed = ($settings['shop_pay'] == 1) ? 'AND NOW() < shop.next_pay' : '';

            
            if($shop_regions != ''){
                $shop_regions .= ' AND shop.region != 0';
            }
            
            //запрос для подсчёта кол-ва магазинов
            $sql_count = "SELECT COUNT(*) as count FROM ".PREF."users_shop shop WHERE 1 
                            AND shop.status=1  
                            ".$shop_regions."
                            ".$shop_categories."
                            ".$shop_payed."
                            ";
            //запрос списка магазинов //upd170216
            $sql = "
                SELECT 
                        COUNT(db.user_id) as count,
                	shop.*,
                	usr.name as user_name,
                	usr.id as user_id
                	
                FROM ".PREF."users_shop shop
                	LEFT OUTER JOIN ".PREF."users usr ON usr.id = shop.user_id
                	LEFT OUTER JOIN ".PREF."db db ON (db.user_id = shop.user_id) AND (db.status=1 ".$shop_categories.")  
                WHERE shop.status=1  
                    ".$shop_regions."
                    ".$shop_categories."
                    ".$shop_payed."
                GROUP by shop.id 
                ORDER by id desc
                ";

            // пагинация
            $page = $_GET['page'];
            $limit = "";

            $count_messages = dbarray(dbquery($sql_count));
            $count_messages = $count_messages['count'];
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
            $sql .= $limit;
            $allusers = array();
            $res = dbquery($sql);
            while($dat = dbarray($res)){
                parse_info($dat);
                $shops[] = $dat;
            }
            $count_text = om_number($count_messages, array($locale[1114], $locale[1115], $locale[1116]));
            
            $count_num = $count_messages;
            
            // отбор рубрик ДО, в которых есть магазины

            /*
            $sql = "SELECT 
                        cat, COUNT(*) as count
                    FROM ".PREF."db db
                        WHERE status=1 ".$shop_regions_db." 
                        AND user_id IN (SELECT user_id FROM ".PREF."users_shop)
                        GROUP by cat
                        ";
            */
            //upd170216
            $sql = "
            SELECT 
                cat, COUNT(*) as count
            FROM ".PREF."users_shop shop
            WHERE 1  
                    AND shop.status=1
                    ".$shop_regions."
                    ".$shop_categories."
                    ".$shop_payed."
            GROUP by cat
            
            ";    

            list($shop_tree, $main_counter_cat) = shop_get_tree($sql);

            $settings['path_rel'] = PATH.$cat.'/';
?>