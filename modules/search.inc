<?php //269
/*
	Скрипт доски объявлений
	Elite-Board 2
*/

if(!$exe)
	{

	$editable = true;
	$mid = false;
	$settings['title'] = $locale[198];
	$title_normal[1] = array('link' => $settings['patch'].$cat.'/', 'name' => $settings['title']);
	//$field_name = $_GET['cat'][1];
	// type - v(alue), t(exarea), s(elect), c(heckbox), r(adio) - тип поля
    if(!isset($_GET['sort_by'])) $_GET['sort_by'] = "";
	$sort_by = $_GET['sort_by'];
	$cond = array();

    unset($fields);
    if(!isset($_GET['cat_id'])) $_GET['cat_id'] = "";
    $fields_cat = $_GET['cat_id'];
    include(COREPATH."fields.php");
    
    $htmlscript = "";
    if(count($_GET) > 0)
	    {
        if(!isset($_GET['desc'])) $_GET['desc'] = "";

        $htmlscript .= "var must = new Array();\n";
        $htmlscript .= "var cond = new Array();\n";
        $htmlscript .= "var sort_by = '".$_GET['sort_by']."';\n";
        $htmlscript .= "var desc = '".$_GET['desc']."';\n";

        //$req = $_SERVER['REQUEST_URI'];
        //$req = str_replace('/search/?', '', $req);
        
        //parse_str($req, $_GET);
        
        //$_GET = clear_array($_GET);
        
	    foreach($_GET as $k => $v)
		    {


            if(substr($k, 0, 4) == 'cond')
                {
                $htmlscript .= "cond['".substr($k, 7)."'] = '".$_GET[$k]."';\n";
                }
                        
            if(isset($fields[$k]))
                {
                 
    			if(is_array($v) && count($v) > 0)
    				{
    				$htmlscript .= "fields['".$k."'] = new Array();\n";
    				foreach($v as $kk => $vv)
    					{
                        $kk = str_replace('over', "'over'", $kk);
                        $kk = str_replace('less', "'less'", $kk);
                        $kk = str_replace('rate', "'rate'", $kk);

    					$htmlscript .= "fields['".$k."'][".$kk."] = '".$vv."';\n";
    					}
    				}
    	 	    else
    		 	    {
    	 		    $_GET[$k] = trim(str_replace("\n", " ", $_GET[$k]));
    	 		    $_GET[$k] = trim(str_replace("\r", " ", $_GET[$k]));
    	 		    $_GET[$k] = trim(str_replace("\t", " ", $_GET[$k]));
                    if(strlen($_GET[$k]) > 200)
                        {
                        $_GET[$k] = substr($_GET[$k], 0, 200);
                        }
                    if(substr($k, 0, 2) == 'f_')
                        {
                        if($_GET[$k] != "")
                            {
        			 		$htmlscript .= "fields['".$k."'] = '".$_GET[$k]."';\n";
        		 		    }
                        }  
    		 	    }
                }
		    }
        if(!isset($_GET['must'])) $_GET['must'] = array();
        if(count($_GET['must']) > 0)
            {
            foreach($_GET['must'] as $k => $v)
                {
                $htmlscript .= "must['".$k."'] = '".$v."';\n";
                }
            $htmlscript .= "sort_by = '".$_GET['sort_by']."';\n";
            }
        if(!isset($_GET['add_cat']))
            {
            $htmlscript .= "
            /*
            $(document).ready(function() {
                var input = document.createElement('input');
            });
            */
            ";
            }
        }

    if(!isset($_GET['text'])) $_GET['text'] = "";
    if($_GET['text'] == $locale[270])
        {
        $_GET['text'] = "";
        }








	if(count($_GET > 0))
		{
		foreach($_GET as $k => $v)
			{
		    if(isset($fields[$k]['id']))
			    {
			    if($v != "")
				    {
				    if(!is_array($v))
				    	{$cond[$k] = urldecode($v);}
				    else
				    	{$cond[$k] = $v;}
				    }
			    }
			}
		}



	$fields_cond = array();
	if(count($cond) > 0)
		{

		foreach($cond as $k => $v)
			{

			$type = $fields[$k]['type'];
			if($type == 'v')
				{
				$cond_tmp = "field=".$fields[$k]['id']." AND ";
				if($fields[$k]['type_string'] == 'n' && is_numeric($v))
					{
                    
				    if($_GET['cond_'.$k] == 'over')
					    {
					    $cond_tmp .= "`value`+0 >= ".$v." ";
					    }
				    elseif($_GET['cond_'.$k] == 'less')
					    {
					    $cond_tmp .= "`value`+0 <= ".$v." ";
					    }
				    else
					    {
					    $cond_tmp .= "`value`+0 = ".$v." ";
					    }
                    $fields_cond[] = $cond_tmp;
					}
				else
					{
                        $cond_tmp = "`field`=".$fields[$k]['id']." AND ";
        				$cnd = make_text_cond($v);
                        
        				if($cnd)
        					{
        				    $fields_cond[] = $cond_tmp . $cnd;
        					}                        

					}

				}
			elseif($type == 'p')
				{
                $cond_tmp = "`field`=".$fields[$k]['id']." AND ";
                $cond_tmp1 = array();
                if($rates[$v['rate']]['value'] != "")
                    {
                    if(is_numeric($v['over']) && strlen($v['over']) < 10)
                        {
                        $v['over'] = $rates[$v['rate']]['value'] * $v['over'];
                        $cond_tmp1[] = "`value`+0 >= ".$v['over']."";
                        }
                    if(is_numeric($v['less']) && strlen($v['less']) < 10)
                        {
                        $v['less'] = $rates[$v['rate']]['value'] * $v['less'];
                        $cond_tmp1[] = "`value`+0 <= ".$v['less']."";
                        $cond_tmp1[] = "`value`+0 != ''";
                        }
                    if(count($cond_tmp1) > 0){
                        $cond_tmp .= "(".implode(' AND ', $cond_tmp1).")";
                        $fields_cond[] = $cond_tmp;
                    }
                    }
                
				}
			elseif($type == 't')
				{
                $cond_tmp = "field=".$fields[$k]['id']." AND ";
				$cnd = make_text_cond($v);
                
				if($cnd)
					{
				    $fields_cond[] = $cond_tmp . $cnd;
					}
				}
			elseif(($type == 's' || $type == 'r') && is_numeric($v))
				{
                $cond_tmp = "field=".$fields[$k]['id']." AND ";
			    $fields_cond[] = $cond_tmp."value = ".$v;
				}
			elseif($type == 'c' && is_array($v))
				{
				$cond_tmp = "field=".$fields[$k]['id']." AND ";
                $cond_tmp1 = array();
				if(count($v) > 0)
					{
				    foreach($v as $vv)
					    {
					    if(is_numeric($vv))
						    {
						    $cond_tmp1[] = "'$vv'";
                            }
					    }
                    if(count($cond_tmp1) > 0){
                        $fields_cond[] = $cond_tmp . '`value` in(' . implode(',', $cond_tmp1) .')';
                    }
					}
				}

			}
		}

    if(is_array($_GET['must']) && count($_GET['must']) > 0)
	    {
        $cond_tmp = "field IN ";
        $cond_tmp1 = array();
	    foreach($_GET['must'] as $k => $v)
		    {

	 	    if($fields[$k]['type'] == 'f' || $fields[$k]['type'] == 'i' || $fields[$k]['type'] == 'j' || $fields[$k]['type'] == 'y')
		 	    {
	 		    $cond_tmp1[] = $fields[$k]['id'];
		 	    }
            if($k == 'images')
                {
                foreach($fields as $vv)
                    {
                    if($vv['type'] == 'i')
                        {
                        $cond_tmp1[] = $vv['id'];
                        }
                    }              
                }

		    }
        if(count($cond_tmp1) > 0){
            $fields_cond[] = $cond_tmp . "(".implode(",", $cond_tmp1).")";
        }
	    }
     $i = 0;
    if(count($fields_cond) > 0){
        foreach($fields_cond as $k => $v){
            $fields_cond[$k] = '(SELECT `message` as msg'.$i.' FROM `'.PREF.'db_fields` WHERE '.$v.') as tbl'.$i;
            $i++;
        }
    }
    
   
	//$fields_cond = '('.implode_string($fields_cond, ' OR ').')';
    if($i > 0){
        $fields_cond = '
        SELECT `msg0` FROM 
        	'.implode($fields_cond, ",\n");
        
        if($i > 1) {
            $fields_cond .= ' WHERE ';
            $i2 = 0;
            while($i2 < $i-1){
                $fields_cond .= 'tbl'.$i2.'.msg'.$i2.'=tbl'.($i2+1).'.msg'.($i2+1);
                $i2++;
                if($i2 < $i-1) $fields_cond .= ' AND ';
            }
        }
        /*
        $fields_cond = '
        id IN 
        (
            '.$fields_cond.'
        )
        ';
        */
    }
    
	$main_cond = array();
    $shop_cond = array();
    
	if($_GET['text'] != "")
		{
		$_GET['text'] = str_replace("'", '', $_GET['text']);
		$main_cond[] = "(MATCH (`title`, `text`) AGAINST ('".$_GET['text']."'))";
        $shop_cond[] = "(MATCH (`name`, `description`, `delivery`, `payment`, `addr`, `site`) AGAINST ('".$_GET['text']."'))";
		}

    if(!isset($_GET['add_cat'])) $_GET['add_cat'] = "";
	if(is_numeric($_GET['add_cat']) && $_GET['add_cat'] > 0)
		{
		  
          
		$childres = array();
		$childres = get_childres($_GET['add_cat'], $cats);
		$childres[] = $_GET['add_cat'];

		$main_cond[] = PREF.'db.cat IN ('.implode(',', $childres).')';
        $shop_cond[] = 'cat IN ('.implode(',', $childres).')';
		}
        
    if(!isset($_GET['add_region'])) $_GET['add_region'] = "";
	if(is_numeric($_GET['add_region']) && $_GET['add_region'] > 0)
		{
		$childres = array();
		$childres = get_childres($_GET['add_region'], $regions);
		$childres[] = $_GET['add_region'];
        
        $main_cond[] = PREF.'db.region IN ('.implode(',', $childres).')';
        $shop_cond[] = 'region IN ('.implode(',', $childres).')';
		}
    if(isset($_GET['tag']))
        {
    	if(is_numeric($_GET['tag']))
    		{
    	    $main_cond[] = PREF."db.id IN (SELECT message FROM ".PREF."db_tags WHERE tag = ".$_GET['tag'].")";
            }
        else{
    	    $main_cond[] = PREF."db.id IN (SELECT message FROM ".PREF."db_tags WHERE tag IN (SELECT id FROM ".PREF."tags WHERE word LIKE '%".addslashes($_GET['tag'])."%'))";           
            }
        }
    if(isset($_GET['user_id']))
        {
    	if(is_numeric($_GET['user_id']))
    		{
    	    $main_cond[] = "user_id = ".$_GET['user_id'];
            $shop_cond[] = "user_id = ".$_GET['user_id'];
    		}
        }
    $main_cond[] = PREF."db.status = 1";
    $__cond = "";
    if(!is_array($fields_cond)){
            $res = dbquery($fields_cond);

            $fields_cond = array();
            while($dat = dbarray($res)){
                $fields_cond[] = $dat['msg0'];
            }
            if(count($fields_cond) > 0){
                $fields_cond = '
                    '.PREF.'db.id IN('.implode(',', $fields_cond).')
                ';
                $__cond = $fields_cond;
            }else{
                $fields_cond = ' 1=0 ';//fix151130
            }

    }    
    if(count($fields_cond) > 0){
        $main_cond[] = $fields_cond;
    }
    
    
    //upd1701080
    $search_shop = false;
    if(isset($_GET['shop'])){
        $shop_id = intval($_GET['shop']);
        if($shop_id > 0){
            $search_shop = dbarray(dbquery("SELECT * FROM ".PREF."users_shop WHERE id=".$shop_id));
            if($search_shop){
                $main_cond[] = PREF."db.user_id = ".$search_shop['user_id'];
            }
        }
    }
    
    if(count($main_cond) > 0){
        if($__cond != ""){
            $__cond .= "
            AND
            ";
        }
        $__cond .= " 
       (".implode_string($main_cond, ' AND ').")";
    }
        
	$__order = " AND ".PREF."db.status = 1 ORDER by ".PREF."db.date_add";


    if(!isset($_GET['sort_by'])) $_GET['sort_by'] = "";

	if($_GET['sort_by'] != "")
		{
	    if($_GET['sort_by'] == 'date_add')
		    {
		 	$__order = " ORDER by ".PREF."db.date_add";
		    }
		}


	if($_GET['desc'] == "" && $__order != ""){
	    $__order .= " DESC" ;
	}


    $searshresult = true;
    
    $smarty->assign('fields', $fields);
    $smarty->assign('shop', $search_shop);  
    
    if($search_shop){
        $htmlscript .= 'var shop_name = "'.addslashes($search_shop['name']).'";'."\n";
        $htmlscript .= 'var shop_id = "'.addslashes($search_shop['id']).'";'."\n";
    }
    

    

    if(isset($_GET['map'])){
        if($_GET['map'] == 1){
            $payed = ($settings['shop_pay'] == 1) ? 'AND NOW() < next_pay' : '';
            $shop_points = array();

            if(trim($__cond) == ""){
                $__cond_shop = " AND ".PREF."db.status = 1";
                
            }else{
                $__cond_shop = " AND ".$__cond;
            }

            
            $sql = "
            SELECT fld.value, ".PREF."db.id, sh.id as shop_id, sh.map as shop_point FROM ".PREF."db_fields fld 
                LEFT OUTER JOIN ".PREF."fields fls ON fld.field = fls.id
                LEFT OUTER JOIN ".PREF."db ON fld.message = ".PREF."db.id
                LEFT OUTER JOIN ".PREF."users_shop sh ON sh.user_id = ".PREF."db.user_id
                WHERE  fls.type='j'
                $__cond_shop
            ";    
                      


            $res = dbquery($sql);
            
            
            $points = array();

            $i = 0;
            while($dat = dbarray($res)){
                $point = explode(',',$dat['value']);
                $type = is_null($dat['shop_id']) ? 0 : 1;
                if(count($point) == 3){
                    $points[$i] =  array(
                        'point'=>array($point[0],$point[1]),
                        'id'=>$dat['id'],
                        'type'=>$type
                        );

                }
                $i++;
            }

            
            
            $shop_cond  = implode(' AND ', $shop_cond);
            if($shop_cond != "") $shop_cond = ' AND '.$shop_cond;          
 
            $sql = "
            SELECT id, map FROM ".PREF."users_shop WHERE status=1 ".$payed.$shop_cond;

            $res = dbquery($sql);
            while($dat = dbarray($res)){
                $point = explode(',',$dat['map']);
                if(count($point) == 3){
                    $points[] =  array(
                        'point'=>array($point[0],$point[1]),
                        'id'=>$dat['id'],
                        'type'=>2
                        );
                }
            }            

            $count_points = count($points);
            $points = json_encode($points);
            $smarty->assign('points', $points);            
            $smarty->assign('htmlscript', $htmlscript);
            $smarty->assign('count_points', $count_points);            
            $smarty->display('map.html');       
            
            exit();
        }
    }

    if(trim($__cond) == "" || trim($__cond) == '(status = 1)'){
        $searshresult = false;
    }

}

