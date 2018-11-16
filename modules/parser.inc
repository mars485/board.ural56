<?php

if($_SERVER['REMOTE_ADDR'] != gethostbyname('illusionweb.org')) exit('access denied');

$act = (isset($_GET['act'])) ? $_GET['act'] : "";

function fixtmpfilename($ext, $field, $id, $title)
    {
    $name = strtolower(cpu($title));
    if(strlen($name) < 3)
        {
        $name = strtolower(make_password(5));
        }
    return $id.'_'.$field.'_'.$name.'.'.$ext;
    }

function make_select_array($cats_id, $default = 'none', $truncate = '400', $seporator = ' / ',  $id = 0)
	{
    static $array = array();
    if($id == 0) $array = array();
	if(count($cats_id)){
	    foreach($cats_id as $k => $v){
	        if($v['parent'] == $id)
		        {
                $selected = ($k == $default) ? true : false;
	            $title = array();
	            foreach(array_reverse(get_parents($v['id'], $cats_id)) as $vv){
	                $title[] = $cats_id[$vv]['name'];
	            }
		        $title[]  = $v['name'];
		        $title = implode($seporator, $title);
				if(mb_strlen($title, 'UTF-8') > $truncate){
				    $title = '...'.mb_substr($title, "-".$truncate, 'UTF-8');
				}
                $r = true;
                foreach($cats_id as $v2){
                    if($v2['parent'] == $k){
                        $r = false;
                        break;
                    }
                }
                if($r) $array[] = array('id' => $v['id'], 'name' => $title, 'selected' => $selected);
	            make_select_array($cats_id, $default, $truncate, $seporator,  $k);
		        }
		    }
	    }
	if($id == 0)
	    {
		return $array;
	    }
	}	


if($act == "getinfo"){
    $afields = array();
    foreach($fields as $v){
        $afields[$v['id']] = array('id' => $v['id'], 'name' => $v['name'], 
                                    'type' => $v['type'], 'type_string' =>$v['type_string'],
                                    'cat_id' => $v['cat'], 'cat_name' => $cats_id[$v['cat']]['name']);
    }
    
    $ans = array();
    $ans['categories'] = make_select_array($cats_id);
    $ans['regions'] = make_select_array($regions_id_);
    $ans['fields'] = $afields;
    
    header("Content-type: text/plain; charset=utf-8");

    echo serialize($ans);

}elseif($act == "data"){

    $approve_sql = dbarray(dbquery("show create table ".PREF."db"));
    $approve_sql = strstr($approve_sql['Create Table'], '`approved`') ? true : false; 



    $data = str_replace(' ', '+', $_POST['data']);
    
    $data = base64_decode($data);
    $data = unserialize($data);


    if($data){
	    $sql = "INSERT INTO ".PREF."db SET
	    uid='".md5($_POST['data'])."',
	    ip='".$settings['ip']."',
	    cat='".$data['cat_id']."',
	    user='".$data['username']."',
	    region='".$data['region_id']."',
	    date_add='".$data['date_add']."',
	    date_del='".($data['date_add'] + 86400*$data['days'])."',
	    status='1',
	    sendmail='1',
	    email='".$data['email']."',
	    title='".wordwrap_utf8(trim($data['title']),50)."',
	    text='".$data['text']."',
	    marked='0',";
        if($approve_sql){
            $sql .= "
            approved='1',
            ";
        } 
        $sql .= "
	    raised='0'
        ";
        
        dbquery($sql)   ;   
        
        $id = dbarray(dbquery("SELECT LAST_INSERT_ID() as id"));
        $id = $id['id']; 
        //message 	field 	value
        if(count($data['fields']) > 0){
            foreach($data['fields'] as $k => $v){
                if($v != ""){
                    dbquery("INSERT INTO ".PREF."db_fields SET message=".$id.", field = ".$k.", value = '".$v."'");
                }
            }    
        }
        if($data['img']){
            include(COREPATH.'imglib.php');
            $i = 0;
            foreach($fields as $k => $v){
                if($v['type'] == 'i'){
                    if($data['img'][$i] != ""){
                        
                        $link = $data['img'][$i];
                        
                        $tmpfile = FULLPATH.'uploads/temp/parser.dat';
                        file_put_contents($tmpfile, file_get_contents($link));
                        $ext = get_ext($link);
                        $filename = fixtmpfilename($ext, $k, $id, $data['title']);
                	    $info = @getimagesize($tmpfile);
                        if($info){
                    		convert_img($ext, $settings['img_small_width'], $settings['img_small_height'], $tmpfile, FULLPATH."uploads/images/ts/".$filename, FULLPATH.'images/watermark_small.png');
                    		convert_img($ext, $settings['img_big_width'], $settings['img_big_height'], $tmpfile, FULLPATH."uploads/images/tb/".$filename, FULLPATH.'images/watermark_big.png');
                        }
                        $sql = "INSERT INTO ".PREF."db_fields SET message=".$id.", field = ".$v['id'].", value = '".$filename."'";
                        dbquery($sql);
                        $i++;
                    } 
                }
            }
             
        }
    edit_cat_counter('+1', $data['cat_id'], $data['region_id'], $id);
     
    echo 'ok';
    }else{
        echo 'err';
    }
    


}


    

    
    exit();
?>