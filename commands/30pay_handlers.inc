<?php

    if(!isset($settings['pay_handlers'])) $settings['pay_handlers'] = array();
	$settings['pay_handlers']['s'] = array('handler'=>'shop_make_order', 'name'=>$locale[1173]);
	$settings['pay_handlers']['p'] = array('handler'=>'custom_check_order', 'name'=>$locale[1173]);

    function shop_make_order($payment, $comment=""){
        global $settings, $locale;
        $price_type = $payment['message_id'];
        $need_price = $settings['shop_pay_types'][$price_type]['price'];
        $amount = $payment['amount'];
        $activate = false;
        if($payment['status'] == 2) return false;
        $dat = dbarray(dbquery("SELECT * FROM ".PREF."users WHERE id=".intval($payment['user_id'])));
        if($dat){
            $balance = $dat['balance'];
            $balance = $balance + $amount;
            update_balance($dat['id'], 'i', $amount, $comment);
            if($balance >= $need_price){
                $activate = true;
                update_balance($dat['id'], 'o', $need_price, $locale[1173]);
            } 
        }else{
            if($amount >= $need_price) $activate = true;
        }
        if($activate){
            $shop_date = dbarray(dbquery("SELECT UNIX_TIMESTAMP(next_pay) as date FROM ".PREF."users_shop WHERE  user_id = ".intval($payment['user_id'])));
            if($shop_date['date'] < $settings['time']){
                $upd_sql = "NOW()";
            }else{
                $upd_sql = "next_pay";
            }
            $settings['shop_pay_types'][$price_type]['time'] = $settings['shop_pay_types'][$price_type]['time'] + 43200;
            $sql = "UPDATE ".PREF."users_shop SET next_pay=DATE_ADD(".$upd_sql.", INTERVAL ".$settings['shop_pay_types'][$price_type]['time']." SECOND) WHERE user_id = ".intval($payment['user_id']);
            dbquery($sql);
        }
        dbquery("UPDATE ".PREF."payments SET status = 2 WHERE id=".$payment['id']);
    }
    
    function custom_make_order_sql($service, $usr, $days, $msg, $text, $price){
        global $settings;
        $time_end = $settings['time'] + (86400 * $days);
        $dat = qarray("SELECT MAX(time_end) as time_end FROM ".PREF."orders WHERE type = '".$service['type']."' AND message_id = '".$msg."'"); 
        if($dat){
            if($dat['time_end'] > $settings['time']){
                $time_end = $dat['time_end'] + (86400 * $days);
            }
        }
 	    $sql = "INSERT INTO ".PREF."orders SET user_id = '".$usr."', time_end = '".$time_end."', days = '".$days."', type = '".$service['type']."', message_id = '".$msg."', status = ".$settings['default_order_status'];
        dbquery($sql);
 	    $sql = "INSERT INTO ".PREF."pay SET user_id='".$usr."', time='".$settings['time']."', type='i', pay='".$price."', rest='0', comments='".$text."'";
        dbquery($sql);
 	    $sql = "UPDATE ".PREF."db SET ".$service['field']."=1 ".($service['type'] == 'r' ? ', date_raised=CURRENT_TIMESTAMP ' : '')." WHERE id=".$msg;
        dbquery($sql);
    }
    
    
    function custom_make_order($action){
        global $settings;
        if($action['type'] == 0){
            $service = qarray("SELECT * FROM ".PREF."services WHERE type='".addslashes($action['serv'])."'");
            if($service){
                custom_make_order_sql($service, $action['usr'], $action['days'], $action['msg'], $action['text'], $action['price']);
            }
        }elseif($action['type'] == 1){
            $pkg = qarray("SELECT * FROM ".PREF."packages WHERE id = ".intval($action['pkg']));
            $service = qarray("SELECT * FROM ".PREF."services WHERE id=".intval($pkg['service']));
            custom_make_order_sql($service, $action['usr'], $pkg['days'], $action['msg'], $action['text'], $pkg['price']);
        }
    }
    
    function custom_check_order($payment, $comment=""){
        global $settings, $locale;
        $price_type = $payment['message_id'];
        $action = @unserialize($payment['action']);
        if($action){
            if(isset($action['pkg'])){
                $pkg = qarray("SELECT * FROM ".PREF."packages WHERE id = ".intval($action['pkg']));
                $need_price = $pkg['price'];
            }else{
                $service = qarray("SELECT * FROM ".PREF."services WHERE type='".addslashes($action['serv'])."'");
                $need_price = round(($service['price'] * $action['days']), 2); 
            }
            $amount = $payment['amount'];
            $activate = false;
            if($payment['status'] == 2) return false;
            $dat = qarray("SELECT * FROM ".PREF."users WHERE id=".intval($payment['user_id']));
            if($dat){
                $balance = $dat['balance'];
                $balance = $balance + $amount;
                update_balance($dat['id'], 'i', $amount, $comment);
                if($balance >= $need_price){
                    $activate = true;
                    update_balance($dat['id'], 'o', $need_price, $locale[1173]);
                } 
            }else{
                if($amount >= $need_price) $activate = true;
            }
            if($activate){
                custom_make_order($action);
            }
            dbquery("UPDATE ".PREF."payments SET status = 2 WHERE id=".$payment['id']);
        }
    }
?>