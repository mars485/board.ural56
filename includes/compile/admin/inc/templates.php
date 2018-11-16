<?php

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
	if(!isset($_GET['fl']))
		{
		$_GET['fl'] = 'header.html';
		}
        
        $add_head = '
        <link rel="stylesheet" href="../css/codemirror.css">
        <style>
        .CodeMirror {
        	height: 1000px;
        }
        </style>
        <script src="../js/codemirror/codemirror.js"></script>
        <script src="../js/codemirror/xml.js"></script>
        <script src="../js/codemirror/smarty.js"></script>
        <script src="../js/codemirror/css.js"></script>
        <script>
          function collapse(){
            var collapse_td = document.getElementById("collapse_td");
            var collapse_div = document.getElementById("s1");
            if (collapse_div.style.display == "none"){
              collapse_div.style.display = "block";
              collapse_td.style.width = "230px";
            }else{
              collapse_div.style.display = "none";
              collapse_td.style.width = "0";
            }
          }
        </script>
        ';
/*
	$add_head = "
    <script src='".$settings['patch']."js/codemirror/codemirror.js' type='text/javascript'></script>


    <style type='text/css'>
      .CodeMirror-line-numbers {
        width: 2.2em;
        color: #aaa;
        background-color: #eee;
        text-align: right;
        padding-right: .3em;
        font-size: 10pt;
        font-family: monospace;
        padding-top: .4em;
      }
    </style>
    ";
    
    */
    
    $smarty->assign('add_head', $add_head);

	$err = false;
    $_GET['fl'] = str_replace('../', '', $_GET['fl']);
    $fl = FULLPATCH.'templates/'.$settings['theme'].'/'.$_GET['fl'];

    if($_POST['submit'] != "")
	    {
	    if(file_exists($fl))
		    {
		 	$fp = fopen($fl, 'w');
		 	fwrite($fp, stripslashes(trepl1($__POST['content'])));
		 	fclose($fp);
		 	$saved = ' - '.$locale[525];
			}
		}
	}

