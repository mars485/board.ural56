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

	}
else
	{

	$lk = explode(',', $locale['symb']);
	$lk = implode("", $lk);
	$en = "A,B,V,G,D,E,E,Zh,Z,I,I,K,L,M,N,O,P,R,S,T,U,F,H,C,Ch,Sh,Sh,,Y,,E,Yu,Ya,a,b,v,g,d,e,e,zh,z,i,i,k,l,m,n,o,p,r,s,t,u,f,h,c,ch,sh,sh,,y,,e,yu,ya";
	$en = explode(',', $en);
	$en = implode("','", $en);


	$reserv = array();
	$res = dbquery("SELECT uri FROM ".PREF."cat WHERE parent = 0");
	while($dat = dbarray($res))
		{
	    $reserv[] = $dat['uri'];
		}
	$res = dbquery("SELECT uri FROM ".PREF."regions WHERE parent = 0");
	while($dat = dbarray($res))
		{
	    $reserv[] = $dat['uri'];
		}

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



	if($act == "")
		{
		echo "
		<div align='left'>
		<input type='button' value=' &rarr; ".$locale[479]."' onclick=\"go('?unit=mods&act=add')\">
		</div>
		";

		echo "<br /><br />
		<table align='center' width='90%' border='0' cellpadding='1' cellspacing='1' class='tbl'>
			<tr class='tbl_head'>
				<td width='40%'>".$locale[478]."</td>
				<td width='30%'>".hlp($locale[256])." ".$locale[255]."</td>
				<td width='20%'>".$locale[468]."</td>
				<td width='10%'>".$locale[275]."</td>
			</tr>
	    ";

	    $res = dbquery("SELECT * FROM ".PREF."modules");
	    while($dat = dbarray($res))
		    {
	        echo "
	        <tr>
	        <td>".stripslashes($dat['title'])."</td>
	        <td>".$dat['cat']."</td>
	        <td>".stripslashes($dat['type'])."</td>
	  		";

		  	echo "

		        <td align='center'>
			        <nobr>
				        ".ico("?unit=mods&act=edit&id=".$dat['id'], 'e')."
				        ".ico("?unit=mods&act=del&id=".$dat['id'], 'd')."
				  	<nobr>
		        </td>
	        </tr>
	        ";
		    }
	    echo "
		</table>
		";
		}
	elseif($act == 'add')
		{
	    echo "


	    <div align='center'  id='s123123'>
			    <form name='form' action='?unit=mods&act=save' method='post'>
	            <FIELDSET style='width:700px;'><LEGEND>".$locale[461]."</LEGEND>
	            <table width='100%' class='add_item'>
	            <tr><td>".$locale[478]."</td><td><input name='title' id='title' type='text' value='' style='width:100%;'></td></tr>
				<tr><td colspan='2' align='center' style='width:100%;'>[ <a href=\"javascript:copy_id('n');\">&darr; ".$locale[257]."</a> ] [ <a href=\"javascript:copy_id('t');\">&darr; ".$locale[258]."</a> ]</td></tr>
	            <tr><td>".hlp($locale[256])." ".$locale[255]."</td><td><input name='cat' id='cat' type='text' value='' style='width:100%;'></td></tr>
	            <tr><td>".hlp($locale[481])." ".$locale[281]."</td><td><input name='autor' type='text' value='' style='width:100%;'></td></tr>
	            <tr><td>".hlp($locale[481])." ".$locale[107]."</td><td><input name='keywords' type='text' value='' style='width:100%;'></td></tr>
	            <tr><td>".hlp($locale[481])." ".$locale[358]."</td><td><input name='description' type='text' value='' style='width:100%;'></td></tr>
	            <tr><td>".hlp($locale[481])." ".$locale[480]."</td><td><input name='copyright' type='text' value='' style='width:100%;'></td></tr>
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
	            </table>
	            <div align='center' style='margin:5px;'><input type='submit' name='submit' value=' ".$locale[125]." '></div>
	            </FIELDSET>
	            <input name='post_filter' type='hidden' value='false'>
				</form>
		<br /><br /><input type='button' name='submit' onclick=\"go('?unit=mods')\" value='&larr; ".$locale[324]."'>
	    </div>
	    ";
		}
	elseif($act == 'save')
		{
	    $title = addslashes($_POST['title']);
	    $autor = addslashes($_POST['autor']);
	    $keywords = addslashes($_POST['keywords']);
	    $description = addslashes($_POST['description']);
	    $copyright = addslashes($_POST['copyright']);
	    $type = addslashes($_POST['type']);
	    $cat = addslashes($_POST['cat']);
	    $copyright = addslashes($_POST['copyright']);
	    $content = addslashes($__POST['content_'.$type]);

		$err = array();

        if(in_array($cat, $reserv) || in_array($cat, $reserved_id))
	        {
            $err[] = $locale[332];
	        }
        if($cat == "")
	        {
            $err[] = $locale[484];
	        }

	    if(count($err) > 0)
		    {
	 	    echo "

	 	    <div align='center'>
	 	    <div class='error'>
		 	    <ul>
		 	    ";
		 	    foreach($err as $v)
			 	    {
		 		    echo "<li>".$v."</li>";
			 	    }
		 	    echo "
		 	    </ul>
			<a href='javascript:history.back(1);'>&laquo;&laquo; ".$locale[156]."</a>
	 	    </div>
	 	    </div>
	 	    ";
		    }
		else
			{
		    $sql = "INSERT INTO ".PREF."modules SET
		    		title = '".$title."',
		    		autor = '".$autor."',
		    		keywords = '".$keywords."',
		    		description = '".$description."',
		    		copyright = '".$copyright."',
		    		type = '".$type."',
		    		cat = '".$cat."',
		    		content = '".$content."'
		    		";
		   	dbquery($sql);
	 	    echo "
			<script>
			setTimeout(\"document.location.href='?unit=mods'\",1000);
			</script>
	 	    <center><div class='ok'>".$locale[322]."</div></center>
	 	    ";
		   	}
		}
	elseif($act == 'edit' && is_numeric($_GET['id']))
		{
		if($_POST['submit'] != "")
			{
		    $title = addslashes($_POST['title']);
		    $autor = addslashes($_POST['autor']);
		    $keywords = addslashes($_POST['keywords']);
		    $description = addslashes($_POST['description']);
		    $copyright = addslashes($_POST['copyright']);
		    $type = addslashes($_POST['type']);
		    $content = addslashes($__POST['content_'.$type]);
		    $cat = addslashes($_POST['cat']);
		    $copyright = addslashes($_POST['copyright']);


			$err = array();

	        if(in_array($cat, $reserv))
		        {
	            $err[] = $locale[332];
		        }
	        if($cat == "")
		        {
	            $err[] = $locale[484];
		        }

			foreach($modules as $v)
				{
			    if($v['id'] == $cat)
				    {
				    $err[] = $locale[332];
				    break;
				    }
				}

            $res = dbquery("SELECT cat FROM ".PREF."modules WHERE id != ".$_GET['id']);
            while($dat = dbarray($res))
	            {
			    if($dat['cat'] == $cat)
				    {
				    $err[] = $locale[332];
				    break;
				    }
	            }

		    if(count($err) > 0)
			    {
		 	    echo "

		 	    <div align='center'>
		 	    <div class='error'>
			 	    <ul>
			 	    ";
			 	    foreach($err as $v)
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
			    $sql = "UPDATE ".PREF."modules SET
			    		title = '".$title."',
			    		autor = '".$autor."',
			    		keywords = '".$keywords."',
			    		description = '".$description."',
			    		copyright = '".$copyright."',
			    		type = '".$type."',
			    		cat = '".$cat."',
			    		content = '".$content."'
			    		WHERE id=".$_GET['id']."
			    		";
			   	dbquery($sql);
		 	    echo "
		 	    <center><div class='ok'>".$locale[322]."</div></center>
		 	    ";
			   	}



			}

		$data = dbarray(dbquery("SELECT * FROM ".PREF."modules WHERE id=".$_GET['id']));
	    echo "


	    <div align='center'>
			    <form name='form' action='?unit=mods&act=edit&id=".$_GET['id']."' method='post'>
	            <FIELDSET style='width:700px;'><LEGEND>".$locale[485]."</LEGEND>
	            <table width='100%' class='add_item'>
	            <tr><td>".$locale[478]."</td><td><input name='title' id='title' type='text' value='".stripslashes($data['title'])."' style='width:100%;'></td></tr>
				<tr><td colspan='2' align='center' style='width:100%;'>[ <a href=\"javascript:copy_id('n');\">&darr; ".$locale[257]."</a> ] [ <a href=\"javascript:copy_id('t');\">&darr; ".$locale[258]."</a> ]</td></tr>
	            <tr><td>".hlp($locale[256])." ".$locale[255]."</td><td><input name='cat' id='cat' type='text' value='".stripslashes($data['cat'])."' style='width:100%;'></td></tr>
	            <tr><td>".hlp($locale[481])." ".$locale[281]."</td><td><input name='autor' type='text' value='".stripslashes($data['autor'])."' style='width:100%;'></td></tr>
	            <tr><td>".hlp($locale[481])." ".$locale[107]."</td><td><input name='keywords' type='text' value='".stripslashes($data['keywords'])."' style='width:100%;'></td></tr>
	            <tr><td>".hlp($locale[481])." ".$locale[358]."</td><td><input name='description' type='text' value='".stripslashes($data['description'])."' style='width:100%;'></td></tr>
	            <tr><td>".hlp($locale[481])." ".$locale[480]."</td><td><input name='copyright' type='text' value='".stripslashes($data['copyright'])."' style='width:100%;'></td></tr>
	            <tr><td>".$locale[468]."</td>
	            	<td>
	            	<input onclick=\"switch_area('html')\" name='type' type='radio' value='html'"; if($data['type'] == 'html'){echo " checked ";} echo "> ".$locale[482]."
	            	<input onclick=\"switch_area('php')\" name='type' type='radio' value='php'"; if($data['type'] == 'php'){echo " checked ";} echo "> ".$locale[483]."
	            	</td>
	            </tr>
	            <tr><td colspan='2'>
	            <div id='php'"; if($data['type'] == 'html'){echo " style='display: none;' ";}echo ">
	            <div class='phpcode'>&lt;?php<br></div>
	            <textarea id='content_php' name='content_php' style='width:100%; height:350px;' wrap='off'>".stripslashes($data['content'])."</textarea>
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
	            <div id='html'"; if($data['type'] == 'php'){echo " style='display: none;' ";}echo ">
                <textarea class='ckeditor' name='content_html'>".stripslashes($data['content'])."</textarea>
                </div>
	            </td></tr>
	            </table>
	            <div align='center' style='margin:5px;'><input type='submit' name='submit' value=' ".$locale[335]." '></div>
	            </FIELDSET>
	            <input name='post_filter' type='hidden' value='false'>
				</form>

		<br /><br /><input type='button' name='submit' onclick=\"go('?unit=mods')\" value='&larr; ".$locale[324]."'>


	    </div>
	    ";
		}
	elseif($act == 'del' && is_numeric($_GET['id']))
		{

		dbquery("DELETE FROM ".PREF."modules WHERE id = ".$_GET['id']);

		echo "
		<script>
		setTimeout(\"document.location.href='?unit=mods'\",1000);
		</script>
		<center><div class='ok'>".$locale[325]."</div></center>
		";
		}

	}

?>