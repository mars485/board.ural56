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
    if(!isset($_GET['id'])) $_GET['id'] = "";
    $tbl = $_GET['unit']=='cat' ? PREF.'cat' : PREF.'regions';
	if($act == 'savesort')
		{
        if(count($_POST['list']) > 0)
        {        
        $list = $_POST['list'];
        $i = 0;
        $root_cat = 0;
        if(isset($_GET['cat'])){
            if(is_numeric($_GET['cat'])) $root_cat = $_GET['cat'];
        }

        foreach($list as $k => $v)
            {
            if($v == 'root') $v = $root_cat;
            $sql = "UPDATE ".$tbl." SET sort = ".$i.", parent = ".$v." WHERE id=".$k;
            dbquery($sql);
            $i++;
            }
        echo 'ok';
        }
        
        exit();
		}
        
    if($settings['ipgeo'] == '1' && $_GET['unit'] == 'region')
        {
        $add_head = "
        <script type='text/javascript' src='".$settings['path']."js/autocomplete/lib/jquery.bgiframe.min.js'></script>
        <script type='text/javascript' src='".$settings['path']."js/autocomplete/lib/jquery.ajaxQueue.js'></script>
        <script type='text/javascript' src='".$settings['path']."js/autocomplete/lib/thickbox-compressed.js'></script>
        <script type='text/javascript' src='".$settings['path']."js/autocomplete/jquery.autocomplete.js'></script>
        ";
        
        $add_head .= '
        <link rel="stylesheet" type="text/css" href="'.$settings['path'].'js/autocomplete/jquery.autocomplete.css" />
        <link rel="stylesheet" type="text/css" href="'.$settings['path'].'js/autocomplete/lib/thickbox.css" />
        
        <script type="text/javascript" src="'.$settings['path'].'js/autocomplete/jquery.autocomplete.js"></script>
        <script type="text/javascript">

        function setCookie(name, value) {
              var valueEscaped = escape(value);
              var expiresDate = new Date();
              expiresDate.setTime(expiresDate.getTime() + 365 * 24 * 60 * 60 * 1000); // срок - 1 год, но его можно изменить
              var expires = expiresDate.toGMTString();
              var newCookie = name + "=" + valueEscaped + "; path=/; expires=" + expires;
              if (valueEscaped.length <= 4000) document.cookie = newCookie + ";";
        }

        $(document).ready(function() {
            if (!expires)
                {
                var expires = new Date();
                }
        if(window.gtype !== undefined){
            var gtype = "";
        }       
        setCookie("gtype", gtype);
    	function formatItem(row) {
    		return row[1];
    	}
    	function formatResult(row) {
    		return row[0].replace(/(<.+?>)/gi, \'\');
    	}
        
        $("input[name=\'gtype\']").click(function() {
            gtype = $(this).val();
            setCookie("gtype", gtype);
          });
        
    	$("#query").unbind().autocomplete("?unit=ipgeo&type="+gtype, {
    		width: 260,
    		selectFirst: false,
            formatResult: formatItem
    	});

         

         
        });        
       </script>
    
        ';
        
        $smarty->assign('add_head', $add_head);
        }
	if($act == 'srt')
		{
		sort_cat($tbl);
        $r = '?unit='.$_GET['unit'];
        if($_cache) $r .= '&act=recache';
		header('Location: '.$r);
		exit();
		}
	if($act == 'move' && is_numeric($_GET['id']) && is_numeric($_GET['parent']))
		{
		$res = dbquery("SELECT id, sort FROM ".$tbl." WHERE parent=".$_GET['parent']." ORDER by sort");
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
				dbquery("UPDATE ".$tbl." SET sort='".$v['n']."' WHERE id=".$v['id']);
				}
			}
		header('Location: ?unit='.$_GET['unit']);
		exit();
		}

	//include(COREPATH.'funct-tree.php');

	function echo_tree_admin($cat, $link, $clean = true)
		{
		static $html = "";
		if($clean){$html = "";}
		foreach($cat as $v)
			{
            $link2 = $link;
            $link2[] = $v['uri'];
	        if($v['name'] != "" )
		        {
				if($v['parent'] == '')
					{
					$v['parent'] = 0;
					}
		        $html .= "
                <li id='list_".$v['id']."'>
                <div>
                <a target='_blank' href='".implode('/', $link2)."/'>".($clean ? '<b>'.$v['name'].'</b>' : $v['name'])."</a>
		        ".ico("?unit=".$_GET['unit']."&act=edit&id=".$v['id'], 'e')."
		        ".ico("?unit=".$_GET['unit']."&act=del&id=".$v['id'], 'd')."
		        </div>\n";
			    }
            if(!isset($v['cat'])) $v['cat'] = "";
		    if(is_array($v['cat']) && count($v['cat']) > 0 && $_GET['subcat'])
			    {
			    $html .=  "\n<ol>\n";
		        echo_tree_admin($v['cat'], $link2, false);
		        $html .=  "\n</ol>\n";
			    }
			$html .=  "\n";

			}
		return $html;
		}


	}
