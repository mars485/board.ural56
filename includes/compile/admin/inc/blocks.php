<?php
/*
	Скрипт доски объявлений
	Elite-Board 2
	Тихомиров Юрий
	Санкт-Петербург
	2009 - 2010

	версия модуля: 230210
*/


if(!$exe)
	{
	$add_head = "
	<link type='text/css' rel='stylesheet' href='".$settings['patch']."css/calendar/jscal2.css' />
	<link type='text/css' rel='stylesheet' href='".$settings['patch']."css/calendar/border-radius.css' />
	<link type='text/css' rel='stylesheet' href='".$settings['patch']."css/calendar/".$calendar_theme."/".$calendar_theme.".css' />
	<script src='".$settings['patch']."js/calendar/jscal2.js'></script>
	<script src='".$settings['patch']."js/calendar/lang/".$calendar_lang.".js'></script>

	<script type=\"text/javascript\" language=\"javascript\" charset=\"utf-8\">
	// <![CDATA[


	$(document).ready( function () {
		var FROM_CAL = Calendar.setup({
			inputField: \"from\",
          	dateFormat: \"%Y-%m-%d\",
          	trigger: \"from\",
          	bottomBar: false,
          	date: Calendar.intToDate(".date("Ymd")."),
          	min: Calendar.intToDate(10001130),
          	onSelect: function() {
				var date = Calendar.intToDate(this.selection.get());
                END_CAL.args.min = date;

                FROM_CAL.hide();
                END_CAL.redraw();
                END_CAL.focus();
          	}
  		});

		var END_CAL = Calendar.setup({
			inputField: \"to\",
          	dateFormat: \"%Y-%m-%d\",
          	trigger: \"to\",
          	bottomBar: false,
          	date: Calendar.intToDate(".date("Ymd")."),
          	min: Calendar.intToDate(10001130),
          	onSelect: function() {
				var date = Calendar.intToDate(this.selection.get());
				FROM_CAL.args.max = date;

                END_CAL.hide();
          	}
  		});


	});





	// ]]>
	</script>
	";

	$res = dbquery("SELECT * FROM ".PREF."blocks_db");
	$blocks_db = array();
	while($dat = dbarray($res))
		{
	    $blocks_db[$dat['id']] = $dat;
		}

    if($act == 'places' || $act == 'places_edit')
	    {
		$smarty->assign('add_head', $add_head);
		}
	//t(op)/b(ottom)/l(eft)/r(ight)/h(eader)/f(ooter)/m(iddle)
	$b_places['t'] = array('name' => $locale[429], 'hlp' => $locale[436]);
	$b_places['b'] = array('name' => $locale[430], 'hlp' => $locale[437]);
	$b_places['l'] = array('name' => $locale[431], 'hlp' => $locale[438]);
	$b_places['r'] = array('name' => $locale[432], 'hlp' => $locale[439]);
	$b_places['h'] = array('name' => $locale[433], 'hlp' => $locale[440]);
	$b_places['f'] = array('name' => $locale[434], 'hlp' => $locale[441]);
	$b_places['m'] = array('name' => $locale[435], 'hlp' => $locale[442]);


	if($act == 'places_move' && is_numeric($_GET['id']))
		{
		$res = dbquery("SELECT id, sort FROM ".PREF."blocks_places WHERE place='".$_GET['place']."' ORDER by sort");
		$n = 1;
		while($dat = dbarray($res))
			{
		    $fav[$n]['id'] = $dat['id'];
		    $fav[$n]['n'] = $n;
		    if($dat['id'] == $_GET['id']){$start = $n;}
			$n ++;
			}

		$newfav = array();

	   	if(isset($_GET['up']))
	    	{
	 		$fav[($start - 1)]['n'] = $start;
	 		$fav[$start]['n'] = $start - 1;
	    	}

	   	if(isset($_GET['down']))
	    	{
	 		$fav[($start + 1)]['n'] = $start;
	 		$fav[$start]['n'] = $start + 1;
	    	}

		foreach($fav as $v)
			{
			if($v['n'] != "" && $v['id'] != "")
				{
				dbquery("UPDATE ".PREF."blocks_places SET sort='".$v['n']."' WHERE id=".$v['id']);
				}
			}
		header('Location: ?unit=blocks&act=places');
		exit();
		}

	if($act == 'db_save' && $_POST['submit'] != "")
		{
        $name = save_text($_POST['name']);


	    $type = addslashes($_POST['type']);
	    $html = addslashes($__POST['content_'.$type]);

		$sql = "INSERT INTO ".PREF."blocks_db SET
				name='".$name."',
				html='".$html."',
				parent = '".$type."'";
				dbquery($sql);
        header("Location: ?unit=blocks&act=db");
		}

	if($act == 'places_save' && $_POST['submit'] != "")
		{
		if($_POST['reg'] == 'ON')
			{
			$_POST['reg'] = 1;
			}
        else
	        {
            $_POST['reg'] = 0;
	        }

		if($_POST['from'] != "")
			{
			list($Y, $m, $d) = explode('-', trim($_POST['from']));
			$from = mktime(0, 0, 0, $m, $d, $Y);
	        }
		if($_POST['to'] != "")
			{
			list($Y, $m, $d) = explode('-', trim($_POST['to']));
			$to = mktime(0, 0, 0, $m, $d, $Y);
	        }
            
         if($_POST['mod_type'] == 'cat'){
            $_POST['cat'] = $_POST['cat2'];
            if($_POST['cat'] == 0) $_POST['cat'] = '%cat';
         }
		$sql = "INSERT INTO ".PREF."blocks_places SET
				cat='".$_POST['cat']."',
				region='".$_POST['region']."',
				link='".$_POST['link']."',
				reg='".$_POST['reg']."',
				`from`='".$from."',
				`to`='".$to."',
				status=1,
				sort=100000,
				place='".$_POST['place']."'
				";
				dbquery($sql);
        header("Location: ?unit=blocks&act=places");
		}
        if($act == 'savesort'){
            if(isset($_POST['data'])){
                if(is_array($_POST['data'])){
                    if(count($_POST['data']) > 0){
                        foreach($_POST['data'] as $k => $v){
                            dbquery("UPDATE ".PREF."blocks_places SET sort='".intval($k)."' WHERE id=".intval($v));
                        }
                    }
                }
            }
            echo 'ok';
            exit();
		}

	}
