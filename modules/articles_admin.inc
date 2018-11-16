<?php   //976

if($exe){
	$lk = explode(',', $locale['symb']);
	$lk = implode("", $lk);
	$en = "A,B,V,G,D,E,E,Zh,Z,I,I,K,L,M,N,O,P,R,S,T,U,F,H,C,Ch,Sh,Sh,,Y,,E,Yu,Ya,a,b,v,g,d,e,e,zh,z,i,i,k,l,m,n,o,p,r,s,t,u,f,h,c,ch,sh,sh,,y,,e,yu,ya";
	$en = explode(',', $en);
	$en = implode("','", $en);
    if($act == "article_add" || $act == "article_edit"){
        echo "
        	<script type='text/javascript' language='javascript' charset='utf-8'>
        	// <![CDATA[
        	$(document).ready( function () {
        		var FROM_CAL = Calendar.setup({
        			inputField: 'pubdate',
                  	dateFormat: '%Y-%m-%d %H:%M',
                  	trigger: 'pubdate',
                  	bottomBar: false,
                  	date: Calendar.intToDate(".date("Ymd", $settings['time'])."),
                  	min: Calendar.intToDate(10001130),
                  	onSelect: function() {
        				var date = Calendar.intToDate(this.selection.get());
                        END_CAL.args.min = date;
        
                        FROM_CAL.hide();
                        END_CAL.redraw();
                        END_CAL.focus();
                  	}
          		});
        
        	});
        
        	// ]]>
        	</script>
        ";
    }
	echo "
	<link type='text/css' rel='stylesheet' href='".PATH."css/calendar/jscal2.css' />
	<link type='text/css' rel='stylesheet' href='".PATH."css/calendar/border-radius.css' />
	<link type='text/css' rel='stylesheet' href='".PATH."css/calendar/steel/steel.css' />
	<script src='".PATH."js/calendar/jscal2.js'></script>
	<script src='".PATH."js/calendar/lang/ru.js'></script>

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

    $(document).ready(function() {
        $('.showblock').click(function(){
            var type = $('#block').css('display');
            if(type == 'none'){
                $('#block').show(500);              
                }else{
                $('#block').hide(500);  
                }
            });
    });
    </script>
    ";
    if($act == ""){
        if($_POST['submit'] != ""){
            $err = array();
            if($_POST['name'] == "") $err[] = $locale[86].' '.$locale[253];
            if($_POST['uri'] == "") $err[] = $locale[86].' '.$locale[255];
            if(count($err) == 0){
                list($date, $time) = explode(' ', trim($_POST['pubdate']));
                list($y, $m, $d) = explode('-', $date);
                list($h, $i) = explode(':', $time);
                
                $pubdate = mktime($h,$i,0,$m,$d,$y);
                dbquery("INSERT INTO ".PREF."articles SET
                        name = '".$_POST['name']."',
                        cat = '".$_POST['cat']."',
                        uri = '".$_POST['uri']."',
                        keywords = '".$_POST['keywords']."',
                        content = '".addslashes($__POST['content'])."',
                        pubdate = '".$pubdate."'
                        ");   
                echo "
                <center><div class='ok'>".$locale[351]."</div></center>
                ";            
            }else{
                echo "
                <center>
                    <div class='err'>Error!</div>
                    <ul>
                    ";
                    foreach($err as $v){
                        echo "<li>".$v."</li>";
                    }
                    echo "
                    </ul>
                </center>
                ";                 
            }                
        }        
        if(isset($_POST['index'])){
            if(is_numeric($_POST['index'])){
                dbquery("UPDATE ".PREF."articles SET `index`=0");
                dbquery("UPDATE ".PREF."articles SET `index`=1 WHERE id=".$_POST['index']);                
            }

        }
        if(isset($_GET['del_id'])){
            if(is_numeric($_GET['del_id'])){
                if(dbquery("DELETE FROM ".PREF."articles WHERE id=".$_GET['del_id'])){
                    echo "
                    <center><div class='ok'>".$locale[351]."</div></center>
                    ";
                }
            }
        }        
        
        echo "
        <p>
            <input type='button' value='".$locale[1027]."' onclick='document.location.href=\"?unit=".$unit."&act=cat\"'>
            <input type='button' value='".$locale[1028]."' onclick='document.location.href=\"?unit=".$unit."&act=article_add\"'>
            ";
        
        $articles_cat = array();
        $res = dbquery("SELECT name, id FROM ".PREF."articles_cat");
        while($dat = dbarray($res)){
            $articles_cat[$dat['id']] = $dat;
        }
        
        
        if(!isset($_GET['category'])) $_GET['category'] = '';
        $where = ($_GET['category'] != '') ? " WHERE cat='".$_GET['category']."' " : '';
        
        if(!isset($_GET['page'])) $_GET['page'] = 0;
        if(!isset($_GET['onpage'])) $_GET['onpage'] = $on_page_default; 
        $page = $_GET['page'];
        $limit = "";
        $count_messages = dbrows(dbquery("SELECT id FROM ".PREF."articles ".$where.""));
    	$page_count = ceil($count_messages/$_GET['onpage']);
    	if($page > $page_count)
    		{
    		$page = $page_count;
    		}
    	if($page <= 0 )
    		{
    		$page = 1;
    		}
    	$offset = ( $page - 1 ) * $_GET['onpage'];
    	$limit = " LIMIT ".$offset.", ".$_GET['onpage'];
        
        
                            
        $dat = dbarray(dbquery("SELECT id FROM ".PREF."nav WHERE url='".PATH.$unit."/'"));
        if(!$dat){
            echo "<input type='button' value='".$locale[1040]."' class='showblock'>";
        }
        
        
            echo "
        </p>
        <div id='block' style='display: none; padding: 10px; width: 400px;'>
            <div style='border: 1px solid silver; margin: 10px;'>
                <h4>".$locale[1041] ."</h4>
                <form name='frm0' method='POST' action='?unit=nav&act=save'>
                 <input type=hidden name=url value='".PATH.$unit."/'>
                 <input type=hidden name=seporator value='0'>
                 <input type=hidden name=status value='0'>
                ".$locale[457].": <input type=text name=name value=''>
                <input type='submit' value=' ".$locale[125]." ' name='submit'>
                </form>
            </div>
        </div>
        
        
    	<form name='form' action='?' method='get' id='form'>
    	<input name='unit' type='hidden' value='".$_GET['unit']."'>
    	    <div align='center'>
    		    <div class='sort'>
    				".$locale[333].":
    				<select size='1' name='onpage'>
    				<option "; if($_GET['onpage'] == 5){echo ' selected ';} echo "value='5'>5</option>
    				<option "; if($_GET['onpage'] == 15){echo ' selected ';} echo "value='15'>15</option>
    				<option "; if($_GET['onpage'] == 30){echo ' selected ';} echo "value='30'>30</option>
    				<option "; if($_GET['onpage'] == 60){echo ' selected ';} echo "value='60'>60</option>
    				<option "; if($_GET['onpage'] == 100){echo ' selected ';} echo "value='100'>100</option>
    				<option "; if($_GET['onpage'] == 150){echo ' selected ';} echo "value='150'>150</option>
    				<option "; if($_GET['onpage'] == 200){echo ' selected ';} echo "value='200'>200</option>
    				<option "; if($_GET['onpage'] == 300){echo ' selected ';} echo "value='300'>300</option>
    				</select>
    				<img src='".PATH."admin/tpl/img/hor.gif' alt='' border='0' style='vertical-align:middle;'>
        			";
                    if(count($articles_cat) > 0){
                        echo "
                        ".$locale[17].":
                        <select name=category>
                        <option value=''>".$locale[204]."</option>
                        ";
                        foreach($articles_cat as $category){
                            echo "<option "; if($_GET['category'] == $category['id']){echo ' selected ';} echo "value='".$category['id']."'>".stripslashes($category['name'])."</option>";
                        }
                        echo "</select>";
                    }
        echo "
                    
                    <input type='submit' value='".$locale[335]."'>
    			</div>
    		</div>
    	</form>        
  
	    <table border='0' width='100%'>
	    <tr><td align='center' style='font-size:13px;'>
	    ".$locale[2]." <b>".$count_messages."</b>
	    </td></tr>
	    <tr><td>
	    ";
	    if($page_count > 1)
		    {
		    echo "
		    <div style='width:90%;'>
		    <div class='page unsel' >".$locale[140].":</div>
		    ";
		    for($i=1; $i <= $page_count; $i++)
			    {
		        echo "<div class='page ";
		        if($i == $_GET['page'])
			        {
			        echo "sel";
			        }
			    else
				    {
			 	    echo "unsel";
				    }
				echo "' onclick=\"go('?unit=".$_GET['unit']."&category=".$_GET['category']."&onpage=".$_GET['onpage']."&page=".$i."')\">".$i."</div>";
			    }
		    echo "
		    </div>
		    ";
		    }

//email pass date status  email_status  actions    name    balance


	    echo "
	    </td></tr>
	    </table>


	
        
        <form name='frm' method='POST'>
        <table align='center' width='99%' border='0' cellpadding='1' cellspacing='1' class='tbl'>
    	    <tr class='tbl_head'>
                <td>".$locale[273]."</td>
                <td>".$locale[17]."</td>
                <td colspan=2>".$locale[275]."</td>
    	    </tr>
        ";
        
        $res = dbquery("SELECT * FROM ".PREF."articles ".$where." ORDER by pubdate".$limit);
        while($dat = dbarray($res)){ 
            $cat = dbarray(dbquery("SELECT name FROM ".PREF."articles_cat WHERE id=".$dat['cat']));
            echo "
            <tr>
                <td>".stripslashes($dat['name'])."</td>
                <td>".stripslashes($cat['name'])."</td>
                <td align='center'>".ico("?unit=".$unit."&act=article_edit&id=".$dat['id'], 'e')."</td>
                <td align='center'>".ico("?unit=".$unit."&del_id=".$dat['id'], 'd')."</td>
            </tr>
            ";
        }
        echo "</table>
        </form>
        

        ";
    }elseif($act == "cat"){
        if($_POST['submit'] != ""){
            $err = array();
            if($_POST['name'] == "") $err[] = $locale[86].' '.$locale[253];
            if($_POST['uri'] == "") $err[] = $locale[86].' '.$locale[255];
            if(count($err) == 0){
                dbquery("INSERT INTO ".PREF."articles_cat SET
                        name = '".$_POST['name']."',
                        uri = '".$_POST['uri']."',
                        description = '".addslashes($__POST['description'])."'
                         ");   
                echo "
                <center><div class='ok'>".$locale[351]."</div></center>
                ";            
            }else{
                echo "
                <center>
                    <div class='err'>Error!</div>
                    <ul>
                    ";
                    foreach($err as $v){
                        echo "<li>".$v."</li>";
                    }
                    echo "
                    </ul>
                </center>
                ";                 
            }


        }

        if(isset($_GET['del_id'])){
            if(is_numeric($_GET['del_id'])){
                if(dbquery("DELETE FROM ".PREF."articles_cat WHERE id=".$_GET['del_id'])){
                    echo "
                    <center><div class='ok'>".$locale[351]."</div></center>
                    ";
                }
            }
        }
        echo "
        <p>
            <input type='button' value='".$locale[1026]."' onclick='document.location.href=\"?unit=".$unit."\"'>
            <input type='button' value='".$locale[251]."' class='showblock'>
        </p>
        
			<div id='block' align='center' style='display:none;'>
			    <form name='form' action='?unit=".$unit."&act=cat' method='post'>
	            <FIELDSET style='width:700px;'><LEGEND>".$locale[252]."</LEGEND>
	            <table width='100%' class='add_item'>
	            <tr>
                    <td>".$locale[253]."</td>
                    <td>
                        <input id='catname' name='name' type='text' value='' style='width:100%;'>
                    </td>
                </tr>
	            <tr><td colspan='2' align='center'>[ <a href=\"javascript:copy_id('n');\">&darr; ".$locale[257]."</a> ] [ <a href=\"javascript:copy_id('t');\">&darr; ".$locale[258]."</a> ]</td></tr>
	            <tr>
                    <td>".hlp($locale[256])." ".$locale[255]."</td>
                    <td>
                        <input id='catid' name='uri' type='text' value='' style='width:100%;'>
                    </td>
                </tr>
	            <tr>
                    <td colspan='2'>
                        <p>".$locale[358]."</p>
                        <textarea class='ckeditor' name='description'></textarea>
                    </td>
                </tr>
                </table>
                <input name='post_filter' type='hidden' value='false'>
	            <div align='center' style='margin:5px;'>
                    <input type='submit' name='submit' value=' ".$locale[125]." '>
                </div>
	            </FIELDSET>
				</form>
		      </div>
        ";
        
        echo "
        <table align='center' width='99%' border='0' cellpadding='1' cellspacing='1' class='tbl'>
    	    <tr class='tbl_head'>
                <td>".$locale[880]."</td>
                <td>".$locale[255]."</td>
                <td>".$locale[358]."</td>
                <td colspan=2>".$locale[275]."</td>
    	    </tr>
        ";
        $res = dbquery("SELECT * FROM ".PREF."articles_cat");
        while($dat = dbarray($res)){
            $dat = stripslashes_recursive($dat);
            echo "
            <tr>
                <td>".$dat['name']."</td>
                <td>".$dat['uri']."</td>
                <td>".strip_tags($dat['description'])."</td>
                <td align='center'>".ico("?unit=".$unit."&act=cat_edit&id=".$dat['id'], 'e')."</td>
                <td align='center'>".ico("?unit=".$unit."&act=cat&del_id=".$dat['id'], 'd')."</td>
            </tr>
            ";
        }
        echo "</table>\n";
    }elseif($act == 'cat_edit' && isset($_GET['id'])){
        if(is_numeric($_GET['id'])){
            
            if($_POST['submit'] != ""){
                $err = array();
                if($_POST['name'] == "") $err[] = $locale[86].' '.$locale[253];
                if($_POST['uri'] == "") $err[] = $locale[86].' '.$locale[255];
                if(count($err) == 0){
                    dbquery("UPDATE ".PREF."articles_cat SET
                            name = '".$_POST['name']."',
                            uri = '".$_POST['uri']."',
                            description = '".addslashes($__POST['description'])."'
                            WHERE id=".$_GET['id']);   
                    echo "
                    <center><div class='ok'>".$locale[351]."</div></center>
                    ";            
                }else{
                    echo "
                    <center>
                        <div class='err'>Error!</div>
                        <ul>
                        ";
                        foreach($err as $v){
                            echo "<li>".$v."</li>";
                        }
                        echo "
                        </ul>
                    </center>
                    ";                 
                }                
            }

            
            $dat = dbarray(dbquery("SELECT * FROM ".PREF."articles_cat WHERE id=".$_GET['id']));
            $dat = stripslashes_recursive($dat);
        }
        echo "
        <p>
            <input type='button' value='".$locale[1026]."' onclick='document.location.href=\"?unit=".$unit."\"'>
            <input type='button' value='".$locale[1027]."' onclick='document.location.href=\"?unit=".$unit."&act=cat'>
        </p>
        
			<div id='block' align='center'>
			    <form name='form' action='' method='post'>
	            <FIELDSET style='width:700px;'><LEGEND>".$locale[252]."</LEGEND>
	            <table width='100%' class='add_item'>
	            <tr>
                    <td>".$locale[253]."</td>
                    <td>
                        <input id='catname' name='name' type='text' value='".$dat['name']."' style='width:100%;'>
                    </td>
                </tr>
	            <tr><td colspan='2' align='center'>[ <a href=\"javascript:copy_id('n');\">&darr; ".$locale[257]."</a> ] [ <a href=\"javascript:copy_id('t');\">&darr; ".$locale[258]."</a> ]</td></tr>
	            <tr>
                    <td>".hlp($locale[256])." ".$locale[255]."</td>
                    <td>
                        <input id='catid' name='uri' type='text' value='".$dat['uri']."' style='width:100%;'>
                    </td>
                </tr>
	            <tr>
                    <td colspan='2'>
                        <p>".$locale[358]."</p>
                        <textarea class='ckeditor' name='description'>".$dat['description']."</textarea>
                    </td>
                </tr>
                </table>
                <input name='post_filter' type='hidden' value='false'>
	            <div align='center' style='margin:5px;'>
                    <input type='submit' name='submit' value=' ".$locale[837]." '>
                </div>
	            </FIELDSET>
				</form>
		      </div>
        ";        
    }elseif($act=='article_add'){   
        echo "
            <p>
                <input type='button' value='".$locale[1026]."' onclick='document.location.href=\"?unit=".$unit."\"'>
                <input type='button' value='".$locale[1027]."' onclick='document.location.href=\"?unit=".$unit."&act=cat'>
            </p>
			<div id='block' align='center' >
			    <form name='form' action='?unit=".$unit."' method='post'>
	            <FIELDSET style='width:700px;'><LEGEND>".$locale[1028]."</LEGEND>
	            <table width='100%' class='add_item'>
	            <tr>
                    <td>".$locale[1029]."</td>
                    <td>
                        <input id='catname' name='name' type='text' value='' style='width:100%;'>
                    </td>
                </tr>
	            <tr><td colspan='2' align='center'>[ <a href=\"javascript:copy_id('n');\">&darr; ".$locale[257]."</a> ] [ <a href=\"javascript:copy_id('t');\">&darr; ".$locale[258]."</a> ]</td></tr>
	            <tr>
                    <td>".hlp($locale[256])." ".$locale[255]."</td>
                    <td>
                        <input id='catid' name='uri' type='text' value='' style='width:100%;'>
                    </td>
                </tr>
	            <tr>
                    <td> ".$locale[107]."</td>
                    <td>
                        <input name='keywords' type='text' value='' style='width:100%;'>
                    </td>
                </tr>
	            <tr>
                    <td> ".$locale[276]."</td>
                    <td>
                        <input name='pubdate' id='pubdate' type='text' value='".date("Y-m-d H:i", $settings['time'])."' style='width:100%;'>
                    </td>
                </tr>
	            <tr>
                    <td> ".$locale[17]."</td>
                    <td>
                        <select name='cat'>
                            ";
                            $res = dbquery("SELECT name, id FROM ".PREF."articles_cat");
                            while($dat = dbarray($res)){
                                echo "
                                <option value=".$dat['id'].">".stripslashes($dat['name'])."</option>
                                ";
                            }
                            echo "
                        </select>
                    </td>
                </tr>
	            <tr>
                    <td colspan='2'>
                        <p>".hlp($locale[1032])." ".$locale[1031]."</p>
                        <textarea class='ckeditor' name='content'></textarea>
                    </td>
                </tr>
                </table>
                <input name='post_filter' type='hidden' value='false'>
	            <div align='center' style='margin:5px;'>
                    <input type='submit' name='submit' value=' ".$locale[125]." '>
                </div>
	            </FIELDSET>
				</form>
		      </div>
              
              
        ";
    }elseif($act=='article_edit' && isset($_GET['id'])){   
        if(is_numeric($_GET['id'])){
            
            if($_POST['submit'] != ""){
                $err = array();
                if($_POST['name'] == "") $err[] = $locale[86].' '.$locale[253];
                if($_POST['uri'] == "") $err[] = $locale[86].' '.$locale[255];
                if(count($err) == 0){
                    list($date, $time) = explode(' ', trim($_POST['pubdate']));
                    list($y, $m, $d) = explode('-', $date);
                    list($h, $i) = explode(':', $time);
                    $pubdate = mktime($h,$i,0,$m,$d,$y);
                    dbquery("UPDATE ".PREF."articles SET
                                name = '".$_POST['name']."',
                                cat = '".$_POST['cat']."',
                                uri = '".$_POST['uri']."',
                                keywords = '".$_POST['keywords']."',
                                content = '".addslashes($__POST['content'])."',
                                pubdate = '".$pubdate."'
                            WHERE id=".$_GET['id']);   
    
                        echo "
                        <center><div class='ok'>".$locale[351]."</div></center>
                        ";            
                }else{
                    echo "
                    <center>
                        <div class='err'>Error!</div>
                        <ul>
                        ";
                        foreach($err as $v){
                            echo "<li>".$v."</li>";
                        }
                        echo "
                        </ul>
                    </center>
                    ";                 
                }                
            }
            
            $dat = dbarray(dbquery("SELECT * FROM ".PREF."articles WHERE id=".$_GET['id']));
            $dat = stripslashes_recursive($dat);
        }
        echo "
            <p>
                <input type='button' value='".$locale[1026]."' onclick='document.location.href=\"?unit=".$unit."\"'>
                <input type='button' value='".$locale[1027]."' onclick='document.location.href=\"?unit=".$unit."&act=cat\"'>
            </p>
			<div id='block' align='center' >
			    <form name='form' action='' method='post'>
	            <FIELDSET style='width:700px;'><LEGEND>".$locale[1030]."</LEGEND>
	            <table width='100%' class='add_item'>
	            <tr>
                    <td>".$locale[1029]."</td>
                    <td>
                        <input id='catname' name='name' type='text' value='".$dat['name']."' style='width:100%;'>
                    </td>
                </tr>
	            <tr><td colspan='2' align='center'>[ <a href=\"javascript:copy_id('n');\">&darr; ".$locale[257]."</a> ] [ <a href=\"javascript:copy_id('t');\">&darr; ".$locale[258]."</a> ]</td></tr>
	            <tr>
                    <td>".hlp($locale[256])." ".$locale[255]."</td>
                    <td>
                        <input id='catid' name='uri' type='text' value='".$dat['uri']."' style='width:100%;'>
                    </td>
                </tr>
	            <tr>
                    <td> ".$locale[107]."</td>
                    <td>
                        <input name='keywords' type='text' value='".$dat['keywords']."' style='width:100%;'>
                    </td>
                </tr>
	            <tr>
                    <td> ".$locale[276]."</td>
                    <td>
                        <input name='pubdate' id='pubdate' type='text' value='".date("Y-m-d H:i", $dat['pubdate'])."' style='width:100%;'>
                    </td>
                </tr>
	            <tr>
                    <td> ".$locale[17]."</td>
                    <td>
                        <select name='cat'>
                            ";
                            $res2 = dbquery("SELECT name, id FROM ".PREF."articles_cat");
                            while($dat2 = dbarray($res2)){
                                echo "
                                <option ";
                                if($dat2['id'] == $dat['cat']) echo "selected ";
                                echo "value=".$dat2['id'].">".stripslashes($dat2['name'])."</option>
                                ";
                            }
                            echo "
                        </select>
                    </td>
                </tr>
	            <tr>
                    <td colspan='2'>
                        <p>".hlp($locale[1032])." ".$locale[1031]."</p>
                        <textarea class='ckeditor' name='content'>".$dat['content']."</textarea>
                    </td>
                </tr>
                </table>
                <input name='post_filter' type='hidden' value='false'>
	            <div align='center' style='margin:5px;'>
                    <input type='submit' name='submit' value=' ".$locale[125]." '>
                </div>
	            </FIELDSET>
				</form>
		      </div>
              
              
        ";
    }

}

?>