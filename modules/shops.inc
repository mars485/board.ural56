<?php //1103

    if(!$exe){
        
        $shop_onpage = $settings['shop_onpage'];
        $image_folder = $settings['shop_img_folder'];
        $main_category = false;
        
        if($settings['shop'] == 0){
            header("Location: ".$settings['path']."404/");
        }

        function shop_make_tree($array, $cats){
        	$return = $array;
        	foreach($cats as $v){
        		if($v['parent'] == $array['id']){
        			$return['cat'][$v['id']] = shop_make_tree($v, $cats);
       			}
       		}
        	return $return;
        }
        function parse_info(&$dat){
            global $image_folder, $locale;
            $img = 'uploads/images/'.$image_folder.'/logo_'.$dat['id'].'.png';
            if(file_exists(FULLPATH.$img)){
                $dat['img'] = PATH.$img;
            }else{
                $dat['img'] = false;
            }
            $dat['link'] = PATH.$_GET['cat'][0].'/'.$dat['id'].'-'.cpu($dat['name']).'/';
            if($dat['count'] > 0){
                $dat['count_text'] = om_number($dat['count'], array($locale[274], $locale[1106], $locale[1112]));
            }else{
                $dat['count_text'] = $locale[1113];
            }
        }
        function shop_get_tree($sql){
            global $cats_id;
            $res = dbquery($sql);
            $main_counter_cat = array(); // счетчик объявлений
            $shop_categories_all = array();
            while($dat = dbarray($res)){
                $main_counter_cat[$dat['cat']] = $dat['count']; // счётчик объявлений для конечной рубрик
                $tmp = get_parents($dat['cat'], $cats_id); // список родительских рубрик
                $tmp2 = $tmp;
                $tmp[] = $dat['cat'];
                if(count($tmp2) > 0){
                    foreach($tmp2 as $v){
                        //счётчик объявлений для родительских рубрик
                        if(isset($main_counter_cat[$v])){
                            $main_counter_cat[$v] =  $main_counter_cat[$v]+$dat['count'];
                        }else{
                            $main_counter_cat[$v] = $dat['count'];
                        }
                    }
                }
                $shop_categories_all = array_merge($shop_categories_all, $tmp);
            }
            $shop_categories_all = array_unique($shop_categories_all);
            $shop_cats = array();
            $shop_cats_root = array();
            $main_parent = ($second_category['id'] != "") ? $second_category['id'] : 0;
            foreach($cats_id as $v){
                if(in_array($v['id'], $shop_categories_all)){
                    $shop_cats[$v['id']] = $v;
                    if($main_parent == $v['parent']){
                        $shop_cats_root[$v['id']] = $v;
                    }
                }

            }
            $shop_tree = array();
            if(count($shop_cats_root) > 0){
                foreach($shop_cats_root as $v){
                        $shop_tree[$v['id']] = shop_make_tree($v, $shop_cats);
                }
            }
            return array($shop_tree, $main_counter_cat);
        }
        
             
        $shops = false;
        $shop = false;
        $sname = $locale[1103];
        if($second_region){
            $sname .= ' '.$locale[1019].' '.implode(', ', $second_region['name']);
        }
        
                        
    	$title_normal[1] = array('link' => $settings['path'].$cat.'/', 'name' => $sname);

        //upd170217 разрешаем администратору или модератору просматривать страницу магазина
        $shop_editable = false;
        if(ADMINSTATUS){
            $shop_editable = true;
        }elseif($settings['user']){
            if($settings['user']['status'] == 2){
                if(in_array('shops', $settings['user']['actions']) || in_array('shop', $settings['user']['actions'])){
                    $shop_editable = true;
                }
            }
        }
        
        if(isset($_GET['cat'][1])){     
            $arr = explode('-', $_GET['cat'][1]);
            $id = false;
            if(count($arr) > 0){
                if(is_numeric($arr[0])){
                    $shop_id = array_shift($arr);
                    //upd170217
                    $payed = ($settings['shop_pay'] == 1 && !$shop_editable) ? 'NOW() < next_pay AND' : '';
                    $shop = dbarray(dbquery("SELECT * FROM ".PREF."users_shop WHERE ".$payed." id=".$shop_id)); 
                    //upd1701240
                    if($shop){
                        $shop['user_array'] = dbarray(dbquery("SELECT * FROM ".PREF."users WHERE id=".$shop['user_id'])); 
                    }
                }
            }
        }
        
        $categories_array = $_GET['cat'];
        array_shift($categories_array);

        //определяем текущий и дочерние регионы
        $shop_regions = array();
        if(isset($second_region['id'])){
            $shop_regions = get_childres($second_region['id'], $regions_id_);
            $shop_regions[] = $second_region['id'];
        }
        if(count($shop_regions) > 0){
            $shop_regions = 'AND shop.region IN ('.implode(',', $shop_regions).')';
        }else{
            $shop_regions = "";
        }

        //страница со списком магазинов
        if(!$shop){
            include(FULLPATH.'modules/shop_list.php');
        }

        // страница отдельного магазина        
        if($shop){
            include(FULLPATH.'modules/shop_once.php');
        }
        
        $weeks = array('', $locale[1233], $locale[1234], $locale[1235], $locale[1236], $locale[1237], $locale[1238], $locale[1239]);
        unset($weeks[0]);
        
        $smarty->assign('weeks', $weeks);
        $smarty->assign('settings', $settings);
        $smarty->assign('tree', $shop_tree);
        $smarty->assign('count_text', $count_text);
        $smarty->assign('count_num', $count_num);
        $smarty->assign('messages_counter', $count_text);
        $smarty->assign('shop', $shop);
        $smarty->assign('shops', $shops);
    }else{
        
        //upd1702140
        $smarty->display('shops.html');
        
    }
?>