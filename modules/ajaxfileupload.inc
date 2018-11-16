<?php

if(!isset($fields[$_GET['field_key']])) exit();
$field = $fields[$_GET['field_key']];
$back = '<br /><a href="#" onclick="window.history.back();return false;">'.$locale[156].'</a>';
$img = false;

if(isset($_GET['file'])) {
    if(!strpos($_GET['file'], '.')){
        $_GET['file'] = base64_decode($_GET['file']);        
    }
}

if (!empty($_FILES)) 
    {
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
		if($_FILES['Filedata']['error'] == 1){die('upload error #1');}
		if($_FILES['Filedata']['error'] == 2){die('upload error #2');}
		if($_FILES['Filedata']['error'] == 3){die('upload error #3');}
		}
        
    //pr($_FILES['Filedata']['tmp_name']);
    if(!file_exists($_FILES['Filedata']['tmp_name']))
        {
        die('file doesn\'t exists'.$back);
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
    if(substr($ext, 0, 3) == 'php'){exit();}
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
            $img = $settings['path'].'images/ico/'.get_ico($ext).'?'.rand(100000, 999999);
            }
        else
            {
            $img = $settings['path'].'gettmpfile/?file='.$filename.'&rand='.rand(100000, 999999);   
            }
        }
	else
        {
        die('error file upload'.$back);
        }
        
	if($img){
		  header("Location: ".PATH."ajaxfileupload/?field_key=f_".$field['id']."&file=".base64_encode($img));
		  }  
            
    }

if(!isset($field_id)){
    $field_id = substr($_GET['field_key'], 2);
}

echo "<html>
<head>
	<meta http-equiv='content-type' content='text/html; charset=utf-8' />
    <link rel='stylesheet' type='text/css' href='".THEME."style.css' />
    <script type='text/javascript' src='".PATH."js/jquery.js'></script>
    <script type='text/javascript'>
    $(document).ready(function() {

        deletetmpfile = function()
                {
                 	if(confirm('".$locale[43]."'))
                        {
                  
                    	$.ajax({
                        type: 'GET',
                        data: 'field_id=".$field_id."&form_id=' + form_id,
                         url: '".$settings['path']."gettmpfile/',
                         cache: true,
                         success: function(html){
                            if(html == 'ok')
                            {
                               
                            $('#h1-f_".$field_id."').hide(500);
                            $('#h2-f_".$field_id."').hide(500);
                            } 
                         }
                    	});
                         
                        }
                };

        
        })
    </script>

</head>
<body>

<table width='100%' border='0'>
	<tr>
	    <td>
        <form name='uploadform' method='POST' action='' enctype='multipart/form-data'>
			<input id='' name='Filedata' type='file' value=''  class='add uploadfile' onchange='document.uploadform.submit();'>
            <input type='hidden' name='field_id' value='".$field['id']."'>
            <input type='hidden' name='form_id' value=''>
        </form>
        	<span class='filetypes'>".$locale[85].": ";
            if(count($field['values_array']) > 0){
                echo implode(', ', $field['values_array']);
            }
            echo "</span>

        </td>
        <td width='50'>
			<div ";
            if($_GET['file'] == ""){
                echo "style='display:none;'";
            }
            echo " id='h1-".$_GET['field_key']."'>
				     <img id='i-".$_GET['field_key']."' width='60' height='40' border='0' src='".$_GET['file']."' />
			</div>
		</td>
    </tr>
	<tr>
        <td colspan='2' align='right' style='font-size:10px; color:red;'>
			<div ";
            if($_GET['file'] == ""){
                echo "style='display:none;'";
            }
            echo " id='h2-".$_GET['field_key']."' class=filedelete style='margin-top:-5px;' onclick=\"deletetmpfile()\"></div>
		</td>
    </tr>
</table>
<script>
document.uploadform.form_id.value = top.form_id;
var form_id = top.form_id;
</script>

</body>
</html>
";

exit();
?>