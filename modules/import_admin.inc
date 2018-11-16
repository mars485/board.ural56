<?php    //700
if(!$exe)
	{
	$sep_rows =   '['.chr(1).']';
	$sep_fields = '['.chr(2).']';
    function convcat($cat)
	    {
        $cat = trim($cat);
        $cat = strtolower_utf8($cat);
        $cat = str_replace('ё', 'е', $cat);
        $cat = str_replace('  ', ' ', $cat);
        $cat = str_replace('  ', ' ', $cat);
        return $cat;
	    }
	if(get_magic_quotes_gpc())
		{
		function stripslashes_deep($value)
			{
			if( is_array($value) )
				{
				$value = array_map('stripslashes_deep', $value);
				}
			elseif ( !empty($value) && is_string($value) )
				{
				$value = stripslashes($value);
				}
			return $value;
			}
        if(!isset($__POST)) $__POST = array();
		$__POST    = stripslashes_deep($__POST);
		$_COOKIE  = stripslashes_deep($_COOKIE);
		$_COOKIE  = stripslashes_deep($_COOKIE);
		}

	if(isset($_POST['submit1']))
		{
        if(!isset($__POST['html'])) $__POST['html'] = "";
        if(!isset($__POST['br'])) $__POST['br'] = "";
        
	    setcookie('import_cat_id', $__POST['cat_id'], $settings['time'] + 31536000);
	    setcookie('import_region_id', $__POST['region_id'], $settings['time'] + 31536000);
	    setcookie('import_user_id', $__POST['user_id'], $settings['time'] + 31536000);
	    setcookie('import_days', $__POST['days'], $settings['time'] + 31536000);
	    setcookie('import_mode', $__POST['mode'], $settings['time'] + 31536000);
	    setcookie('import_title_count', $__POST['title_count'], $settings['time'] + 31536000);
	    setcookie('import_symb_cat', $__POST['symb_cat'], $settings['time'] + 31536000);
	    setcookie('import_symb_field', $__POST['symb_field'], $settings['time'] + 31536000);
	    setcookie('import_symb_main', $__POST['symb_main'], $settings['time'] + 31536000);
	    setcookie('import_html', $__POST['html'], $settings['time'] + 31536000);
	    setcookie('import_br', $__POST['br'], $settings['time'] + 31536000);
	    setcookie('import_encoding', $__POST['encoding'], $settings['time'] + 31536000);
		}
    if($act == 'view')
	    {


		function make_cat_import_array2($cats_id, $seporator,  $id = 0)
			{
		    static $c_array = array();
		    if($id == 0){$c_array = array();}

			if(count($cats_id))
				{
			    foreach($cats_id as $k => $v)
				    {
			        if($v['parent'] == $id)
				        {

			            $titles = array();
			            $parends = get_parents($v['id'], $cats_id);
			            $parends = array_reverse($parends);
			            foreach($parends as $vv)
				            {
			                $titles[] = $cats_id[$vv]['name'];
				            }
				        $titles[]  = $v['name'];

				        $title = implode($seporator, $titles);

						$c_array[$v['id']] = convcat($title);
			            make_cat_import_array2($cats_id, $seporator,  $k);

				        }
				    }
			    }
			if($id == 0)
			    {
				return $c_array;
			    }
			}

		$cat_import_array = make_cat_import_array2($cats_id, '/');
		echo "
		<html>
		<head>
		<title></title>
		</head>
		<body style='font-size:10px; font-family:Verdana;'>
		";
        if(file_exists(FULLPATCH.'uploads/'.$_GET['file']))
	        {

	        $content = file_get_contents(FULLPATCH.'uploads/'.$_GET['file']) ;
            
	        $content = explode($sep_rows, $content);

	        foreach($content as $v)
		        {
		          
		        if(trim($v) != "")
			        {
			        $v = explode($sep_fields, $v);
		            echo "
		            <b>".$locale[17]."</b>: ".$cat_import_array[$v[0]]."<br />
		            <b>".$locale[72]."</b>: ".$v[8]."<br />
		            <b>".$locale[74]."</b>: ".$v[9]."
		            <hr>
		            ";
		            }
	            }
	        }
	    exit("</body></html>");
	    }
	}

