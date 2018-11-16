<?php
include(COREPATH.'download_functions.php');

if(!isset($_GET['field_id'])) $_GET['field_id'] = "";
if(!isset($_GET['form_id'])) $_GET['form_id'] = "";

if($_GET['form_id'] != "" && is_numeric($_GET['field_id']))
    {
    $form_id = $_GET['form_id'];
    $field_id = $_GET['field_id'];
    $form_id = str_replace('..', '', $form_id);
    $form_id = str_replace('/',  '', $form_id);
    $form_id = str_replace('\\', '', $form_id);
    
    include(COREPATH.'fields.php');
    $v = $fields['f_'.$field_id];
    
    if(is_numeric($form_id) )
        {
        if(($v['values_array']) > 0)
            {
            $file1 = FULLPATH.'uploads/temp/'.$form_id.'-'.$field_id.'.';
            foreach($v['values_array'] as $ext)
                {
                $file = $file1.$ext;
                if(file_exists($file))
                    {  
                     if(@unlink($file))
                        {
                        echo 'ok';
                        }               
                    exit();
                    }
                }
            }        
        


        $dat = dbarray(dbquery("SELECT value, id FROM ".PREF."db_fields WHERE message='".$form_id."' AND field=".$field_id)); 
      if($dat){
        $file = $dat['value'];
        if($v['type'] == 'i')
            {
            $file1 = FULLPATH.'uploads/images/ts/'.$file;
            $file2 = FULLPATH.'uploads/images/tb/'.$file;
            if(@unlink($file1) && @unlink($file2))
                {
                echo 'ok';
                } 
            }
        else
            {
            $file1 = FULLPATH.'uploads/files/'.$file;
            if(@unlink($file1))
                {
                echo 'ok';
                } 
            }
      
        dbquery("DELETE FROM ".PREF."db_fields WHERE id='".$dat['id']."'");
                
      }

        }
    else
        {

        if(($v['values_array']) > 0)
            {
            foreach($v['values_array'] as $ext)
                {
                $file = FULLPATH.'uploads/temp/'.$form_id.'-'.$field_id.'.'.$ext;
                if(file_exists($file))
                    {  
                     if(@unlink($file))
                        {
                        echo 'ok';
                        }               
                    exit();
                    }
                }
            }
        }
    exit();
    }
else
    {
    $file = $_GET['file'];
    $file = str_replace('/', '', $file);
    $file = str_replace('\\', '', $file);
    $file = str_replace('..', '', $file);
    $filepath1 = FULLPATH.'uploads/images/ts/'.$file;
    $filepath2 = FULLPATH.'uploads/temp/'.$file;
    if(file_exists($filepath1))	
        {
        get_file($filepath1, $file);
        }
    elseif(file_exists($filepath2))	
        {
        get_file($filepath2, $file);
        }
    }    
    

exit();
?>