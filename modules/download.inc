<?php
if(!$exe)
    {
        if(!isset($_SESSION)){
            session_start();
        }
    include(COREPATH.'download_functions.php');
    $message_id = $_GET['cat'][1];
    $field_id = $_GET['cat'][2];
    $filename = $_GET['cat'][3];
    $session_id = session_id();
        
    if(!is_numeric($message_id) || !is_numeric($field_id) || $filename == "") {exit('error');}
    if($session_id == ""){exit('empty session_id');}
    
    $dop_sql = "WHERE id='".$message_id."' AND status=1 LIMIT 0, 1";
    include(COREPATH.'messages.php');  
    $message = $messages[0]; 
    
    if($filename != $message['f_'.$field_id]['value']['filename']){exit('wrong filename');}
     
    $field = $fields['f_'.$field_id];
    if($message['id'] != "" || $field['id'] != "")
	    {
    		$title_normal[1] = array(
            'link' => $settings['patch'].MESSAGES.'/'.$message['link'], 
            'name' => strip_tags(stripslashes($message['title']))
            );
    		$title_normal[2] = array(
            'link' => $settings['patch'].$_GET['cat'][0].'/'.$message_id.'/'.$field_id.'/'.$filename, 
            'name' => $field['name'].', '.$locale[846]
            );
        }
    else
        {
    		$title_normal[1] = array(
            'link' => $settings['patch'].$_GET['cat'][0].'/'.$message_id.'/'.$field_id.'/'.$filename, 
            'name' => $locale[523]
            ); 
			header("HTTP/1.1 404 Not Found");
			header("Status: 404 Not Found");               
        }
        
        
    $key = md5($settings['rand'].$session_id.$message['id'].$field['id']);
    $download_link = $settings['patch'].$_GET['cat'][0].'/'.$message_id.'/'.$field_id.'/'.$filename;
    
    if(isset($_GET['key']))
        {
        if(substr($_GET['key'], -1) == '/') $_GET['key'] = substr($_GET['key'], 0, -1);
        if($_GET['key'] != $key){exit('wrong key');}
        else
            {
            $filepath = FULLPATH.'uploads/files/'.$filename;
            if(file_exists($filepath))	
                {
                get_file($filepath, $filename);
                exit();
                }
            else
                {
     			header("HTTP/1.1 404 Not Found");
    			header("Status: 404 Not Found");    
                exit();           
                }       
            }
        }
    }
else
    {


    
    if($message['id'] == "" || $field['id'] == "")
        {
        echo '<div class="error">'.$locale[523].'</div>';
        }
    else
        {
        $field = $message['f_'.$field_id];
        $smarty->assign('field', $field);
        $smarty->assign('message', $message);
        $smarty->assign('key', $key);
        $smarty->assign('link', $download_link);
        $smarty->assign('filename', $filename);
        $smarty->display('download.html');
        }
    }
    
    
    
    
    
?>