if($exe)
	{
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
	if($act == "")
		{
        if(!isset($_COOKIE['import_user_id'])) $_COOKIE['import_user_id'] = "";
        if(!isset($_COOKIE['import_cat_id'])) $_COOKIE['import_cat_id'] = "";
        if(!isset($_COOKIE['import_region_id'])) $_COOKIE['import_region_id'] = "";
        if(!isset($_COOKIE['import_days'])) $_COOKIE['import_days'] = "";
        if(!isset($_COOKIE['import_html'])) $_COOKIE['import_html'] = "";
        if(!isset($_COOKIE['import_br'])) $_COOKIE['import_br'] = "";
        if(!isset($_COOKIE['import_encoding'])) $_COOKIE['import_encoding'] = "";
        if(!isset($_COOKIE['import_mode'])) $_COOKIE['import_mode'] = "";
        if(!isset($_COOKIE['import_title_count'])) $_COOKIE['import_title_count'] = "";


        $_COOKIE = stripslashes_recursive($_COOKIE);

		if(is_numeric($_COOKIE['import_user_id']))
			{
		    $res = dbquery("SELECT name FROM ".PREF."users WHERE id=".$_COOKIE['import_user_id']);
		    $dat = dbarray($res);
		    $username = $dat['name'];
			}
		else
			{
		    $username = "";
			}
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
        <form name='imp' action='?unit=import&act=check' method='POST' enctype='multipart/form-data'>
		<div align='center' id='s123123'>
		<table width='600' class='add_item'>
			<tr>
				<td>".hlp($locale[705]).'&nbsp;'.$locale[703]."</td>
				<td>
					<select name='cat_id'>
						".make_select('cat_id', $cats_id,     $_COOKIE['import_cat_id'], $substr,' / ')."
					</select>
				</td>
			</tr>
			<tr>
				<td>".hlp($locale[706]).'&nbsp;'.$locale[704]."</td>
				<td>
					<select name='region_id'>
						".make_select('region_id', $regions_id_, $_COOKIE['import_region_id'], $substr,' / ')."
					</select>
				</td>
			</tr>
			<tr>
				<td>".hlp($locale[708]).'&nbsp;'.$locale[707]."</td>
				<td>

					<a href='javascript:select_user();'>[".$locale[339]."]</a>
					<span id='user' style='font-weight:bold;'>".$username."</span>
					<input  id='user_id' name='user_id' type='hidden' value='".$_COOKIE['import_user_id']."'>
				</td>
			</tr>
			<tr>
				<td>".hlp($locale[711]).'&nbsp;'.$locale[78]."</td>
				<td><input name='days' type='text' value='".$_COOKIE['import_days']."' size='5'></td>
			</tr>
			<tr>
				<td>".$locale[729]."</td>
				<td><input name='html' type='checkbox' value='ON'"; if($_COOKIE['import_html']){echo " checked";} echo "></td>
			</tr>
			<tr>
				<td>".$locale[730]."</td>
				<td><input name='br' type='checkbox' value='ON'"; if($_COOKIE['import_br']){echo " checked";} echo "></td>
			</tr>
			<tr>
				<td>".$locale[731]."</td>
				<td>
					<select size='1' name='encoding'>
						";
						foreach($encoding as $v)
							{
						    echo "<option value='".$v."'";
						    if($_COOKIE['import_encoding'] == $v){echo " selected ";}
						    echo ">".$v."</option>";
							}
						echo "
					</select>
				</td>
			</tr>
			<tr>
				<td>".$locale[712]."</td>
				<td>
				<input name='mode' type='radio' value='main' onclick=\"switch_mode('full');\" "; if($_COOKIE['import_mode'] == 'main' || $_COOKIE['import_mode'] == ""){echo ' checked';} echo ">&nbsp;".$locale[713]."<br />
				<input name='mode' type='radio' value='full' onclick=\"switch_mode('main');\" "; if($_COOKIE['import_mode'] == 'full'){echo ' checked';} echo ">&nbsp;".$locale[714]."<br />
				</td>
			</tr>
			</table>
            <div id='mode_main' "; if($_COOKIE['import_mode'] == 'full'){echo " style='display:none;'";} echo ">
	            <table width='600'  class='add_item'>
					<tr>
						<td>".$locale[720]."</td>
						<td><input name='title_count' type='text' value='".$_COOKIE['import_title_count']."' size='5'></td>
					</tr>
				</table>
            </div>


            <div id='mode_full' "; if($_COOKIE['import_mode'] == 'main' || $_COOKIE['import_mode'] == ""){echo " style='display:none;'";} echo ">
            <table width='600'  class='add_item'>
				<tr>
					<td>".hlp($locale[718]).'&nbsp;'.$locale[717]."</td>
					<td><input name='symb_cat' type='text' value='".$_COOKIE['import_symb_cat']."' size='10'></td>
				</tr>
				<tr>
					<td>".$locale[719]."</td>
					<td><input name='symb_field' type='text' value='".$_COOKIE['import_symb_field']."' size='10'></td>
				</tr>
            </table>
            </div>

            <table width='600'  class='add_item'>
			<tr>
				<td>".hlp($locale[716]).'&nbsp;'.$locale[715]."</td>
				<td><input name='symb_main' type='text' value='".$_COOKIE['import_symb_main']."' size='10'></td>
			</tr>
			<tr>
				<td><b>".$locale[721]."</b></td>
				<td><input name='file' type='file'></td>
			</tr>

		</table>
		<div align='center' style='margin:5px;'><input type='submit' name='submit1' value=' ".$locale[125]." '></div>
		<input name='post_filter' type='hidden' value='false'>
		</form>
		</div>
		";
		}
	elseif($act == 'check')
		{
		$err = array();
		$tmpfilename = make_password(15).'.tmp';
		if(!file_exists($_FILES['file']['tmp_name']))
			{
		    $err[] = $locale[100];
			}
		if($__POST['user_id'] == "")
			{
		    $err[] = $locale[722];
			}
		if($__POST['days'] == "")
			{
		    $err[] = $locale[723];
			}
		if($__POST['symb_main'] == "")
			{
		    $err[] = $locale[724];
			}
		if($_POST['mode'] == 'full')
			{
			if($__POST['symb_cat'] == "")
				{
			    $err[] = $locale[725];
				}
			if($__POST['symb_field'] == "")
				{
			    $err[] = $locale[726];
				}
			}
		elseif($_POST['title_count'] == "")
	        {
            $err[] = $locale[727];
	        }

	 	if(count($err) > 0)
		 	{
		    echo "
		    <div align='center'>
			    <div class='error'>
			    <ul>
			    ";
			    foreach($err as $k => $v)
			    {
				echo "<li>".$v."</li>";
			    }
			    echo "
			    </ul>
			    </div>
			</div>
		    ";
	 		}
		else
			{
            $seps = array('symb_field', 'symb_cat', 'symb_main');
            foreach($seps as $v){
                $__POST[$v] = str_replace('\n', "\n", $__POST[$v]);
                $__POST[$v] = str_replace('\r', "\r", $__POST[$v]);
                $__POST[$v] = str_replace('\t', "\t", $__POST[$v]);
            }

			$content = file_get_contents($_FILES['file']['tmp_name']);

			if($__POST['encoding'] != 'UTF-8'){$content = iconv($__POST['encoding'], 'UTF-8', $content);}

            $import_array = array();
			if($__POST['mode'] == 'main')
				{
                $array = array();
                $array = explode($__POST['symb_main'], $content);
                if(count($array) > 0)
	                {
                    foreach($array as $k => $v)
	                    {
                        $import_array[$k]['cat']		= $__POST['cat_id'];
                        $import_array[$k]['region']		= $__POST['region_id'];
                        $import_array[$k]['date_add']	= $settings['time'];
                        $import_array[$k]['date_del']	= $settings['time'] + ($__POST['days'] * 86400);
                        $import_array[$k]['user_id']	= $__POST['user_id'];
                        $import_array[$k]['status']		= 1;
                        $import_array[$k]['sendmail']	= 1;
                        $import_array[$k]['active']		= 1;
                        if(strlen($v) > strip_tags($__POST['title_count']))
	                        {
	                        $import_array[$k]['title']	= substr(strip_tags(trim($v)), 0, $__POST['title_count']).'...';
	                        }
	                    else
		                    {
	                 	    $import_array[$k]['title'] = strip_tags($v);
		                    }
	                    if($__POST['html'] != 'ON')
		                    {
	                 	    $import_array[$k]['text'] = strip_tags($v);
		                    }
		              	else
			              	{
		         		    $import_array[$k]['text'] = $v;
			              	}
	                    if($__POST['br'] != 'ON')
		                    {
	                 	    $import_array[$k]['text'] = nl2br($v);
		                    }
	                    }
	                }
				}
			else
				{

				function make_cat_import_array($cats_id, $seporator,  $id = 0)
					{
				    static $c_array = array();
				    if($id == 0){$c_array = array();}

					if(count($cats_id))
						{
					    foreach($cats_id as $k => $v)
						    {
					        if($v['parent'] == $id)
						        {

					            $titles = array();
					            $parends = get_parents($v['id'], $cats_id);
					            $parends = array_reverse($parends);
					            foreach($parends as $vv)
						            {
					                $titles[] = $cats_id[$vv]['name'];
						            }
						        $titles[]  = $v['name'];

						        $title = implode($seporator, $titles);

								$c_array[convcat($title)] = $v['id'];
					            make_cat_import_array($cats_id, $seporator,  $k);

						        }
						    }
					    }
					if($id == 0)
					    {
						return $c_array;
					    }
					}



				$cat_import_array = make_cat_import_array($cats_id, $__POST['symb_cat']);

                $array = array();
                $array = explode($__POST['symb_main'], $content);

                if(count($array) > 0)
	                {
                    foreach($array as $k => $v2)
	                    {
	                    list($cat, $title, $v) = explode($__POST['symb_field'], $v2);

                        $cat =  convcat($cat);
						if($title == "")
							{
	                        if(strlen(strip_tags($v)) > 100)
		                        {

		                        $title	= substr(strip_tags(trim($v)), 0, 100).'...';
		                        }
		                    else
			                    {
		                 	    $title = strip_tags($v);
			                    }
							}
                        if($cat == "")
	                        {
                            $cat = $__POST['cat_id'];
	                        }
                        else
	                        {
                            $cat = $cat_import_array[$cat];
                            if($cat == "")
	                            {
                                $cat = $__POST['cat_id'];
	                            }
	                        }

                        $import_array[$k]['cat']		= $cat;
                        $import_array[$k]['region']		= $__POST['region_id'];
                        $import_array[$k]['date_add']	= $settings['time'];
                        $import_array[$k]['date_del']	= $settings['time'] + ($__POST['days'] * 86400);
                        $import_array[$k]['user_id']	= $__POST['user_id'];
                        $import_array[$k]['status']		= 1;
                        $import_array[$k]['sendmail']	= 1;
                        $import_array[$k]['active']		= 1;
						$import_array[$k]['title']		= $title;

	                    if($__POST['html'] != 'ON')
		                    {
	                 	    $import_array[$k]['text'] = strip_tags($v);
		                    }
		              	else
			              	{
		         		    $import_array[$k]['text'] = $v;
			              	}
	                    if($__POST['br'] != 'ON')
		                    {
	                 	    $import_array[$k]['text'] = nl2br($v);
		                    }
	                    }
	                }
				}
			}


        if(!isset($import_array)) $import_array = array();
        $rows = count($import_array);



        echo "<div align='center'>".$locale[732]." <b>".$rows."</b></div>";
        if($rows > 0)
	        {
	        $write = "";
	        foreach($import_array as $v)
		        {
                $write .= $v['cat'].$sep_fields.$v['region'].$sep_fields.$v['date_add'].$sep_fields.$v['date_del'].$sep_fields.$v['user_id'].$sep_fields.$v['status'].$sep_fields.$v['sendmail'].$sep_fields.$v['active'].$sep_fields.$v['title'].$sep_fields.$v['text'].$sep_rows;
		        }

	        $fp = fopen(FULLPATCH.'uploads/'.$tmpfilename, 'w');
	        fwrite($fp, $write);
	        fclose($fp);
            @chmod(FULLPATCH.'uploads/'.$tmpfilename, '0777');
            echo "<br /><br />
            <div align='center'>
            <b>".$locale[733]."</b><br />
            <iframe style='width:100%; height:400px;' src='?unit=import&act=view&file=".$tmpfilename."'>
            </iframe>
            </div>
            ";
	        }
        echo "
        <table width='500' border='0' align='center'>
        <tr>
        <td align='left'><input type='button' onclick=\"document.location.href='?unit=import'\" value='".$locale[156]."'></td>
        <td align='right'><input type='button' onclick=\"document.location.href='?unit=import&act=write&file=".$tmpfilename."'\" value='".$locale[728]."'></td>
        </tr>
        </table>
        ";
	    //move_uploaded_file(, $settings['fullpatch'].make_password());
	    //chmod();
		}

	if($act == 'write')
		{

		if(file_exists(FULLPATCH.'uploads/'.$_GET['file']))
			{
	        if(file_exists(FULLPATCH.'uploads/'.$_GET['file']))
		        {

		        $content = file_get_contents(FULLPATCH.'uploads/'.$_GET['file']) ;
		        $content = explode($sep_rows, $content);

		        foreach($content as $v)
			        {
			        if(trim($v) != "")
				        {
				        $v = explode($sep_fields, $v);
			            if($v[9] != "")
				            {
				      		    dbquery("INSERT INTO ".PREF."db SET
				      		        cat = ".$v[0].",
				      		        region = ".$v[1].",
				      		        date_add = ".$v[2].",
				      		        date_del = ".$v[3].",
				      		        user_id = ".$v[4].",
				      		        status = 1,
				      		        sendmail = 1,
				      		        active = '1',
				      		        title = '".trim($v[8])."',
				      		        text = '".trim($v[9])."'
				      		    ");

			      		    $res = dbquery("SELECT LAST_INSERT_ID()");
							$dat = dbarray($res);
							$message_id = $dat['LAST_INSERT_ID()'];

				            }
			            }
		            }
		       	echo "
		       	<div align='center'>
		       	".$locale[351]."
		       	<br /><br />
		       	<input type='button' onclick=\"document.location.href='?unit=import'\" value='".$locale[156]."'>
		       	</div>
		       	";
		       	@unlink(FULLPATCH.'uploads/'.$_GET['file']);
		        }
			}
		}
	}
?>