<?php //477
/*
	Скрипт доски объявлений
	Elite-Board 2
	Тихомиров Юрий
	Санкт-Петербург
	2009 - 2010

	версия модуля: 260110
*/
if(!$exe)
	{
	
       
    include(COREPATH.'admin/inc/services_list.php');

	if(isset($_GET['region']))   if(is_numeric($_GET['region']))   $check['region'] = $_GET['region'];
	if(isset($_GET['category'])) if(is_numeric($_GET['category'])) $check['cat'] = $_GET['category'];

    $editable = false;
    if(!isset($_POST['submit'])) $_POST['submit'] = "";
    if($_POST['submit'] != "")
	    {
	    setcookie('user_id', md5(rand(0, 10000000)), (time() + 86400), "/");
	    }


	function get_childres_first_level($id, $cats)
		{
		$return = array();
		if(count($cats) > 0)
			{
			foreach($cats as $v)
				{
				if($v['parent'] == $id && $v['id'] != "")
					{
					$return[] = $v['id'];
					}
				}
			}
		return $return;
		}

	function echo_parents($id, $cats, $cats_id, $select_id = 'none', $noselect2 = false)
		{
		global $locale;
		static $html = array();
		$temp = "";
        $noselect = false;
        if($id == "")
	        {
	        $id = 0;
        	}

		$childres = get_childres_first_level($id, $cats);

		if(count($childres) > 0)
			{
			$temp .= "\n<select size='1' onChange='loadPage(this)' class='add' style='margin-bottom:3px;'>\n";
			$temp .= "<option value='0'>".$locale[81]."</option>\n";
			foreach($childres as $v)
				{
				$temp .=  "<option value='".$v."'";
				if($v == $select_id && !$noselect2){$temp .=  " selected ";}
				$temp .=  ">".$cats_id[$v]['name']."</option>\n";
				}
			$temp .= "\n</select>\n";
			}
        elseif(!$noselect)
	        {
            if(!isset($_GET['search'])) $_GET['search'] = "";
            if($_GET['search'] != "true")
                {
                $temp .= '<center><div class="selected">'.$locale[82].'</div></center>';
                }
            $temp .= '<script>top.document.add.add_'.$_GET['cat'][2].'.value="'.$id.'";</script>';

            if($_GET['cat'][2] == "cat")
	            {
                $temp .= '<script>top.loadFields("'.$id.'");</script>';
	            }
	        }
        if(($id != 0 && $id != "") and (!$noselect || count($childres) == 0))
			{
			echo_parents($cats_id[$id]['parent'], $cats, $cats_id, $id, $noselect);

            }
		$html[] = $temp;
		return $html;
		}

	$settings['title'] = $locale[69];

	if($freetail > 0 && $_POST['submit'] == "")
		{
		$settings['title'] .= ' ('.$locale[821].': '.$freetail.')';
	    }

    if(!isset($_GET['cat'][1])) $_GET['cat'][1] = "";
    if(!isset($_GET['cat'][2])) $_GET['cat'][2] = "";

	$act = $_GET['cat'][1];
	$act2 = $_GET['cat'][2];
    
	$title_normal[1] = array('link' => $settings['patch'].$cat.'/', 'name' => $settings['title']);

	if($act == "select" && ($act2 == "cat" || $act2 == "region"))
		{
        //include('includes/funct-tree.php');
        if(!isset($_GET['i'])) $_GET['i'] = "";
        $cat = $_GET['i'];

        if($act2 == 'cat')
	        {
	        $_cat_array = $cats;
	        $_cat_id_array = $cats_id;

	        }
        elseif($act2 == 'region')
	        {
	        $_cat_array = $regions;
	        $_cat_id_array = $regions_id_;
	        }
        if(is_numeric($cat) || $cat == "")
	        {
	        setcookie('add_'.$act2, $cat, (time() + 10800), '/') ;
			$select_array = echo_parents($cat, $_cat_array, $_cat_id_array);
            $smarty->assign('act2', $act2);
            $smarty->assign('select_array', $select_array);
	        $smarty->display('add_select.html');
	        }
        die();
		}
  
      if(!isset($_POST['form_id'])) $_POST['form_id'] = "";
      if($_POST['form_id'] == "")
        {
        $form_id = md5(make_password(32));
        }
      else
        {
        $form_id = $_POST['form_id'];
        }
      $smarty->assign('form_id', $form_id);
 
        $emailstatus = 0;
        if ($settings['sms'] == 1) {
            $emailstatus = 1;
        }

        $ExistedUserError = false;
        $ExistedUserErrorNoEmail = false;
        $RegisteredUser = false;
        $WriteNewUser = false;
        if($_POST['submit'] != "" && !$settings['user'] && $_POST['password1'] != "" && $_POST['email'] != "" && email_check($_POST['email'])){
            $pass = md5($_POST['password1']);
            $dat = dbarray(dbquery("SELECT * FROM " . PREF . "users WHERE email='".$_POST['email']."'"));

            if($dat){
                if($dat['pass'] == $pass){
                    if($dat['email_status'] != 1){
                        $ExistedUserErrorNoEmail = $_POST['email'];
                    }else{
                        setcookie('userid', $dat['id'], ($settings['time'] + $settings['cookie_time']), "/");
                        setcookie('pass', $pass, ($settings['time'] + $settings['cookie_time']), "/");
                        $settings['user'] = $dat;                         
                    }
                }else{
                    $ExistedUser = true;
                }
            }elseif($_POST['password1'] == $_POST['password2'] && strlen($_POST['password1']) > 5 && email_check($_POST['email'])){

                if ($settings['default_user_balance'] == "")
                    $settings['default_user_balance'] = 0;
                
                
                
                
                dbquery("INSERT INTO " . PREF . "users SET email = '" . $_POST['email'] .
                    "', name='" . $_POST['name'] . "', pass='" . $pass . "', status='" . $settings['default_user_status'] .
                    "', balance=" . $settings['default_user_balance'] . ", email_status=" . $emailstatus .
                    ", date=" . $settings['time']);
                $RegisteredUser = true;
                $userid = mysql_insert_id_u();
                
                
                if ($userid) {
                    $WriteNewUser = array();
                    $WriteNewUser['id'] = $userid;
                    $WriteNewUser['pass'] = $pass;
                    $WriteNewUser['name'] = $_POST['name'];

                    $dat = dbarray(dbquery("SELECT * FROM " . PREF . "users WHERE id='".$userid."'"));
                    setcookie('userid', $userid, ($settings['time'] + $settings['cookie_time']), "/");
                    setcookie('pass', $pass, ($settings['time'] + $settings['cookie_time']), "/");
                    $settings['user'] = $dat; 

                }


            }
        }    
  
	}