if($exe)
	{

	$def_cat_id = 0;
    if(isset($_GET['cat_id']))
        {
    	if(is_numeric($_GET['cat_id']))
    		{
    	    $def_cat_id = $_GET['cat_id'];
    		}
    	}
    $def_region_id = 0;
    if(isset($_GET['region_id']))
        {
    	if(is_numeric($_GET['region_id']))
    		{
    	    $def_region_id = $_GET['region_id'];
    		}
        }
    //$smarty->assign('category_select', make_select('cat_id', $cats_id, $def_cat_id, 400,' &rarr; '));
    //$smarty->assign('region_select', make_select('region_id', $regions_id_, $def_region_id, 400,' &rarr; '));


    echo "\n<script>\n".$htmlscript."\n</script>\n";
	$smarty->display('search.html');
    
	if($searshresult)
		{

	    $dop_sql = 'WHERE '.$__cond.$__order;

        
        if(isset($_GET['page']))
            {
    	    $page = $_GET['page'];
    	    }
        $limit = "";
	    $count_messages = dbrows(dbquery("SELECT id FROM ".PREF."db ".$dop_sql));

		$page_count = ceil($count_messages/$settings['onpage']);
        if(!isset($page)){$page = 1;}
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

        if(isset($_GET['sort_by'])){
            if($fields[$_GET['sort_by']]['id'] != ""){
    			$custom_sql = "
                    SELECT ".PREF."db.*   FROM ".PREF."db
    				LEFT JOIN ".PREF."db_fields ON ".PREF."db_fields.message=".PREF."db.id
                    AND ".PREF."db_fields.field=".$fields[$_GET['sort_by']]['id']."
                    WHERE
                    ";
                    if(count($main_cond) > 0){
                        $custom_sql .= "  
                        (".implode_string($main_cond, ' AND ').")
                        ";
                    }        
                    if(!is_array($fields_cond)){
                        $custom_sql .= "
                        AND " . $fields_cond."
                        ";
                    }          
                    $custom_sql .= "
                    ORDER BY ".PREF."db_fields.value+0";
                	if($_GET['desc'] == "yes"){
                	    $custom_sql .= " DESC" ;
                	}
                    $custom_sql .= $limit;
                    
    			}
        }

	    include(COREPATH."messages.php");

		$smarty->assign('get_str', '?'.$get[1]);
		$smarty->assign('messages', $messages);
		$smarty->assign('messages_counter', $locale[2].' '.om_number($count_messages, array($locale[3], $locale[4], $locale[5])));
		$smarty->display('list.html');
		}
	}
?>