<?php   //992
	
    if(!$exe){
        $settings['cron_eml'] = (isset($settings['cron_eml'])) ? $settings['cron_eml'] : 1200;  
        $settings['mailing'] = (isset($settings['mailing'])) ? $settings['mailing'] : 0;  
        $settings['mailing_limit'] = (isset($settings['mailing_limit'])) ? $settings['mailing_limit'] : 20;                      
    
        if($act == 'statuschange'){
            if(!dbarray(dbquery("SELECT id FROM ".PREF."settings WHERE k='mailing'"))){
                dbquery("INSERT INTO ".PREF."settings SET v=0, k='mailing'");
            }
            if($settings['mailing'] == 1){
                dbquery("UPDATE ".PREF."settings SET v=0 WHERE k='mailing'");
            }else{
                dbquery("UPDATE ".PREF."settings SET v=1 WHERE k='mailing'");
            }
            header('Location: ?unit='.$unit);
        }
        if($act == 'settingschange'){
            if(!dbarray(dbquery("SELECT id FROM ".PREF."settings WHERE k='cron_eml'"))){
                dbquery("INSERT INTO ".PREF."settings SET v=0, k='cron_eml'");
            }
            if(!dbarray(dbquery("SELECT id FROM ".PREF."settings WHERE k='mailing_limit'"))){
                dbquery("INSERT INTO ".PREF."settings SET v=0, k='mailing_limit'");
            }
            
            dbquery("UPDATE ".PREF."settings SET v='".$_GET['cron_eml']."' WHERE k='cron_eml'");
            dbquery("UPDATE ".PREF."settings SET v='".$_GET['mailing_limit']."' WHERE k='mailing_limit'");

            header('Location: ?unit='.$unit);
        }
        if($act == 'del' && is_numeric($_GET['id'])){
            dbquery("DELETE FROM ".PREF."mailing_db WHERE id=".$_GET['id']);
            header('Location: ?unit='.$unit);
        }
        
    
    }else{
	   if($act == ""){
	       $queue = dbarray(dbquery("SELECT COUNT(*) as count FROM ".PREF."mailing_queue"));
           $queue = $queue['count'];
           $status = ($settings['mailing'] == 1) ? $locale[1007] : $locale[1008];
           $statuschange = ($settings['mailing'] == 1) ? $locale[1009] : $locale[1010];
    	   echo "
            <h3>".$locale[993]."</h3>
            <ul id='mailing'>
                <li>".hlp($locale[1012])." ".$locale[1001].": ".$queue." [ <a href='#' onclick=\"if(confirm('".$locale[43]."')){go('?unit=".$unit."&act=clear');}\">".$locale[1002]."</a> ] [ <a href='?unit=".$unit."&act=queue'>".$locale[1016]."</a> ]</li>
                <li>".hlp($locale[1062])." ".$locale[1063].": ".dbrows(dbquery("SELECT id FROM ".PREF."mailing_unsubscribe"))." [ <a href='?unit=".$unit."&act=unsubscribe'>".$locale[1064]."</a> ]</li>
                <li>".hlp($locale[1011])." ".$locale[213].": ".$status." [ <a href='#' onclick=\"if(confirm('".$locale[43]."')){go('?unit=".$unit."&act=statuschange');}\">".$statuschange."</a> ]</li>
                <li>".hlp($locale[1015])." 
                    <form type=get name=settingschange style='display:inline;'>
                        <input type=hidden name=unit value=".$unit.">
                        <input type=hidden name=act value=settingschange>
                        ".$locale[1013].": <input type=text name=cron_eml value=".$settings['cron_eml']." size=5>
                        ".$locale[1014].": <input type=text name=mailing_limit value='".$settings['mailing_limit']."' size=5> 
                        [ <a href='#' onclick=\"document.settingschange.submit();\">".$locale[837]."</a> ]
                    </form>
                </li>
            </ul>
            <p>
                <input type='button' value=' &rarr; ".$locale[476]."' onclick='go(\"?unit=".$unit."&act=add\");'>
            </p>
            <form name='form1' action='?options&id=".$_GET['id']."' method='post'>
                <table border='0' width='100%' border='0' cellpadding='1' cellspacing='1' class='tbl'>
                    <tr class='tbl_head'>
                        <td>".hlp($locale[999])."&nbsp;<b>".$locale[998]."</b></td>
                        <td>".hlp($locale[995])."&nbsp;<b>".$locale[994]."</b></td>
                        <td><b>".$locale[996]."</b></td>
                        <td><b>".$locale[474]."</b></td>
                        <td><b>".$locale[275]."</b></td>
                    </tr>            
            ";
            $res = dbquery("SELECT * FROM ".PREF."mailing_db");
            while($dat = dbarray($res)){
                $dat = stripslashes_recursive($dat);
                $dat['single'] = ($dat['single'] == 1) ? $locale[396] : $locale[397];
                echo "
                <tr>
                    <td>".$dat['single']."</td>
                    <td>".$dat['time']."</td>
                    <td>".$dat['title']."</td>
                    <td>".strip_tags($dat['text'])."</td>
                    <td>
							".ico("?unit=".$_GET['unit']."&act=edit_db&id=".$dat['id'], 'e')."
					        ".ico("?unit=".$_GET['unit']."&act=del&id=".$dat['id'], 'd')."                    
                    </td>
                </tr>";
            }
            echo "
                </table>
            </form>
           ";	       
	   }elseif($act == 'add'){
	       if($_POST['submit'] != ""){
	           $_POST['single'] = ($_POST['single'] == 'ON') ? $_POST['single'] = 1 : $_POST['single'] = 0;
	           dbquery("INSERT INTO ".PREF."mailing_db SET title='".$_POST['title']."',
                                            text='".addslashes($__POST['text'])."',
                                            time='".$_POST['time']."',
                                            single='". $_POST['single']."'");
                echo "<script>go('?unit=".$unit."&act=edit_db&id=".mysql_insert_id_u()."')</script>";
	       }
	       echo "
            <h3>".$locale[1]."</h3>
    	    <div align='center'  id='s123123'>
    			    <form name='form' action='' method='post'>
    	            <FIELDSET style='width:700px;'><LEGEND>".$locale[1]."</LEGEND>
    	            <table width='100%' class='add_item'>
    	            <tr><td>".hlp($locale[999])."&nbsp;<b>".$locale[998]."</td><td><input type=checkbox value=ON name=single></td></tr>
    	            <tr><td>".hlp($locale[995])."&nbsp;<b>".$locale[994]."</td><td><input name='time' type='text' value='' style='width:30px;'></td></tr>
    	            <tr><td><b>".$locale[996]."</b></td><td><input name='title' type='text' value='' style='width:100%;'></td></tr>
    	            <tr><td colspan='2'>
                    <b>".$locale[997]."</b><br />
                    <textarea class='ckeditor' name='text'></textarea>
                                      
    	            </td></tr>
    	            <tr><td colspan='2'>
    	            * ".$locale[422]."
    	            <ul>
    		            <li>%user% - ".$locale[1004]."</li>
    		            <li>%title% - ".$locale[1005]."</li>
    		            <li>%link% - ".$locale[1006]."</li>
    		            <li>%message_title% - ".$locale[72]."</li>
    		            <li>%link_unsubscribe% - ".$locale[1065]."</li>
    	            </ul>
    	            </td></tr>
    	            </table>
    	            <div align='center' style='margin:5px;'><input type='submit' name='submit' value=' ".$locale[125]." '></div>
    	            </FIELDSET>
    	            <input name='post_filter' type='hidden' value='false'>
    				</form>
    		<br /><br /><input type='button' onclick=\"go('?unit=".$unit."')\" value='&larr; ".$locale[324]."'>
    	    </div>
	    ";
	   }elseif($act == 'edit_db' && is_numeric($_GET['id'])){
	       if($_POST['submit'] != "" || $_POST['sendmail'] != ""){
	           $_POST['single'] = ($_POST['single'] == 'ON') ? $_POST['single'] = 1 : $_POST['single'] = 0;
	           dbquery("UPDATE ".PREF."mailing_db SET title='".$_POST['title']."',
                                            text='".addslashes($__POST['text'])."',
                                            time='".$_POST['time']."',
                                            single='". $_POST['single']."'
                                            WHERE id=".$_GET['id']."
                                            ");
               
	       }
           if($_POST['sendmail'] != "" && $_POST['single'] == 1){
                $mailing = dbarray(dbquery("SELECT * FROM ".PREF."mailing_db WHERE id=".$_GET['id']));
                $allemail = array();
                $count = 0;
                $res = dbquery("SELECT email, id, name FROM ".PREF."users WHERE status=1 AND email != '' GROUP BY email ORDER by id DESC");
                while($dat = dbarray($res)){
                        $array = array();
                        $array['user'] = $dat['name'];
                        $array['title'] = $settings['title'];
            			$array['link_unsubscribe'] = 'http://'.$settings['site_address'].$settings['path'].'unsubscribe/?email='.base64_encode($dat['email']).'&key='.md5($dat['email'].$settings['rand']);
            			$array['unsubscribe'] = '<a href="'.$array['link_unsubscribe'].'">'.$locale[1059].'</a>';                        
                        
        				//$array['message_title'] = stripslashes($array['title']);
                        //$array['message_link'] = 'http://'.$settings['site_address'].$settings['path'].MESSAGES.'/'.$dat['id'].'-'.cpu($dat['title'], $locale['symb']).'.html';
                        $count = $count + sendmail_queue_add($mailing, $dat['email'], $array);  
                        $allemail[] = $dat['email'];
                        
                }
                $res = dbquery("SELECT email, user FROM ".PREF."db WHERE user_id = 0 AND status=1 AND email != '' GROUP BY email ORDER by id DESC");
                while($dat = dbarray($res)){
                    if(!in_array($dat['email'], $allemail)){
                        $array = array();
                        $array['user'] = $dat['user'];
                        $array['title'] = $settings['title'];
            			$array['link_unsubscribe'] = 'http://'.$settings['site_address'].$settings['path'].'unsubscribe/?email='.base64_encode($dat['email']).'&key='.md5($dat['email'].$settings['rand']);
            			$array['unsubscribe'] = '<a href="'.$array['link_unsubscribe'].'">'.$locale[1059].'</a>';                        

                        $count = $count + sendmail_queue_add($mailing, $dat['email'], $array);
                        
                    }
                }
                echo "<center><div class='ok'>".$locale[1003].": ".$count."</div></center>";
           }
           $dat = stripslashes_recursive(dbarray(dbquery("SELECT * FROM ".PREF."mailing_db WHERE id=".$_GET['id'])));
	       echo "
            <h3>".$locale[132]."</h3>
    	    <div align='center' id='s123123'>
    			    <form name='form' action='' method='post'>
    	            <FIELDSET style='width:700px;'><LEGEND>".$locale[132]."</LEGEND>
    	            <table width='100%' class='add_item'>
    	            <tr><td>".hlp($locale[999])."&nbsp;<b>".$locale[998]."</td><td><input type=checkbox value=ON name=single "; if($dat['single'] == 1) echo ' checked '; echo "></td></tr>
    	            <tr><td>".hlp($locale[995])."&nbsp;<b>".$locale[994]."</td><td><input name='time' type='text' value='".$dat['time']."' style='width:30px;'></td></tr>
    	            <tr><td><b>".$locale[996]."</b></td><td><input name='title' type='text' value='".$dat['title']."' style='width:100%;'></td></tr>
    	            <tr><td colspan='2'>
                    <b>".$locale[997]."</b><br />
                    <textarea class='ckeditor' name='text'>".$dat['text']."</textarea>
                    
    	            </td></tr>
    	            <tr><td colspan='2'>
    	            * ".$locale[422]."
    	            <ul>
    		            <li>%user% - ".$locale[1004]."</li>
    		            <li>%title% - ".$locale[1005]."</li>
    		            <li>%link% - ".$locale[1006]."</li>
    		            <li>%links% - ".$locale[1093]."</li>
    		            <li>%message_title% - ".$locale[72]."</li>
    	            </ul>
    	            </td></tr>
    	            </table>
    	            <div align='center' style='margin:5px;'>
                    <input type='submit' name='submit' value=' ".$locale[911]." '>";
                    if($dat['single'] == 1){
                        echo "
                        <input type='submit' name='sendmail' value=' ".$locale[1000]." ' style='border-color:red;' onclick=\"if(confirm('".$locale[43]."')){document.form.submit();} return false;\">
                        ";                        
                    }
                    echo "
                    </div>
    	            </FIELDSET>
    	            <input name='post_filter' type='hidden' value='false'>
    				</form>
    		<br /><br /><input type='button' onclick=\"go('?unit=".$unit."')\" value='&larr; ".$locale[324]."'>
    	    </div>
	    ";
	   }elseif($act == 'clear'){
	       if(dbquery("TRUNCATE TABLE ".PREF."mailing_queue")){
	       echo "
           <center><div align='center' class='ok' style='width:200px;'>".$locale[351]."</div>
           	<br /><br /><input type='button' onclick=\"go('?unit=".$unit."')\" value='&larr; ".$locale[324]."'>
            </center>
           ";	           
	       }

	   }elseif($act == 'queue'){
        if($_POST['submit'] != ""){
            if(isset($_POST['check'])){
                if(count($_POST['check']) > 0){
                    foreach($_POST['check'] as $k => $v){
                        dbquery("DELETE FROM ".PREF."mailing_queue WHERE id=".$k);
                    }
                }
            }

        }
        echo "<h3>".$locale[1017]."</h3>";
        
        $_GET['onpage'] = 20;
        
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
        
        if(!isset($_GET['page'])) $_GET['page'] = 0;
        $page = $_GET['page'];
        $limit = "";
        $count_messages = dbrows(dbquery("SELECT id FROM ".PREF."mailing_queue ".$dop_sql));
    	$page_count = ceil($count_messages/$_GET['onpage']);
    	if($page > $page_count){
    		$page = $page_count;
   		}
    	if($page <= 0 ){
    		$page = 1;
   		}
    	$offset = ( $page - 1 ) * $_GET['onpage'];
    	$limit = " ORDER BY id ASC LIMIT ".$offset.", ".$_GET['onpage'];
    
        $dop_sql .= $limit;
    
    	$sql = "SELECT * FROM ".PREF."mailing_queue ".$dop_sql;

	    if($page_count > 1){
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
				echo "' onclick=\"go('?unit=".$unit."&act=".$_GET['act']."&page=".$i."')\">".$i."</div>";
			    }
		    echo "
		    </div>
            <div style='clear:both;'></div>
		    ";
        }   
         
	    echo "
            <form name=frm action='' method='POST'>
		    <table align='center' width='98%' border='0' cellpadding='1' cellspacing='1' class='tbl'>
			    <tr class='tbl_head'>
                    <td>#</td>
                    <td>Email</td>
                    <td>".$locale[996]."</td>
                    <td>".$locale[74]."</td>
                    <td>".$locale[339]."</td>
			    </tr>
			   ";
                $res = dbquery($sql);
                $i = 0;
                while($dat = dbarray($res)){
                    $dat = stripslashes_recursive($dat);
                    echo "
                    <tr>
                        <td>".$dat['id']."</td>
                        <td>".$dat['email']."</td>
                        <td>".$dat['title']."</td>
                        <td>".strip_tags($dat['text'])."</td>
                        <td><input type='checkbox' id='check".$i."' name='check[".$dat['id']."]' value='ON' ></td>
                    </tr>
                    ";
                    $i++;
                }       
                echo "
			  
                </table>
                
            <div align='center'><br /><br />
                <a href='javascript:select_all();'>".$locale[341]."</a>
                <br /><br />
                
            	<input type='submit' name='submit' value='".$locale[916]."'>
             </div>
            </form>
			";

        
	   }elseif($act == 'unsubscribe'){
	       
           echo "<h3>".$locale[1064]."</h3>";

            if(!isset($_GET['onpage'])) $_GET['onpage'] = $on_page_default; 
        
        	$save = "";
            if(!isset($_GET['onpage'])) $_GET['onpage'] = "";
            if(!isset($_GET['page'])) $_GET['page'] = "";
        	if(!is_numeric($_GET['onpage']))
        		{
        	    $_GET['onpage'] = $on_page_default;
        		}
            
            $act2 = (isset($_GET['act2'])) ? $_GET['act2'] : "";
                
        	if($act2 == 'del' && is_numeric($_GET['id']))
        		{
        	    dbquery("DELETE FROM ".PREF."mailing_unsubscribe WHERE id=".$_GET['id']);
        		}

            if(isset($_POST['check']))
                {
        	    if(is_array($_POST['check']) && count($_POST['check']) > 0)
        		    {
        	 	    foreach($_POST['check'] as $k => $v)
        		 	    {
        	 		    if(isset($k) && $v == 'ON')
        		 		    {
                            dbquery("DELETE FROM ".PREF."mailing_unsubscribe WHERE id=".$k);
        		 		    }
        		 	    }
        		    }
        
                }
                    
        if($act2 == 'save')
            {
            dbquery("INSERT INTO ".PREF."mailing_unsubscribe SET email='".$_POST['email']."'");
            }


            $page = $_GET['page'];
            $limit = "";
            $count_messages = dbrows(dbquery("SELECT id FROM ".PREF."mailing_unsubscribe"));
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


    	echo "
    	<form name='form' action='?' method='get' id='form'>
    	<input name='unit' type='hidden' value='".$unit."'>
    	<input name='act' type='hidden' value='".$act."'>
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
    				<img src='".PATH."admin/tpl/img/vert.gif' width='5' alt='' border='0' style='vertical-align:middle;'>
    				<input type='submit' value='".$locale[335]."'>
    			</div>
    		</div>
    	</form>
        ".$save."
        
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
    				echo "' onclick=\"go('?unit=".$unit."&act=".$act."&onpage=".$_GET['onpage']."&page=".$i."')\">".$i."</div>";
    			    }
    		    echo "
    		    </div>
    		    ";
    		    }
    
    //email pass date status  email_status  actions    name    balance
    
    
    	    echo "
    	    </td></tr>
    	    </table>
    
    
    	";
    
    
		echo "
		<div align='left'>
		<input type='button' value=' &rarr; ".$locale[476]."' onclick='sh(123123);'>
			<div id='s123123' style='display:none;' align='center'>
			    <form name='form' action='?unit=".$unit."&act=".$act."&act2=save' method='post'>
	            <FIELDSET style='width:400px;'><LEGEND>".$locale[476]."</LEGEND>

                    <table border='0' class='add_item'>
                    <tr><td>E-mail:</td><td><input type='text' name='email' style='width:100%;' value='' /></td></tr>
                    </table>

	            <div align='center' style='margin:5px;'><input type='submit' name='submit' value=' ".$locale[125]." '></div>
	            </FIELDSET>

				</form>

			<br />
			<img src='".PATH."admin/tpl/img/hor.gif' width='500' alt='' border='0' style='vertical-align:middle; margin:4px;'>
			<br />

		</div>
		";
        
        
        
        echo "
    	<form name='form2' action='' method='post'>
        <table align='center' border='0' cellpadding='1' cellspacing='1' class='tbl' style='width:550px;'>
    	    <tr class='tbl_head' >
    		    <td width='200'>E-mail</td>
    		    <td width='60'>".$locale[339]."</td>
    		    <td width='60'>".$locale[201]."</td>
    	    </tr>
    	    ";
    
    	$sql = "SELECT * FROM ".PREF."mailing_unsubscribe ".$limit;
    	$i = 0;
    	$res = dbquery($sql);
    	while($dat = dbarray($res))
    		{
 
    		echo "
    			<tr>
    				<td>".$dat['email']."</td>
    				<td align='center'><input id='check".$i."' name='check[".$dat['id']."]' type='checkbox' value='ON'></td>
                    <td align='center'>".ico("?unit=".$unit."&act=".$act."&act2=del&onpage=".$_GET['onpage']."&page=".$_GET['page']."&id=".$dat['id'], 'd')."</td>
    			</tr>
    		";
            $i++;
    		}
    	echo "
       
    	</table>
    <div align='center'><br />
    	    <a href='javascript:select_all();'>".$locale[341]."</a>
    	    <br /><br />
    	<input type='submit' name='submit' value='".$locale[916]."'></div>
    	</form>
        ";
            
            
	   }

	}
    

?>