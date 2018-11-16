<?php // 1089
if(!$exe){
set_time_limit(600);

$field_imploder = ', ';

function str2low($str){
    return mb_strtolower($str, 'UTF-8');
}
function array_searchi($str, $array){
    $str = str2low($str, 'UTF-8');
    $array = array_map('str2low', $array);
    return array_search($str, $array);
}

function fixtmpfilename($ext, $field, $id, $title)
    {
    $name = strtolower(cpu($title));
    if(strlen($name) < 3)
        {
        $name = strtolower(make_password(5));
        }
    return $id.'_'.$field.'_'.$name.'.'.$ext;
    }

function save_tags($tags, $id){
    global $locale, $settings;
    
    $tagstmp = explode(',', $tags);
    if(count($tagstmp) > 0){
        foreach($tagstmp as $k => $v){
            if(trim($v) == "") unset($tagstmp[$k]);
        }
    }
    $tags = implode(',', $tagstmp);
    
    $_POST['tagsinput'] = trim($tags);
    $check['tagsinput'] = trim($tags);
    
    $save_id = $id;
    if($_POST['tagsinput'] != ""){
        include(COREPATH.'save_tags.php');
    }
}

function make_select_array($cats_id, $default = 'none', $truncate = 100, $seporator = ' / ',  $id = 0)
	{
    static $array = array();
    if($id == 0) $array = array();
	if(count($cats_id)){
	    foreach($cats_id as $k => $v){
	        if($v['parent'] == $id)
		        {
                $selected = ($k == $default) ? 'selected' : '';
	            $title = array();
	            foreach(array_reverse(get_parents($v['id'], $cats_id)) as $vv){
	                $title[] = $cats_id[$vv]['name'];
	            }
		        $title[]  = $v['name'];
		        $title = implode($seporator, $title);
                $cc = mb_strlen($title, 'UTF-8') - $truncate;
				if(mb_strlen($title, 'UTF-8') > $truncate){
				    $title = '...'.mb_substr($title, $cc, $truncate, 'UTF-8');
				}
                $r = true;
                foreach($cats_id as $v2){
                    if($v2['parent'] == $k){
                        $r = false;
                        break;
                    }
                }
                if($r) $array[] = '<option value="'.$v['id'].'" '.$selected.'>'.$title.'</option>';
                //array('id' => $v['id'], 'name' => $title, 'selected' => $selected);
	            make_select_array($cats_id, $default, $truncate, $seporator,  $k);
		        }
		    }
	    }
	if($id == 0)
	    {
		return implode("\r\n", $array);
	    }
	}	
        
    if(!isset($settings['importcsv'])){
        $settings['importcsv']['def_user'] = 0;
        $settings['importcsv']['def_cat'] = 24;
        $settings['importcsv']['def_region'] = 2;
        $settings['importcsv']['pub'] = 365;
        $settings['importcsv']['html'] = 1;
        $settings['importcsv']['br'] = 1;
        $settings['importcsv']['encoding'] = 'CP1251';
        $settings['importcsv']['sep'] = ';';
        dbquery("INSERT INTO ".PREF."settings SET k='importcsv', v='".addslashes(serialize($settings['importcsv']))."' ");
    }else{
        $settings['importcsv'] = unserialize($settings['importcsv']);
    }
    
    
    if(isset($_POST['cat_id'])){
        $settings['importcsv']['def_user'] = $_POST['user_id'];
        $settings['importcsv']['def_cat'] = $_POST['cat_id'];
        $settings['importcsv']['def_region'] = $_POST['region_id'];
        $settings['importcsv']['pub'] = $_POST['days'];
        $settings['importcsv']['html'] = ($_POST['html'] == 'ON') ? '1' : '0';
        $settings['importcsv']['br'] = ($_POST['br'] == 'ON') ? '1' : '0';
        $settings['importcsv']['encoding'] = $_POST['encoding'];
        $settings['importcsv']['sep'] =  $_POST['sep'];
        dbquery("UPDATE ".PREF."settings SET v='".addslashes(serialize($settings['importcsv']))."' WHERE k='importcsv'");
    }
    

    
    if(file_exists($_FILES['file']['tmp_name'])){
        $tmpfilename = make_password(15);
        move_uploaded_file($_FILES['file']['tmp_name'], FULLPATH.'uploads/temp/'.$tmpfilename.'.ptmp');
        header('Location: ?unit='.$unit.'&act=file&name='.$tmpfilename);
    }
    
    if(!isset($fields)){
        include(COREPATH.'fields.php');
    }

    $pfields = array();
    $pfields['none'] = $locale[364];
    $pfields['title'] = $locale[273];
    $pfields['text'] = $locale[74];
    $pfields['email'] = $locale[21];
    $pfields['user'] = $locale[281];
    $pfields['tags'] = $locale[1077];
    foreach($fields as $k=>$v){
        $pfields[$k] = $v['name'];
    }
    
}else{

    echo "
    <style>
    .ok{
        padding:10px;
        margin-top:10px;
        margin-bottom:10px;
    }
    </style>
    ";

    $encoding = array(
    				    'CP1251',
    				    'UTF-8',
    				    'CP866',
    				    'MacCyrillic',
    				    'MacUkraine',
    				    'KOI8-R',
    				    'KOI8-U',
    				    'KOI8-RU',
    				    'ISO-8859-1'
    					);
    if($act == ""){
        
		if(is_numeric($settings['importcsv']['def_user']))
			{
		    $res = dbquery("SELECT name FROM ".PREF."users WHERE id=".$settings['importcsv']['def_user']);
		    $dat = dbarray($res);
		    $username = $dat['name'];
			}
		else
			{
		    $username = "";
			}
        if($username == "")$username=$locale[364];

		echo "
        
		<script>
		function select_user()
			{
			window.open('".$settings['patch']."admin/?unit=select_user','name','toolbar=0,location=0,directories=0,menuBar=0,resizable=0,scrollbars=yes,width=400,height=500,left=16,top=16');
			}

		function switch_mode(type)
			{
			document.getElementById('mode_' + type).style.display = 'none';
			if(type == 'main')
				{
			    document.getElementById('mode_full').style.display = 'block';
				}
			else(type == 'full')
				{
			    document.getElementById('mode_main').style.display = 'block';
				}

			}
		</script>
        <div align='center'>
        <form name='imp' action='' method='POST' enctype='multipart/form-data'>        

    		<table width='600' class='add_item'>
    			<tr>
    				<td>".hlp($locale[705]).'&nbsp;'.$locale[703]."</td>
    				<td>
                        ". ajax_select('cat', 'cat_id', $settings['importcsv']['def_cat'])."
    				</td>
    			</tr>
    			<tr>
    				<td>".hlp($locale[706]).'&nbsp;'.$locale[704]."</td>
    				<td>
                        ". ajax_select('region', 'region_id', $settings['importcsv']['def_region'])."
    				</td>
    			</tr>
    			<tr>
    				<td>".hlp($locale[708]).'&nbsp;'.$locale[707]."</td>
    				<td>
    					<span id='user' style='font-weight:bold;'>".$username."</span>
                        <a href='javascript:select_user();' class='dashed_link'>".$locale[339]."</a>
    					<input  id='user_id' name='user_id' type='hidden' value='".$settings['importcsv']['def_user']."'>
    				</td>
    			</tr>
    			<tr>
    				<td>".hlp($locale[711]).'&nbsp;'.$locale[78]."</td>
    				<td><input name='days' type='text' value='".$settings['importcsv']['pub']."' size='5'></td>
    			</tr>
    			<tr>
    				<td>".$locale[729]."</td>
    				<td><input name='html' type='checkbox' value='ON'"; if($settings['importcsv']['html'] == '1'){echo " checked";} echo "></td>
    			</tr>
    			<tr>
    				<td>".$locale[730]."</td>
    				<td><input name='br' type='checkbox' value='ON'"; if($settings['importcsv']['br'] == '1'){echo " checked";} echo "></td>
    			</tr>
    			<tr>
    				<td>".$locale[731]."</td>
    				<td>
    					<select size='1' name='encoding'>
    						";
    						foreach($encoding as $v)
    							{
    						    echo "<option value='".$v."'";
    						    if($settings['importcsv']['encoding'] == $v){echo " selected ";}
    						    echo  ">".$v."</option>";
    							}
    						echo   "
    					</select>
    				</td>
    			</tr>
    			<tr>
    				<td>".hlp('Один символ. Обычно это зяпятая или толчка с запятой').'&nbsp;'.'Разделитель полей'."</td>
    				<td><input name='sep' type='text' value='".$settings['importcsv']['sep']."' size='10'></td>
    			</tr>
    
        			<tr>
        				<td><b>".$locale[721]."</b></td>
        				<td><input name='file' type='file'></td>
        			</tr>
    
    		</table>

    		<div align='center' style='margin:5px;'><input type='submit' name='submit1' value=' Сохранить настройки и продолжить &raquo; '></div>
    		<input name='post_filter' type='hidden' value='false'>
		</form>
                            
		</div>
		";
    }elseif($act == 'file' && $_GET['name'] != ''){
        if(isset($_POST['del'])){
            if(is_array($_POST['del'])){
                if(count($_POST['del']) > 0){
                    dbquery("DELETE FROM ".PREF."db WHERE id IN(".implode(',', $_POST['del']).") ");
                    dbquery("DELETE FROM ".PREF."db_fields WHERE message IN(".implode(',', $_POST['del']).") ");
                    echo "
                    <div class='error'>
                        ".$locale[334]."
                    </div>
                    ";
                }
            }
        }
        //pr($settings['importcsv']);
        $path = FULLPATH.'uploads/temp/'.$_GET['name'].'.ptmp';
        if(file_exists($path)){
            $row = 1;
            if(($handle = fopen($path, "r")) !== FALSE) {
                $pdata = array();
                while (($data = fgetcsv($handle, 0, $settings['importcsv']['sep'])) !== FALSE) {
                    $num = count($data);
                    $row++;
                    for ($c=0; $c < $num; $c++) {
                        $v = iconv($settings['importcsv']['encoding'], 'UTF-8', $data[$c]);
                        $pdata[$row][$c] = $v;
                    }
                }
                fclose($handle);
                if($c < 2){
                    echo "
                    <div class='error'>
                        ".$locale[1078]."
                    </div>
                    <input type=button onclick='document.location.href=\"?unit=$unit\"' value='".$locale[1079]."'>
                    ";
                }else{
                    $form = true;
                    if(isset($_POST['ifields'])){
                        if(is_array($_POST['ifields'])){
                            echo '<form method=post name=import_done action="">';
                            include(COREPATH.'imglib.php');
                            $ifields = $_POST['ifields'];
                            $err = array();
                            if(!in_array('text', $ifields)) $err[] = $locale[1080].' &laquo;'.$locale[74].'&raquo;';
                            if(count($err) == 0){
                                $username = 'none';
                        		if(is_numeric($settings['importcsv']['def_user'])){
                            		    $res = dbquery("SELECT name FROM ".PREF."users WHERE id=".$settings['importcsv']['def_user']);
                            		    $dat = dbarray($res);
                            		    $username = $dat['name'];
                        			}
                                $import_counter = 0;
                                foreach($pdata as $k => $v){
                                    
                                    
                                    
                            	    $sql = "INSERT INTO ".PREF."db SET
                            	    uid='".md5(serialize($v))."',
                            	    ip='".$_SERVER['REMOTE_ADDR']."',
                            	    cat='".$settings['importcsv']['def_cat']."',
                                    region='".$settings['importcsv']['def_region']."',
                            	    date_add='".$settings['time']."',
                            	    date_del='".($settings['time'] + 86400*$settings['importcsv']['pub'])."',
                            	    status='1',
                            	    sendmail='1',";
                                    
                                    $user_email = '';
                                    if(in_array('email', $ifields)){
                                        $email_keys = array_keys($ifields, 'email');
                                        foreach($email_keys as $email_key){
                                            if($v[$email_key] != ""){
                                                if(email_check($v[$email_key])){
                                                    $user_email = $v[$email_key];
                                                    break;
                                                }
                                            }
                                        }

                                    }
                                    
                                    $user = "";
                                    if(in_array('user', $ifields)){
                                        $user_key = array_search('user', $ifields);
                                        //foreach($user_keys as $user_key){
                                            if($v[$user_key] != ""){
                                                $user = trim($v[$user_key]);
                                                //break;
                                            }
                                        //}
                                    }
                                    if($user == "" && $user_email != ""){
                                        $user = explode('@', $user_email);
                                        $user = $user[0];
                                    }
                                  
                                    $text = "";
                                    $text_keys = array_keys($ifields, 'text');
                                    if(count($text_keys) > 0){
                                        $tmp = array();
                                        foreach($text_keys as $text_key){
                                            if(trim($v[$text_key]) != "")
                                            $tmp[] = trim($v[$text_key]);
                                        }
                                        $text = implode($tmp, $field_imploder);
                                        $text = trim($text);
                                    }
                                    
                                    $text = wordwrap_utf8(trim($text),50);
                                    
                                    $title = "";
                                    if(in_array('title', $ifields)){
                                        $title_keys = array_keys($ifields, 'title');
                                        $tmp = array();
                                        foreach($title_keys as $title_key){
                                            if(trim($v[$title_key]) != "")
                                            $tmp[] = trim($v[$title_key]);
                                        }
                                        $title = implode($tmp, $field_imploder);
                                        $title = trim($title);
                                    }
                                    if($title == ""){
                                        $title = $text;
                                    }
                                    
                                    if(mb_strlen($title, 'UTF-8') > 150){
                                        $title = mb_substr($title, 0, 150, 'UTF-8');
                                    }
                                    $title = wordwrap_utf8(trim($title),50);



                                    
                                    if($user_email != ""){
                                        if($user == "") $user = $username;
                                        $sql .= "
                                        user='".$user."',
                                	    email='".$user_email."',
                                        ";
                                    }else{
                                        $sql .= "
                                        user_id='".$settings['importcsv']['def_user']."',
                                        ";
                                    }
                                    
                                    if($settings['importcsv']['html'] != 1){
                                        $text = strip_tags($text);
                                    }
                                    if($settings['importcsv']['br'] == 1){
                                        $text = nl2br($text);
                                    }
                                    $text = trim($text);
                                    $text = addslashes($text);
                                    $title = addslashes($title);
                                    $sql .= "
                            	    title='".wordwrap_utf8(trim($title),50)."',
                            	    text='".$text."',
                            	    marked='0',
                                    approved='1',
                            	    raised='0'";
                                    

                                    if($title != "" && $text != ""){
                                        $res = dbquery($sql); 
                                    }else{
                                        $res = false;
                                    }
                                      
                                    
                                    if($res){
                                        
                                        $message = dbarray(dbquery("SELECT LAST_INSERT_ID() as id"));
                                        $message = $message['id']; 
                                        echo '<input type=hidden name="del[]" value="'.$message.'">';
                                        $import_counter++;
                                       
                                       
                                       
                                        $tags = "";
                                        if(in_array('tags', $ifields)){
                                            $tags_keys = array_keys($ifields, 'tags');
                                            $tmp = array();
                                            foreach($tags_keys as $tags_key){
                                                if(trim($v[$tags_key]) != "")
                                                $tmp[] = trim($v[$tags_key]);
                                            }
                                            $tags = implode($tmp, $field_imploder);
                                            save_tags($tags, $message);
                                        }                                    
                                       
                                       
                                        //message 	field 	value
                                        $sql_fields = array();
                                        
                                        foreach($ifields as $f_num => $f_id){
                                            if(substr($f_id, 0, 2) == 'f_'){
                                                
                                                $f_value = false;
                                                $id = substr($f_id, 2);
    
                                                if(isset($fields[$f_id]) && $v[$f_num] != ""){
                                                    
                                                    $v[$f_num] = trim($v[$f_num]);
                                                    
                                                    if($fields[$f_id]['type'] == 'f' || $fields[$f_id]['type'] == 'i'){
                                                       $ext = get_ext($v[$f_num]);
                                                       $tmp = array_searchi($ext, $fields[$f_id]['values_array']);
                                                       
                                                       if(array_searchi($ext, $fields[$f_id]['values_array']) !== false){
                                                        
                                                        if($filedata = file_get_contents($v[$f_num])){
                                                            $filename = fixtmpfilename($ext, $id, $message, $title);
                                                            $tmpfile = FULLPATH.'uploads/temp/parser.dat';
    
                                                            if($fields[$f_id]['type'] == 'i'){                                                            
                                                        	    $info = @getimagesize($tmpfile);
                                                                file_put_contents($tmpfile, $filedata);
                                                                if($info){
                                                            		convert_img($ext, $settings['img_small_width'], $settings['img_small_height'], $tmpfile, FULLPATH."uploads/images/ts/".$filename, FULLPATH.'images/watermark_small.png');
                                                            		convert_img($ext, $settings['img_big_width'], $settings['img_big_height'], $tmpfile, FULLPATH."uploads/images/tb/".$filename, FULLPATH.'images/watermark_big.png');
                                                                    $f_value = $filename;
                                                                }
                                                            }else{
                                                                //pr(FULLPATH.'uploads/files/'.$filename);
                                                                file_put_contents(FULLPATH.'uploads/files/'.$filename, $filedata);
                                                            }
                                                        }
                                                       }
                                                       
                                                       
                                                       
                                                       
                                                    }elseif($fields[$f_id]['type'] == 's' ||  $fields[$f_id]['type'] == 'c' ||  $fields[$f_id]['type'] == 'r'){
                                                        
                         
                                                        $f_value = array_searchi($v[$f_num], $fields[$f_id]['values_array']);
                                                        
                                                    }elseif($fields[$f_id]['type'] == 'p'){
                                                        $v[$f_num] = str_replace(',', '.', $v[$f_num]);
                                                        if(is_numeric(str_replace('.', '', $v[$f_num]))){
                                                            $f_value = $v[$f_num];
                                                        }
                                                    }elseif($fields[$f_id]['type'] == 'y'){
                                            			$query = parse_url($v[$f_num]);
                                        
                                                        if(!isset($query['host'])) $query['host'] = "";
                                                        if(!isset($query['scheme'])) $query['scheme'] = "";
                                                        if(!isset($query['path'])) $query['path'] = "";
                                                        if(!isset($query['query'])) $query['query'] = "";
                                        
                                        			    if($query['host'] == 'youtu.be'){
                                        			        $query['query'] = 'v='.substr($query['path'], 1);
                                                            $query['path'] = '/watch';
                                        			    }
                                            			if(($query['host'] == 'www.youtube.com' || $query['host'] == 'youtube.com' || $query['host'] == 'youtu.be'|| $query['host'] == 'www.youtu.be') && ($query['scheme'] == 'http' || $query['scheme'] == 'https') && $query['path'] == '/watch'){
                                            				$query['query'] = @parse_request($query['query']);
                                            				if(!preg_match("/[^a-z,A-Z,0-9,\-,_]/", $query['query']['v'])){
                                            				    $v[$f_num] = $query['query']['v'];
                                           					}
                                           				}
                                                    }else{
                                                        if($v[$f_num] != ""){
                                                            $f_value = trim(strip_tags($v[$f_num]));
                                                        }
                                                        
                                                    }
                                                }
                                                
                                                if($f_value !== false){
                                                    if(isset($sql_fields[$id])){
                                                        if($fields[$f_id]['type'] == 't' || $fields[$f_id]['type'] == 'v'){
                                                            $sql_fields[$id][] = $f_value;
                                                        }
                                                    }else{
                                                        $sql_fields[$id][0] = $f_value;
                                                    }
                                                    
                                                }
                                            }
                                        }   
                                    }

                                    
                                    if(count($sql_fields) > 0){
                                        foreach($sql_fields as $fk=>$fv){
                                            $fv  = implode($field_imploder, $fv);
                                            
                                            dbquery("INSERT INTO ".PREF."db_fields SET message=".$message.", field = ".$fk.", value = '".addslashes(trim($fv))."'");
                                        }
                                    } 
                                    edit_cat_counter('+1', $settings['importcsv']['def_cat'], $settings['importcsv']['def_region'], $message); 
                                }
                            }
                        }
                        
                        $form = false;
                        
                        echo "
                        <div class=ok>
                        <p>".$locale[1081]." ".om_number($import_counter, array($locale[1082], $locale[1083], $locale[1084]))."</p>
                        </div>
                        <input type=submit value='Удалить эти записи'>
                        <input type=button onclick='document.location.href=\"?unit=$unit&act=clean\"' value='".$locale[1085]."'>
                        </form>
                        ";
                    }
                    
                    if($form){
                        echo "
                        <h3>Предпросмотр импорта (".om_number(count($pdata), array($locale[1082], $locale[1083], $locale[1084])).")</h3>
                        <p>".$locale[1086]."</p>
                        <form name='imp' action='' method='POST'>                        
                        <table border=1>
                        ";
                        //pr($pdata);
                        if(count($pdata) > 0){
                            echo "<tr>";
                            foreach($pdata[2] as $k => $v){
                                echo "
                                <td>
                                <select name='ifields[$k]'>
                                ";
                                foreach($pfields as $kk=>$vv){
                                    echo "<option value='$kk'";
                                    if($_POST['ifields'][$k] == $kk) echo ' selected ';
                                    echo ">$vv</option>";
                                }
                                echo "
                                </select>
                                </td>
                                ";
                            }
                            echo "</tr>";
                            foreach($pdata as $row_num => $row){
        
                                echo "<tr>";
                                if(count($row) > 0){
        
                                    foreach($row as $k => $v){
                                        echo "
                                        <td>".$v."</td>
                                        ";
                                    }
        
                                }
                                echo "</tr>";
                                if($row_num > 5){
                                    echo "<tr>";
                                    foreach($row as $k => $v){
                                        echo "
                                        <td>...</td>
                                        ";
                                    }
                                    echo "</tr>";
                                    break;//?unit='.$unit.'&act=file&name='.$tmpfilename
                                }
                            }
        
                        }
                        echo "
                        </table>
                        ";
        		       	echo "
                        <br />
        		       	<div align='left'>
                        <input type='button' onclick=\"document.location.href='?unit=".$unit."'\" value='&laquo; ".$locale[156]."'>
        		       	<input type='submit' value='".$locale[1088]." &raquo; '>
        		       	</div>
                        </form>
        		       	";                        
                    }

                }

                
                
            }  
        }
    

    
    }elseif($act=='clean'){
        $files = glob(FULLPATH.'uploads/temp/*.ptmp');
        if(count($files) > 0){
            foreach($files as $file){
                unlink($file);
            }
        }
        echo "
        <div class=ok>
            Завершено!
        </div>
        <input type=button onclick='document.location.href=\"?unit=$unit\"' value='".$locale[1079]."'>

        ";
    }
}
?>