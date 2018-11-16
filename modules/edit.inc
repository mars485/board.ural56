<?php  //132
/*
	Скрипт доски объявлений
	Elite-Board 2
	Тихомиров Юрий
	Санкт-Петербург
	2009 - 2010

	версия модуля: 170310
*/



if(!$exe)
	{
    include(COREPATH.'admin/inc/services_list.php');
 

    $form_id = $_GET['cat'][1];   
    $smarty->assign('form_id', $form_id);
 
	if($settings['user'] || $settings['editable'])
		{
        if(!isset($_GET['cat'][2])) $_GET['cat'][2] = "";
		$editable = true;// шаблону add.html говорим, что это редактирование, а не добавление
		$mid = false;
		$settings['title'] = $locale[132];
		$act = $_GET['cat'][1];
		$act2 = $_GET['cat'][2];
        if(!isset($dop)) $dop = "";
		if(is_numeric($act))
			{
			if($settings['editable'])   // модератор или администратор
				{
			    $dop = "";
				}
			else
				{
			    $dop .= " AND user_id = ".$settings['user']['id'];
				}

			$message_array = dbarray(dbquery("SELECT * FROM ".PREF."db WHERE id = ".$act.$dop));
			if($message_array['id'] != "")
				{
				$mid = $act;
				$title_normal[1] = array('link' => $settings['patch'].$cat.'/'.$mid, 'name' => $settings['title']);
				$message_array['title'] = stripslashes($message_array['title']);
				$message_array['text'] = stripslashes($message_array['text']);
                $res1 = dbquery("SELECT * FROM ".PREF."db_fields WHERE message=".$message_array['id']);
                $sql_values_fi = array();
                while($dat1 = dbarray($res1)){
                    if($fields['f_'.$dat1['field']]['type'] == 'c'){
                        $message_array['f_'.$dat1['field']][$dat1['value']] = 'ON';
                    }elseif($fields['f_'.$dat1['field']]['type'] == 'f' || $fields['f_'.$dat1['field']]['type'] == 'i'){
                        $sql_values_fi[$dat1['field']] = $dat1['value'];
                    }else{
                        $message_array['f_'.$dat1['field']] = $dat1['value'];
                    }
                }
                $res1 = dbquery("SELECT word FROM ".PREF."tags WHERE id IN (SELECT tag FROM ".PREF."db_tags WHERE message=".$message_array['id'].")");
                $tags_text = array();
                while($dat1 = dbarray($res1)){
                    $tags_text[] = $dat1['word'];
                }
                $tags_text = implode(", ", $tags_text);   
				}else{header("Location: ".$settings['patch']."404/");}
			}else{header("Location: ".$settings['patch']."404/");}
		}
	}

