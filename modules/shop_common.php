<?php
if(!isset($settings['shop'])) $settings['shop'] = 1;
$shop_pay_types = array(
        array('name' => $locale[1161], 'time' => 86400, 'price' => 5),
        array('name' => $locale[1162], 'time' => 86400*30, 'price' => 100),
        array('name' => $locale[1163], 'time' => 86400*364, 'price' => 1000)
    );
$vars = array(
    'status' => 1,
    'img_w' => 300,
    'img_h' => 200,
    'img_folder' => 'sh',
    'onpage' => 10,
    'point' => array(55.76,37.64,10),
    'min_name' => 5,
    'max_name' => 100,
    'min_description' => 200,
    'max_description' => 2000,
    'min_addr' => 30,
    'max_addr' => 100,
    'min_phone1' => 5,
    'max_phone1' => 20,
    'min_delivery' => 50,
    'max_delivery' => 1000,
    'min_payment' => 50,
    'max_payment' => 1000,
    'min_site' => 10,
    'max_site' => 100,
    'pay' => 0,
    'pay_types' => serialize($shop_pay_types)
);


foreach($vars as $k=>$v){
    if(!isset($settings['shop_'.$k]))  $settings['shop_'.$k] = $v;
}

$settings['shop_pay_types'] = unserialize($settings['shop_pay_types']);


?>