<?php

$q = strtolower_utf8(urldecode($_GET["q"]));
if (!$q) return;
$path = FULLPATH.'ipgeo/';

$t = $_GET["gtype"];
if($t == "")
    {
    $t = $_COOKIE["gtype"];
    }
  
$items = array();
$array = array();

if($t == 's')
    {
        $states = array();
        $file = file($path.'states.txt');
        foreach($file as $v){ 
            $states[substr($v, 0, 2)] = trim(substr($v, 3));
        }  
        $i = 0;        
        $issetstates = array();
        if(file_exists($path.'cidr_optim_0.txt')){
            while(file_exists($path.'cidr_optim_'.$i.'.txt')){
                $file = file($path.'cidr_optim_'.$i.'.txt');
                
                foreach($file as $v){
                    $x = explode("\t", $v);
                    $key = $x[3];
                    if(!isset($issetstates[$key])){
                        $issetstates[$key] = 1;
                        $value = $states[$key];
                        if(strpos(strtolower_utf8($value), $q) !== false) {
                            echo $key.': '.$value.'|'.$key."\n"; 
                        }
                    }
                }
                $i++;
            }
        }else{
            $file = file($path.'cidr_optim.txt');
            foreach($file as $v)
                {
                $x = explode("\t", $v);
                $array[] = $x[3];
                }
            $array = array_unique($array);
            
            $states = array();
            $file = file($path.'states.txt');
            foreach($file as $v)
                { 
                $states[substr($v, 0, 2)] = trim(substr($v, 3));
                }   
            foreach($array as $key)
                {
                $value = $states[$key];
                if($value == "")
                    {
                    $value = $key;
                    }
                if(strpos(strtolower_utf8($value), $q) !== false) 
                    {
                    echo $key.': '.$value.'|'.$key."\n"; 
                    }      
                }
                
        }

        
        
        
        
    }
elseif($t == 'd')
    {
      
    $file = file($path.'cities.txt');
    foreach($file as $v)
        {
        $x = explode("\t", $v);
        $array[] = $x[3];
        }
    $array = array_unique($array);
    foreach($array as $key)
        {       
        $key1 = iconv('windows-1251', 'utf-8', $key);
        $key2 = strtolower_utf8($key1);
        if(strpos($key2, $q) !== false) 
            {
            echo $key1.'|'.$key1."\n"; 
            }   
        }    
    }
elseif($t == 'r')
    {
    $file = file($path.'cities.txt');
    foreach($file as $v)
        {
        $x = explode("\t", $v);
        $array[$x[2]] = $x[3].'/'.$x[2];
        }
    $array = array_unique($array);
    foreach($array as $key => $value)
        {       
        $key1 = iconv('windows-1251', 'utf-8', $key);
        $key2 = strtolower_utf8($key1);
        $value = iconv('windows-1251', 'utf-8', $value);
        if(strpos($key2, $q) !== false) 
            {
                
            echo $key1.'|'.$value."\n"; 
            }   
        }    
    }
elseif($t == 'c')
    {
      
    $file = file($path.'cities.txt');
    foreach($file as $v)
        {
        $x = explode("\t", $v);
        $array[$x[1]] = $x[3].'/'.$x[2].'/'.$x[1];
        }
    $array = array_unique($array);
    foreach($array as $key => $value)
        {       
        $key1 = iconv('windows-1251', 'utf-8', $key);
        $key2 = strtolower_utf8($key1);
        $value = iconv('windows-1251', 'utf-8', $value);
        if(strpos($key2, $q) !== false) 
            {
                
            echo $key1.'|'.$value."\n"; 
            }   
        }    
    }
exit();
?>