else
	{
    echo "
    <script>
        var form_id = '".$form_id."';

    </script>
    ";

	if($act == "")
		{
	    include(COREPATH.'fields.php');

	    $res = dbquery("SELECT * FROM ".PREF."timing order by sort");
	    $timing = array();
	    while($dat = dbarray($res))
		    {
	        $timing[] = $dat;
	        $timing_id[$dat['id']] = $dat;
		    }


		if($_POST['submit'] != "")
			{
			$err = array();

            
			$redirect = false;

        if(!isset($_POST['password1'])) $_POST['password1'] = "";
        
        if($_POST['password1'] != ""){
            if(!$settings['user']){
                if($ExistedUser){
                    $err[] = $locale[989];
                }elseif($_POST['password1'] != $_POST['password2']){
                    $err[] = $locale[38];
                }elseif(strlen($_POST['password1']) < 6){
                    $err[] = $locale[990];
                }elseif($ExistedUserErrorNoEmail){ // && $settings['active_service'] != 1
                    $err[] = $locale[1043].'. <a href="'.PATH.'email_confirmation/?show_notice&email='.base64_encode($_POST['email']).'">'.$locale[1047].'</a>';
                }
            }
        }elseif($settings['unreg'] != 1 && !$settings['user']){
            $err[] = $locale[987];
        }
        


			if(ADMINSTATUS || @in_array('edit', $settings['user']['actions']))
				{
				$__text = $__POST['content'];
		        $__POST['content'] = 'nocheck';
				}
                //
            if($settings['active_service'] == 1)
	            {
                $_POST['timing'] = $timing[0]['id'];
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
			if(ADMINSTATUS || @in_array('edit', $settings['user']['actions']))
				{
				$check['content'] = addslashes($__text);
                $approved = 1;
				}
            if($settings['active_service'] == 1)
	            {
	            $count = $_POST['active_service'];
	            $service = $services['a'];
	            if($count == "")
		            {
	         	    $err[] = $locale[636];
		            }
	            elseif($_POST['active_days'] < $service['min'])
		            {
	         	    $err[] = $locale[638];
		            }
	            elseif($_POST['active_days'] > $service['max'])
		            {
	         	    $err[] = $locale[637];
		            }
	            elseif($settings['user'] && $settings['user']['balance'] < $count)
		            {
	         	    //$err[] = $locale[180];
		            }
		      	$check['active_service'] = $count;
		      	$check['active_days'] = $_POST['active_days'];
	            $days = round($count / $service['price']);
                

  
                if(count($err) == 0)
	                {                  
                    $date_del = $settings['time'] + 86400*$days;
	                }
	            }





		    if(count($err) == 0)
			    {

		        
			    if($settings['fckeditor'] != 1)
				    {
                    $check['content'] = wordwrap_utf8(trim($check['content']),30);
                    $check['content'] = str_replace("\r", "", $check['content']);
                    $check['content'] = str_replace("\n", "<br />", $check['content']);
				    }
			    if($settings['user']){$check['name'] = ""; $check['email'] = "";}
                $sstatus = $settings['default_message_status'];
                if($settings['active_service'] == '1')$sstatus = 2;
                if($WriteNewUser) $sstatus = 2;
			    $sql = "INSERT INTO ".PREF."db SET
			    uid='".$form_id."',
			    ip='".$settings['ip']."',
			    cat='".$check['cat']."',
			    user='".$check['name']."',
			    region='".$check['region']."',
			    date_add='".$settings['time']."',
			    date_del='".$date_del."',
			    user_id='".$settings['user']['id']."',
			    status='".$sstatus."',
			    sendmail='0',
			    email='".$check['email']."',
			    title='".wordwrap_utf8(trim($check['content']),20)."',
			    text='".$check['content']."',
			    marked='0',
                approved='".$approved."',
			    raised='0'" . $write_fields;

			    dbquery($sql);

				$save_id = mysql_insert_id_u();
                
                if($WriteNewUser){
                    dbquery("INSERT INTO ".PREF."db_disabled SET message='".$save_id."', user='".$WriteNewUser['id']."'");
                    $MessageDisabled = true;
                }else{
				    if($settings['default_message_status'] == '1'){
	                   edit_cat_counter('+1', $check['cat'], $check['region'], $save_id);
	                }
                    $MessageDisabled = false;
                }

				$smarty->assign('MessageDisabled', $MessageDisabled);
				$smarty->assign('save_id', $save_id);

				$link = "";

				$smarty->assign('save_id', $save_id);

				$link = "";
				if(count($_GET['region']) > 0)
					{
					$newregion = "";
					$newregion1 = get_array_linenav($check['region'], $regions_id_);
					foreach($newregion1 as $v)
						{
					    $newregion .= $v['uri'].'/';
						}
					$link = $settings['path'].$newregion.MESSAGES.'/'.$save_id.'-'.cpu($check['title'], $locale['symb']).'.html';
					}
				else
					{
				    $link = $settings['path'].MESSAGES.'/'.$save_id.'-'.cpu($check['title'], $locale['symb']).'.html';
					}
				$smarty->assign('link', $link);

				if(count($_GET['region']) > 0)
					{
					$newregion = "";
					$newregion1 = get_array_linenav($check['region'], $regions_id_);
					foreach($newregion1 as $v)
						{
					    $newregion .= $v['uri'].'/';
						}
					$link = $settings['path'].$newregion.MESSAGES.'/'.$save_id.'-'.cpu($check['title'], $locale['symb']).'.html';
					}
				else
					{
				    $link = $settings['path'].MESSAGES.'/'.$save_id.'-'.cpu($check['title'], $locale['symb']).'.html';
					}
				$smarty->assign('link', $link);

				include(COREPATH.'save_files.php');
				include(COREPATH.'save_tags.php');
                
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
                    if(count($sql) > 0){
                        $sql = "INSERT INTO ".PREF."db_fields (message, field, value)\nVALUES\n".implode(",\n", $sql); 
                        dbquery($sql);                        
                    }
                }

                
                //upd1701270
                if($settings['subscribe'] == 1 && $sstatus == 1)
	                {
                    include(COREPATH.'subscribe.php');
	                }

				$redirect = $save_id;

				if($settings['active_service'] == 1)
					{
					if($settings['user']){$user_id = $settings['user']['id'];}else{$user_id = 0;}
					$payment_id = make_payment($count, 0, $save_id, 'a');
					$smarty->assign('payment_id', $payment_id);
					$smarty->assign('count', $count);
					}
				
                if($WriteNewUser){
                    $link = $settings['http']."://" . $settings['site_address'] . $settings['patch'] .
                        "users/email_confirmation/?user_id=" . $WriteNewUser['id'] . "&key=" . md5($WriteNewUser['id'] .
                        $WriteNewUser['pass']  . $settings['rand']);
                    $vars['title'] = TITLE;
                    $vars['user'] = $WriteNewUser['name'] ;
                    $vars['link'] = "<a href='" . $link . "'>" . $link . "</a>";
 

                    
                    if ($emailstatus == 0) {
                        send_mail($_POST['email'], TITLE . ' / ' . $locale[49], $board_msg['reg_check'], $vars);
                    } else {
                        cms_syncusers();
                    }
                }
                }else{
                    if($WriteNewUser){
                        dbquery("DELETE FROM ".PREF."users WHERE id='".$WriteNewUser['id']."'");
                        $check['user'] = $_POST['name'];
                        $check['email'] = $_POST['email'];
                    }
                }

			}

	    if($settings['fckeditor'] == 1)
		    {
		      /*
		    include(FULLPATCH.'fckeditor/fckeditor.php');
			$sBasePath = $settings['patch'].'fckeditor/' ;
			$oFCKeditor = new FCKeditor('content') ;
			$oFCKeditor->BasePath	= $sBasePath ;
			//$oFCKeditor->Height	= '100%' ;
			if($settings['editable'])
				{
			    $oFCKeditor->ToolbarSet	= 'Board_Admin';
				}
			else
				{
				$oFCKeditor->ToolbarSet	= 'Board_Add';
				}
            if(!isset($check['content'])) $check['content'] = "";
			$oFCKeditor->Value		= $check['content'] ;
			$fck = $oFCKeditor->Create() ;
			$smarty->assign('fckeditor', $fck);
            */
		    }
      else{
        $check['content'] = trim(str_replace('<br />', "\n", $check['content']));
        //upd1702090
        $check['content'] = stripslashes($check['content']);
      }



	    if(count($check) > 0)
		    {
		    echo "\n<script>\n\n";
		    foreach($check as $k => $v)
			    {
				if(is_array($v) && count($v) > 0)
					{
					echo "fields['".$k."'] = new Array();\n";
					foreach($v as $kk => $vv)
						{
						echo "fields['".$k."'][".$kk."] = '".$vv."';\n";
						}
					}
		 	    if($k != 'content' && !is_array($v))
			 	    {
		 		    $check[$k] = trim(str_replace('<br />', "\n", $check[$k]));
                    if(substr($k, 0, 2) == 'f_')
	                    {
                        if(isset($fields[$k]['type'])){
                            if($fields[$k]['type'] == 'y'){
                                if(strpos($check[$k], '/') === FALSE && $check[$k] != ""){
                                   $check[$k] ='https://www.youtube.com/watch?v='.$check[$k];
                                } 
                            }
                        }
                        //upd1702090
	                    $vl = encode_for_js($check[$k]);

				 		echo "fields['".$k."'] = '".$vl."';\n";
			 		    }
			 	    }
                if(isset($fields[$k]['type']))
	                {
                    if($fields[$k]['type'] == 'j')
                        {
                        echo "yamaps['".$k."'] = '".$v."';\n";;
    	                }
                    }
			    }
			echo "\n</script>\n";
	        }

        if($settings['active_service'] == 1 ){
            if($check['active_service'] > $settings['user']['balance']){
              $err[] = '<a href="'.$settings['path'].'users/pay/" target="_blank">'.$locale[180].'</a>';
              $redirect = false;
            }
        }


        if(!isset($redirect)){$redirect = false;}
        if(!isset($err)){$err = array();}
        $smarty->assign('editable', $editable);
		$smarty->assign('redirect', $redirect);
		$smarty->assign('err', $err);
		$smarty->assign('check', $check);
		$smarty->assign('timing', $timing);
		$smarty->assign('fields', $fields);
		$smarty->assign('RegisteredUser', $RegisteredUser);

		if($settings['active_service'] == 1 && $_POST['submit'] != "" && count($err) == 0)
			{
			 
			$smarty->display('add2.html');
			}
		elseif($settings['sms'] == 1 && $settings['user']['phone'] == '')
			{
	      	echo '
              <div align="center" style="margin:50px;"><a href="'.$settings['path'].'users/info/">'.$locale[871].'</a></div>
              ';
			}
        else
            {
            $smarty->display('add.html');
            }
		}
    elseif($act == 'debit' && is_numeric($_GET['payment_id']))
	    {
	    $res = dbquery("SELECT amount FROM ".PREF."payments WHERE status=0 AND id=".$_GET['payment_id']);
	    $dat = dbarray($res);
        
        if($dat){
            update_balance($settings['user']['id'], 'o', $dat['amount'], $locale[291]);
            make_order($_GET['payment_id'], '');
            $smarty->assign('ok', true);
            $smarty->display('add2.html');
        }
     
	    }
	}

?>