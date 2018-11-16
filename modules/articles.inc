<?php   //976

if(!$exe){
    $title_normal[] = array('link' => $settings['patch'].$cat.'/', 'name' => $locale['976']);
    
        function article_explode($text){
            $array = array('short' => false, 'more' => false, 'full' => false);
            $array['full'] = $text;
            $text = explode('<hr class="cut" />', $text);
            $array['short'] = $text[0];
            unset($text[0]);
            if(isset($text[1])){
                $array['more'] = implode("", $text);                
            }
            return $array;
        }
        
    if(!isset($_GET['cat'][1])){

        $res = dbquery("SELECT 
        (SELECT COUNT(*) FROM ".PREF."articles WHERE ".PREF."articles.cat = ".PREF."articles_cat.id) as `count`, 
                                                                                        ".PREF."articles_cat.* 
                                                                                            FROM 
                                                                                        ".PREF."articles_cat");
        $articles_cat = array();
        $kw = array();
        while($dat = dbarray($res)){
            $dat = stripslashes_recursive($dat);
            $articles_cat[$dat['id']] = $dat;
            $settings['keywords'] .= ', '.$dat['name'];
        }
    }elseif(!isset($_GET['cat'][2])){
        
        $articles_cat = dbarray(dbquery("SELECT 
        (SELECT COUNT(*) FROM ".PREF."articles WHERE ".PREF."articles.cat = ".PREF."articles_cat.id) as `count`, 
                                                            ".PREF."articles_cat.* 
                                                                FROM 
                                                            ".PREF."articles_cat WHERE 
                                                            ".PREF."articles_cat.uri='".$_GET['cat'][1]."'
                                                            "));
        if($articles_cat){
            $title_normal[] = array('link' => $settings['patch'].$cat.'/'.$_GET['cat'][1].'/', 'name' => $articles_cat['name']);

    		if(!isset($_GET['page'])) $_GET['page'] = "";
    		$page = $_GET['page'];
    		$limit = "";
    		$count_messages = $articles_cat['count'];
    		$page_count = ceil($count_messages/$settings['onpage']);
    		if($page > $page_count){
    			$page = $page_count;
   			}
    		if($page <= 0 ){
    			$page = 1;
   			}
    		$offset = ( $page - 1 ) * $settings['onpage'];
    		$limit = " LIMIT ".$offset.", ".$settings['onpage'];
    		if($page_count > 0){
    			$smarty->assign('pages', $page_count);
   			}
    
    		$res = dbquery("SELECT * FROM ".PREF."articles WHERE cat=".$articles_cat['id']." 
                                        ORDER by pubdate DESC ".$limit);
            $articles = array();
            while($dat = dbarray($res)){
                $dat = stripslashes_recursive($dat);
                $dat['content'] = article_explode($dat['content']);
                $articles[$dat['id']] = $dat;
                $settings['keywords'] .= ', '.$dat['name'].', '.$dat['keywords'];
            }
        }else $return404 = true;
    }else{
        $article = dbarray(dbquery("SELECT ".PREF."articles.*,
                                            (SELECT ".PREF."articles_cat.name FROM ".PREF."articles_cat 
                                             WHERE ".PREF."articles.cat = ".PREF."articles_cat.id) as `cat_name`
                        FROM  
                            ".PREF."articles 
                        WHERE 
                            cat IN (SELECT id FROM ".PREF."articles_cat WHERE uri='".$_GET['cat'][1]."')
                            AND uri = '".$_GET['cat'][2]."'
                        "));
        $article = stripslashes_recursive($article);
        $settings['keywords'] .= ', '.$article['name'].', '.$article['keywords'];
        $additional_text = strip_tags($article['content']);
        $title_normal[] = array('link' => $settings['patch'].$cat.'/'.$_GET['cat'][1].'/', 'name' => $article['cat_name']);
        $title_normal[] = array('link' => $settings['patch'].$cat.'/'.$_GET['cat'][1].'/'.$_GET['cat'][2], 'name' => $article['name']);
        if(!$article) $return404 = true;
    }
    if(isset($return404)){
        	header("HTTP/1.1 404 Not Found");
        	header("Status: 404 Not Found");
            $modtype = '404';
            $title_normal[1] = array('link' => $settings['path'].'404/', 'name' => $locale[112]); 
            if($title_normal[2]) unset($title_normal[2]);
            if($title_normal[3]) unset($title_normal[3]);
    }
}else{
    

    
    if(!isset($_GET['cat'][1])){
       
       

        if(!isset($_GET['page'])) $_GET['page'] = "";
        $page = $_GET['page'];
        $limit = "";
        $count_messages = dbrows(dbquery("SELECT id FROM ".PREF."articles"));
        $page_count = ceil($count_messages/$settings['onpage']);
        if($page > $page_count){
        	$page = $page_count;
        }
        if($page <= 0 ){
        	$page = 1;
        }
        $offset = ( $page - 1 ) * $settings['onpage'];
        $limit = " LIMIT ".$offset.", ".$settings['onpage'];
        if($page_count > 0){
        	$smarty->assign('pages', $page_count);
        }
                                   
        $res = dbquery("SELECT 
        (SELECT ".PREF."articles_cat.uri FROM ".PREF."articles_cat 
                        WHERE ".PREF."articles.cat = ".PREF."articles_cat.id) as `cat_uri`, 
                                                            ".PREF."articles.* 
                                                                FROM 
                                                            ".PREF."articles ORDER by pubdate DESC ".$limit);                                    

        $articles = array();
        while($dat = dbarray($res)){
            if($dat['cat_uri'] == null) continue(1);
            $dat = stripslashes_recursive($dat);
            $dat['content'] = article_explode($dat['content']);
            $articles[$dat['id']] = $dat;
        }
        
        $smarty->assign('articles', $articles);
        $smarty->assign('articles_cat', $articles_cat);
        $smarty->display('articles_cat.html');

    }elseif(!isset($_GET['cat'][2])){              
        $smarty->assign('articles_count_word', om_number($articles_cat['count'], array($locale[1034],$locale[1035],$locale[1036])));
        $smarty->assign('articles_cat', $articles_cat);
        $smarty->assign('articles', $articles);
        $smarty->display('articles.html');

    }else{
        $article['content'] = article_explode($article['content']);
        $smarty->assign('article', $article);  
        $smarty->display('articles_item.html');                     
    }
    
}

?>