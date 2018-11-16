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

    if(isset($settings['moderation_notifications'])){
        if($settings['moderation_notifications'] == 1) $customconfig['disable_moderator_notifications'] = 0;
        else $customconfig['disable_moderator_notifications'] = 1;        
    }
    
	   
    $allmessages = $counter['messages_off']['Count(id)'] + $counter['messages_on']['Count(id)'];
    if($act == 'counter'){
        $admin_counter = (isset($_COOKIE['admin_counter'])) ? $_COOKIE['admin_counter'] : 0; 
        $admin_counter = $allmessages - $admin_counter;
        if($admin_counter < 0) $admin_counter = 0;
        echo $admin_counter;
        exit();
    }else{
        setcookie('admin_counter', $allmessages, time()+86400*365, PATH);
    }

	if(!isset($_GET['status']))	    $_GET['status'] = 0;
	if(!isset($_GET['onpage']))	    $_GET['onpage'] = "";
	if(!isset($_GET['cat']))	    $_GET['cat'] = "";
	if(!isset($_GET['region']))	    $_GET['region'] = "";
	if(!isset($_GET['user_id']))	$_GET['user_id'] = "";
	if(!isset($_GET['text']))	    $_GET['text'] = "";
	if(!isset($_GET['page']))	    $_GET['page'] = "";
	if(!isset($_GET['approved']))	$_GET['approved'] = "all";

	if(!is_numeric($_GET['onpage']))
		{
	    $_GET['onpage'] = $on_page_default;
		}


	$get_str = "?unit=edit&onpage=".$_GET['onpage']."&status=".$_GET['status']."&cat=".$_GET['cat']."&region=".$_GET['region']."&user_id=".$_GET['user_id']."&text=".$_GET['text']."&approved=".$_GET['approved']."&page=".$_GET['page'];

    if($act == 'showmessage'){
        $id = $_GET['id'];
        $id = explode('-', $id);
        if(is_numeric($id[1])){
            $dat = dbarray(dbquery("SELECT text FROM ".PREF."db WHERE id=".$id[1]));
            echo stripslashes($dat['text']);
        }
        
        exit();
    }

	if($_POST['submit'] != "" && $_POST['status'] != "")
		{

	    if(is_array($_POST['check']) && count($_POST['check']) > 0)
		    {
		      
              
			$file_fields = array();
			$res = dbquery("SELECT id FROM ".PREF."fields WHERE `type`='f'");
			while($dat = dbarray($res)){
				$file_fields[] = $dat['id'];
			}
			
			$image_fields = array();
			$res = dbquery("SELECT id FROM ".PREF."fields WHERE `type`='i'");
			while($dat = dbarray($res)){
				$image_fields[] = $dat['id'];
			}
		      
            /*
			$fp = opendir(FULLPATCH."uploads/images/ts/");
			$img_files = array();
			while(($file = readdir($fp)) !== false)
				{
				$exfile = explode('_', $file);
				if(is_numeric($exfile[0]))
					{
					$img_files[$exfile[0]][] = $file;
					}
				}
			$fp = opendir(FULLPATCH."uploads/files/");
			$other_files = array();
			while(($file = readdir($fp)) !== false)
				{
				$exfile = explode('_', $file);
				if(is_numeric($exfile[0]))
					{
					$other_files[$exfile[0]][] = $file;
					}
				}
            */
	 	    foreach($_POST['check'] as $k => $v)
		 	    {


                       
	 		    if(is_numeric($k) && $v == 'ON')
		 		    {
		 		       
		 		    if(isset($_POST['approved'])){
                        $sql = "UPDATE ".PREF."db SET approved=".$_POST['approved']."  WHERE id=".$k;
                        dbquery($sql);
		 		    }

                     if(is_numeric($_POST['status']))
			 		    {
			 		      
		 			    $dat = dbarray(dbquery("SELECT * FROM ".PREF."db WHERE id=".$k));
                        if($_POST['status'] != $dat['status']){
                            if($_POST['status'] == 1 ){
                                edit_cat_counter('+1', $dat['cat'], $dat['region'], $k);
                            }elseif($_POST['status'] == 0 && $dat['status'] != 2){
                                edit_cat_counter('-1', $dat['cat'], $dat['region'], $k);
                            }elseif($_POST['status'] == 2 && $dat['status'] != 0){
                                edit_cat_counter('-1', $dat['cat'], $dat['region'], $k);
                            }                            
                        }

		 			    if($dat['status'] == '0' && ($_POST['status'] == 1 || $_POST['status'] == 2))
                            {
                            /*
                            if($dat['status'] == 0 && $_POST['status'] == 1){
                                edit_cat_counter('+1', $dat['cat'], $dat['region'], $k);
                            }elseif($dat['status'] == 1 && $_POST['status'] == 0){
                                edit_cat_counter('-1', $dat['cat'], $dat['region'], $k);
                            }
                            */

                            $email = "";
                			if($dat['email'] != "")
                				{
                			    $email = $dat['email'];
                				$user = $dat['user'];
                				}
                			elseif($dat['user_id'] != 0 && $dat['user_id'] != "")
                				{
                			    $dat2 = dbarray(dbquery("SELECT email, name FROM ".PREF."users WHERE id = '".$dat['user_id']."'"));
                			    $email = $dat2['email'];
                			    $user = stripslashes($dat2['name']);
                				}
                
                	        if($email != "")
                				{
                				$vars['user'] = $user;
                				$vars['title'] = $settings['title'];
                				$vars['message'] = stripslashes($dat['title']);
                				$vars['link'] = 'http://'.$settings['site_address'].$settings['patch'].'messages/'.$dat['id'].'-'.cpu($dat['title'], $locale['symb']).'.html';
                				$vars['link'] = '<a href="'.$vars['link'] .'">'.$vars['link'] .'</a>';
                
                				if($_POST['status'] == 1)
                                    {
                                    $msg1 = $board_msg['message_allowed'];
                                    $msg2 = $locale[923];
                                    }
                                else
                                    {
                                    $msg1 = $board_msg['message_denied'];
                                    $msg2 = $locale[924];
                                    }
                                $send = true;
                                if(isset($customconfig['disable_moderator_notifications'])){
                                    if($customconfig['disable_moderator_notifications'] == true){
                                        $send = false;
                                    }
                                }
                                if($send){
                                    send_mail($email, TITLE.' / '.$msg2, $msg1, $vars);
                                }

                				}


                            
                            }
                        dbquery("UPDATE ".PREF."db SET status=".$_POST['status']." WHERE id=".$k);
		 			    if($_POST['status'] == 1 && $dat['date_del'] < $settings['time'])
			 			    {
                            dbquery("UPDATE ".PREF."db SET date_del='".($settings['time'] + $dob_time)."' WHERE id=".$k);
			 			    }
			 		    }
					elseif($_POST['status'] == 'delete')
						{
						$dat = dbarray(dbquery("SELECT cat, region, status FROM ".PREF."db WHERE id=".$k));
						                        
                        if($dat['status'] != 2){
                           edit_cat_counter('-1', $dat['cat'], $dat['region'], $k);
                        } 

					    dbquery("DELETE FROM ".PREF."db WHERE id=".$k);

					    //dbquery("UPDATE ".PREF."tags SET counter = counter - 1 WHERE id IN (SELECT tag FROM ".PREF."db_tags WHERE message=".$k.")");
					    dbquery("DELETE FROM ".PREF."tags WHERE id IN (SELECT tag FROM ".PREF."db_tags WHERE message=".$k.") AND counter < 1");
                        dbquery("DELETE FROM ".PREF."db_tags WHERE message=".$k);
                        /*
					    if(count($img_files[$k]) > 0)
						    {
						    foreach($img_files[$k] as $vvv)
							    {
							    unlink(FULLPATCH."uploads/images/ts/".$vvv);
							    unlink(FULLPATCH."uploads/images/tb/".$vvv);
							    }
						    }
					    if(count($other_files[$k]) > 0)
						    {
						    foreach($other_files[$k] as $vvv)
							    {
							    unlink(FULLPATCH."uploads/files/".$vvv);
							    }
						    }
                        */
                        
						if(count($image_fields) > 0){
							$res = dbquery("SELECT value FROM ".PREF."db_fields WHERE message=".$k." AND field IN (".implode(', ', $image_fields).")");
							while($dat = dbarray($res)){
							    @unlink(FULLPATCH."uploads/images/ts/".$dat['value']);
							    @unlink(FULLPATCH."uploads/images/tb/".$dat['value']);
							}
						}
						if(count($file_fields) > 0){
							$res = dbquery("SELECT value FROM ".PREF."db_fields WHERE message=".$k." AND field IN (".implode(', ', $file_fields).")");
							while($dat = dbarray($res)){
							    @unlink(FULLPATCH."uploads/files/".$dat['value']);
							}
						}
						
						dbquery("DELETE FROM ".PREF."db_fields WHERE message=".$k);                        
                            
						}
		 		    }
		 	    }

			header('Location: '.$get_str);
		    }
		}



	}