if($exe)
	{
	$lk = explode(',', $locale['symb']);
	$lk = implode("", $lk);
	$en = "A,B,V,G,D,E,E,Zh,Z,I,I,K,L,M,N,O,P,R,S,T,U,F,H,C,Ch,Sh,Sh,,Y,,E,Yu,Ya,a,b,v,g,d,e,e,zh,z,i,i,k,l,m,n,o,p,r,s,t,u,f,h,c,ch,sh,sh,,y,,e,yu,ya";
	$en = explode(',', $en);
	$en = implode("','", $en);
	echo "
	<script>

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
	    doc_name = document.getElementById('catname').value;
        if(type == 't')
	        {
            doc_id = document.getElementById('catid').value = trans_replace.translit(doc_name);
	        }
	    else
		    {
		    doc_id = doc_name;
			}
		doc_id = doc_id.replace(/ /g, '-');
		doc_id = doc_id.replace(/,/g, '');
		doc_id = doc_id.replace(/\//g, '');
		document.getElementById('catid').value = doc_id;
		}
	</script>
	";

    if($act == "")
	    {
		echo "
        <div class='tree_buttons'>
		<input type='button' value='".$locale[251]."' onclick='sh(123123);'>
		<input type='button' value='".$locale[669]."' onclick=\"if(confirm('".$locale[43]." ".$locale[670]."')){go('?unit=".$_GET['unit']."&act=srt');}\">
		<input type='button' value='".$locale[872]."' id='savesort' disabled> <br><br>
			<div id='s123123' "; if(!isset($_GET['parent'])){echo " style='display:none;' ";} echo " align='center'>
			    <form name='form' action='?unit=".$_GET['unit']."&act=save' method='post'>
	            <FIELDSET style='width:500px;'><LEGEND>".$locale[252]."</LEGEND>
	            <table width='100%' class='add_item'>
	            <tr><td>".hlp($locale[254]).' '.$locale[880]."</td><td><input id='catname' name='name' type='text' value='' style='width:100%;'></td></tr>
	            <tr><td colspan='2' align='center' style='width:100%;'>[ <a href=\"javascript:copy_id('n');\">&darr; ".$locale[257]."</a> ] [ <a href=\"javascript:copy_id('t');\">&darr; ".$locale[258]."</a> ]</td></tr>
	            <tr><td>".hlp($locale[256]).' '.$locale[255]."</td><td><input id='catid'   name='uri'  type='text' value='' style='width:100%;'></td></tr>
				<tr><td>".hlp($locale[331]).' '.$locale[310]."</td><td>
                ";
                $default = isset($_GET['parent']) ? intval($_GET['parent']) : 0;
                echo ajax_select($_GET['unit'], 'parent', $default);   
        echo "                                
				</td></tr>
                ";
                if($_GET['unit'] == 'region'){
                    if($settings['ipgeo'] == '1')
                        {
                        echo "
                		<tr><td colspan=2 align=center><b>".$locale[864]."</b></td></tr>
                		<tr>
                            <td>".$locale[865]."</td>
                            <td>
                                <script>
                                    var gtype = '".$dat['ipgeo_field']."';
                                </script>
                                <input type='radio' name='gtype' value='s'>".$locale[866]."<br />
                                <input type='radio' name='gtype' value='d'>".$locale[867]."<br />
                                <input type='radio' name='gtype' value='r'>".$locale[868]."<br />
                                <input type='radio' name='gtype' value='c'>".$locale[869]."<br />
                            </td>
                        </tr>
                        ";
                        }
                    echo "
            		<tr><td align='center' colspan=2>".$locale[870]."
                    
                    <br />
                    <input type='text' name='q' id='query' style='width:100%' value=''/></td>
                    </tr>
                    ";
                }else{
                    echo "
        				<tr><td>".hlp($locale[314]).''.$locale[313]."[<a href=\"javascript:popup('?selectimage', 400, 550);\">".$locale[315]."</a>]</td><td><input id='image'   name='img'  type='text' value='' style='width:100%;'></td></tr>
        				<tr><td>".$locale[358]."</td><td><a href='#' onclick='sh(111);' class='dashed'>".$locale[125]."</a></td></tr>
                        <tr>
                            <td colspan='2'>
                                <div id='s111' style='display: none;'>
                                    <textarea class='ckeditor' name='description'></textarea>
                                    <input name='post_filter' type='hidden' value='false'>
                                </div>
                            </td>
                        </tr>
                    ";
                }

                
                echo "
        		</table>
	            <div align='center' style='margin:5px;'><input type='submit' name='submit' value=' ".$locale[125]." '></div>
	            </FIELDSET>
				</form>

			</div>
        ";

        echo '
        <div class="select_branch">        
            <form action="" method=get>
                <input type=hidden name=unit value='.$_GET['unit'].'>
                ';
                $default = isset($_GET['cat']) ? intval($_GET['cat']) : 0;
                echo ajax_select($_GET['unit'], 'cat', $default);
            echo '
                <button type=submit name="subcat" value="1" style="display:inline;">'.$locale[1331].'</button>
                <button type=submit name="subcat" value="0" style="display:inline;">'.$locale[1332].'</button>
            </form>
        </div>        
        ';
        
        if(isset($_GET['cat'])){
            $cat_num = intval($_GET['cat']);
            $cat_tree = make_main_tree($_GET['unit'], array('id'=>$cat_num));
            $cat_tree = isset($cat_tree['cat']) ? $cat_tree['cat'] : false;
    
            if($cat_tree){
                echo "<ol class='sortable'>";
                echo echo_tree_admin($cat_tree, array('..'));
                echo "</ol>";
            }else{
                echo '

		        	<div class="error">
		        	 '.$locale[1330].'
		        	</div>
	        	';
            }
        }else{
            echo '
            	<div class="warn">
                <i class="fa fa-info-circle" aria-hidden="true"></i>
            	 '.$locale[1329].'
            	</div>
        	';
        }
        
		echo "
        </ol>
        </div>\n";
		}
	elseif($act == 'save')
		{
		$uri = stripslashes($_POST['uri']);
		$name = stripslashes($_POST['name']);
		$parent = $_POST['parent'];
        $err = array();
        $dsql = "";
        if($_GET['unit'] == 'region'){
            $ipgeo_field = $_POST['gtype'];
            $ipgeo_value = $_POST['q'];
            if($ipgeo_field != "" && $ipgeo_value != "")
                {
                $dsql = ", ipgeo_field = '".$ipgeo_field."', ipgeo_value = '".$ipgeo_value."' ";
                }
            $check_tree = 'cat';
        }else{
    		$img = stripslashes($_POST['img']);
            $description = addslashes($__POST['description']);
            $check_tree = 'region';
            $dsql = ", img='".addslashes($img)."', description='".$description."'";

        }
        $uri = trim($uri);
        $luri = strtolower($uri);
        if(count($full_list[$check_tree]) > 0){
            if($parent == 0){
    		  foreach($full_list[$check_tree] as $v){
        		    if(strtolower($v['uri']) == $luri && $v['parent'] == 0){
        			    $err[] = $locale[320];
        			    break;
       			    }
     			}
            }
        }
		if($uri == ""){$err[] = $locale[484];}
		$uri = str_replace(' ', '_', $uri);
		foreach($full_list[$_GET['unit']] as $v)
			{
		    if($v['parent'] == $parent && $v['uri'] == $uri)
			    {
			    $err[] = $locale[321].' &laquo;<b>'.stripslashes($v['name']).'</b>&raquo;';
			    break;
			    }
			}
		if(in_array($uri, $reserved_id))
			{
		    $err[] = $locale[332];
			}
	    if(count($err) == 0)
		    {
            $max_sort = dbarray(dbquery("SELECT MAX(sort) as m FROM ".$tbl));
            $max_sort = intval($max_sort['m']) + 1;
	 	    dbquery("INSERT INTO ".$tbl." SET sort=".$max_sort.", uri='".addslashes($uri)."', name='".addslashes($name)."', parent='".addslashes($parent)."'".$dsql);
            echo "
            <script>
            ";
            if($_cache){
                $last_id = mysql_insert_id_u();
                part_cashe_flush($last_id);
                echo '
                $(document).ready(function(){
                reindex4("?unit='.$_GET['unit'].'&parent='.$parent.'");
                });
                ';
            }else{
                echo "setTimeout(\"document.location.href='?unit=".$_GET['unit']."&parent=".$parent."'\",1000);";
            }
            echo "
            </script>
            <center>
                <div class='ok'>
                    <div id=reindex_info></div>
                    ".$locale[322]."
                </div>
            </center>
	 	    ";
		    }
		else
			{
	 	    echo "
	 	    <center><div class='error'>
	 	    <ul>
	 	    ";
	 	    foreach($err as $v)
		 	    {
	 		    echo "<li>".$v."</li>";
		 	    }
	 	    echo "
	 	    </ul>
	 	    <a href='javascript:history.back(1);'><i class=\"fa fa-chevron-left\" aria-hidden=\"true\"></i> ".$locale[156]."</a>
	 	    </div></center>
	 	    ";
			}
		}
	elseif($act == 'edit' && is_numeric($_GET['id']))
		{
		$res = dbquery("SELECT * FROM ".$tbl." WHERE id=".$_GET['id']);
		$dat = dbarray($res);
        if($dat['ipgeo_field'] == ""){$dat['ipgeo_field'] = 's';}

		echo "
       
		<div align='center'>
		<form name='form' action='?unit=".$_GET['unit']."&act=saveedit&id=".$_GET['id']."' method='post'>
		<FIELDSET style='width:500px;'><LEGEND>".$locale[323]."</LEGEND>
		<table width='100%' class='add_item'>
		<tr><td>".hlp($locale[254]).' '.$locale[880]."</td><td><input id='catname' name='name' type='text' value='".stripslashes($dat['name'])."' style='width:100%;'></td></tr>
		<tr><td colspan='2' align='center' style='width:100%;'>[ <a href=\"javascript:copy_id('n');\">&darr; ".$locale[257]."</a> ] [ <a href=\"javascript:copy_id('t');\">&darr; ".$locale[258]."</a> ]</td></tr>
		<tr><td>".hlp($locale[256]).' '.$locale[255]."</td><td><input id='catid'   name='uri'  type='text' value='".stripslashes($dat['uri'])."' style='width:100%;'></td></tr>
		<tr><td>".hlp($locale[331]).' '.$locale[310]."</td><td>
        ".ajax_select($_GET['unit'], 'parent', $dat['parent'])."
		</td></tr>";


        if($_GET['unit'] == 'region'){
            if($settings['ipgeo'] == '1')
                {
                echo "
        		<tr><td colspan=2 align=center><b>".$locale[864]."</b></td></tr>
        		<tr>
                    <td>".$locale[865]."</td>
                    <td>
                        <script>
                            var gtype = '".$dat['ipgeo_field']."';
                        </script>
                        <input "; if($dat['ipgeo_field'] == 's'){echo 'checked';} echo " type='radio' name='gtype' value='s'>".$locale[866]."<br />
                        <input "; if($dat['ipgeo_field'] == 'd'){echo 'checked';} echo " type='radio' name='gtype' value='d'>".$locale[867]."<br />
                        <input "; if($dat['ipgeo_field'] == 'r'){echo 'checked';} echo " type='radio' name='gtype' value='r'>".$locale[868]."<br />
                        <input "; if($dat['ipgeo_field'] == 'c'){echo 'checked';} echo " type='radio' name='gtype' value='c'>".$locale[869]."<br />
                    </td>
                </tr>
                ";
                }
            echo "
    		<tr><td align='center' colspan=2>".$locale[870]."
            
            <br />
            <input type='text' name='q' id='query' style='width:100%' value='".$dat['ipgeo_value']."'/></td>
            </tr>
            ";
        }else{
            echo "
        		<tr><td>".hlp($locale[314]).''.$locale[313]."[<a href=\"javascript:popup('?selectimage', 400, 550);\">".$locale[315]."</a>]</td><td><input id='image'   name='img'  type='text' value='".stripslashes($dat['img'])."' style='width:100%;'></td></tr>
        		<tr><td>".$locale[358]."</td><td><a href='#' onclick='sh(111);' class='dashed'>".$locale[837]."</a></td></tr>
                <tr>
                    <td colspan='2'>
                        <div id='s111' style='display: none;'>
                            <textarea class='ckeditor' name='description'>".stripslashes($dat['description'])."</textarea>
                            <input name='post_filter' type='hidden' value='false'>
                        </div>
                    </td>
                </tr>
            ";
        }

                
                echo "        
		</table>
		<div align='center' style='margin:5px;'><input type='submit' name='submit' value=' ".$locale[34]." '></div>
		</FIELDSET>
		</form>
		<br /><br /><input type='button' name='submit' onclick=\"go('?unit=".$_GET['unit']."')\" value='&larr; ".$locale[324]."'>
		</div>
        <script>
        var gtype = '".$dat['ipgeo_field']."';
        </script>
		";
		}
	elseif($act == 'saveedit' && is_numeric($_GET['id']))
		{
		$uri = stripslashes($_POST['uri']);
		$name = stripslashes($_POST['name']);
		$parent = $_POST['parent'];
        $err = array();
        $dsql = "";
        if($_GET['unit'] == 'region'){
            $ipgeo_field = $_POST['gtype'];
            $ipgeo_value = $_POST['q'];
            if($ipgeo_field != "" && $ipgeo_value != "")
                {
                $dsql = ", ipgeo_field = '".$ipgeo_field."', ipgeo_value = '".$ipgeo_value."' ";
                }
            $check_tree = 'cat';
        }else{
    		$img = stripslashes($_POST['img']);
            $description = addslashes($__POST['description']);
            $check_tree = 'region';
            $dsql = ", img='".addslashes($img)."', description='".$description."'";

        }
        $uri = trim($uri);
        $luri = strtolower($uri);
        if(count($full_list[$check_tree]) > 0){
            if($parent == 0){
    		  foreach($full_list[$check_tree] as $v){
        		    if(strtolower($v['uri']) == $luri && $v['parent'] == 0){
        			    $err[] = $locale[320];
        			    break;
       			    }
     			}
            }
        }
		if($uri == ""){$err[] = $locale[484];}
		$uri = str_replace(' ', '_', $uri);
		foreach($full_list[$_GET['unit']] as $v)
			{
		    if($v['parent'] == $parent && $v['uri'] == $uri && $v['id'] != $_GET['id'])
			    {
			    $err[] = $locale[321].' &laquo;<b>'.stripslashes($v['name']).'</b>&raquo;';
			    break;
			    }
			}
		if(in_array($uri, $reserved_id))
			{
		    $err[] = $locale[332];
			}
        if($_GET['id'] == $parent )
            {
            $err[] = $locale[934]; 
            }


	    if(count($err) == 0)
		    {
	 	    dbquery("UPDATE ".$tbl." SET uri='".addslashes($uri)."', name='".addslashes($name)."', parent='".addslashes($parent)."'".$dsql." WHERE id=".$_GET['id']);
	 	    echo "

			<script>
            ";
            if($_cache){
                part_cashe_flush($_GET['id']);
                echo '
                $(document).ready(function(){
                    reindex4("?unit='.$_GET['unit'].'&act=edit&id='.$_GET['id'].'");
                });
                ';
            }else{
                echo "setTimeout(\"document.location.href='?unit=".$_GET['unit']."&act=edit&id=".$_GET['id']."'\",1000);";
            }
            echo "
		
			</script>
	 	    <center><div class='ok'>
             <div id=reindex_info></div>
             ".$locale[322]."
             </div></center>
	 	    ";
		    }
		else
			{
	 	    echo "
	 	    <center><div class='error'>
	 	    <ul>
	 	    ";
	 	    foreach($err as $v)
		 	    {
	 		    echo "<li>".$v."</li>";
		 	    }
	 	    echo "
	 	    </ul>
	 	    <a href='javascript:history.back(1);'>&laquo;&laquo; ".$locale[156]."</a>
	 	    </div></center>
	 	    ";
			}
		}
	elseif($act == 'del' && is_numeric($_GET['id']))
		{
		  
		$deletes_array = array();
        $deletes_array = get_childres($_GET['id'], $full_list[$_GET['unit']]);
        $deletes_array[] = $_GET['id'];
        $where1 = make_sql('id', $deletes_array);
        $where2 = make_sql($_GET['unit'], $deletes_array);
		dbquery("DELETE FROM ".$tbl." WHERE ".$where1);
        
        //$issetmsg = dbarray(dbquery("SELECT id FROM ".PREF."db WHERE status=1 AND ".$where2." LIMIT 1"));
		//dbquery("UPDATE ".PREF."db SET status=2 WHERE ".$where2);

        echo "
		<script>
        ";
        if($_cache){
            if(!$issetmsg){
                part_cashe_flush($_GET['id']);
            }
            echo '
            $(document).ready(function(){
                reindex4("?unit='.$_GET['unit'].'");
            });
            ';
        }else{
            echo "setTimeout(\"document.location.href='?unit=".$_GET['unit']."'\",1000);";
        }
        echo "
        </script>
        <center>
            <div class='ok'>
                <div id=reindex_info></div>        
                ".$locale[1318]."
            </div>
        </center>
        ";
		}
	elseif($act == 'recache')
		{
            echo "
			<script>
            ";
            if($_cache){
                part_cashe_flush(0);
                echo '
                $(document).ready(function(){
                    reindex4("?unit='.$_GET['unit'].'");
                });
                ';
            }else{
                echo "setTimeout(\"document.location.href='?unit=".$_GET['unit']."'\",1000);";
            }
            echo "
            </script>
            <center>
                <div class='ok'>
                    <div id=reindex_info></div>        
                    ".$locale[1318]."
                </div>
            </center>
            ";
		}
	}
?>