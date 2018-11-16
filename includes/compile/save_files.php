<?php
/*
	Скрипт доски объявлений
	Elite-Board 2
	Тихомиров Юрий
	Санкт-Петербург
	2009 - 2010

	версия модуля: 260110
*/

function fixtmpfilename($filename, $field, $id, $title)
    {
    $return = $filename;
    if($filename != '' && $field != '' && $id != '')
        {
        $ext = get_ext($filename);
        $name = strtolower(cpu($title));
        if(strlen($name) < 3)
            {
            $name = strtolower(make_password(5));
            }
        $return = $id.'_'.$field.'_'.$name.'.'.$ext;
        }        
    return $return;
    }

if(!is_numeric($save_id)){die('fatal error');}
if(count($load_files) > 0)
	{
	foreach($load_files as $file)
		{
		  $filename = fixtmpfilename($file['name'], $file['field'], $save_id, $check['title']);

	 	if(@copy($file['tmp_name'], FULLPATH.'uploads/files/'.$filename))
		 	{
		    //dbquery("UPDATE ".PREF."db SET ".$file['field']." = '".$filename."' WHERE id=".$save_id);
            
            $sql_values[] = array('field' => $file['fid'], 'value' => $filename);
            
            @unlink($file['tmp_name']);
		 	}
		}
	}
    
    
if(count($load_images) > 0)
	{
	include(COREPATH.'imglib.php');
	foreach($load_images as $file)
		{
        $filename = fixtmpfilename($file['name'], $file['field'], $save_id, $check['title']);
        
		$ext = get_ext($file['name']);

	    $info = getimagesize($file['tmp_name']);

		convert_img($ext, $settings['img_small_width'], $settings['img_small_height'], $file['tmp_name'], FULLPATH."uploads/images/ts/".$filename, FULLPATH.'images/watermark_small.png');
		convert_img($ext, $settings['img_big_width'], $settings['img_big_height'], $file['tmp_name'], FULLPATH."uploads/images/tb/".$filename, FULLPATH.'images/watermark_big.png');
        
        @unlink($file['tmp_name']);
        
        //dbquery("UPDATE ".PREF."db SET ".$file['field']." = '".$filename."' WHERE id=".$save_id);
        $sql_values[] = array('field' => $file['fid'], 'value' => $filename);
        if(isset($sql_values_fi)){
            if(isset($sql_values_fi[$file['fid']])){
                unset($sql_values_fi[$file['fid']]);
            }
        }
		}
	}

?>