if($exe)
	{
	$helpers = array();

	$helpers['add.html'] = $locale[488];
	$helpers['add_select.html'] = $locale[489];
	$helpers['block_counter.html'] = $locale[490];
	$helpers['block_nav.html'] = $locale[491];
	$helpers['block_seporator.html'] = $locale[492];
	$helpers['block_tags.html'] = $locale[493];
	$helpers['block_user.html'] = $locale[494];
	$helpers['blocks.html'] = $locale[495];
	$helpers['body1.html'] = $locale[496];
	$helpers['body2.html'] = $locale[497];
	$helpers['deleted.html'] = $locale[498];
	$helpers['footer.html'] = $locale[499];
	$helpers['header.html'] = $locale[500];
	$helpers['list.html'] = $locale[501];
	$helpers['message.html'] = $locale[502];
	$helpers['messages_block.html'] = $locale[503];
	$helpers['popup_region.html'] = $locale[504];
	$helpers['popup_sendmail.html'] = $locale[505];
	$helpers['prolongation.html'] = $locale[506];
	$helpers['sort.html'] = $locale[507];
	$helpers['subscribe.html'] = $locale[508];
	$helpers['tree1.html'] = $locale[509];
	$helpers['tree2.html'] = $locale[510];
	$helpers['tree3.html'] = $locale[511];
	$helpers['tree4.html'] = $locale[512];
	$helpers['users_panel.html'] = $locale[522];
	$helpers['users_order.html'] = $locale[513];
	$helpers['users_orders.html'] = $locale[514];
	$helpers['users_pay.html'] = $locale[515];
	$helpers['users_state.html'] = $locale[516];
	$helpers['users_subscribe.html'] = $locale[517];
	$helpers['users_login.html'] = $locale[518];
	$helpers['users_password_recovery.html'] = $locale[519];
	$helpers['users_password_recovery_success.html'] = $locale[520];
	$helpers['users_registr.html'] = $locale[521];
	$helpers['admin_login.html'] = $locale[527];
	$helpers['admin_top.html'] = $locale[528];
	$helpers['admin_bottom.html'] = $locale[529];
	$helpers['style_admin.css'] = $locale[530];
	$helpers['style.css'] = $locale[531];
	$helpers['style_ie.css'] = $locale[532];
	$helpers['404.html'] = $locale[112];
	$helpers['add2.html'] = $locale[891];
	$helpers['block_language.html'] = $locale[892];
	$helpers['block_promo.html'] = $locale[893];
	$helpers['block_templates.html'] = $locale[894];
	$helpers['block_user.html'] = $locale[895];
	$helpers['comment.html'] = $locale[896];
	$helpers['comment_add.html'] = $locale[897];
	$helpers['download.html'] = $locale[898];
	$helpers['fields.html'] = $locale[899];
	$helpers['popup_services.html'] = $locale[900];
	$helpers['search.html'] = $locale[507];
	$helpers['search_fields.html'] = $locale[901];
	$helpers['userinfo.html'] = $locale[902];
	$helpers['users_list.html'] = $locale[903];
	$helpers['articles_cat.html'] = $locale[1279];
	$helpers['articles.html'] = $locale[1280];
	$helpers['articles_item.html'] = $locale[1281];
	$helpers['block_search.html'] = $locale[1282];
	$helpers['closed.html'] = $locale[1283];
	$helpers['comments.html'] = $locale[896];
	$helpers['form_premium.html'] = $locale[1285];
	$helpers['form_contact.html'] = $locale[1286];
	$helpers['list_full.html'] = $locale[1287];
	$helpers['list_short.html'] = $locale[1288];
	$helpers['map.html'] = $locale[1257];
	$helpers['pagination.html'] = $locale[1289];
	$helpers['prolong_few.html'] = $locale[1290];
	$helpers['restored.html'] = $locale[1291];



	echo "
	<script>

	function paste_tag(but)
		{
		var txt = document.getElementById('code');

        var txtLen = txt.value.length;
        var selEnd = txt.selectionEnd;

        var txtbefore = txt.value.substring(0,selEnd);
        var txtafter =  txt.value.substring(selEnd, txtLen);

 	    document.getElementById('content_php').value = txtbefore + but.value + txtafter;
		}

	</script>

	<table border='0' width='100%' style='table-layout: fixed;'>
		<tr>
			<td id='collapse_td' style='width:230px;'>
				<div id='s1' align='left'>
					<ul>
	";

    function get_files($file){
        static $allfiles;
        global $settings;
        $file1 = $file;
        $basepath = str_replace(FULLPATH.'templates/'.$settings['theme'], '', $file);
        $files = array();
    	$fp = opendir($file.'/');
    	while(($file = readdir($fp)) !== false){
  		    if($file != '.' && $file != '..') $files[] = $file;
    		}
        if(count($files) > 0){
            foreach($files as $v){
                if(is_dir($file1.'/'.$v)){
                    get_files($file1.'/'.$v);
                }elseif(substr($v, -5) == '.html' || substr($v, -4) == '.css' || substr($v, -4) == '.htm'){
                    $allfiles[] = substr($basepath.'/'.$v, 1);
    			}
                	
            }
        }
    return $allfiles;
    }
    
    $tmpls = get_files(FULLPATH.'templates/'.$settings['theme']);

	sort($tmpls);

    foreach($tmpls as $file)
	    {
		echo "<li>";
		if(isset($helpers[$file]))
			{
			echo hlp($helpers[$file]);
			}
		else
			{
			echo "<i class='fa fa-question-circle'></i>";
			}
		echo "<a href='?unit=templates&fl=".$file."'>".$file."</a>";
		if($_GET['fl'] == $file)
			{
			echo "<img style='vertical-align:middle;' src='".$settings['patch']."images/calendar/nav-left.gif' alt='' border='0'>";
			}
		echo "</li>";
	    }

    if(file_exists($fl))
	    {
		$content = trepl2(file_get_contents($fl));
	    }
	else
		{
	    $err = $locale[523];
		}
	if(!$err)
		{
		if(!is_writable($fl))
			{
		    $err = $locale[524];
			}
		}
    if(!isset($saved)) $saved = "";
	echo "
					</ul>
				</div>
			</td>
			<td width='7' style='height:500px; border:1px solid #C0C0C0; cursor:pointer;' onclick='collapse();'>
					<img src='".PATH."admin/tpl/img/sep.gif' width='7' height='50' alt='' border='0'>
			</td>
			<td width='100%' valign='top'>
			<div align='center'><b>".$fl."</b><span id='inf'>".$saved."</span></div><br />
			";
	if($err)
		{
	    echo "
	    <center><div align='center' class='err'>".$err."</div></center>
	    ";
		}
    if(!isset($content)) $content = "";
    
	echo "
	<form name='form' action='?unit=templates&fl=".$_GET['fl']."' method='post'>

            <textarea id='code' name='content' wrap='off'>".$content."</textarea>
            <br /><br />
	            <div align='center'>
                	<input type='submit' name='submit' value='".$locale[335]."'><br /><br />

                	<input name='post_filter' type='hidden' value='false'>
	            </div>
	</form>
			</td>
		</tr>
	</table>



	<script type='text/javascript'>
        var editor = CodeMirror.fromTextArea(document.getElementById('code'), {
            lineNumbers: true,";
    	    if(substr($fl, -4) == '.css'){
    		    echo "
                mode: {
                    name: 'css'
                }
    		    ";
   		    }elseif(substr($fl, -3) == '.js'){
    		    echo "
                mode: {
                    name: 'javascript'
                }
    		    ";
		    }else{
    		    echo "
                mode: {
                    name: 'smarty',
                    leftDelimiter: '{%',
                    rightDelimiter: '%}', 
                    baseMode: 'text/html'
                }
    		    ";
    		    }
        echo "
            

        });

    


	</script>
	";
	}
?>