else
	{

	include(COREPATH.'admin/inc/get_modules_list.php');
    if(!isset($lk)) $lk = "";
    if(!isset($en)) $en = "";
	echo "
	<script type=\"text/javascript\">

	function switch_area(id)
		{
	    if(id == 'html')
		    {
	 	    document.getElementById('html').style.display = 'block';
	 	    document.getElementById('php').style.display = 'none';
		    }
		else
			{
	 	    document.getElementById('html').style.display = 'none';
	 	    document.getElementById('php').style.display = 'block';
			}
		}

	var trans_replace = {
		  ru_str : \"".$lk."\",
		  en_str : ['".$en."'],
		  translit : function(org_str) {
		    var tmp_str = \"\";
		    for(var i = 0, l = org_str.length; i < l; i++) {
		      var s = org_str.charAt(i), n = this.ru_str.indexOf(s);
		      if(n >= 0) { tmp_str += this.en_str[n]; }
		      else { tmp_str += s; }
		    }
		    return tmp_str;
		  }
		}


	function copy_id(type)
		{
	    var doc_name;
	    var doc_id;
	    doc_name = document.getElementById('title').value;
        if(type == 't')
	        {
            doc_id = document.getElementById('cat').value = trans_replace.translit(doc_name);
	        }
	    else
		    {
		    doc_id = doc_name;
			}
		doc_id = doc_id.replace(/ /g, '-');
		doc_id = doc_id.replace(/,/g, '');
		doc_id = doc_id.replace(/\//g, '');
		document.getElementById('cat').value = doc_id;
		}

	function paste_tag(but)
		{
		var txt = document.getElementById('content_php');

        var txtLen = txt.value.length;
        var selEnd = txt.selectionEnd;

        var txtbefore = txt.value.substring(0,selEnd);
        var txtafter =  txt.value.substring(selEnd, txtLen);

 	    document.getElementById('content_php').value = txtbefore + but.value + txtafter;
		}

	</script>
	";

	if($act == '')
		{
	    echo "
	    <ul id='mod_a'>
		    <li><a href='?unit=blocks&act=db'>".$locale[415]."</a></li>
		    <li class='raspologenie'><a href='?unit=blocks&act=places'>".$locale[416]."</a></li>
	    </ul>
	    ";
		}
	elseif($act == 'db')
    	{
		echo "
		<div align='left'>
		<input type='button' value=' &rarr; ".$locale[420]."' onclick='sh(123123);'>
			<div id='s123123' style='display:none;' align='center'>
			    <form name='form' action='?unit=blocks&act=db_save' method='post'>
	            <FIELDSET style='width:600px;'><LEGEND>".$locale[1087]."</LEGEND>
	            <table width='100%' class='add_item'>
	            <tr><td>".hlp($locale[418])." ".$locale[417]."</td><td><input id='name' name='name' type='text' value='' style='width:100%;'></td></tr>
	            <tr><td>".$locale[468]."</td>
	            	<td>
	            	<input onclick=\"switch_area('html')\" name='type' type='radio' value='html' checked> ".$locale[482]."
	            	<input onclick=\"switch_area('php')\" name='type' type='radio' value='php'> ".$locale[483]."
	            	</td>
	            </tr>
	            <tr><td colspan='2'>
	            <div id='php' style='display: none;'>
	            <div class='phpcode'>&lt;?php<br></div>
	            <textarea id='content_php' name='content_php' style='width:100%; height:350px;' wrap='off'></textarea>
	            <div class='phpcode'>?&gt;</div>
	                <div class='phpbuttons'>
		            <input type='button' value='<b></b>' onclick='paste_tag(this)'>
		            <input type='button' value='<i></i>' onclick='paste_tag(this)'>
		            <input type='button' value='<u></u>' onclick='paste_tag(this)'>
		            <input type='button' value='<p></p>' onclick='paste_tag(this)'>
		            <input type='button' value='<br />' onclick='paste_tag(this)'>
		            <input type='button' value='<center></center>' onclick='paste_tag(this)'>
		            <input type='button' value='<div></div>' onclick='paste_tag(this)'>
		            <input type='button' value='\\\"' onclick='paste_tag(this)'>
		            <input type='button' value='echo \"\";' onclick='paste_tag(this)'>
		            <input type='button' value='pr();' onclick='paste_tag(this)'>
		            <input type='button' value='\\n' onclick='paste_tag(this)'>
	                <input type='button' value='<img src=\"\" width=\"\" height=\"\" alt=\"\" border=\"0\">' onclick='paste_tag(this)'>
	                <input type='button' value='<a href=\"\"></a>' onclick='paste_tag(this)'>
	                <input type='button' value='<a href=\"mailto:\"></a>' onclick='paste_tag(this)'>
	                </div>

	            </div>
	            <div id='html'>
                <textarea class='ckeditor' name='content_html'></textarea>
                </div>
	            </td></tr>
	            <tr><td colspan='2'>
	            * ".$locale[422]."
	            <ul>
		            <li>%PATCH% - ".$locale[426]."</li>
		            <li>%block_user% - ".$locale[425]."</li>
		            <li>%block_nav% - ".$locale[424]."</li>
		            <li>%block_tags% - ".$locale[423]."</li>
		            <li>%block_counter% - ".$locale[427]."</li>
	            </ul>
	            </td></tr>

	            </table>
	            <div align='center' style='margin:5px;'><input type='submit' name='submit' value=' ".$locale[125]." '></div>
	            </FIELDSET>
	            <input name='post_filter' type='hidden' value='false'>
				</form>

			<br />
			<img src='".PATH."admin/tpl/img/hor.gif' width='500' alt='' border='0' style='vertical-align:middle; margin:4px;'>
			<br />

		</div>
		";

		echo "<br /><br />
		<form name='form2' action='?unit=fields' method='post'>
		<table align='center' width='90%' border='0' cellpadding='1' cellspacing='1' class='tbl'>
			<tr class='tbl_head'>
				<td width='30%'>".hlp($locale[418])." ".$locale[417]."</td>
				<td width='60%'>".$locale[419]."</td>
				<td width='10%'>".$locale[338]."</td>
			</tr>
	    ";
	    $res = dbquery("SELECT * FROM ".PREF."blocks_db ");
	    while($dat = dbarray($res))
		    {
            if(strlen(stripslashes($dat['html'])) > 300)
	            {
                $dat['html'] = substr($dat['html'], 0, 300);
	            }
	        echo "
	        <tr>
		        <td>".stripslashes($dat['name'])."</td>
		        <td>".htmlspecialchars(stripslashes($dat['html']))."</td>
		        <td align='center'>
			        <nobr>
				        ".ico("?unit=blocks&act=db_edit&id=".$dat['id'], 'e')."
				        ".ico("?unit=blocks&act=db_del&id=".$dat['id'], 'd')."
				  	<nobr>
		        </td>
	        </tr>
	        ";
		    }
	    echo "
		</table>

		<br /><br /><div align='center'><input type='button' name='submit' onclick=\"go('?unit=blocks')\" value='&larr; ".$locale[324]."'></div>
		";
		}
	elseif($act == 'db_edit' && is_numeric($_GET['id']))
		{

		if($_POST['submit'] != "")
			{
	        $name = save_text($_POST['name']);
		    $type = addslashes($_POST['type']);
		    $html = addslashes($__POST['content_'.$type]);


			$sql = "UPDATE ".PREF."blocks_db SET
					name='".$name."',
					html='".$html."',
					parent='".$type."'
					WHERE id=".$_GET['id'];
			dbquery($sql);
	        echo "<div align='center'><div class='ok'>".$locale[351]."</div></div>";
			}

        $data = dbarray(dbquery("SELECT * FROM ".PREF."blocks_db WHERE id=".$_GET['id']));
         //stripslashes($data['html'])
		echo "
		<div  id='s123123'  align='center'>
		    <form name='form' action='?unit=blocks&act=db_edit&id=".$_GET['id']."' method='post'>
            <FIELDSET style='width:600px;'><LEGEND>".$locale[428]."</LEGEND>
            <table width='100%' class='add_item'>
            <tr><td>".hlp($locale[418])." ".$locale[417]."</td><td><input id='name' name='name' type='text' value='".stripslashes($data['name'])."' style='width:100%;'></td></tr>


            <tr><td>".$locale[468]."</td>
            	<td>
            	<input onclick=\"switch_area('html')\" name='type' type='radio' value='html'"; if($data['parent'] == 'html' || $data['parent'] == ''){echo " checked ";} echo "> ".$locale[482]."
            	<input onclick=\"switch_area('php')\" name='type' type='radio' value='php'"; if($data['parent'] == 'php'){echo " checked ";} echo "> ".$locale[483]."
            	</td>
            </tr>
            <tr><td colspan='2'>
            <div id='php'"; if($data['parent'] == 'html' || $data['parent'] == ''){echo " style='display: none;' ";}echo ">
            <div class='phpcode'>&lt;?php<br></div>
            <textarea id='content_php' name='content_php' style='width:100%; height:350px;' wrap='off'>".stripslashes($data['html'])."</textarea>
            <div class='phpcode'>?&gt;</div>
                <div class='phpbuttons'>
	            <input type='button' value='<b></b>' onclick='paste_tag(this)'>
	            <input type='button' value='<i></i>' onclick='paste_tag(this)'>
	            <input type='button' value='<u></u>' onclick='paste_tag(this)'>
	            <input type='button' value='<p></p>' onclick='paste_tag(this)'>
	            <input type='button' value='<br />' onclick='paste_tag(this)'>
	            <input type='button' value='<center></center>' onclick='paste_tag(this)'>
	            <input type='button' value='<div></div>' onclick='paste_tag(this)'>
	            <input type='button' value='\\\"' onclick='paste_tag(this)'>
	            <input type='button' value='echo \"\";' onclick='paste_tag(this)'>
	            <input type='button' value='pr();' onclick='paste_tag(this)'>
	            <input type='button' value='\\n' onclick='paste_tag(this)'>
                <input type='button' value='<img src=\"\" width=\"\" height=\"\" alt=\"\" border=\"0\">' onclick='paste_tag(this)'>
                <input type='button' value='<a href=\"\"></a>' onclick='paste_tag(this)'>
                <input type='button' value='<a href=\"mailto:\"></a>' onclick='paste_tag(this)'>
                </div>
            </div>
            <div id='html'"; if($data['parent'] == 'php'){echo " style='display: none;' ";}echo ">
            <textarea class='ckeditor' name='content_html'>".stripslashes($data['html'])."</textarea>
            
               </div>
            </td></tr>



            <tr><td colspan='2'>
            * ".$locale[422]."
            <ul>
	            <li>%PATCH% - ".$locale[426]."</li>
	            <li>%block_user% - ".$locale[425]."</li>
	            <li>%block_nav% - ".$locale[424]."</li>
	            <li>%block_tags% - ".$locale[423]."</li>
	            <li>%block_counter% - ".$locale[427]."</li>
            </ul>
            </td></tr>

            </table>
            <div align='center' style='margin:5px;'><input type='submit' name='submit' value=' ".$locale[335]." '></div>
            </FIELDSET>
            <input name='post_filter' type='hidden' value='false'>
			</form>
			<br /><br /><input type='button' name='submit' onclick=\"go('?unit=blocks&act=db')\" value='&larr; ".$locale[324]."'>
		</div>
		";

		}
// id
// place   t(op)/b(ottom)/l(eft)/r(ight)/h(eader)/f(ooter)/m(iddle)
// reg     показывать зарегистрированным 1/0 да/нет
// status  статус 1/0 вкл/выкл
// from    отображается c timestamp
// to      отображается до timestamp
// link
	elseif($act == 'places')
		{

		if(($_GET['set_status'] == 1 || $_GET['set_status'] == 0) && is_numeric($_GET['id']))
			{
			dbquery("UPDATE ".PREF."blocks_places SET status = ".$_GET['set_status']." WHERE id = ".$_GET['id']);
			}



		echo "
		<div align='left'>
		<input type='button' value=' &rarr; ".$locale[420]."' onclick='sh(123123);'>
        <input type='button' value='".$locale[872]."' id='savesort' disabled>
			<div id='s123123' style='display:none;' align='center'>
			    <form name='form' action='?unit=blocks&act=places_save' method='post'>
	            <FIELDSET style='width:500px;'><LEGEND>".$locale[420]."</LEGEND>
	            <table width='100%' class='add_item'>
	            	<tr><td>".$locale[446]."</td><td>
	            	<select size='1' name='link'>
	            	";
	            	foreach($blocks_db as $k => $v)
		            	{
	          		    echo "<option value='".$k."'>".stripslashes($v['name'])."</option>";
		            	}
	            	echo "
	            	</select>
	            	</td></tr>
	            	<tr><td>".$locale[453]."</td><td>
	            	";
	            	foreach($b_places as $k => $v)
		            	{
	          		    echo "
	          		    <input name='place' type='radio' value='".$k."'";
	          		    if($k == 't'){echo " checked ";}
	          		    echo ">".hlp($v['hlp'])." ".$v['name']."<br>
	          		    ";
		            	}
	            	echo "
	            	</td></tr>
	            	<tr><td>".hlp($locale[447])." ".$locale[16]."</td><td>
						<select size='1' name='region'>
			  			<option value=''>".$locale[449]."</option>
						".make_select('region', $regions_id_, 'none', $substr, ' / ')."
						</select>
	            	</td></tr>
	            	<tr><td>".hlp($locale[448])." ".$locale[453]."</td>
                    <td>
                        <div>
                            <label><input type='radio' name='mod_type' value='mod' class='block_type_mod'> Модуль</label>
    						<select size='1' name='cat' class='block_type_select'>
        			  			<option value='0'>".$locale[449]."</option>
        			  			<option value='%ind'>".$locale[633]."</option>
        			  			<option value='%cat'>".$locale[634]."</option>
        			  			<option value='%modules'>".$locale[635]."</option>
        
        			  			<option value='' disabled>-- ".$locale[486].":</option>
        		                ";
        
        		                foreach($modules_list as $k => $v)
        			                {
        			                 if($k != $v){
        			                     echo "<option value='".$k."'>".$v."</option>";
        			                 }
        		          		    
        		                	}
        
         		                echo "
                            </select>
                        </div>
                        <hr style='height:1px; border: 1px solid silver' />
                        
                            <label><input type='radio' name='mod_type' value='cat' class='block_type_cat'> Категория</label>
    					<div class='block_type_ajax block_type_disabled'>
                        	".ajax_select('cat', 'cat2', $default)."
                        </div>
						
	            	</td></tr>
	            	<tr><td>".hlp($locale[452])." ".$locale[445]."</td><td><input name='reg' type='checkbox' checked value='ON'></td></tr>
	            	<tr><td>".hlp($locale[450])." ".$locale[443]."</td><td><input name='from' id='from' type='text' value='' size='10'>&nbsp;<input type='button' onclick=\"document.getElementById('from').value=''\" name='submit' value='X'></td></tr>
	            	<tr><td>".hlp($locale[451])." ".$locale[444]."</td><td><input name='to' id='to' type='text' value='' size='10'>&nbsp;<input type='button' onclick=\"document.getElementById('to').value=''\" name='submit' value='X'></td></tr>
	            </table>
	            <div align='center' style='margin:5px;'><input type='submit' name='submit' value=' ".$locale[125]." '></div>
	            </FIELDSET>
				</form>

			<br />
			<img src='".PATH."admin/tpl/img/hor.gif' width='500' alt='' border='0' style='vertical-align:middle; margin:4px;'>
			<br />
		</div>   <br /><br />
		";

        foreach($b_places as $place => $bl)
	        {
            echo "
			<table align='center' width='90%' border='0' cellpadding='1' cellspacing='1' class='tbl fields_sort'>
			  <thead>
                <tr class='tbl_head'>
					<td colspan='8'>".hlp($bl['hlp'])." ".$bl['name']."</td>
				</tr>
				<tr class='tbl_head'>
					<td width='15%'>".$locale[417]."</td>
					<td width='20%'>".$locale[17]."</td>
					<td width='20%'>".$locale[16]."</td>
					<td width='10%'>".$locale[443]."</td>
					<td width='10%'>".$locale[444]."</td>
					<td width='5%'>".$locale[445]."</td>
					<td width='5%'>".$locale[213]."</td>
					<td width='5%'>".$locale[338]."</td>
				</tr>
               </thead>
               <tbody>
			";
			$res = dbquery("SELECT * FROM ".PREF."blocks_places WHERE place='".$place."' ORDER by sort");
			while($dat = dbarray($res))
				{
				$ct = get_array_linenav($dat['cat'], $cats_id);
				$rg = get_array_linenav($dat['region'], $regions_id_);

		        foreach($ct as $k => $v)
			        {
		            $ct[$k] = "<a href='../sort/?cat_id=".$v['id']."' target='_blank'>".stripslashes($v['name'])."</a>";
			        }

		        foreach($rg as $k => $v)
			        {
		            $rg[$k] = "<a href='../sort/?region_id=".$v['id']."' target='_blank'>".stripslashes($v['name'])."</a>";
			        }

		        $ct = implode(' / ', $ct);
		        $rg = implode(' / ', $rg);

                if($dat['from'] != "" && $dat['from'] != 0)
	                {
                    $from = date('d.m.Y H:i', $dat['from']);
	                }
				else
					{
				    $from = "";
					}

                if($dat['to'] != "" && $dat['to'] != 0)
	                {
                    $to = date('d.m.Y H:i', $dat['to']);
	                }
				else
					{
				    $to = "";
					}
				if($dat['reg'] == 1)
					{
				    $dat['reg'] = $locale[396];
					}
				else
					{
				    $dat['reg'] = $locale[397];
					}
				if($dat['status'] == 1)
					{
				    $dat['status'] = $locale[214];
				    $st = 0;
					}
				else
					{
				    $dat['status'] = $locale[215];
				    $st = 1;
					}

			    echo "
				<tr data-id='".$dat['id']."'>
					<td>".stripslashes($blocks_db[$dat['link']]['name'])."</td>
					<td>".$ct."</td>
					<td>".$rg."</td>
					<td>".$from."</td>
					<td>".$to."</td>
					<td>".$dat['reg']."</td>
					<td><a href='?unit=blocks&act=places&set_status=".$st."&id=".$dat['id']."'>".$dat['status']."</td>
					<td>
						<nobr>
				        ".ico("?unit=blocks&act=places_edit&id=".$dat['id'], 'e')."
				        ".ico("?unit=blocks&act=places_del&id=".$dat['id'], 'd')."
				        ".ico("?unit=blocks&act=places_move&id=".$dat['id']."&place=".$place."&up", 'up')."
				        ".ico("?unit=blocks&act=places_move&id=".$dat['id']."&place=".$place."&down", 'down')."
						</nobr>
					</td>
				</tr>
			    ";
				}
			echo "
              </tbody>
			</table>
			<br /><br />

            ";
	        }
		echo "<div align='center'><input type='button' name='submit' onclick=\"go('?unit=blocks')\" value='&larr; ".$locale[324]."'></div>";
		}
	elseif($act == 'places_edit' && is_numeric($_GET['id']))
		{

		if($_POST['submit'] != "")
			{
			if($_POST['reg'] == 'ON')
				{
				$_POST['reg'] = 1;
				}
	        else
		        {
	            $_POST['reg'] = 0;
		        }

			if($_POST['from'] != "")
				{
				list($Y, $m, $d) = explode('-', trim($_POST['from']));
				$from = mktime(0, 0, 0, $m, $d, $Y);
		        }
			if($_POST['to'] != "")
				{
				list($Y, $m, $d) = explode('-', trim($_POST['to']));
				$to = mktime(0, 0, 0, $m, $d, $Y);
		        }
             if($_POST['mod_type'] == 'cat'){
                $_POST['cat'] = $_POST['cat2'];
                if($_POST['cat'] == 0) $_POST['cat'] = '%cat';
             }
			$sql = "UPDATE ".PREF."blocks_places SET
					cat='".$_POST['cat']."',
					region='".$_POST['region']."',
					link='".$_POST['link']."',
					reg='".$_POST['reg']."',
					`from`='".$from."',
					`to`='".$to."',
					place='".$_POST['place']."'
					WHERE id=".$_GET['id'];
					dbquery($sql);

	        echo "<div align='center'><div class='ok'>".$locale[351]."</div></div>";
			}

		$data = dbarray(dbquery("SELECT * FROM ".PREF."blocks_places WHERE id=".$_GET['id'])) ;

        if($data['from'] != "" && $data['from'] != 0)
	        {
			$from = date('Y', $data['from'])."-".date('m', $data['from'])."-".date('d', $data['from']);
			}
		else
			{
		    $from = "";
			}
		if($data['to'] != "" && $data['to'] != 0)
			{
			$to = date('Y', $data['to'])."-".date('m', $data['to'])."-".date('d', $data['to']);
	        }
		else
			{
		    $to = "";
			}
	    echo "
	    <div align='center'>
	    <form name='form' action='?unit=blocks&act=places_edit&id=".$_GET['id']."' method='post'>
           <FIELDSET style='width:500px;'><LEGEND>".$locale[420]."</LEGEND>
           <table width='100%' class='add_item'>
           	<tr><td>".$locale[446]."</td><td>
           	<select size='1' name='link'>
           	";
           	foreach($blocks_db as $k => $v)
            	{
         		    echo "<option value='".$k."'";
         		    if($k == $data['link']){echo " selected ";}
         		    echo ">".stripslashes($v['name'])."</option>";
            	}
           	echo "
           	</select>
           	</td></tr>
           	<tr><td>".$locale[453]."</td><td>
           	";
           	foreach($b_places as $k => $v)
            	{
         		    echo "
         		    <input name='place' type='radio' value='".$k."'";
         		    if($k == $data['place']){echo " checked ";}
         		    echo ">".hlp($v['hlp'])." ".$v['name']."<br>
         		    ";
            	}
                
            $selector_cat = is_numeric($data['cat']);
            if($data['cat'] == 0) $selector_cat = false;
            $selector_cat_default = 0;
            if($selector_cat){
                $selector_cat_default = $data['cat'];
            }
           	echo "
           	</td></tr>
           	<tr><td>".hlp($locale[447])." ".$locale[16]."</td><td>
				<select size='1' name='region'>
	  			<option value=''>".$locale[449]."</option>
				".make_select('region', $regions_id_, $data['region'], $substr, ' / ')."
				</select>
           	</td></tr>
	            	<tr><td>".hlp($locale[448])." ".$locale[453]."</td>
                    <td>
                        <div>
                            <label><input ".($selector_cat ? '' : 'checked')." type='radio' name='mod_type' value='mod' class='block_type_mod'> Модуль</label>
    						<select ".($selector_cat ? 'disabled' : '')." size='1' name='cat' class='block_type_select'>
        			  			<option value='0'>".$locale[449]."</option>
        			  			<option value='%ind' ";if($data['cat'] == '%ind'){echo ' selected ';} echo ">".$locale[633]."</option>
        			  			<option value='%cat' ";if($data['cat'] == '%cat'){echo ' selected ';} echo ">".$locale[634]."</option>
        			  			<option value='%modules' ";if($data['cat'] == '%modules'){echo ' selected ';} echo ">".$locale[635]."</option>
        
        			  			<option value='' disabled>-- ".$locale[486].":</option>
        		                ";
        
        		                foreach($modules_list as $k => $v)
        			                {
        		          		    echo "<option value='".$k."'";
        		          		    if($k == $data['cat']){echo ' selected ';}
        		          		    echo ">".$v."</option>";
        		                	}
        
         		                echo "
                            </select>
                        </div>
                        <hr style='height:1px; border: 1px solid silver' />
                        
                            <label><input  ".($selector_cat ? 'checked' : '')." type='radio' name='mod_type' value='cat' class='block_type_cat'> Категория</label>
    					<div class='block_type_ajax ".($selector_cat ? '' : 'block_type_disabled')."'>
                        	".ajax_select('cat', 'cat2', $selector_cat_default)."
                        </div>
						
	            	</td></tr>
           	<tr><td>".hlp($locale[452])." ".$locale[445]."</td><td><input name='reg' type='checkbox' ";
           	if($data['reg'] == 1){echo " checked ";}
           	echo " value='ON'></td></tr>
           	<tr><td>".hlp($locale[450])." ".$locale[443]."</td><td><input name='from' id='from' type='text' value='".$from."' size='10'>&nbsp;<input type='button' onclick=\"document.getElementById('from').value=''\" name='submit' value='X'></td></tr>
           	<tr><td>".hlp($locale[451])." ".$locale[444]."</td><td><input name='to' id='to' type='text' value='".$to."' size='10'>&nbsp;<input type='button' onclick=\"document.getElementById('to').value=''\" name='submit' value='X'></td></tr>
           </table>
           <div align='center' style='margin:5px;'><input type='submit' name='submit' value=' ".$locale[335]." '></div>
           </FIELDSET>
		</form>
		</div>
	    ";
	    echo "<br /><br /><div align='center'><input type='button' name='submit' onclick=\"go('?unit=blocks&act=places')\" value='&larr; ".$locale[324]."'></div>";
		}








	elseif($act == 'db_del' && is_numeric($_GET['id']))
		{

		dbquery("DELETE FROM ".PREF."blocks_db WHERE id = ".$_GET['id']);

		echo "
		<script>
		setTimeout(\"document.location.href='?unit=blocks&act=db'\",1000);
		</script>
		<center><div class='ok'>".$locale[325]."</div></center>
		";
		}
	elseif($act == 'places_del' && is_numeric($_GET['id']))
		{

		dbquery("DELETE FROM ".PREF."blocks_places WHERE id = ".$_GET['id']);

		echo "
		<script>
		setTimeout(\"document.location.href='?unit=blocks&act=places'\",1000);
		</script>
		<center><div class='ok'>".$locale[325]."</div></center>
		";
		}
	}

?>