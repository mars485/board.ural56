<?php
if (!empty($_FILES)) 
    {
    $back = '<a href="#" onclick="window.history.back();return false;">'.$locale[156].'</a>';
	$tempFile = $_FILES['Filedata']['tmp_name'];
	$targetPath = FULLPATH . 'uploads/temp/';
    
    if(!isset($_POST['field_id'])) $_POST['field_id'] = "";
    if(!isset($_POST['form_id']))  $_POST['fielform_id_id'] = "";
    $field_id = $_POST['field_id'];
    $form_id = $_POST['form_id'];
    
    if(!is_numeric($field_id)){die('field error'.$back);}
    
    $form_id = str_replace('/', '', $form_id);
    $form_id = str_replace('\\', '', $form_id);
    $form_id = str_replace(',', '', $form_id);

    include(COREPATH.'fields.php');
    $field = $fields['f_'.$field_id];

	if(isset($_FILES['Filedata']['error']))
		{
		if($_FILES['Filedata']['error'] == 1){die('upload error #1'.$back);}
		if($_FILES['Filedata']['error'] == 2){die('upload error #2'.$back);}
		if($_FILES['Filedata']['error'] == 3){die('upload error #3'.$back);}
		}
        
    //pr($_FILES['Filedata']['tmp_name']);
    if(!file_exists($_FILES['Filedata']['tmp_name']))
        {
        die('error');
        }
    if(file_exists($_FILES['Filedata']['tmp_name']))
	    {
 	    $ext = get_ext($_FILES['Filedata']['name']);

	    if(!in_array($ext, $field['values_array']) && count($field['values_array']) > 0)
		    {
		    die($locale[93].$back);
		    }
		else
			{
			if(is_numeric($field['max']) && (filesize($_FILES['Filedata']['tmp_name']) > ($field['max'] * 1024)))
				{
			    die($locale[1022].$back);
				}
			}
		}
        
        

    $filename = $form_id.'-'.$field_id.'.'.$ext;
	$targetFile =  str_replace('//','/',$targetPath) . $filename;
    
    
	// $fileTypes  = str_replace('*.','',$_REQUEST['fileext']);
	// $fileTypes  = str_replace(';','|',$fileTypes);
	// $typesArray = split('\|',$fileTypes);
	// $fileParts  = pathinfo($_FILES['Filedata']['name']);

	// if (in_array($fileParts['extension'],$typesArray)) {
		// Uncomment the following line if you want to make the directory if it doesn't exist
		// mkdir(str_replace('//','/',$targetPath), 0755, true);

	if(move_uploaded_file($tempFile,$targetFile))
        {
        if($field['type'] == 'f')
            {
            die($settings['path'].'images/ico/'.get_ico($ext).'?'.rand(100000, 999999));
            }
        else
            {
            die($settings['path'].'gettmpfile/?file='.$filename.'&rand='.rand(100000, 999999));   
            }
        }
	else
        {
        die('error file upload'.$back);
        }
    }
exit();	

?>