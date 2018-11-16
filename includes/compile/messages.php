<?php
/*
	Скрипт доски объявлений
	Elite-Board 2
	Тихомиров Юрий
	Санкт-Петербург
	2009 - 2010

	версия модуля: 260110
*/

// таблица board_fields
// id
// name - название поля
// type - v(alue), t(exarea), s(elect), c(heckbox), r(adio) - тип поля
// values - (значения, разделитель |) для типов s, c, r
// max - максимальное количество символов для типов v и t
// type_string - тип строки, n(umeric), l(atin), t(telephone number), u(rl)
// req - обязательное поле (1), необязательное поле (2)
// hide - скрыть поле от зарегистрированного пользователя? 0 - нет, 1 - да
// sort
// !!!Ахтунг!!!
// для типов s, c, r значение в базе board_db - будет ЧИСЛОМ 0, 1, 2, ... , порядковым номером элемента массива, образованного от explode('|', values), где values - значения, перечисленные в таблице board_fields



$messages = array();
if(!isset($_COOKIE['notes'])){$_COOKIE['notes'] = "";}
$notes = explode_string($_COOKIE['notes'], ',');


if(isset($custom_sql)){
	$sqlcachecheck = md5($custom_sql);
}else{
	$sqlcachecheck = md5($dop_sql);
}
$settings['cache_query'] = (isset($settings['cache_query'])) ? $settings['cache_query'] : false;
if($settings['cache_query'] == 1){
    $sqlcache = cache_get('q_'.$sqlcachecheck);
}else{
    $sqlcache = false;
}

