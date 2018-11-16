<?php //1103
if(!$exe){
    
    include(FULLPATH.'modules/shop_common.php');
    
    $onpage_list = array(5,15,30,60,100,150,200,300);
    $sort_list = array(
            array('shop.id', $locale[1105]), 
            array('user_name', $locale[336]), 
            array('name', $locale[1104]), 
            array('count', $locale[1106])
            );
    if($settings['shop_pay'] == 1) $sort_list[] = array('next_pay', $locale[1169]);
    $text_fields = array(
            array('description', $locale[358]), 
            array('delivery', $locale[1107] ), 
            array('payment', $locale[1108])
            );
    $string_fields = array(
            array('phone1', $locale[1109]), 
            array('phone2', $locale[1110]), 
            array('addr', $locale[458]),
            array('map', $locale[1111]),
            array('site', $locale[410])
            );      
   $mod_status = array($locale[219], $locale[1055], $locale[1151]);

    
   if(!isset($_GET['onpage'])) $_GET['onpage'] = $on_page_default;
   if(!isset($_GET['sort'])) $_GET['sort'] = 0;
   if(!isset($_GET['desc'])) $_GET['desc'] = 0;
   if(!isset($_GET['status'])) $_GET['status'] = $settings['shop_status'];
}else{

    echo "

	<link type='text/css' rel='stylesheet' href='".$settings['path']."css/calendar/jscal2.css' />
	<link type='text/css' rel='stylesheet' href='".$settings['path']."css/calendar/border-radius.css' />
	<link type='text/css' rel='stylesheet' href='".$settings['path']."css/calendar/".$calendar_theme."/".$calendar_theme.".css' />
	<script src='".$settings['path']."js/calendar/jscal2.js'></script>
	<script src='".$settings['path']."js/calendar/lang/".$calendar_lang.".js'></script>

	<script>

	$(document).ready( function () {
	   
        if($('#next_pay').length > 0){
            Calendar.setup({
                inputField : 'next_pay',
                trigger    : 'next_pay',
                onSelect   : function() { this.hide() }
            });
        }


        $('#selunsel').click(function(event) {
                $('.shopsel').each(
                  function(){
                    var el = $(this);
                    if(el.prop('checked')){
                        el.prop('checked', false);
                    }else{
                        el.prop('checked', true);
                    }
                  }
                );
                event.preventDefault();

        });
        
    $('.shop_pay_types_del').click(function(event) {
        if(confirm('".$locale[43]."')){
           	 $(this).parent().parent().remove();
           
        }
         event.preventDefault();
      });

	});





    
    
	</script>";    
    
    if($act == ""){
        if($_POST['submit'] != ""){
            if(isset($_POST['shops'])){
                if(count($_POST['shops']) > 0){
                    $status = intval($_POST['status']);
                    $shps = array();
                    foreach($_POST['shops'] as $v){
                        $shps[] = intval($v);
                    }
                    $sql = "UPDATE ".PREF."users_shop SET status=$status";
                    if($_POST['next_pay'] != ""){
                        $sql .= ", next_pay = '".addslashes($_POST['next_pay'])."'";
                    }
                    $sql .= " WHERE id IN(".implode(',', $shps).")";
                    dbquery($sql);
                }
            }
        }

    
   echo "
    <h4>".$locale[1146]."</h4>

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
			    <img src='".$settings['path']."admin/tpl/img/vert.gif' width='5' alt='' border='0' style='vertical-align:middle;'>
				".$locale[67].":
				<select size='1' name='sort'>
                ";
                foreach($sort_list as $k => $v){
                    echo "<option "; if($_GET['sort'] == $k){echo ' selected ';} echo "value='".$k."'>".$v[1]."</option>";
                }
                echo "
				</select>
                <p><label><input type=checkbox name=desc value=1 style='height: auto;' ".(($_GET['desc'] == 1) ? ' checked ' : '')."> ".$locale[205]."<label></p>
       			<img src='".$settings['path']."admin/tpl/img/hor.gif' width='500' alt='' border='0' style='vertical-align:middle; margin:4px;'>
				".$locale[1054].":
				<select size='1' name='status'>
                ";
                foreach($mod_status as $k => $v){
                    echo "<option "; if($_GET['status'] == $k){echo ' selected ';} echo "value='".$k."'>".$v."</option>";
                }
                echo "
				</select>
				<input type='submit' value='".$locale[335]."'>
			</div>
		</div>
	</form>
    ";


    $sql_count = "SELECT COUNT(*) as count FROM ".PREF."users_shop";
    $desc = ($_GET['desc'] == 1) ? ' DESC ' : ' ASC ';
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

    if($page_count > 1){
	    echo "
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

    echo "   
    <form name='shop_list' method='POST' action=''> 
	<table align='center' cellpadding='0' cellspacing='0'  border='0' cellpadding='1' cellspacing='1' class='tbl'>
		<tr class='tbl_head'>
			<td>".$locale[336]."</td>
			<td>".$locale[357]."</td>
			<td>".$locale[5]."</td>
			<td>".$locale[1054]."</td>
            ";
            //upd170216
            if($settings['shop_pay'] == 1){
                echo "
                <td>".$locale[1169]."</td>
                ";
            }
            echo "
			<td>".$locale[275]."</td>
		</tr>
    ";
    
    $sql = "
            SELECT 
            usr.name as user_name, usr.id as user_id, COUNT(db.id) as count,  UNIX_TIMESTAMP(shop.next_pay) as shop_next_pay, shop.*
            FROM ".PREF."users_shop shop 
            LEFT JOIN ".PREF."users usr ON shop.user_id = usr.id 
            LEFT JOIN ".PREF."db db ON (db.user_id = usr.id AND db.status=1)
            WHERE shop.status=".intval($_GET['status'])."
            GROUP by shop.id
            ORDER by ".$sort_list[intval($_GET['sort'])][0]."
            ".$desc."
            ".$limit."
            ";

    $res = dbquery($sql);
    while($dat = dbarray($res)){
        echo "
		<tr>
			<td>
            ";
            if(is_null($dat['user_name'])){
                echo "<i class='fa fa-user'></i> deleted";
            }else{
                echo "
                    <a onmouseover=\"Tip(this, '".$locale[1127]."')\" onmouseout=\"UnTip(this)\"  onclick=\"popup('?user_opt&id=".$dat['user_id']."', 400, 400);\" href=#>
                        <i class='fa fa-user'></i>
                        ".$dat['user_name']."
                    </a>
                ";
            }
            echo "
            </td>
            ";
            //upd170217
            echo "
            <td><a target='_blank' href='../shops/".$dat['id']."-".cpu($dat['name'])."/'><i class='fa fa-external-link' aria-hidden='true'></i> ".$dat['name']."</a></td>
			<td><a href='?unit=edit&onpage=30&status=1&cat=all&region=all&user_id=".$dat['user_id']."&approved=all'>".$dat['count']."</a></td>
            <td>".$mod_status[$dat['status']]."</td>
            ";
            //upd170216
            if($settings['shop_pay'] == 1){
                
                echo "
                <td style='color:".(($dat['shop_next_pay'] < $settings['time']) ? 'red' : 'green')."'>".(($dat['shop_next_pay'] == 0) ? $locale[1170] : date('d.m.Y', $dat['shop_next_pay']))."</td>
                ";
            }
            
            //upd170216
            echo "
			<td>
			        <nobr>
                        <input class='shopsel' onmouseover=\"Tip(this, '".$locale[339]."')\" onmouseout=\"UnTip(this)\" type='checkbox' name='shops[]' value='".$dat['id']."'>
				        ".ico("?unit=".$unit."&act=edit&id=".$dat['id'], 'e')."
				        ".ico("?unit=".$unit."&act=del&id=".$dat['id'], 'd')."
				  	<nobr>
            </td>
		</tr>
        ";
    }
    echo "    
    </table>
    <div align='center' class='tab_fut_a tbl'>

        <a href='#' id='selunsel'>".$locale[341]."</a>
        <br /><br />
        ".$locale[342].":
        <select size='1' name='status'>";
            foreach($mod_status as $k => $v){
                echo "<option "; if($k == 1){echo ' selected ';} echo "value='".$k."'>".$v."</option>";
            }
        echo "
        </select>
        ".$locale[1169]."
        <input  name='next_pay' id='next_pay' placeholder='".$locale[1274]."' value=''>
        
    	<input type='submit' name='submit' value='".$locale[335]."'>
    </div>
    </form>
    <h4>".$locale[306]."</h4>
        
    ";
    
    $chekers = array('shop_status'=>1, 'shop'=>0, 'shop_pay'=>0);
    
    //upd170216
    if(isset($_POST['opt']['shop_pay_types'])){
        $shop_pay_save = $_POST['opt']['shop_pay_types'];
        $_POST['opt']['shop_pay_types'] = array();
        if(is_array($shop_pay_save)){
            if(count($shop_pay_save) > 0){
                foreach($shop_pay_save as $k=>$v){
                    if(trim($v['name']) != ""){
                        $v['time'] = trim($v['time']);
                        $v['time'] = 86400 * intval($v['time']);
                        $v['name'] = addslashes($v['name']);
                        $_POST['opt']['shop_pay_types'][$k] = $v;
                    }
                }
            }
        }
        $settings['shop_pay_types'] = $_POST['opt']['shop_pay_types'];
        $_POST['opt']['shop_pay_types'] = serialize($_POST['opt']['shop_pay_types']);
    }
    if(isset($_POST['opt'])){
        if(is_array($_POST['opt'])){
            if(count($_POST['opt']) > 0){
                $sql = array();
                foreach($chekers as $k=>$v){
                    if(!isset($_POST['opt'][$k])) $_POST['opt'][$k] = $v;
                }
                foreach($_POST['opt'] as $k=>$v){
                    if(substr($k, 0, 4) == 'shop'){
                        $check = dbarray(dbquery("SELECT id FROM ".PREF."settings WHERE `k` = '".$k."'"));
                        if($check){
                            $sql = "UPDATE ".PREF."settings SET `v` = '".addslashes($v)."' WHERE `k` = '".$k."'";
                        }else{
                            $sql = "INSERT INTO ".PREF."settings SET `v` = '".addslashes($v)."', `k` = '".addslashes($k)."'";                            
                        }
                        if($k != 'shop_pay_types') $settings[$k] = $v;
                        dbquery($sql);
                    }            
                }
                
	        	echo "
	        	<div align='center'>
		        	<div class='ok'>
		        	".$locale[525]."
		        	</div>
	        	</div>
	        	";
            }
        }
    }
    
    echo "
    
    <form method=post action=''>
   	<table align='center' cellpadding='0' cellspacing='0'  border='0' cellpadding='1' cellspacing='1' class='tbl'>
        <tr>
            <td>".$locale[1130]."</td>
            <td><input type='checkbox' ".(($settings['shop'] == 1) ? 'checked' : '')." name='opt[shop]' value='1'></td>
        </tr>
        <tr>
            <td>".$locale[1147]."</td>
            <td><input type='checkbox' ".(($settings['shop_status'] == 0) ? 'checked' : '')." name='opt[shop_status]' value='0'></td>
        </tr>
        <tr>
            <td>".$locale[1148]."</td>
            <td><input type='number' name='opt[shop_img_w]' value='".$settings['shop_img_w']."'></td>
        </tr>
        <tr>
            <td>".$locale[1149]."</td>
            <td><input type='number' name='opt[shop_img_h]' value='".$settings['shop_img_h']."'></td>
        </tr>
        <tr>
            <td>".$locale[1150]."</td>
            <td><input type='number' name='opt[shop_onpage]' value='".$settings['shop_onpage']."'></td>
        </tr>
   ";

    //upd170216
    
    echo "
        <tr>
            <td>".$locale[1175]."</td>
            <td>
            <table class='subtable'>
                <tr>
                    <td>".$locale[382]."</td>
                    <td>".$locale[1154]."</td>
                    <td>".$locale[1155]."</td>
                </tr>
            ";
    $ext_fields = array(
        'name'=>$locale[1145], 
        'description'=>$locale[358], 
        'addr'=>$locale[458], 
        'phone1'=>$locale[1109], 
        'phone2'=>$locale[1110], 
        'delivery'=>$locale[1107], 
        'payment'=>$locale[1108]
    );
    
            foreach($ext_fields as $k=>$v){
                echo "
                    <tr>
                        <td>".$v."</td>
                        <td><input type='text' name='opt[shop_min_".$k."]' value='".intval($settings["shop_min_".$k])."'></td>
                        <td><input type='text' name='opt[shop_max_".$k."]' value='".intval($settings["shop_max_".$k])."'></td>
                    </tr>
                ";
            }
    echo "
            </table>
            </td>
        </tr>
        <tr>
            <td>".$locale[1159]."</td>
            <td>
                <input onclick='sh(200);' type='checkbox' ".(($settings['shop_pay'] == 1) ? 'checked' : '')." name='opt[shop_pay]' value='1'>
                <div  id='s200' ".(($settings['shop_pay'] == 0) ? 'style="display:none;"' : '').">
                    ".$locale[1160].":
                    <table class='subtable'>
                    <tr>
                        <td>".$locale[880]."</td>
                        <td>".$locale[160]." (".$locale[175].")</td>
                        <td colspan=2>".$locale[185]."</td>
                    </tr>
                    ";
        if(count($settings['shop_pay_types']) > 0){
            foreach($settings['shop_pay_types'] as $k => $v){
                echo "
                    <tr>
                        <td><input type='text' name='opt[shop_pay_types][$k][name]' value='".htmlspecialchars($v['name'])."'></td>
                        <td><input type='number' name='opt[shop_pay_types][$k][time]' value='".(intval($v['time'])/86400)."'></td>
                        <td><input type='number' name='opt[shop_pay_types][$k][price]' value='".intval($v['price'])."'></td>
                        <td><a href='#' class='shop_pay_types_del' onmouseover=\"Tip(this, '".$locale[201]."')\" onmouseout=\"UnTip(this)\" >[X]</a></td>
                    </tr>
                ";
            }
        }
    echo "
                    <tr>
                        <td colspan=4><a href='#' onclick='sh(300); return false;'>".$locale[125]."</a></td>
                    </tr>
                </table>
                <div  style='display:none;' id='s300'>
                    <table class='subtable'>
                        <tr>
                            <td><input type='text' name='opt[shop_pay_types][".($k+1)."][name]' value=''></td>
                            <td><input type='number' name='opt[shop_pay_types][".($k+1)."][time]' value=''></td>
                            <td><input type='number' name='opt[shop_pay_types][".($k+1)."][price]' value=''></td>
                        </tr>
                    </table>
                </div>
                </div>
            </td>
        </tr>

    "; 
  
   
   echo "     
        
        
    </table>
    <style>
    .subtable{
        border:1px solid silver;
        font-size: 1em;
    }
    </style>
    <p><input type=submit value='".$locale[34]."'></p>
   ";
    }elseif($act == 'edit' && isset($_GET['id'])){
        if($_POST['post_filter'] == 'false'){
            $sql_fields = array();
            foreach($string_fields as $v){
                if(isset($_POST[$v[0]])){
                    $sql_fields[] = "`".$v[0]."` = '".$_POST[$v[0]]."'";
                }
            }
            foreach($text_fields as $v){
                if(isset($__POST[$v[0]])){
                    $sql_fields[] = "`".$v[0]."` = '".addslashes($__POST[$v[0]])."'";
                }
            }
            //upd170216
            if(isset($_POST['next_pay'])){
                $sql_fields[] = 'next_pay="'.addslashes($_POST['next_pay']).'"';
            }
            
            //upd1701240
            $sql = "
                UPDATE ".PREF."users_shop SET 
                    name='".$_POST['name']."',
                    cat=".intval($_POST['cat']).",
                    region=".intval($_POST['region']).",
                    status=".intval($_POST['status']).",
                    ".implode(",\n", $sql_fields)."
                WHERE 
                    id=".intval($_GET['id'])."
            ";
            dbquery($sql);
                    echo "
                    <center><div class='ok'>".$locale[351]."</div></center>
                    ";
        }
    $sql = "
            SELECT 
            usr.name as user_name, usr.id as user_id, shop.*
            FROM ".PREF."users_shop shop 
            JOIN ".PREF."users usr ON shop.user_id = usr.id 
            WHERE shop.id= ".$_GET['id']."
        ";
    $dat = dbarray(dbquery($sql));
    $dat = stripslashes_recursive($dat);
    echo "
			<div id='block' align='center'>
			    <form name='form' action='' method='post'>
	            <FIELDSET style='width:700px;'><LEGEND>".$locale[1104]." &laquo;".$dat['name']."&raquo;</LEGEND>
	            <table width='100%' class='add_item'>
	            <tr>
                    <td>".$locale[880]."</td>
                    <td>
                        <input name='name' type='text' value='".$dat['name']."' style='width:100%;'>
                    </td>
                </tr>
	            <tr>
                    <td>".$locale[17]."</td>
                    <td>
        	            <select size='1' name='cat'>
        	            <option value='0'>".$locale[449]."</option>
                                ".make_select('cat', $cats_id, $dat['cat'], $substr, ' / ')."
                        </select>
                    </td>
                </tr>
	            <tr>
                    <td>".$locale[16]."</td>
                    <td>
        	            <select size='1' name='region'>
        	            <option value='0'>".$locale[449]."</option>
                                ".make_select('region', $regions_id_, $dat['region'], $substr, ' / ')."
                        </select>
                    </td>
                </tr>
                ";
                
                
                foreach($text_fields as $v){
                    echo "
    	            <tr>
                        <td colspan='2'>
                            <p>".$v[1]."</p>
                            <textarea class='ckeditor' name='".$v[0]."'>".$dat[$v[0]]."</textarea>
                        </td>
                    </tr>
                    ";
                }
                foreach($string_fields as $v){
                    echo "
    	            <tr>
                        <td>".$v[1]."</td>
                        <td>
                            <input name='".$v[0]."' type='text' value='".$dat[$v[0]]."' style='width:100%;'>
                        </td>
                    </tr>
                    ";                    
                }
                
                echo "
                
    	            <tr>
                        <td>".$locale[1054]."</td>
                        <td>
            	            <select size='1' name='status'>";
                                foreach($mod_status as $k => $v){
                                    echo "<option "; if($dat['status'] == $k){echo ' selected ';} echo "value='".$k."'>".$v."</option>";
                                }
                            echo "
                            </select>
                        </td>
                    </tr>     
               ";    
               if($settings['shop_pay'] == 1){
                //upd170216
                echo "
    	            <tr>
                        <td>".$locale[1169]."</td>
                        <td>
            	            <input name='next_pay' id='next_pay' value='".$dat['next_pay']."'>
                        </td>
                    </tr> 
                ";
               }      

               echo "               
                

                </table>
                <input name='post_filter' type='hidden' value='false'>
	            <div align='center' style='margin:5px;'>
                    <input type='submit' name='submit' value=' ".$locale[837]." '>
                </div>
	            </FIELDSET>
				</form>
		      </div>
              
              <div align='center'><input type='button' name='submit' onclick=\"go('?unit=".$unit."')\" value='&larr; ".$locale[324]."'></div>
    ";

    }
    //upd1701190
    elseif($act == 'del' && isset($_GET['id'])){
        if(is_numeric($_GET['id'])){
            dbquery("DELETE FROM ".PREF."users_shop WHERE id=".$_GET['id']);
    		echo "
    		<script>
    		  setTimeout(\"document.location.href='?unit=".$unit."'\",1000);
    		</script>
    		<center><div class='ok'>".$locale[325]."</div></center>
    		";
        }
    }


}
?>