if($exe)
	{
    echo "
    <script>
        var form_id = '".$form_id."';
    </script>
    ";
    if($mid)
	    {

	    $res = dbquery("SELECT * FROM ".PREF."timing order by sort");
	    $timing = array();
	    while($dat = dbarray($res))
		    {
	        $timing[] = $dat;
	        $timing_id[$dat['id']] = $dat;
		    }

		if(isset($_POST['submit']))
			{
			$err = array();
			$redirect = false;
			if(ADMINSTATUS || @in_array('edit', $settings['user']['actions']))
				{
				$__text = $__POST['content'];
		        $__POST['content'] = 'nocheck';
				}
                
                
            $bemail = "";
            if(isset($_POST['email']))
                {
                if($_POST['email'] != "")
                    {
                    $bemail = $_POST['email'];
                    }
                }
            
            $bsql = "SELECT * FROM ".PREF."blacklist WHERE (v='".$settings['ip']."' AND k='i')";
            if($settings['user'])
                {
                $bsql .= " OR (k='u' AND v='".$settings['user']['id']."')";
                $bemail = $settings['user']['email'];
                }
            if($bemail != "")
                {
                $bsql .= " OR (k='e' AND v='".$bemail."')";
                }
            $bsql = dbarray(dbquery($bsql));
   
            if(isset($bsql['id']))
                {
                $err[] = "<b>".$locale[914]."</b>";
                }

            if(count($err) == 0)
                {
                $btext = array();
                $res = dbquery("SELECT v FROM ".PREF."blacklist WHERE k='t'");
                while($dat = dbarray($res))
                    {
                    if(strstr($_POST['content'], $dat['v']) || strstr($_POST['title'], $dat['v']))
                        {
                        $err[] = "<b>".$locale[915]."</b>";
                        break;
                        }
                    }
                }
                                
     
		    include(COREPATH.'check_form.php');
            
            $approved = 0;
		    if(ADMINSTATUS || @in_array('edit', $settings['user']['actions'])){
	            $check['content'] = addslashes($__text);
                $approved = 1;
            }
             //editable
            $save_user_id = $settings['user']['id'];
		    if(count($err) == 0)
			    {		          
			    
			    if($settings['fckeditor'] != 1)
				    {
                    $check['content'] = wordwrap_utf8(trim($check['content']),30);
                    $check['content'] = str_replace("\r", "", $check['content']);
                    $check['content'] = str_replace("\n", "<br />", $check['content']);
				    }

				$olddat = dbarray(dbquery("SELECT * FROM ".PREF."db WHERE id=".$act));
                
    		    if(ADMINSTATUS || @in_array('edit', $settings['user']['actions'])){
    	            $setstatus = $olddat['status'];
                }else{
                    $setstatus = $settings['default_message_status'];
                    if($settings['pay_funct'] == 2 || $settings['pay_funct'] == 3){
                        $setstatus = $olddat['status'];
                    }
                }
				if($olddat['cat'] != $check['cat'] ||  $olddat['region'] != $check['region']){
                    if($olddat['status'] == 1){
                        edit_cat_counter('-1', $olddat['cat'], $olddat['region'], $mid);
                        edit_cat_counter('+1', $check['cat'], $check['region'], $mid);		                  
                    }
                }elseif($olddat['status'] == 1 && $setstatus == 0){
                    edit_cat_counter('-1', $olddat['cat'], $olddat['region'], $mid);
                }
			    $sql = "UPDATE ".PREF."db SET
			    cat='".$check['cat']."',
			    region='".$check['region']."',";
				if(!$settings['editable'])
					{
                    $sql .= "
                    user_id='".$settings['user']['id']."',
                    email='".$check['email']."',
                    ";
					}
				elseif($message_array['user_id'] == "" || $message_array['user_id'] = 0)
					{
                    if(!isset($_POST['name']))
                    $sql .= "
                    user='".addslashes($message_array['user'])."',
                    email='".addslashes($message_array['email'])."',
                    ";
                    else
                    $sql .= "
                    user='".addslashes($_POST['name'])."',
                    email='".addslashes($_POST['email'])."',
                    ";
					}
			    $sql .= "
			    status='".$setstatus."',
			    sendmail='0',
			    title='".wordwrap_utf8(trim($check['title']),30)."',
			    text='".$check['content']."',
			    marked='0',
			    raised='0',
                approved='".$approved."'
			    ".$write_fields."
			    WHERE id=".$mid."
			    ";

			    dbquery($sql);


				$save_id = $mid;


				include(COREPATH.'save_files.php');
				include(COREPATH.'save_tags.php');
                $check['id'] = $mid;
				$redirect = $save_id;
                
                dbquery("DELETE FROM ".PREF."db_fields WHERE message=".$save_id);
                
                if(count($sql_values) > 0){
                    $sql = array();
                    foreach($sql_values as $k => $v){
                        if(!is_array($v['value'])){
                            if(trim($v['value']) != ""){
                                $sql[] = "(".$save_id.", ".$v['field'].", '".$v['value']."')";                        
                            }
                        }elseif(count($v['value'] > 0)){
                            foreach($v['value'] as $kk => $vv){
                                $sql[] = "(".$save_id.", ".$v['field'].", '".$kk."')";                        
                            }
                        }
                    }
                    if(count($sql_values_fi) > 0){
                        foreach($sql_values_fi as $kk => $vv){
                            $sql[] = "(".$save_id.", ".$kk.", '".$vv."')"; 
                        }
                    }
                    if(count($sql) > 0){
                        $sql = "INSERT INTO ".PREF."db_fields (message, field, value)\nVALUES\n".implode(",\n", $sql); 
                        dbquery($sql);                        
                    }
                }
                
				}

			}
		else
			{
		    $check = $message_array;

			foreach($fields as $k => $v)
				{
				if($v['type'] == 'c')
					{
					$form_value = $check[$k];
                    if(is_array($form_value)){
					if(count($form_value) > 0)
						{
					    foreach($form_value as $kk => $vv)
						    {
                            $check[$k][$vv] = 'ON';
						    }
						}                        
                    }

					}
				}
            /*
			$words = array();
			for($i = 0; $i < 10; $i++)
				{
			    if($check['tag'.$i] != "" && $check['tag'.$i] != 0)
				    {
				    $word = dbarray(dbquery("SELECT word FROM ".PREF."tags WHERE id=".$check['tag'.$i]." "));
				    if($word['word'] != "")
					    {
					    $words[] = $word['word'];
					    }
				    }
				}
			$words = implode_string($words, ', ');
			
            */
            $check['tags'] = $tags_text;
			}


		foreach($fields as $k => $v)
			{
            
			if($v['type'] == 'i' && !isset($_FILES[$k]['name']))
				{
			    $check[$k] = stripslashes(trim($message_array[$k]));
				}
			if($v['type'] == 'f' && !isset($_FILES[$k]['name']))
				{
				if($message_array[$k] != "")
					{
					$form_value = stripslashes(trim($message_array[$k]));
					$check[$k] = array();

			        $ext = get_ext($form_value);
			        $ext = $settings['patch'].'images/ico/'.get_ico($ext);
			        $check[$k] = array('filename' => $form_value, 'ico' => $ext);
					}
				}
			}

        if(!isset($check['content'])) {$check['content']  = $check['text'];}

	    if($settings['fckeditor'] == 1)
		    {/*
		    include(FULLPATH.'fckeditor/fckeditor.php');
			$sBasePath = $settings['patch'].'fckeditor/' ;
			$oFCKeditor = new FCKeditor('content') ;
			$oFCKeditor->BasePath	= $sBasePath ;
			$oFCKeditor->Config['EnterMode'] = 'br';
			if($settings['editable'])
				{
			    $oFCKeditor->ToolbarSet	= 'Board_Admin';
				}
			else
				{
				$oFCKeditor->ToolbarSet	= 'Board_Add';
				}
			$oFCKeditor->Value		= $check['content'] ;
			$fck = $oFCKeditor->Create() ;
			$smarty->assign('fckeditor', $fck);*/
		    }
        else
	        {
            $check['content'] = trim(str_replace('<br />', "\n", $check['content'] ));
	        }
	    if(count($check) > 0)
		    {
		    foreach($check as $k => $v)
			    {
		 	    if($k != 'content' && !is_array($v))
			 	    {
		 		    $check[$k] = trim(str_replace('<br />', "\n", $check[$k]));
			 	    }
			    }
	        }
            
	    if(count($check) > 0)
		    {
		    echo "\n<script>\n\n";
		    foreach($check as $k => $v)
			    {
  
                if(!isset($fields[$k]['type'])) $fields[$k]['type'] = "";
				if(is_array($v) && count($v) > 0)
					{
					echo "fields['".$k."'] = new Array();\n";
					foreach($v as $kk => $vv)
						{
						echo "fields['".$k."']['".$kk."'] = '".$vv."';\n";
						}
					}
		 	    if($k != 'content' && !is_array($v))
			 	    {
		 		    $check[$k] = trim(str_replace('<br />', "\n", $check[$k]));
                    if(substr($k, 0, 2) == 'f_')
	                    {
                        //upd1702090
	                    $vl = encode_for_js($check[$k]);


                        if($fields[$k]['type'] == 'y')
                            {
                            echo "fields['".$k."'] = 'http://www.youtube.com/watch?v=".$vl."';\n";
    			 		    }
                        else
                            {
                            echo "fields['".$k."'] = '".$vl."';\n";
                            }
                         }
			 	    }
                if($fields[$k]['type'] == 'j')
	                {
                    echo "yamaps['".$k."'] = '".$v."';\n";;
	                }
                if($fields[$k]['type'] == 'f')
	                {
                    
                    if(is_array($v) && count($v) > 0)
                        {
        				echo "ffiles['".$k."'] = new Array();\n";
        				foreach($v as $kk => $vv)
        					{
        					echo "ffiles['".$k."']['".$kk."'] = '".$vv."';\n";
        					}
                        }
                    else
                        {
                        echo "ffiles['".$k."'] = new Array();\n";
                        echo "ffiles['".$k."']['filename'] = '".$v."';\n";
                        echo "ffiles['".$k."']['ico'] = '".$v."';\n";
                        }
                    }
                    
			    }
			echo "\n</script>\n";
	        }                                    
         //pr($check);
        if($settings['editable'] && is_numeric($message_array['user_id']) && $message_array['user_id'] != 0)
	        {
            $usr = dbarray(dbquery("SELECT name, email FROM ".PREF."users WHERE id=".$message_array['user_id']));
	        $check['user']  = $usr['name'];
	        $check['email'] = $usr['email'];
	        }
        elseif($settings['editable'] && isset($_POST['submit']))
	        {
            if(!isset($_POST['name'])) $_POST['name'] = "";
            if(!isset($_POST['email'])) $_POST['email'] = "";
	        $check['user']  = $_POST['name'];
	        $check['email'] = $_POST['email'];
	        }


		if($settings['editable']) //заплатка
			{
			$tmp = $settings['unreg'];
			$settings['unreg'] = 1;
		    $smarty->assign('settings', $settings);
			}
        if($settings['fckeditor'] != 1) $check['content'] = str_replace("<br  />", "\n", $check['content']);
        if(!isset($redirect)){$redirect = false;}
        if(!isset($err)){$err = array();}
		$smarty->assign('editable', $editable);
		$smarty->assign('uid', make_password(50));
		$smarty->assign('redirect', $redirect);
		$smarty->assign('err', $err);
		$smarty->assign('check', $check);
		$smarty->assign('timing', $timing);
		$smarty->assign('fields', $fields);
		$smarty->display('add.html');

		if($settings['editable']) //заплатка
			{
			$settings['unreg'] = $tmp;
		    $smarty->assign('settings', $settings);
			}




	    }
	else
		{
	    include(COREPATH.'404.php');
		}
	}


?>