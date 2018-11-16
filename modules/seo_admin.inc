<?php       //943
//(t)itle, (n)oindex, (3)01, (4)04

if(!$exe){
    
    $first_el = '';
    foreach($full_tree['cat']['cat'] as $v){
        $first_el = $v['uri'];
        break;
    }
    if(isset($_GET['act'])){
        if($_GET['act'] == 'savesort'){
            if(isset($_POST['data'])){
                if(is_array($_POST['data'])){
                    if(count($_POST['data']) > 0){
                        foreach($_POST['data'] as $k => $v){
                            dbquery("UPDATE ".PREF."seo SET sort='".intval($k)."' WHERE id=".intval($v));
                        }
                    }
                }
            }
            echo 'ok';
            exit();
    	}
    }
}else{
    $onpage_list = array(5,15,30,60,100,150,200,300);
    function parse_seourl($url){
        $expl = explode($_SERVER['HTTP_HOST'].PATH, $url);
        if(isset($expl[1])){
            $url = $expl[1];
        }
        $url = str_replace('*', '%', $url);
        return $url;
    }

    if(!isset($_GET['onpage'])) $_GET['onpage'] = $on_page_default;
    
    echo "
    <script>
    $(document).ready(function() {
        
        $('.changetype').click(function(){
            var type = $(this).attr('value');
            if(type == 't'){
                $('#bl-t').show(500);
                $('#bl-3').hide(500);
                }
            if(type == 'n'){
                $('#bl-t').hide(500);
                $('#bl-3').hide(500);                
                }
            if(type == '4'){
                $('#bl-t').hide(500);
                $('#bl-3').hide(500);                
                }
            if(type == '3'){
                $('#bl-t').hide(500);
                $('#bl-3').show(500);                
                }
            });
        
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

    $trules = array();
    $trules['t'] = $locale[939];
    $trules['n'] = $locale[940];
    $trules['4'] = $locale[941];
    $trules['3'] = $locale[942];
    
    if($act == ""){
	

    if(isset($_POST['url'])){
        $max_sort = dbarray(dbquery("SELECT MAX(sort) as m FROM ".PREF."seo"));
        $max_sort = intval($max_sort['m']) + 1;        
        dbquery("INSERT INTO ".PREF."seo SET
                url = '".parse_seourl($_POST['url'])."',
                title = '".$_POST['title']."',
                keywords = '".$_POST['keywords']."',
                description = '".$_POST['description']."',
                type = '".$_POST['type']."',
                redirect_url = '".$_POST['redirect_url']."',
                nonstrict = '".$_POST['nonstrict']."',
                sort=".$max_sort."
                 ");
                 
        echo "
        <div style='text-align:center;'><div class='ok'>".$locale[351]."</div></div>
        ";
    }
    
    
    	echo "\n<div align='left'>
		<input type='button' value='".$locale[476]."' class='showblock'>
        ".(isset($_GET['sort'])    
            ? "<input type='button' value='".$locale[200]."' onclick='document.location.href=\"?unit=".$_GET['unit']."\"'> <input type='button' value='".$locale[872]."' id='savesort' disabled>"
            : "<input type='button' value='".$locale[1204]."' onclick='document.location.href=\"?unit=".$_GET['unit']."&sort\"'>"
            )."
		
        
		<br><br>
        ";
        
        if(!isset($_GET['sort'])){
            echo "
            
            <div class='warn'>
                ".$locale[1335]."
            </div>
            
            <form name='form' action='' method='get' id='form'>
        	<input name='unit' type='hidden' value='".$unit."'>
        	    <div align='center'>
        		    <div class='sort' style='width:550px;'>
        				".$locale[333].":
        				<select size='1' name='onpage'>
                        ";
                        foreach($onpage_list as $v){
                            echo "<option "; if($_GET['onpage'] == $v){echo ' selected ';} echo "value='".$v."'>".$v."</option>";
                        }
                        echo "
        				</select>
        				<input type='submit' value='".$locale[335]."'>
        			</div>
        		</div>
        	</form>
            
            
            ";
        }else{
            echo "
            <div class='warn'>
                ".$locale[1334]."
            </div>
            ";
        }

        
        echo "

  
			<div id='block' align='center' style='display:none;'>
			    <form name='form' action='?unit=".$unit."' method='post'>
	            <FIELDSET style='width:500px;'><LEGEND>".$locale[477]."</LEGEND>
	            <table width='100%' class='add_item'>
	            <tr>
                    <td colspan=2>
                        ".$locale[937]."
                        <br>
                        <input name='url' type='text' value='' style='width:100%;' 
                            placeholder='".$locale[1336].', '.$settings['http'].'://'.$_SERVER['HTTP_HOST'].PATH.$first_el."/*'></br>
                        <br>
                        <div class=warn style='text-align:left;'>
                            ".$locale[1337]."<br>
                            <i>".$first_el."/</i><br>
                            ".$locale[1338]."<br>
                            <i>".$settings['http'].'://'.$_SERVER['HTTP_HOST'].PATH.$first_el."/</i><br>
                            ".$locale[1339]."<br>
                            <i>".$settings['http'].'://'.$_SERVER['HTTP_HOST'].PATH.$first_el."/page*.html</i><br>
                        </div>
                    </td>
                </tr>

	            <tr><td>".$locale[938]."</td><td>
                <p><input type='radio' name='type' value='t' class='changetype' checked>&nbsp;".$locale[939]."</p>
                <p><input type='radio' name='type' value='n' class='changetype'>&nbsp;".$locale[940]."</p>
                <p><input type='radio' name='type' value='4' class='changetype'>&nbsp;".$locale[941]."</p>
                <p><input type='radio' name='type' value='3' class='changetype'>&nbsp;".$locale[942]."</p>
                </td></tr>

        		</table>
                
                <div id='bl-t'>
                    <table width='100%' class='add_item'>
                        <tr>
                            <td>".$locale[944]."</td>
                            <td><input type='text' name='title' width='100%'></td>
                        <tr>
                        <tr>
                            <td>".$locale[945]."</td>
                            <td><input type='text' name='keywords'  width='100%'></td>
                        <tr>
                        <tr>
                            <td>".$locale[946]."</td>
                            <td><input type='text' name='description'  width='100%'></td>
                        <tr>
                    </table>
                </div>
                
                <div id='bl-3' style='display:none;'>
                    <table width='100%' class='add_item'>
                        <tr>
                            <td>".hlp($locale[947])." ".$locale[948]."</td>
                            <td><input type='text' name='redirect_url'  width='100%'></td>
                        <tr>
                    </table>
                </div>

                
	            <div align='center' style='margin:5px;'><input type='submit' name='submit' value=' ".$locale[125]." '></div>
	            </FIELDSET>
				</form>
		      </div>
        </div>\n";


    echo "
    <table align='center' width='99%' border='0' cellpadding='1' cellspacing='1' class='tbl ".(isset($_GET['sort']) ? 'fields_sort' : '')."'>
	  <thead>
        <tr class='tbl_head'>
            <td>".$locale[937]."</td>
            <td>".$locale[938]."</td>
            <td>".$locale[949]."</td>
            ".(isset($_GET['sort']) ? '' : "<td colspan=2>".$locale[275]."</td>")."
	    </tr>
      </thead>
      <tbody>
    ";


    $sql_count = "SELECT COUNT(*) as count FROM ".PREF."seo";
    $count_messages = dbarray(dbquery($sql_count));
    $count_messages = $count_messages['count'];
    $page = intval($_GET['page']);
    $_GET['onpage'] = intval($_GET['onpage']);
    $limit = "";
	$page_count = ceil($count_messages/$_GET['onpage']);
	if($page > $page_count) $page = $page_count;
	if($page <= 0 ) $page = 1;
	$offset = ( $page - 1 ) * $_GET['onpage'];
	$limit = " LIMIT ".$offset.", ".$_GET['onpage'];
    
     if(isset($_GET['sort'])){
        $limit = "";
        $page_count = false;
     }
    
    $res = dbquery("SELECT * FROM ".PREF."seo order by sort".$limit);
    while($dat = dbarray($res)){
        echo "
        <tr data-id=".$dat['id'].">
            <td><a target='_blank' href='//".$settings['site_address'].PATH.str_replace('%', '', $dat['url'])."'>".str_replace('%', '*', $dat['url'])."</td>
            <td>".$trules[$dat['type']]."</td>
            <td>";
            if($dat['type'] == 't'){
                echo "<p><b>".$locale[944]."</b>: ".$dat['title']."</p>\n";
                echo "<p><b>".$locale[945]."</b>: ".$dat['keywords']."</p>\n";
                echo "<p><b>".$locale[946]."</b>: ".$dat['description']."</p>\n";
            }elseif($dat['type'] == '3'){
                echo "<p><b>".$locale[948]."</b>: ".$dat['redirect_url']."</p>\n";
            }
            echo "</td>";
            
            if(!isset($_GET['sort'])){
                echo "
                <td align='center'>".ico("?unit=".$unit."&act=edit&id=".$dat['id'], 'e')."</td>
                <td align='center'>".ico("?unit=".$unit."&act=del&id=".$dat['id'], 'd')."</td>
                ";
            }
        echo "
        </tr>
        ";
    }
    echo "
      </tbody>
    </table>\n";
    
    if($page_count > 1){
	    echo "
        <br><br>
	    <div style='width:90%;'>
	    <div class='page unsel' >".$locale[140].":</div>
	    ";
        $get = $_GET;
	    for($i=1; $i <= $page_count; $i++){
            $get['page'] = $i;
            $go = '?'.http_build_query($get);
            echo "<div class='page ".(($i == $_GET['page']) ? 'sel' : 'unsel')." ' onclick=\"go('".$go."')\">".$i."</div>";
        }
	    echo "
	    </div>
	    ";
	    }    
    }
    elseif($act == 'edit' && isset($_GET['id'])){
        
        if(isset($_POST['url'])){

            dbquery("UPDATE ".PREF."seo SET
                    url = '".parse_seourl($_POST['url'])."',
                    title = '".$_POST['title']."',
                    keywords = '".$_POST['keywords']."',
                    description = '".$_POST['description']."',
                    type = '".$_POST['type']."',
                    redirect_url = '".$_POST['redirect_url']."',
                    nonstrict = '".$_POST['nonstrict']."'
                    WHERE id=".$_GET['id']);
                     
            echo "
            <center><div class='ok'>".$locale[351]."</div></center>
            ";
        }
        
        if(is_numeric($_GET['id'])){
            $dat = dbarray(dbquery("SELECT * FROM ".PREF."seo WHERE id=".$_GET['id']));
        }
    	echo "\n
        
        
			<div align='center'>
			    <form name='form' action='' method='post'>
	            <FIELDSET style='width:500px;'><LEGEND>".$locale[477]."</LEGEND>
	            <table width='100%' class='add_item'>
	            <tr>
                    <td colspan=2>
                        ".$locale[937]."
                        <br>
                        <input name='url' type='text' value='".str_replace('%', '*', $dat['url'])."' style='width:100%;' 
                            placeholder='".$locale[1336].', '.$settings['http'].'://'.$_SERVER['HTTP_HOST'].PATH.$first_el."/*'></br>
                        <br>
                        <div class=warn style='text-align:left;'>
                            ".$locale[1337]."<br>
                            <i>".$first_el."/</i><br>
                            ".$locale[1338]."<br>
                            <i>".$settings['http'].'://'.$_SERVER['HTTP_HOST'].PATH.$first_el."/</i><br>
                            ".$locale[1339]."<br>
                            <i>".$settings['http'].'://'.$_SERVER['HTTP_HOST'].PATH.$first_el."/page*.html</i><br>
                        </div>
                    </td>
                </tr>

	            <tr><td>".$locale[938]."</td><td>
                <p><input "; if($dat['type'] == 't') echo 'checked'; echo " type='radio' name='type' value='t' class='changetype'>&nbsp;".$locale[939]."</p>
                <p><input "; if($dat['type'] == 'n') echo 'checked'; echo " type='radio' name='type' value='n' class='changetype'>&nbsp;".$locale[940]."</p>
                <p><input "; if($dat['type'] == '4') echo 'checked'; echo " type='radio' name='type' value='4' class='changetype'>&nbsp;".$locale[941]."</p>
                <p><input "; if($dat['type'] == '3') echo 'checked'; echo " type='radio' name='type' value='3' class='changetype'>&nbsp;".$locale[942]."</p>
                </td></tr>

        		</table>
                
                <div id='bl-t' "; if($dat['type'] != 't') {echo 'style="display:none;"';} echo ">
                    <table width='100%' class='add_item'>
                        <tr>
                            <td>".$locale[944]."</td>
                            <td><input type='text' name='title' width='100%' value='".$dat['title']."'></td>
                        <tr>
                        <tr>
                            <td>".$locale[945]."</td>
                            <td><input type='text' name='keywords'  width='100%' value='".$dat['keywords']."'></td>
                        <tr>
                        <tr>
                            <td>".$locale[946]."</td>
                            <td><input type='text' name='description'  width='100%' value='".$dat['description']."'></td>
                        <tr>
                    </table>
                </div>
                
                <div id='bl-3' "; if($dat['type'] != '3') {echo 'style="display:none;"';} echo ">
                    <table width='100%' class='add_item'>
                        <tr>
                            <td>".hlp($locale[947])." ".$locale[948]."</td>
                            <td><input type='text' value='".$dat['redirect_url']."' name='redirect_url'  width='100%'></td>
                        <tr>
                    </table>
                </div>

                
	            <div align='center' style='margin:5px;'><input type='submit' name='submit' value=' ".$locale[34]." '></div>
	            
                </div>
                <p></p>
                <p align='center'><input value='&larr; ".$locale[324]."' type='button' onclick='document.location.href=\"?unit=".$unit."\";'></p>

                ";
       
    }
    elseif($act='del' && isset($_GET['id'])){
        if(is_numeric($_GET['id'])){
            dbquery("DELETE FROM ".PREF."seo WHERE id=".$_GET['id']);
    		echo "
    		<script>
    		setTimeout(\"document.location.href='?unit=".$unit."'\",500);
    		</script>
    		<center><div class='ok'>".$locale[325]."</div></center>
    		";
        }   
    }
}



?>