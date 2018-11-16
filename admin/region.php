<?php
require('../config.php');
define("PREF",$db_pref);

if(!defined('COREPATH')){
    define('COREPATH', $fullpath.'includes/compile/');
}


    
    
function dbconnect($db_host, $db_user, $db_pass, $db_name)
	{
	  if(version_compare(phpversion(), '5.5') >= 0){
        global $_mysqli_link;
        $_mysqli_link = mysqli_connect($db_host, $db_user, $db_pass, $db_name);
	  }else{
		mysql_connect($db_host, $db_user, $db_pass) or die("Unable to connect to SQL Server");
		mysql_select_db($db_name) or die("Unable to select database");
	  }
	}

  
    
function dbquery($query, $get_counter = false)
	{
      $query1 = $query;
	  if(version_compare(phpversion(), '5.5') >= 0){
        global $_mysqli_link;
        if (!$query = mysqli_query($_mysqli_link, $query)) echo mysqli_error($_mysqli_link);
      }else{
        if (!$query = mysql_query($query)) echo mysql_error();
      }
	$sqlquerycounter++;
	return $query;
	}  
        
function dbarray($query)
	{
	  if(version_compare(phpversion(), '5.5') >= 0){
        global $_mysqli_link;
        if (!$query = mysqli_fetch_assoc($query)) echo mysqli_error($_mysqli_link);
	  }else{
		if (!$query = mysql_fetch_assoc($query)) echo mysql_error();
	  }
	return $query;
	}
function dbrows($query)
	{
	  if(version_compare(phpversion(), '5.5') >= 0){
        global $_mysqli_link;
        return mysqli_num_rows($query);
	  }else{
		return mysql_num_rows($query);

	  }

	}
    
    
    
    
 function explode_string($str, $symb = "\n")
	{
	$array = array();
	if(strstr($str, $symb))
		{
	    $array = explode($symb, $str);
	    foreach($array as $k => $v)
		    {
	 		$array[$k] = trim($v);
		    }
		}
	elseif($str != "")
		{
		$array[] = $str;
		}
	return $array;
	}

 
 
dbconnect($db_host, $db_user, $db_pass, $db_name);
        
$res = dbquery("SELECT * FROM ".PREF."settings");
while($dat = dbarray($res))
	{
    $settings[$dat['k']] = $dat['v'];
	}

session_start();

//session_register('login');
//session_register('password');

include(COREPATH.'users.php');
$settings['user'] = $board_user;

$panel_login = false;

if($settings['user']['status'] == 2)
	{
	$panel_login = true;
	}
elseif($_SESSION['admin_login'] == $settings['admin_login'] && $_SESSION['admin_password'] == $settings['admin_password'])
	{
    if($settings['admin_login'] != "" && $settings['admin_password'] != "")
       {
       $panel_login = true; 
       }
    
	}

if(!$panel_login){exit('error');}
function strtolower_utf8($string){
  $convert_to = array(
    "a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u",
    "v", "w", "x", "y", "z", "à", "á", "â", "ã", "ä", "å", "æ", "ç", "è", "é", "ê", "ë", "ì", "í", "î", "ï",
    "ð", "ñ", "ò", "ó", "ô", "õ", "ö", "ø", "ù", "ú", "û", "ü", "ý", "а", "б", "в", "г", "д", "е", "ё", "ж",
    "з", "и", "й", "к", "л", "м", "н", "о", "п", "р", "с", "т", "у", "ф", "х", "ц", "ч", "ш", "щ", "ъ", "ы",
    "ь", "э", "ю", "я"
  );
  $convert_from = array(
    "A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U",
    "V", "W", "X", "Y", "Z", "À", "Á", "Â", "Ã", "Ä", "Å", "Æ", "Ç", "È", "É", "Ê", "Ë", "Ì", "Í", "Î", "Ï",
    "Ð", "Ñ", "Ò", "Ó", "Ô", "Õ", "Ö", "Ø", "Ù", "Ú", "Û", "Ü", "Ý", "А", "Б", "В", "Г", "Д", "Е", "Ё", "Ж",
    "З", "И", "Й", "К", "Л", "М", "Н", "О", "П", "Р", "С", "Т", "У", "Ф", "Х", "Ц", "Ч", "Ш", "Щ", "Ъ", "Ъ",
    "Ь", "Э", "Ю", "Я"
  );

  return str_replace($convert_from, $convert_to, $string);
} 



$q = strtolower_utf8(urldecode($_GET["q"]));
if (!$q) return;
$path = '../ipgeo/';

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

?>