if($sqlcache){
	extract($sqlcache);
}else{
    
    if(isset($custom_sql)){
        $res = dbquery($custom_sql);
    }else{
        $res = dbquery("SELECT * FROM ".PREF."db ".$dop_sql);
    }
    $i = 0;
    $additional_text = '';
    $additional_description = array();
    
    //upd собираем список идентификаторов пользователей
    $users_id = array();
    
    $messages_data = array();
    $messages_ids = array();
    $messages_usrs = array();
    while($data = dbarray($res)){
        $messages_data[] = $data;
        $messages_ids[] = $data['id'];
        if($data['user_id'] != 0){
            $messages_usrs[] = $data['user_id'];
        }
    }
    
    if(count($messages_data) > 0){
        
        $messages_ids = implode(',', $messages_ids);
        
        $fields_data = array();
        $res = dbquery("SELECT * FROM ".PREF."db_fields WHERE message IN (".$messages_ids.")");
        while($dat = dbarray($res)){
            $fields_data[$dat['message']][$dat['field']][$dat['id']] = $dat['value'];
        }
        
        $tags_data = array();
        $res = dbquery("
        SELECT tname.id, tname.word, tdb.message FROM ".PREF."tags tname
        JOIN ".PREF."db_tags tdb ON tdb.tag = tname.id
        WHERE tdb.message IN (".$messages_ids.")
        ");
        while($dat = dbarray($res)){
            $tags_data[$dat['message']][] = $dat;
        }     

        $comments_count_data = array();
        $res = dbquery("SELECT COUNT(*) as count, message_id FROM ".PREF."comments WHERE message_id IN (".$messages_ids.") GROUP by message_id");
        while($dat = dbarray($res)){
            $comments_count_data[$dat['message_id']] = $dat['count'];
        }

        $usr_data = array();
        $shop_data = array();

        if(count($messages_usrs) > 0){
            $messages_usrs = array_unique($messages_usrs);
    	    $res = dbquery("SELECT * FROM ".PREF."users WHERE id IN (".implode(',', $messages_usrs).")");
            while($dat = dbarray($res)){
                $usr_data[$dat['id']] = $dat;    
            }
            $shop_sql = "SELECT * FROM ".PREF."users_shop WHERE user_id IN (".implode(',', $messages_usrs).") AND status=1 ".(($settings['shop_pay'] == 1) ? 'AND NOW() < next_pay' : '');
            $res = dbquery($shop_sql);
            while($dat = dbarray($res)){
                $shop_data[$dat['user_id']] = $dat;
            }
        }
	        

        foreach($messages_data as $data)
        	{
        	$messages[$i] = $data;
        	$messages[$i]['link'] = $data['id'].'-'.cpu($data['title'], $locale['symb']).'.html';
        	$messages[$i]['fields'] = false;
            $messages[$i]['text'] = stripslashes($data['text']);
            $messages[$i]['title'] = stripslashes($data['title']);
            $messages_id[] = $data['id'];
            
            $fields_value = (isset($fields_data[$data['id']])) ? $fields_data[$data['id']] : array();

            $mtags = array();
            if(isset($tags_data[$data['id']])){
                foreach($tags_data[$data['id']] as $v){
                    $additional_text .= $v['word'].' ';
                    $mtags[] = $v;
                }
            }

        	if($messages[$i]['date_del'] < $settings['time'])
        		{
        	    $messages[$i]['date_del'] = $settings['time'];
        		}
        
        	if(in_array($data['id'], $notes))
        		{
        	    $messages[$i]['fav'] = 2;
        	    $messages[$i]['fav_block'] = 'block';
        		}
        	else
        		{
        	    $messages[$i]['fav'] = 1;
        	    $messages[$i]['fav_block'] = 'none';
        		}
        
        	if(isset($usr_data[$data['user_id']])){
        	    $user = $usr_data[$data['user_id']];
    		    $messages[$i]['user_id_name'] = $user['name'];
                $messages[$i]['user_array'] = $user;
                if(isset($shop_data[$user['id']])){
                    $messages[$i]['shop'] = $shop_data[$user['id']];
                    $messages[$i]['shop']['link'] = $shop_data[$user['id']]['id'].'-'.cpu($shop_data[$user['id']]['name'], $locale['symb']).'.html';
                }
        	}
            
            foreach($fields as $k => $v)
        	    {
        	     
                $current = (!is_array($fields_value[$v['id']])) ? false : current($fields_value[$v['id']]);
                if($current !== false)
        	        {
        	        $array = array();
                    if($v['type'] == 's' || $v['type'] == 'r')
        	            {
                        $values = explode_string($v['values']);
                        $value = trim($values[$current]);
                        
                        $additional_text .= $value.' ';
                        $link = $current;
        	            }
        	        elseif($v['type'] == 'v')
        		        {
        	     	    $value = stripslashes($current);
                        
        	     	    $additional_text .= $value.' ';
        	     	    //$link = urlencode($value) ;
        		        }
        	        elseif($v['type'] == 't')
        		        {
        	     	    $value = stripslashes($current);
        	     	    $link = false;
        		        }
        	        elseif($v['type'] == 'c')
        		        {
        		        $values = explode_string($v['values']);
        	     	    $value2 = $fields_value[$v['id']];
        	     	    $value = array();
        	     	    if(count($value2) > 0)
        		     	    {
        	     		    foreach($value2 as $_val)
        		     		    {
        	     			    $value[] = array('name' => $values[$_val], 'key' => stripslashes($_val));
        	     			    $additional_text .= $values[$_val].' ';
        		     		    }
        		     	    }
        	     	    $link = false;
        		        }
        	        elseif($v['type'] == 'i')
        		        {
        		        $value = stripslashes($current);
        	     	    $link = false;
        		        }
        	        elseif($v['type'] == 'f')
        		        {
        		          
        		        $value = stripslashes($current);
        		        $ext = get_ext($value);
        		        $ext = $settings['patch'].'images/ico/'.get_ico($ext);
        		        $value = array('filename' => $value, 'ico' => $ext);
        	     	    $link = false;
        		        }
        	        elseif($v['type'] == 'y' || $v['type'] == 'j')
        		        {
        		        $value = $current;
        	     	    $link = false;
        		        }
        	        elseif($v['type'] == 'p')
        		        {
                        $value = array('num' => $current, 'txt' => om_number($current, $rates_default['text']));
        		        }
        
                    
        		  	$array = array('field_type' => $v['type'], 'field_value' => $link, 'field_name' => $k, 'name' => $v['name'], 'value' => $value, 'string_type' => $v['type_string'], 'hide' => $v['hide']);
        		  	$messages[$i]['fields'][$v['type']][] = $array;
                    $messages[$i]['fields_sorted'][$k] = $array;
        		  	$messages[$i][$k] = $array;
        	        }
        	    }
            /*
        	$mtags = array();
            for($ti = 0; $ti < 10; $ti++)
        	    {
        	    $temp = $data['tag'.$ti];
                if($temp != "" && $temp != 0)
        	        {
                    $temp = dbarray(dbquery("SELECT word, id FROM ".PREF."tags WHERE id='".$temp."'"));
                    if($temp['word'] != "")
        	            {
        	            $additional_text .= $temp['word'].' ';
                        $mtags[] = $temp;
        	            }
        	        }
        	    }
            */  
            $comments_count1 = (isset($comments_count_data[$data['id']])) ? $comments_count_data[$data['id']] : 0;
            if($comments_count1 > 0){
                $comments_count2 = om_number($comments_count1, array($locale[838], $locale[839], $locale[840]));
            }else{
                $comments_count2 = $locale[789];
            }
        
            $messages[$i]['comments_count1'] = $comments_count1;	
        	$messages[$i]['comments_count2'] = $comments_count2;
            	
        	$messages[$i]['tags'] = $mtags;
        	$messages[$i]['array_linenav'] = get_array_linenav($data['cat'], $cats_id);
        	$messages[$i]['array_regions'] = get_array_linenav($data['region'], $regions_id_);
            
            $prolong = true;
            if($settings['pay_funct'] == 3){
                if($settings['user']['counter'] >= $settings['num_limit']){
                    $prolong = false;
                }
            }
            if($data['sendmail'] == 0){
                $prolong = false;
            }      
            $messages[$i]['prolong'] = $prolong;
            
        	$additional_text .= $data['title'].' '.$data['text'].' ';
            $additional_description[] = $data['title'];
        	$i++;
        	}
    }
    //upd если есть объявления от зарегистрированных пользователей, одним запросом ищем информацию о магазинах
    /*
    if(count($users_id) > 0){
        $mshops = array();
        $users_id = array_unique($users_id);
        $shop_sql = "SELECT * FROM ".PREF."users_shop WHERE user_id IN(".implode(',', $users_id).") AND status=1 ".(($settings['shop_pay'] == 1) ? 'AND NOW() < next_pay' : '');
        $res = dbquery($shop_sql);
        while($dat = dbarray($res)){
            $mshops[$dat['user_id']] = $dat;
        }
        if(count($mshops) > 0){
            foreach($messages as $k => $m){
                if(isset($m['user_array']['id'])){
                    if(isset($mshops[$m['user_array']['id']])){
                        $messages[$k]['shop'] = $mshops[$m['user_array']['id']];
                        $messages[$k]['shop']['link'] = $mshops[$m['user_array']['id']]['id'].'-'.cpu($mshops[$m['user_array']['id']]['name'], $locale['symb']).'.html';
                    }
                }
            }
        }
    }
    */

    
    if($i == 1){
        $text = trim(strip_tags($messages[0]['text']));
        $text = str_replace("\r", '', $text);
        $text = str_replace("\n", ' ', $text);
        $text = str_replace("\t", ' ', $text);
        $text = str_replace('"', '', $text);
        $text = str_replace('  ', ' ', $text);
        
        $additional_description = $text;
    }elseif(count($additional_description) > 0){
        $additional_description = implode('. ', $additional_description);
    }else{
        $additional_description = '';
    }
    
	$array = array(
        'messages' => $messages, 
        'additional_text' => $additional_text,
        'additional_description' => $additional_description
        );
        
    if($settings['cache_query'] == 1) cache_set('q_'.$sqlcachecheck, $array, 600);  
	  
}

if(isset($custom_sql)) unset($custom_sql);
?>