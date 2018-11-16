<?php

/*
	Скрипт доски объявлений
	Elite-Board 2
	Тихомиров Юрий
	Санкт-Петербург
	2009 - 2010

	версия модуля: 300110
*/

if($exe)
	{
    if(!isset($settings['default_comment_status'])) $settings['default_comment_status'] = 1;
    if(!isset($_settings['default_comment_status'])) $_settings['default_comment_status'] = 1;
    if(!isset($_settings['cache'])) $_settings['cache'] = 0;
    if(!isset($_settings['update_days'])) $_settings['update_days'] = 7;
    if(!isset($_settings['update_allow'])) $_settings['update_allow'] = 0;
    if(!isset($_settings['email_orders'])) $_settings['email_orders'] = 0;
    if(!isset($_settings['shop'])) $_settings['shop'] = 1;
    if(!isset($_settings['captcha_type'])) $_settings['captcha_type'] = 2;
    if(!isset($_settings['captcha_complexity'])) $_settings['captcha_complexity'] = 3;
    if(!isset($_settings['max_title'])) $_settings['max_title'] = 100;
    if(!isset($_settings['sharing'])) $_settings['sharing'] = 1;
    if(!isset($_settings['closed_info'])) $_settings['closed_info'] = $locale[1271];
    if(!isset($_settings['closed_time'])) $_settings['closed_time'] = date("Y/m/d H:i:s", $settings['time']+3600);
    if(!isset($_settings['maptype'])) $_settings['maptype'] = 0;
    if(!isset($_settings['mapkey'])) $_settings['mapkey'] = '';
    if(!isset($_settings['moderation_notifications'])) $_settings['moderation_notifications'] = 1;


        
    if(!isset($__POST)) $__POST = array();
	if(count($__POST) > 0)
		{
	    $save = array();

        if($_POST['pay_funct'] == '0')
            {

            $__POST['active_service'] = $_POST['active_service'] = '';
            $__POST['num_limit_on'] = $_POST['num_limit_on'] = '';
            $__POST['default_message_status'] = $_POST['default_message_status'] = 'ON';

            }
        elseif($_POST['pay_funct'] == '1')
            {
            $__POST['active_service'] = $_POST['active_service'] = '';
            $__POST['num_limit_on'] = $_POST['num_limit_on'] = '';
            $__POST['default_message_status'] = $_POST['default_message_status'] = '';
            }
        elseif($_POST['pay_funct'] == '2')
            {
            $__POST['active_service'] = $_POST['active_service'] = 'ON';
            $__POST['num_limit_on'] = $_POST['num_limit_on'] = '';
            $__POST['default_message_status'] = $_POST['default_message_status'] = 'ON';
            }
        elseif($_POST['pay_funct'] == '3')
            {
            $__POST['active_service'] = $_POST['active_service'] = '';
            $__POST['num_limit_on'] = $_POST['num_limit_on'] = 'ON';
            $__POST['default_message_status'] = $_POST['default_message_status'] = 'ON';
            $__POST['unreg'] = $_POST['unreg'] = '';
            }
        
        foreach($__POST as $k => $v)
		    {
	 	    $save[$k] = trim(addslashes($v));
		    }

		$save['license_key'] = str_replace("\n", "", $save['license_key']);
		$save['license_key'] = str_replace("\r", "", $save['license_key']);
		$save['license_key'] = str_replace("\t", "", $save['license_key']);
		$save['license_key'] = trim($save['license_key']);

		$save['license_tpl'] = str_replace("\n", "", $save['license_tpl']);
		$save['license_tpl'] = str_replace("\r", "", $save['license_tpl']);
		$save['license_tpl'] = str_replace("\t", "", $save['license_tpl']);
		$save['license_tpl'] = trim($save['license_tpl']);

		$checkers = array();
		$checkers[] = 'captcha';
		$checkers[] = 'subscribe';
		$checkers[] = 'active_service';
		$checkers[] = 'default_user_status';
		$checkers[] = 'default_order_status';
		$checkers[] = 'del_files';
		$checkers[] = 'default_message_status';
		$checkers[] = 'fckeditor';
		$checkers[] = 'unreg';
		$checkers[] = 'raised_on_ind';
		$checkers[] = 'make_meta';
		$checkers[] = 'caching';
//		$checkers[] = 'block_all';
		$checkers[] = 'prevent_indexing_cat';
		$checkers[] = 'prevent_indexing_region';
		$checkers[] = 'prevent_indexing_sort';
		$checkers[] = 'sms';
		$checkers[] = 'num_limit_on';
		$checkers[] = 'comment_on';
		$checkers[] = 'comment_unreg';
		$checkers[] = 'smtp';
		$checkers[] = 'ipgeo';
		$checkers[] = 'ulogin';
		$checkers[] = 'default_comment_status';
		$checkers[] = 'cache_region_tree';
		$checkers[] = 'optimized_query';
		$checkers[] = 'cache_query';
		$checkers[] = 'update_allow';
		$checkers[] = 'email_orders';
		$checkers[] = 'shop';
		$checkers[] = 'closed';
		$checkers[] = 'moderation_notifications';
        


		foreach($save as $k => $v)
			{

			if($k == 'admin_password' && $v != "")
				{
                //pr($v ." = ".$save['admin_password2']);
                if($v == $save['admin_password2'])
                    {
    			    $v = md5($v);
    				}
                else
                    {
                    $k = 'post_filter';
                    }
                }
			elseif($k == 'admin_password' && $v == "")
				{
			    $k = 'post_filter';
				}
			elseif($k == 'admin_password2')
				{
			    $k = 'post_filter';
				}

			$res = dbquery("SELECT * FROM ".PREF."settings WHERE k = '".$k."'");
			$dat = dbarray($res);

            if($k != 'post_filter' && !in_array($k, $checkers))
	            {
	            if($dat['k'] != "")
		            {
		            dbquery("UPDATE ".PREF."settings SET v = '".$v."' WHERE k = '".$k."'");
		            //pr("UPDATE ".PREF."settings SET v = '".$v."' WHERE k = '".$k."'");
					}
				else
					{
				    dbquery("INSERT INTO ".PREF."settings SET v = '".addslashes($v)."', k = '".addslashes($k)."'");
					}
				}
			}
		foreach($checkers as $k => $v)
			{
			$key = $v;
			$res = dbquery("SELECT * FROM ".PREF."settings WHERE k = '".$v."'");
			$dat = dbarray($res);
            if(!isset($_POST[$v])) $_POST[$v] = "";
			if($_POST[$v] == 'ON')
				{
				$v = '1';
				}
			else
				{
				$v = '0';
				}
			if($dat['k'] != "")
				{
				dbquery("UPDATE ".PREF."settings SET v = '".$v."' WHERE k = '".$key."'");
				}
			else
				{
			    dbquery("INSERT INTO ".PREF."settings SET v = '".addslashes($v)."', k = '".$key."'");
				}
	        }
		$fp = opendir(FULLPATCH.'smarty/compile/');
		while(($file = readdir($fp)) !== false)
			{
			if(substr($file, -4) == '.php')
				{
	            @unlink(FULLPATCH.'smarty/compile/'.$file);
				}
			}

		$fp = opendir(FULLPATCH.'smarty/cache/');
		while(($file = readdir($fp)) !== false)
			{
			if(substr($file, -5) == '.html')
				{
	            @unlink(FULLPATCH.'smarty/cache/'.$file);
				}
			}

/*		//Полные тексты
id

user_id

time_end

days

type

message_id
status
			*/



        echo "
        <div align='center'>
        <div align='center' class='ok'>".$locale[351]."</div>
			<script>
			setTimeout(\"document.location.href='?unit=conf'\",1000);
			</script>
        </div>
        ";
		}
    else
	    {
 


        if($_settings['rand_block'] == ""){$_settings['rand_block'] = 1;}
		echo "

        <style>
        label{
            font-size:1em;
        }
        </style>

    	<link type='text/css' rel='stylesheet' href='".$settings['path']."css/calendar/jscal2.css' />
    	<link type='text/css' rel='stylesheet' href='".$settings['path']."css/calendar/border-radius.css' />
    	<link type='text/css' rel='stylesheet' href='".$settings['path']."css/calendar/".$calendar_theme."/".$calendar_theme.".css' />
    	<script src='".$settings['path']."js/calendar/jscal2.js'></script>
    	<script src='".$settings['path']."js/calendar/lang/".$calendar_lang.".js'></script>
        <script>
        function payblock(status)
            {
            document.getElementById('payblock').style.display = status;
            return false;
            }
        function cacheblock(status)
            {
            document.getElementById('cacheblock').style.display = status;
            return false;
            }
    	$(document).ready( function () {
    	   

            Calendar.setup({
                inputField : 'closed_time',
                trigger    : 'closed_time_trigger',
                dateFormat : '%Y/%m/%d %H:%I:%S',
                onSelect   : function() { this.hide() }
            });
            
        });
        </script>
                
        
        
		<form name='form' action='?unit=conf' method='post'>
	    <input name='post_filter' type='hidden' value='false'>


      <div align='center' id='block'>
		<table width='700' class='add_item conf' align='center'>



		<tr><td colspan='2' class='nameopt'>".$locale[533]."</td></tr>
		<tr><td>".$locale[534]."</td><td>
			<select size='1' name='theme'  style='width:100%;min-height: 40px;'>
			";
			$fp = opendir(FULLPATCH."/templates");
			while(($file = readdir($fp)) !== false)
			if ($file{0} != ".")
				{
				echo "<option value='".$file."' "; if ($settings['theme'] == $file){echo "selected";} echo">$file</option>";
				}
			echo "
			</select>
		</td></tr>
		<tr><td>".$locale[536]."</td><td>
		<select size='1' name='locale'  style='width:100%; min-height: 40px;'>";
		$fp = opendir(FULLPATCH.'locale/');
		while(($file = readdir($fp)) !== false)
			{
			if(substr($file, -4) == '.php')
				{
	            echo "<option value='".substr($file, 0, -4)."' "; if ($settings['locale'] == substr($file, 0, -4)){echo "selected";} echo">".substr($file, 0, -4)."</option>";
				}
			}
		echo "
		</select>
		</td></tr>
		<tr><td>".$locale[273]."</td><td><input name='title' type='text' value='".$settings['title']."' style='width:100%;'></td></tr>

		<tr><td>".hlp($locale[538])."".$locale[537]."</td><td><input name='email' type='text' value='".$settings['email']."' style='width:100%;'></td></tr>
		<tr><td>".$locale[539]."[<a href=\"javascript:popup('?selectimage', 400, 550);\">".$locale[315]."</a>]</td><td><input name='logo' type='text' value='".$_settings['logo']."' id='image' style='width:100%;'></td></tr>
		<tr>
            <td>".hlp($locale[1269]).$locale[1268]."</td>
            <td>
                <input onclick='sh(200); return true;' "; if($_settings['closed'] == '1'){echo " checked ";} echo " name='closed' type='checkbox' value='ON'>
                <div id=s200 style='text-align:left;".(($_settings['closed'] != '1') ? 'display:none;' : '')."'>
                <p>".$locale[1270]."</p>
                <textarea name='closed_info'>".$_settings['closed_info']."</textarea>
                <p>".hlp($locale[1273]).$locale[1272]."</p>
                <a href='#' onclick='return false;' id=closed_time_trigger>
                <i class='fa fa-calendar-o'></i>
                </a>
                <input type=text id=closed_time name=closed_time value='".$_settings['closed_time']."'>
                </div>
            </td>
        </tr>





		<tr><td colspan='2' class='nameopt'>".$locale[540]."</td></tr>
		<tr><td>".$locale[541]."</td><td><input name='admin_login' type='text' value='".$_settings['admin_login']."' style='width:100%;'></td></tr>
		<tr><td>".hlp($locale[129])." ".$locale[130]."</td><td><input name='admin_password' type='password' value='' style='width:100%;'></td></tr>
		<tr><td>".$locale[33]."</td><td><input name='admin_password2' type='password' value='' style='width:100%;'></td></tr>
		<tr><td>".$locale[555]."</td><td><input name='charset' type='text' value='".$_settings['charset']."' style='width:100%;'></td></tr>
		<tr>
            <td>".$locale[569]."</td>
            <td>
            <script>
                function captchatest(){
                    var cparams = '../captcha/?r='+Math.random();
                    cparams = cparams + '&captcha_type=' + document.getElementById('captcha_type').value;
                    cparams = cparams + '&captcha_complexity=' + document.getElementById('captcha_complexity').value;
                    document.getElementById('captcha_image').src = cparams;
                } 
                function captcha_change(sel){
                    if(sel.value=='3'){
                        document.getElementById('captcha_img').style.display = 'none';
                        document.getElementById('captcha_re').style.display = 'block';
                    }else{
                        document.getElementById('captcha_img').style.display = 'block';
                        document.getElementById('captcha_re').style.display = 'none';
                    }
                }        
            </script>
            <style>
                #block div {
                    text-align: left;
                }
            </style>
                <input onclick='sh(100); return true;' "; if($_settings['captcha'] == '1'){echo " checked ";} echo " name='captcha' type='checkbox' value='ON'>
                <div id=s100 style='text-align:left;".(($_settings['captcha'] != '1') ? 'display:none;' : '')."'>
                    <p>".$locale[468]."</p>
                    <select id='captcha_type' name='captcha_type' size=3 onChange='captcha_change(this)'>
                        <option value='1' ".(($_settings['captcha_type'] == '1') ? 'selected' : '').">".$locale[1164]."</option>
                        <option value='2' ".(($_settings['captcha_type'] == '2') ? 'selected' : '').">".$locale[1165]."</option>
                        <option value='3' ".(($_settings['captcha_type'] == '3') ? 'selected' : '').">reCAPTCHA</option>
                    </select>
                
                    <div id=captcha_img ".($_settings['captcha_type'] == 3 ? "style='display:none'" : '').">
                        <p>".$locale[1166]."</p> 
                        <input name='captcha_complexity' id='captcha_complexity' type='range' min='0' max='10' step='1' value='".$_settings['captcha_complexity']."' />   
                        <p>".$locale[1167]." [<a href='#' onclick='captchatest();return false;' >".$locale[1168]."</a>]</p>
                        <p><img src='../captcha/000000' id='captcha_image'></p>
                    </div>
                    <div id=captcha_re ".($_settings['captcha_type'] != 3 ? "style='display:none'" : '').">
                        <p>".$locale[1315]."</p>
                        <p>Ключ для HTML <input type=text name=recaptcha1 value='".$_settings['recaptcha1']."' ></p>
                        <p>Секретный ключ <input type=text name=recaptcha2 value='".$_settings['recaptcha2']."' ></p>
                    </div>
                </div>
            </td>
        </tr>
		<tr><td>".$locale[556]."</td><td><input "; if($_settings['subscribe'] == '1'){echo " checked ";} echo " name='subscribe' type='checkbox' value='ON'></td></tr>
		<tr><td>".$locale[557]."</td><td><input name='max_subscribe' type='text' value='".$_settings['max_subscribe']."' style='width:100%;'></td></tr>
		<tr><td>".hlp($locale[578])." ".$locale[577]."</td><td><input name='rand' type='text' value='".$_settings['rand']."' style='width:100%;'></td></tr>
		<!--tr><td>".hlp($locale[593])." ".$locale[592]."</td><td><input "; if($_settings['caching'] == '1'){echo " checked ";} echo " name='caching' type='checkbox' value='ON'></td></tr-->
		<tr><td>".$locale[977]."</td><td><input "; if($_settings['ulogin'] == '1'){echo " checked ";} echo " name='ulogin' type='checkbox' value='ON'></td></tr>
		<tr>
        <td>".hlp($locale[1309])." ".$locale[1307]."</td>
        <td>
            <input type=radio "; if($_settings['sharing'] == '0'){echo " checked ";} echo " name='sharing' value='0'> ".$locale[859]."<br />
            <input type=radio "; if($_settings['sharing'] == '1'){echo " checked ";} echo " name='sharing' value='1'> ".$locale[1266]."<br />
            <input type=radio "; if($_settings['sharing'] == '2'){echo " checked ";} echo " name='sharing' value='2'> ".$locale[1308]."<br />
        </td>
        </tr>
		<tr>
            <td>".$locale[1295]."</td>
            <td>
                <input onclick=\"document.getElementById('mapblock').style.display='none';\" type=radio "; if($_settings['maptype'] == '0'){echo " checked ";} echo " name='maptype' value='0'> ".$locale[1296]."<br />
                <input onclick=\"document.getElementById('mapblock').style.display='block';\" type=radio "; if($_settings['maptype'] == '1'){echo " checked ";} echo " name='maptype' value='1'> ".$locale[1297]."<br />
        			<div id='mapblock' "; if($_settings['maptype'] != '1'){echo "style='display:none;'";} echo ">
                        <br />
        	            <div style='width:100%; margin-left:3px;'>
         				".$locale[1298]."<br>
                         <input name='mapkey' type='text' value='".$_settings['mapkey']."' style='margin:2px; width: 100%;'>
        	            </div>
        			</div>                
            </td>
        </tr>
		<tr><td>".hlp($locale[796])." ".$locale[793]."</td><td><input "; if($_settings['sms'] == '1'){echo " checked ";} echo " name='sms' type='checkbox' value='ON'></td></tr>
		<tr><td>".hlp($locale[1131])." ".$locale[1130]."</td><td><input "; if($_settings['shop'] == '1'){echo " checked ";} echo " name='shop' type='checkbox' value='ON'></td></tr>
		<tr><td>".$locale[603]."<br />
			<ul style='font-size:10px;'>
				<li>".$locale[604].": ".date("H:i")."</li>
				<li>".$locale[605].": ".date("H:i", $settings['time'])."</li>
			</ul>
		</td><td>
		<select name='cortime' style='min-height: 40px;'>
		 ";
		 for($i = -12; $i < 12; $i++)
			 {
		     echo "<option value='".$i."'";
		     if($i == $settings['cortime']) echo " selected ";
		     echo ">";

		     if($i > 0) echo '+';
		     echo $i."</option>";
			 }
		 echo "
         </select>
        </td></tr>
                
		<tr><td>".hlp($locale[853])." ".$locale[852]."</td><td><input "; if($_settings['smtp'] == '1'){echo " checked ";} echo " name='smtp' type='checkbox' value='ON'  onclick='sh(453)'>
			<div id='s453' "; if($_settings['smtp'] != '1'){echo " style='display:none;' ";} echo ">
            <br />
	            <div style='border-top:1px dotted silver; width:100%; margin-left:10px;'>
                    <table width='100%'>
                        <tr>
                            <td>".$locale[854]."</td>
                            <td><input name='smtp_from' type='text' value='".$_settings['smtp_from']."' style='width:100%;'></td>
                        </tr>
                        <tr>
                            <td>".$locale[855]."</td>
                            <td><input name='smtp_host' type='text' value='".$_settings['smtp_host']."' style='width:100%;'></td>
                        </tr>
                        <tr>
                            <td>".$locale[856]."</td>
                            <td><input name='smtp_port' type='text' value='".$_settings['smtp_port']."' style='width:50px;'></td>
                        </tr>
                        <tr>
                            <td>".$locale[857]."</td>
                            <td>
                                <select name='smtp_crypt'>
                                    <option "; if($_settings['smtp_crypt'] == "")   {echo 'selected';} echo " value=''   >".$locale[859]."</option>
                                    <option "; if($_settings['smtp_crypt'] == "ssl"){echo 'selected';} echo " value='ssl'>SSL</option>
                                    <option "; if($_settings['smtp_crypt'] == "tls"){echo 'selected';} echo " value='tls'>TLS</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td>".$locale[794]."</td>
                            <td><input name='smtp_login' type='text' value='".$_settings['smtp_login']."' style='width:100%;'></td>
                        </tr>
                        <tr>
                            <td>".$locale[22]."</td>
                            <td><input name='smtp_password' type='password' value='".$_settings['smtp_password']."' style='width:100%;'></td>
                        </tr>
                        <tr>
                            <td>".$locale[858]."</td>
                            <td>
                                <input "; if($_settings['smtp_pop'] != ''){echo " checked ";} echo " name='smtp_pop' type='checkbox' value='ON'  onclick='sh(983)'>
                    			<div id='s983' "; if($_settings['smtp_pop'] == ''){echo " style='display:none;' ";} echo ">
                                    ".$locale[860]."<br />
                                    <input name='smtp_pop' type='text' value='".$_settings['smtp_pop']."' style='width:100%;'>
                    			</div>                                
                            </td>
                        </tr>
                    </table>
	            </div>
			</div>

		</td></tr>        

		<tr>
            <td>
                ".hlp($locale[862])." ".$locale[861]."<br>
                ".hlp($locale[1292])." <a href='../?_regiontest' target=_blank>[ ".$locale[1293]." ]</a>
            </td>
            <td>
            <input "; if($_settings['ipgeo'] == '1'){echo " checked ";} echo " name='ipgeo' type='checkbox' value='ON'>
            </td>
        </tr>


		<tr>
            <td>".hlp($locale[955])." ".$locale[954]."</td>
            <td>
                <select name='uploadtype' size='2'>
                    <option value='0' "; if($_settings['uploadtype'] == '0' || $_settings['uploadtype'] == ""){echo " selected ";} echo ">".$locale[956]."</option>
                    <option value='1' "; if($_settings['uploadtype'] == '1'){echo " selected ";} echo ">".$locale[957]."</option>
                </select>
            </td>
        </tr>

		<tr><td>".$locale[1058]."</td><td><textarea name='approve_text' rows='5' style='width:100%;' wrap='on'>".$_settings['approve_text']."</textarea></td></tr>
		<tr><td>".$locale[1262]."</td><td><textarea name='license_text' rows='10' style='width:100%;' wrap='on'>".$_settings['license_text']."</textarea></td></tr>
		<tr><td>".$locale[1310]."</td><td><textarea name='license_reg_text' rows='10' style='width:100%;' wrap='on'>".$_settings['license_reg_text']."</textarea></td></tr>
        
		<tr><td>".$locale[620]."</td><td><textarea name='license_key' rows='5' style='width:200px;' wrap='on'>".$_settings['license_key']."</textarea></td></tr>
		<tr><td>".$locale[1229]."</td><td><textarea name='license_tpl' rows='3' style='width:200px;' wrap='on'>".$_settings['license_tpl']."</textarea></td></tr>

		<tr><td colspan='2' class='nameopt'>".$locale[756]."</td></tr>
		<tr><td>".hlp($locale[758])." ".$locale[757]."</td><td><input name='cron_del' type='text' value='".$_settings['cron_del']."' size='10'> ".$locale[759]."</td></tr>
		<tr><td>".hlp($locale[761])." ".$locale[760]."</td><td><input name='cron_mail' type='text' value='".$_settings['cron_mail']."' size='10'> ".$locale[759]."</td></tr>
		<tr><td>".hlp($locale[763])." ".$locale[762]."</td><td><input name='cron_order' type='text' value='".$_settings['cron_order']."' size='10'> ".$locale[759]."</td></tr>
		<tr><td>".hlp($locale[877])." ".$locale[876]."</td><td><input name='cron_cssjs' type='text' value='".$_settings['cron_cssjs']."' size='10'> ".$locale[759]."</td></tr>
		<tr><td>".hlp($locale[1069])." ".$locale[1068]."</td>
        
        <td>
            <input onclick=\"cacheblock('none')\" type=radio "; if($_settings['cache'] == '0'){echo " checked ";} echo " name='cache' value='0'> ".$locale[859]."<br />
            <input onclick=\"cacheblock('none')\" type=radio "; if($_settings['cache'] == '1'){echo " checked ";} echo " name='cache' value='1'> ".$locale[1070]."<br />
            <input onclick=\"cacheblock('block')\" type=radio "; if($_settings['cache'] == '2'){echo " checked ";} echo " name='cache' value='2'> ".$locale[1071]."<br />
    			<div id='cacheblock' "; if($_settings['cache'] != '2'){echo "style='display:none;'";} echo ">
                <br />
    	            <div style='border-top:1px dotted silver; width:100%; margin-left:3px;'>
     				".$locale[1072]." <input name='memcache_host' type='text' value='".((isset($_settings['memcache_host']) ? $_settings['memcache_host'] : '127.0.0.1' ))."' size='10' style='margin:2px;'>
     				".$locale[856]." <input name='memcache_port' type='text' value='".((isset($_settings['memcache_port']) ? $_settings['memcache_port'] : '11211' ))."' size='5' style='margin:2px;'>
    	            </div>
    			</div>
        </td>
        </tr>
		<tr><td>".hlp($locale[1076])." ".$locale[1075]."</td><td><input "; if($_settings['cache_query'] == '1'){echo " checked ";} echo " name='cache_query' type='checkbox' value='ON'></td></tr>
		<tr>
            <td>
                <a name=indexing></a>
                ".$locale[1316]."
                <br>
                <small>
                ".$locale[1323]."
                </small>
            </td>
            <td style='text-align: center;'>
            
            <button id=indexing style>".($settings['indexing'] == 0 ? $locale[1321] : $locale[1322])."</button>
            <br /><br />";
            if($settings['indexing'] > 0){
                $sql = '
                    SELECT COUNT(*) as c FROM '.PREF.'db WHERE status=1
                    AND id NOT IN(SELECT message FROM '.PREF.'ind_cat)
                    ';
                $count = dbarray(dbquery($sql));
                $count = intval($count['c']);
                $load = round(($settings['indexing']-$count)/$settings['indexing']*100).'%';
            }else{
                $load = '0%';
            }
            
            echo "
            <div id=indexing_text ".($settings['indexing'] == 0 ? 'style="display:none"' : '').">".$locale[1324]." <span id=indexing_status>$load</span></div>
            <script>
            	$(document).ready( function () {
            	   
                   function reindex(){
                        $.ajax({
                            type: 'POST',
                            url: '?indexing=recount',
                            data: 'key=".md5($settings['admin_login'].$settings['admin_password'])."',
                            success: function(data) {
                                if(data.status == 1){
                                    $('#indexing_status').html('<i class=\"fa fa-spinner fa-pulse fa-fw\"></i> ' + data.load);
                                    reindex();
                                }else{
                                    if(data.status == 0){
                                        $('#indexing_status').html('100%. <span style=color:red>".$locale[1319]."!</span>');
                                        $.get('../');
                                    }else{
                                        //reindex();
                                        $('#indexing_status').html('<span style=color:red>Error!</span>');
                                    }
                                }
                            }, 
                            error: function(jqXHR) {
                                console.log(jqXHR);
                                $('#indexing_status').html('<span style=color:red>Error!</span>');
                                //reindex();
                            }
                        });  
                   }
            	   
                    $('#indexing').click(function (event) {
                        $('#indexing_text').show();
                        $('#indexing').attr('disabled', 'disabled');
                        $('#indexing_status').html('<i class=\"fa fa-spinner fa-pulse fa-fw\"></i> ".$locale[1318]."');
                        event.preventDefault(); 
                        reindex();
                    });        

                    
                });
            </script>
            </td>
        </tr>

		<tr><td colspan='2' class='nameopt'>".$locale[559]."</td></tr>
		<tr><td>".$locale[558]."</td><td><input name='sendmail_days' type='text' value='".$_settings['sendmail_days']."' style='width:100%;'></td></tr>
		<tr><td>".$locale[1101]."</td><td><input "; if($_settings['email_orders'] == '1'){echo " checked ";} echo " name='email_orders' type='checkbox' value='ON'></td></tr>
		<tr>
            <td>".$locale[1100]."</td>
            <td>
            
            
                <input "; if($_settings['update_allow'] == '1'){echo " checked ";} echo " name='update_allow' type='checkbox' value='ON'  onclick='sh(456)'>
    			<div id='s456' "; if($_settings['update_allow'] != '1'){echo " style='display:none;' ";} echo ">
                <br />
    	            <div style='border-top:1px dotted silver; width:100%; margin-left:10px;'>
    	            <input style='width:50px;' name='update_days' type='text' value='".$_settings['update_days']."' style='width:100%;'> ".$locale[1095]."
    	            </div>
    			</div>
            
            </td>
        </tr>
		<tr><td>".hlp($locale[1314])." ".$locale[1313]."</td><td><input "; if($_settings['moderation_notifications'] == '1'){echo " checked ";} echo " name='moderation_notifications' type='checkbox' value='ON'></td></tr>
		<tr><td>".$locale[560]."</td><td><input "; if($_settings['del_files'] == '1'){echo " checked ";} echo " name='del_files' type='checkbox' value='ON'></td></tr>
	    <!--tr><td>".$locale[561]."</td><td><input "; if($_settings['default_message_status'] == '1'){echo " checked ";} echo " name='default_message_status' type='checkbox' value='ON'></td></tr--->

		<tr><td>".$locale[562]."</td><td><input "; if($_settings['fckeditor'] == '1'){echo " checked ";} echo " name='fckeditor' type='checkbox' value='ON'></td></tr>
		<tr><td>".$locale[563]."</td><td><input name='img_big_width' type='number' value='".$settings['img_big_width']."' style='width:100px;'></td></tr>
		<tr><td>".$locale[564]."</td><td><input name='img_big_height' type='number' value='".$settings['img_big_height']."' style='width:100px;'></td></tr>
		<tr><td>".$locale[565]."</td><td><input name='img_small_width' type='number' value='".$settings['img_small_width']."' style='width:100px;'></td></tr>
		<tr><td>".$locale[566]."</td><td><input name='img_small_height' type='number' value='".$settings['img_small_height']."' style='width:100px;'></td></tr>
		<tr><td>".$locale[567]."</td><td><input name='max_text' type='number' value='".$settings['max_text']."' style='width:100px'></td></tr>
		<tr><td>".$locale[1261]."</td><td><input name='max_title' type='number' value='".$_settings['max_title']."' style='width:100px'></td></tr>
		<tr><td>".$locale[568]."</td><td><input "; if($_settings['unreg'] == '1'){echo " checked ";} echo " name='unreg' type='checkbox' value='ON'></td></tr>
		<tr><td>".hlp($locale[784])." ".$locale[781]."</td><td><input "; if($_settings['comment_on'] == '1'){echo " checked ";} echo " name='comment_on' type='checkbox' value='ON'  onclick='sh(222)'>
			<div id='s222' "; if($_settings['comment_on'] != '1'){echo " style='display:none;' ";} echo ">
            <br />
	            <div style='border-top:1px dotted silver; width:100%; margin-left:10px;'>
	            <label><input name='comment_unreg' type='checkbox' value='ON' "; if($_settings['comment_unreg'] == '1'){echo " checked ";} echo "> ".$locale[782]."</label>
	            <!--label><input name='default_commant_status' type='checkbox' value='ON' "; if($_settings['default_comment_status'] == '1'){echo " checked ";} echo "> ".$locale[1050]."</label-->
	            </div>
			</div>

		</td></tr>

		<tr><td colspan='2' class='nameopt'>".$locale[546]."</td></tr>
		<tr><td>".$locale[333]."</td><td><input name='onpage' type='text' value='".$_settings['onpage']."' style='width:100%;'></td></tr>
		<tr><td>".$locale[768]."</td><td><input name='onpage_users' type='text' value='".$_settings['onpage_users']."' style='width:100%;'></td></tr>
		<!--tr><td>".$locale[547]."</td><td><input name='stlb' type='text' value='".$_settings['stlb']."' style='width:100%;'></td></tr-->
		<tr><td>".$locale[548]."</td><td>
		<select size='4' name='ind_type' style='width:100%'>
			<option value='1'";if($_settings['ind_type'] == 1){echo " selected ";} echo ">".$locale['549']."</option>
			<option value='2'";if($_settings['ind_type'] == 2){echo " selected ";} echo ">".$locale['550']."</option>
			<option value='3'";if($_settings['ind_type'] == 3){echo " selected ";} echo ">".$locale['551']."</option>
			<option value='4'";if($_settings['ind_type'] == 4){echo " selected ";} echo ">".$locale['552']."</option>
		</select>
		</td></tr>
		<tr><td>".$locale[1038]."</td><td>
		<select size='4' name='cat_type' style='width:100%'>
			<option value='1'";if($_settings['cat_type'] == 1){echo " selected ";} echo ">".$locale['549']."</option>
			<option value='2'";if($_settings['cat_type'] == 2){echo " selected ";} echo ">".$locale['550']."</option>
			<option value='3'";if($_settings['cat_type'] == 3){echo " selected ";} echo ">".$locale['551']."</option>
			<option value='4'";if($_settings['cat_type'] == 4){echo " selected ";} echo ">".$locale['552']."</option>
		</select>
		</td></tr>
		<tr><td>".$locale[553]."</td><td><input name='messages_on_ind' type='text' value='".$_settings['messages_on_ind']."' style='width:100%;'></td></tr>
		<tr><td>".$locale[554]."</td><td><input "; if($_settings['raised_on_ind'] == '1'){echo " checked ";} echo " name='raised_on_ind' type='checkbox' value='ON'></td></tr>




		<tr><td colspan='2' class='nameopt'>".$locale[579]."</td></tr>
	    <tr><td>".hlp($locale[581])." ".$locale[580]."</td><td><input name='middle_block' type='text' value='".$_settings['middle_block']."' style='width:100%;'></td></tr>
	    <tr><td>".$locale[300]."</td><td><input name='rand_block' type='text' value='".$_settings['rand_block']."' style='width:100%;'></td></tr>
		<tr>
            <td>".$locale[738]."</td>
            <td>
                <select name='block_all' size='4'>
                    <option value='1' "; if($_settings['block_all'] == 1) echo 'selected'; echo ">На всех страницах</option>
                    <option value='2' "; if($_settings['block_all'] == 2) echo 'selected'; echo ">На странице региона</option>
                    <option value='3' "; if($_settings['block_all'] == 3) echo 'selected'; echo ">На странице категории</option>
                    <option value='0' "; if($_settings['block_all'] == 0) echo 'selected'; echo ">На странице категории в регионе</option>
                </seect>
            </td>
        </tr>



		<tr>
		<td>".$locale[738]."</td>
		<td>
		<select size='2' name='message_block_type' style='width:100%'>
				<option value='1'"; if($_settings['message_block_type'] == '' || $_settings['message_block_type'] == '1'){echo ' selected ';} echo ">".$locale[739]."</option>
				<option value='2'"; if($_settings['message_block_type'] == '2'){echo ' selected ';} echo ">".$locale[740]."</option>
		</td>
		</tr>





		<tr><td colspan='2' class='nameopt'>".$locale[570]."</td></tr>
		<tr><td>".$locale[571]."</td><td><input name='autor' type='text' value='".$_settings['autor']."' style='width:100%;'></td></tr>
		<tr><td>".$locale[572]."</td><td><input name='keywords' type='text' value='".$_settings['keywords']."' style='width:100%;'></td></tr>
		<tr><td>".$locale[574]."</td><td><input name='copyright' type='text' value='".$_settings['copyright']."' style='width:100%;'></td></tr>
		<tr><td>".$locale[573]."</td><td><input name='description' type='text' value='".$_settings['description']."' style='width:100%;'></td></tr>
		<tr><td>".$locale[589]."</td><td><input "; if($_settings['make_meta'] == '1'){echo " checked ";} echo " name='make_meta' type='checkbox' value='ON'></td></tr>
		<tr><td>".hlp($locale[595])." ".$locale[594]."</td><td><input name='deleted_keywords' type='text' value='".$settings['deleted_keywords']."' style='width:100%;'></td></tr>

		<tr><td>".$locale[741]."</td>
		<td><input name='prevent_indexing_cat' type='checkbox' value='ON'    "; if($_settings['prevent_indexing_cat'] == '1'){echo " checked ";} echo " ></td></tr>
		<tr><td>".$locale[742]."</td><td><input name='prevent_indexing_region' type='checkbox' value='ON' "; if($_settings['prevent_indexing_region'] == '1'){echo " checked ";} echo " ></td></tr>
		<tr><td>".$locale[743]."</td><td><input name='prevent_indexing_sort' type='checkbox' value='ON'   "; if($_settings['prevent_indexing_sort'] == '1'){echo " checked ";} echo " ></td></tr>

        ";

		echo "
		<tr><td colspan='2' class='nameopt'>".$locale[590]."</td></tr>
        
		<tr><td>".hlp($locale[929]).' '.$locale[886]."</td>
            <td>

                <p><label><input "; if($_settings['pay_funct'] == '0') echo ' checked '; echo " type='radio' name='pay_funct' value='0' onclick=\"payblock('none');\"  /> ".$locale[925].''.hlp($locale[930])."</label>
                <p><label><input "; if($_settings['pay_funct'] == '1') echo ' checked '; echo " type='radio' name='pay_funct' value='1' onclick=\"payblock('none');\"  /> ".$locale[926].''.hlp($locale[931])."</label>
                <p><label><input "; if($_settings['pay_funct'] == '2') echo ' checked '; echo " type='radio' name='pay_funct' value='2' onclick=\"payblock('none');\"  /> ".$locale[927].''.hlp($locale[932])."</label>
                <p><label><input "; if($_settings['pay_funct'] == '3') echo ' checked '; echo " type='radio' name='pay_funct' value='3' onclick=\"payblock('block');\" /> ".$locale[928].''.hlp($locale[933])."</label>
        			<div id='payblock' "; if($_settings['pay_funct'] != '3'){echo "style='display:none;'";} echo ">
                    <br />
        	            <div style='border-top:1px dotted silver; width:100%; margin-left:10px;'>
         				<input name='num_limit' type='text' value='".$_settings['num_limit']."' size='3' style='margin:2px;'> ".$locale[820]."
        	            </div>
        			</div>
            </td>
        </tr>
        

		</td></tr>
		<tr><td>".hlp($locale[624])." ".$locale[623]."</td><td><input name='default_user_balance' type='text' value='".$_settings['default_user_balance']."' style='width:100%;'></td></tr>

		</table>
		</div>
		";

		echo "
		<div align='center'><br />
		<input type='submit' value='".$locale[335]."' >
		</div>


		</form>
		";
		}
	}
?>