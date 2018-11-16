<?php

function idn_conv($t){
    if(function_exists('idn_to_ascii')){
        return idn_to_ascii($t);
    }else{
        return $t;
    }
}

if($_GET['go'] != ''){
    $convert = mb_check_encoding($_GET['go'], 'UTF-8');
    if(!$convert){
        $_GET['go'] = iconv('CP1251', 'UTF-8', $_GET['go']);
    }
    $protocols = array('http://', 'https://');
    $link = false;
    foreach($protocols as $p){
        if(substr($_GET['go'], 0, strlen($p)) == $p){
            $link = $p.idn_conv(substr($_GET['go'], strlen($p)));
            break;
        }
    }
    if(!$link){
        $link = 'http://'.idn_conv($_GET['go']);
    }
    header('Location: '.$link);
   }
   
 
exit();
?>