if($exe)
	{
	   
    echo "
    <script>
    $(document).ready(function() {
        
        $('.showmessage').click(function(){
            var id = $(this).attr('name');
            if($('#'+id).css('display') == 'none'){
                $('#'+id).show(500);
            	$.ajax({
                type: 'GET',
                data: 'id='+id,
                 url: '?unit=".$unit."&act=showmessage',
                 cache: true,
                 success: function(html){   
                    $('#'+id).children('td').html(html);
                 }
            	});                
                }else{
                $('#'+id).hide(500);
                }

            });
        
        });
    </script>
    ";
	echo "
    <script type='text/javascript'>
	    function select_all()
		    {
			for (i = 0; i < ".$_GET['onpage']."; i++)
				{
				if(document.getElementById('check' + i))
					{
					if(document.getElementById('check' + i).checked == true)
						{
			            document.getElementById('check' + i).checked = false;
						}
					else
						{
					    document.getElementById('check' + i).checked = true;
						}
					}
				}
		    }
    </script>
	";

	$cond = array();

	if(is_numeric($_GET['cat']) && $_GET['cat'] != 0)
		{
		$childres = array();
		$childres = get_childres($_GET['cat'], $cats);
		$childres[] = $_GET['cat'];

		$cond[] = '('.make_sql('cat', $childres).')';

		}
	if(is_numeric($_GET['region']) && $_GET['region'] != 0)
		{
		$childres = array();
		$childres = get_childres($_GET['region'], $regions);
		$childres[] = $_GET['region'];

		$cond[] = '('.make_sql('region', $childres).')';
		}
	if(is_numeric($_GET['status']))
		{
	    $cond[] = "status=".$_GET['status']."";
		}
	if(is_numeric($_GET['approved']))
		{
	    $cond[] = "approved=".$_GET['approved']."";
		}
	if(is_numeric($_GET['user_id']))
		{
	    $cond[] = "user_id=".$_GET['user_id']."";
		}


	if($_GET['text'] != "")
		{
        $_GET['text'] = trim($_GET['text']);
        if(is_numeric($_GET['text'])){
            $cond[] = "id=".$_GET['text'];
        }else{
            $cond[] = "((LOWER(`text`) LIKE '%".strtolower_utf8($_GET['text'])."%') OR (MATCH (`title`, `text`) AGAINST ('".$_GET['text']."')))";
        }
	    
		}

    $cond = implode(' AND ', $cond);

    
	if($cond != "")
		{
	    $dop_sql = " WHERE ".$cond." ";
	    }
    if(!isset($dop_sql)) $dop_sql = "";
	$dop_sql .= "ORDER by date_add desc ";

    $page = $_GET['page'];
    $limit = "";
    $count_messages = dbrows(dbquery("SELECT id FROM ".PREF."db ".$dop_sql));
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

	//$page_count

    $dop_sql .= $limit;

	$sql = "SELECT id, ip, cat, region, date_add, date_del, user_id, status, user, title, marked, raised, block, approved FROM ".PREF."db  ".$dop_sql;

	$status_text[0] = $locale[219];
	$status_text[1] = $locale[220];
	$status_text[2] = $locale[334];

    echo "
    <div align='center'>

    <div id='form_h'>".$locale[198]."</div>
	<form name='form' action='?' method='get' id='form'>
	<input name='unit' type='hidden' value='edit'>
	    <div class='sort'>
			".$locale[333].":
			<select size='1' name='onpage' style='width: 50px;'>
    			<option "; if($_GET['onpage'] == 5){echo ' selected ';} echo "value='5'>5</option>
    			<option "; if($_GET['onpage'] == 15){echo ' selected ';} echo "value='15'>15</option>
    			<option "; if($_GET['onpage'] == 30){echo ' selected ';} echo "value='30'>30</option>
    			<option "; if($_GET['onpage'] == 60){echo ' selected ';} echo "value='60'>60</option>
    			<option "; if($_GET['onpage'] == 100){echo ' selected ';} echo "value='100'>100</option>
    			<option "; if($_GET['onpage'] == 150){echo ' selected ';} echo "value='150'>150</option>
    			<option "; if($_GET['onpage'] == 200){echo ' selected ';} echo "value='200'>200</option>
    			<option "; if($_GET['onpage'] == 300){echo ' selected ';} echo "value='300'>300</option>
			</select>
			<img src='".$settings['path']."admin/tpl/img/vert.gif' width='5' alt='' border='0' style='vertical-align:middle;'>
    			".$locale[213]."
    			<select size='1' name='status'>
    			<option value='all' "; if($_GET['status'] == 'all'){echo ' selected ';} echo ">".$locale[204]."</option>
    			<option value='0' "; if($_GET['status'] == '0'){echo ' selected ';} echo ">".$locale[219]."</option>
    			<option value='1' "; if($_GET['status'] == '1'){echo ' selected ';} echo ">".$locale[220]."</option>
    			<option value='2' "; if($_GET['status'] == '2'){echo ' selected ';} echo ">".$locale[334]."</option>
			</select>
            
            
  			<div id='razdel_form'></div>

            ".$locale[1054].": ";

            echo "
			<select size='1' name='approved' style='width: 150px;'>
    			<option value='all' "; if($_GET['approved'] == 'all'){echo ' selected ';} echo ">".$locale[204]."</option>
    			<option "; if($_GET['approved'] == '1'){echo ' selected ';} echo "value='1'>".$locale[1055]."</option>
    			<option "; if($_GET['approved'] == '0'){echo ' selected ';} echo "value='0'>".$locale[1056]."</option>
			</select>


   			<div id='razdel_form'></div>

			".$locale[270].": <input class='cat_width' name='text' type='text' size='50' value='".$_GET['text']."'>

            <div id='razdel_form'></div>
            <style>
            .multiselect_text{
                display: inline;    
            }
            .multiselect_admin select {
                margin: 2px;
            }                            
            </style>            
	        ".$locale[17].":
    	        ". ajax_select('cat', 'cat', $_GET['cat'])."


            <div id='razdel_form'></div>

	        ".$locale[16].":
    	        ".ajax_select('region', 'region', $_GET['region'])."


	        <div id='razdel_form'></div>

	        <input type='submit' value='".$locale[335]."'>
	    </div>
	</form>
    </div>
    <table border='0' width='100%' class='border_no'>
    <tr><td align='center' style='font-size:13px;'>
    ".$locale[2]." <b>".$count_messages."</b>
    </td></tr>
    <tr><td>
    ";
    if($page_count > 1)
	    {
	    echo "
	    <div style='width:90%; display: table; margin-bottom: 20px;	margin-left: -5px; margin-top: 20px;'>
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
            echo "' onclick=\"go('?unit=edit&onpage=".$_GET['onpage']."&status=".$_GET['status']."&cat=".$_GET['cat']."&region=".$_GET['region']."&user_id=".$_GET['user_id']."&text=".$_GET['text']."&approved=".$_GET['approved']."&page=".$i."')\">".$i."</div>";
		    }
	    echo "
	    </div>";
	    }
    echo "
    </td></tr>
    </table>

    <form name='form2' action='".$get_str."' method='post'>
    <table align='center' width='90%' border='0' cellpadding='1' cellspacing='1' class='tbl'>
	    <tr class='tbl_head'>
		    <td align='center' width='4%' rowspan='2'><b>".$locale[336]."</b></td>
		    <td align='center' width='3%' rowspan='2'><b>IP</b></td>
		    <td align='center' width='3%' rowspan='2'><b>ID</b></td>
		    <td align='center' width='20%' rowspan='2'><b>".$locale[337]."</b></td>
		    <td align='center' width='10%' colspan='2'><b>".$locale[352]."</b></td>
		    <td align='center' width='15%' rowspan='2'><b>".$locale[17]."</b></td>
		    <td align='center' width='15%' rowspan='2'><b>".$locale[16]."</b></td>
		    <td align='center' width='5%' rowspan='2'><b>".$locale[213]."</b></td>
		    <td align='center' width='5%' rowspan='2'><b>".$locale[1055]."</b></td>
		    <td align='center' width='10%' colspan='6'><b>".$locale[338]."</b></td>
	    </tr>
        
       
	    <tr class='tbl_head'>
		    <td align='center' width='5%'>".$locale[353]."</td>
		    <td align='center' width='5%'>".$locale[354]."</td>
		    <td align='center' width='2%'>
        	<i onclick=\"select_all();\"   onmouseover=\"Tip(this, '".$locale[339]."')\" onmouseout=\"UnTip(this)\" class='fa fa-plus-square'></i>
			</td>
		    <td align='center' width='2%'>
		    	<i  onmouseover=\"Tip(this, '".$locale[200]."')\" onmouseout=\"UnTip(this)\" class='fa fa-pencil-square'></i>
			</td>
		    <td align='center' width='2%'>
			<i onmouseover=\"Tip(this, '".$locale[340]."')\" onmouseout=\"UnTip(this)\"  class='fa fa-cog'></i>
            </td>
		    <td align='center' width='2%'>
			<i onmouseover=\"Tip(this, '".$locale[142]."')\" onmouseout=\"UnTip(this)\"  class='fa fa-calendar-check-o'></i>
		    </td>
		    <td align='center' width='2%'>
			<i onmouseover=\"Tip(this, '".$locale[904]."')\" onmouseout=\"UnTip(this)\" class='fa fa-user-times'></i>
		    </td>
		    <td align='center' width='2%'>
			<i onmouseover=\"Tip(this, '".$locale[950]."')\" onmouseout=\"UnTip(this)\"  class='fa fa-file-excel-o'></i>
		    </td>
	    </tr>

	";
    
    $yesno = array($locale[397], $locale[396]);
	$res = dbquery($sql);
	$i = 0;
	while($data = dbarray($res))
		{
		$usr = "";
		if(is_numeric($data['user_id']) && $data['user_id'] != 0)
			{
		    $res2 = dbquery("SELECT name, id FROM ".PREF."users WHERE id = ".$data['user_id']." ");
		    $user = dbarray($res2);
		    if($user['name'] == "")
			    {
		        $user['name'] = '[deleted user]';
			    }
                
			    $usr = "<a href='?unit=edit&onpage=".$_GET['onpage']."&status=".$_GET['status']."&cat=".$_GET['cat']."&region=".$_GET['region']."&user_id=".$user['id']."&approved=all'>".$user['name']."<a>";
				
		    }
		else
			{
		    $usr = $data['user'];
			}

		$ct = get_array_linenav($data['cat'], $cats_id);
		$rg = get_array_linenav($data['region'], $regions_id_);

        foreach($ct as $k => $v)
	        {
            $ct[$k] = "<a href='?unit=edit&onpage=".$_GET['onpage']."&status=".$_GET['status']."&cat=".$v['id']."&region=".$_GET['region']."&user_id=".$_GET['user_id']."'>".stripslashes($v['name'])."</a>";
	        }

        foreach($rg as $k => $v)
	        {
            $rg[$k] = "<a href='?unit=edit&onpage=".$_GET['onpage']."&status=".$_GET['status']."&cat=".$_GET['cat']."&region=".$v['id']."&user_id=".$_GET['user_id']."'>".stripslashes($v['name'])."</a>";
	        }

        $ct = implode(' / ', $ct);
        $rg = implode(' / ', $rg);

	    echo "
	    <tr>
		    <td >".$usr."</td>
		    <td >".$data['ip']."</td>
		    <td ><small>".$data['id']."</small></td>
		    <td ><a href='../messages/".$data['id']."-".cpu(stripslashes($data['title']), $locale['symb']).".html' target='_blank'>".stripslashes($data['title'])."</a></td>
		    <td ><small>".date("d.m.Y H.i.s", $data['date_add'])."</small></td>
		    <td ><small>".date("d.m.Y H.i.s", $data['date_del'])."</small></td>
		    <td >".$ct."</td>
		    <td >".$rg."</td>
		    <td >".	$status_text[$data['status']]."</td>
		    <td >".	$yesno[$data['approved']]."</td>

		    <td ><input id='check".$i."' name='check[".$data['id']."]' type='checkbox' value='ON'></td>
		    <td align='center'><a href='../edit/".$data['id']."' target='_blank'>
            <i  onmouseover=\"Tip(this, '".$locale[200]."')\" onmouseout=\"UnTip(this)\" class='fa fa-pencil-square'></i>
			</a></td>
		    <td align='center'><i onmouseover=\"Tip(this, '".$locale[340]."')\" onmouseout=\"UnTip(this)\"  class='fa fa-cog'onclick=\"popup('?options&id=".$data['id']."', 300, 300);\"></i></td>
		    <td align='center'><i onmouseover=\"Tip(this, '".$locale[142]."')\" onmouseout=\"UnTip(this)\"  class='fa fa-calendar-check-o' onclick=\"popup('?prolong&id=".$data['id']."', 400, 300);\"></i></td>
		    <td align='center'><i onmouseover=\"Tip(this, '".$locale[904]."')\" onmouseout=\"UnTip(this)\" class='fa fa-user-times'  onclick=\"popup('?blacklist&id=".$data['id']."', 400, 300);\"></i></td>
		    <td align='center'><div class='showmessage' name='hiddentext-".$data['id']."''><i onmouseover=\"Tip(this, '".$locale[950]."')\" onmouseout=\"UnTip(this)\"  class='fa fa-file-excel-o'></i></div></td>
	    
        </tr>
        <tr id='hiddentext-".$data['id']."' style='display:none;'>
        <td colspan='16'><img align='center' src='".PATH."images/ajax-loader.gif'></td>
        </tr>
	    ";
        //
	    $i++;
		}
	echo "
    </table>
    <div align='center' class='tab_fut_a'>
        <br /><br />
        <a href='javascript:select_all();'>".$locale[341]."</a>
        <br /><br />
        ".$locale[342].":
    	<select size='1' name='status' style='width: 200px;'>
    		<option value='1'>".$locale[220]."</option>
    		<option value='0'>".$locale[219]."</option>
    		<option value='2'>".$locale[343]."</option>
    		<option value='delete'>".$locale[344]."</option>
    	</select>
        ".$locale[1054].":
    	<select size='1' name='approved' style='width: 200px;'>
    		<option value='1'>".$locale[1055]."</option>
    		<option value='0'>".$locale[1056]."</option>
    	</select>
    	<input type='submit' name='submit' value='".$locale[335]."'>
    </div>
    </form>
    ";
	}
?>