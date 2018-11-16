<?php
    $num = 160526;
    if(!isset($settings[$num])){
        $indexes = array();
        $indexes['date_add'] = 'ADD INDEX `date_add` (`date_add`)';
        $indexes['date_del'] = 'ADD INDEX `date_del` (`date_del`)';
        $indexes['status'] = 'ADD INDEX `status` (`status`)';
        $indexes['date_raised_raised'] = 'ADD INDEX `date_raised_raised` (`date_raised`, `raised`)';
        $indexes['cat'] = 'ADD INDEX `cat` (`cat`)';
        $indexes['region'] = 'ADD INDEX `region` (`region`)';
        $indexes['title_text'] = 'ADD FULLTEXT `title_text` (`title`, `text`)';

        $old_indexes = array();
        $res = dbquery('SHOW INDEX FROM '.PREF.'db');
        while($dat = dbarray($res)){
            $old_indexes[] = $dat['Key_name'];
        }
    
        foreach($indexes as $k => $v){
            if(!in_array($k, $old_indexes)){
                $sql = 'ALTER TABLE `'.PREF.'db` '.$v;
                dbquery($sql);
            }
        }
        
    dbquery('ALTER TABLE `'.PREF.'counter_cr` ADD INDEX `region_cat` (`region`, `cat`)');
    
    dbquery('ALTER TABLE `'.PREF.'counter_cr` DROP INDEX `region`');
    
    if(isset($settings['cache_region_tree'])){
        if($settings['cache_region_tree'] == 1){
            $dat = dbarray(dbquery('SELECT id FROM '.PREF.'settings WHERE k="cache"'));
            if(!$dat){
                dbquery('INSERT INTO '.PREF.'settings SET k="cache", v="1"');
            }
        }
    }
    
    $colums = array();
    $res = dbquery('SHOW COLUMNS FROM '.PREF.'db');
    while($dat = dbarray($res)){
        $c = $dat['Field'];
        if(substr($c, 0, 3) == 'tag'){
            $colums[] = 'DROP `'.$c.'`';
        }elseif(substr($c, 0, 2) == 'f_'){
            $colums[] = 'DROP `'.$c.'`';
        }
        
    }
    if(count($colums) > 0){
        $sql = 'ALTER TABLE `'.PREF.'db` '.implode(",\n", $colums);
        dbquery($sql);
    }
    
        
        $dat = dbarray(dbquery('SELECT id FROM '.PREF.'settings WHERE k="'.$num.'"'));
        if(!$dat){
            dbquery('INSERT INTO '.PREF.'settings SET k="'.$num.'", v="1"');
        }
    
    if($customconfig['messages_cycle'] < 100){
        $customconfig['messages_cycle'] = 100;
        if(is_writable(FULLPATH.'admin/conf.php')){
            if(copy(FULLPATH.'admin/conf.php', FULLPATH.'admin/conf_backup.php')){
                $content  = "<?php\n";
                $content .= '$customconfig = ';
                $content .= var_export($customconfig, true).";\n";
                $content .= "?>";
                file_put_contents(FULLPATH.'admin/conf.php', $content);
            }
        }
    }

    
    }
?>