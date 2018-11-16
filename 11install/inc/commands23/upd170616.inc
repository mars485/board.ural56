<?php
    $upd = true;
    $res = dbquery('SHOW INDEX FROM '.PREF.'users_shop');
    while($dat = dbarray($res)){
        if($dat['Key_name'] == 'alltext'){
            $upd = false; break;
        }
    }
    
    if($upd){
        dbquery('ALTER TABLE `'.PREF.'users_shop`
                ADD FULLTEXT `alltext` (`name`, `description`, `delivery`, `payment`, `addr`, `site`)');
    }
?>