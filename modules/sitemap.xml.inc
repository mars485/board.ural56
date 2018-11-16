<?php
	
    $act = isset($_GET['act']) ? $_GET['act'] : '';
    header("Content-type: text/xml; charset=utf-8");
    $lastBuildDate = date(DATE_W3C);
    $onpage = 10000;
    $url = $settings['http'].'://'.$_SERVER['HTTP_HOST'].PATH;

    function list_cat($tree, $names=array()){
        static $return_list;
        foreach($tree['cat'] as $cat){
            $tmp = $names;
            $tmp[] = $cat['uri'];
            if(isset($cat['cat'])){
                list_cat($cat, $tmp);
            }
            $return_list[$cat['id']] = implode('/', $tmp).'/';
        }
        return $return_list;
    }
    
    echo "<?xml version=\"1.0\" encoding=\"utf-8\"?>";    
    if($act == ''){
        echo "<sitemapindex xmlns=\"http://www.sitemaps.org/schemas/sitemap/0.9\">\n";
        $acts = array('cat', 'region', 'articles', 'mod');
        if(count($tags) > 0) $acts[] = 'tags';
        if($settings['shop'] = 1) $acts[] = 'shops';        
        $db_count = dbarray(dbquery("SELECT COUNT(*) as c FROM ".PREF."db WHERE status = 1"));
        $db_count = $db_count['c'];
        if($db_count > 0){
            $pages = ceil($db_count / $onpage);
            for ($i = 0; $i < $pages; $i++) {
                $acts[] = "db&amp;p=".$i;
            }
        }
        foreach($acts as $v){
            echo "\t<sitemap><loc>".$url.$_GET['cat'][0].'?act='.$v."</loc></sitemap>\n";
        }
        echo "</sitemapindex>";
    }else{
        echo "<urlset xmlns=\"http://www.sitemaps.org/schemas/sitemap/0.9\">\n";
        if(in_array($act, array('cat', 'region'))){
            $tbl = $act=='cat' ? PREF.'cat' : PREF.'regions';
            $res = dbquery("SELECT COUNT(*) as count, cat.id, cat.name FROM ".PREF."ind_".$act." ind LEFT JOIN ".$tbl." cat ON (cat.id = ind.cat) GROUP by cat.id order by count desc");
            $return_list = list_cat($full_tree[$act]);
            while($dat = dbarray($res)){
	           echo "<url><loc>".$url.$return_list[$dat['id']]."</loc></url>\n";  
            }
        }elseif($act == 'articles'){
            $res = dbquery("SELECT a.id, a.pubdate, a.uri as a_uri, c.uri as c_uri FROM ".PREF."articles a
                                LEFT OUTER JOIN ".PREF."articles_cat c ON c.id = a.cat");
            while($dat = dbarray($res)){
            	$pubDate = date(DATE_W3C, $dat['pubdate']);
                echo "<url><lastmod>".$pubDate."</lastmod><loc>".$url.'articles/'.stripslashes($dat['c_uri']).'/'.stripslashes($dat['a_uri'])."</loc></url>\n";  	
            }
        }elseif($act == 'shops'){
            $res = dbquery("SELECT id, name FROM ".PREF."users_shop");
            while($dat = dbarray($res)){
                echo "<url><loc>".$url.'shops/'.$dat['id'].'-'.cpu($dat['name']).'/'."</loc></url>\n";  		
            }
        }elseif($act == 'mod'){
            $modules_list = array('', 'shops/','add/','articles/','search/', 
                'users/register/','users/login/','mail/','search/?map=1');
            foreach($modules_list as $mod){
                echo "<url><loc>".$url.$mod."</loc></url>\n";  		
            }
        }elseif($act == 'tags'){
            if(count($tags) > 0){
                foreach($tags as $t){
                    echo "<url><loc>".$url.'tags/'.urlencode($t['tag_name'])."/</loc></url>\n";  		
                }
            }
        }elseif($act == 'db'){
            $limit = $onpage * intval($_GET['p']);
            $res = dbquery("SELECT id, title, date_add FROM ".PREF."db WHERE status = 1 ORDER by date_add desc LIMIT ".$limit.", ".$onpage);
            while($dat = dbarray($res)){
            	$link  = $url.MESSAGES.'/'.$dat['id'].'-'.cpu($dat['title'], $locale['symb']).'.html';
            	$pubDate = date(DATE_W3C, $dat['date_add']);
                echo "<url><lastmod>".$pubDate."</lastmod><loc>".$link."</loc></url>\n";
           	}
        }
        echo "</urlset>\n";
    }
    
    exit();
?>