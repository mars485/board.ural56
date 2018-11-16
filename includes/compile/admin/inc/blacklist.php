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
    if(!isset($_GET['onpage'])) $_GET['onpage'] = $on_page_default; 

	$save = "";
    if(!isset($_GET['onpage'])) $_GET['onpage'] = "";
    if(!isset($_GET['page'])) $_GET['page'] = "";
	if(!is_numeric($_GET['onpage']))
		{
	    $_GET['onpage'] = $on_page_default;
		}
	if($act == 'del' && is_numeric($_GET['id']))
		{
	    dbquery("DELETE FROM ".PREF."blacklist WHERE id=".$_GET['id']);
        header("Location: ?unit=blacklist&onpage=".$_GET['onpage']."&page=".$_GET['page']);
		}

    if(isset($_POST['check']))
        {
	    if(is_array($_POST['check']) && count($_POST['check']) > 0)
		    {
	 	    foreach($_POST['check'] as $k => $v)
		 	    {
	 		    if(isset($k) && $v == 'ON')
		 		    {
                    dbquery("DELETE FROM ".PREF."blacklist WHERE id=".$k);
		 		    }
		 	    }
		    }
        header("Location: ?unit=blacklist&onpage=".$_GET['onpage']."&page=".$_GET['page']);
        }
        
    if($act == 'save')
        {
        dbquery("INSERT INTO ".PREF."blacklist SET k='".$_POST['type']."', v='".$_POST['v']."'");
        header("Location: ?unit=blacklist");
        }
        
	}
if($exe)
	{
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
	   
    if($act == '')
        {
        $page = $_GET['page'];
        $limit = "";
        $count_messages = dbrows(dbquery("SELECT id FROM ".PREF."blacklist"));
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
    	<input name='unit' type='hidden' value='blacklist'>
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
    				echo "' onclick=\"go('?unit=blacklist&onpage=".$_GET['onpage']."&page=".$i."')\">".$i."</div>";
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
			    <form name='form' action='?unit=blacklist&act=save' method='post'>
	            <FIELDSET style='width:400px;'><LEGEND>".$locale[476]."</LEGEND>

                    <table border='0' class='add_item'>
                    <tr>
                        <td>".$locale[909]."</td>
                        <td>
                        
                            <select type='select' name='type' size='1' >
                                <option  value='i'>IP</option>
                                <option  value='e'>E-mail</option>
                                <option  value='u'>".$locale[912]."</option>
                                <option  value='t'>".$locale[913]."</option>
                            </select>
                        </td>
                    </tr>
                    <tr><td>".$locale[910]."</td><td><input type='text' name='v' style='width:100%;' value='".$dat['v']."' /></td></tr>
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
    	<form name='form2' action='?unit=blacklist&onpage=".$_GET['onpage']."&page=".$_GET['page']."' method='post'>
        <table align='center' border='0' cellpadding='1' cellspacing='1' class='tbl' style='width:550px;'>
    	    <tr class='tbl_head' >
    		    <td width='200'>".$locale[909]."</td>
    		    <td width='200'>".$locale[910]."</td>   
    		    <td width='60'>".$locale[339]."</td>
    		    <td width='60'>".$locale[200]."</td>
    		    <td width='60'>".$locale[201]."</td>
    	    </tr>
    	    ";
    
    	$sql = "SELECT * FROM ".PREF."blacklist ".$limit;
    	$i = 0;
    	$res = dbquery($sql);
    	while($dat = dbarray($res))
    		{
            $params = array();
            $params['i'] = 'IP';
            $params['e'] = 'E-mail';
            $params['t'] = 'Text';
            $params['u'] = 'User';
            if($dat['k'] == 'u')
                {
                if(is_numeric($dat['v']))
                    {
                    $user = dbarray(dbquery("SELECT * FROM ".PREF."users WHERE id=".$dat['v']));
                    $dat['v'] = "<a href='?unit=edit&user_id=".$dat['v']."&status=all'>".$user['name']."</a>";
                    }
                }
            if(!isset($params[$dat['k']])) $params[$dat['k']] = "";  
    		echo "
    			<tr>
    				<td><b>".$params[$dat['k']]."</b></td>
    				<td>".$dat['v']."</td>
    				<td align='center'><input id='check".$i."' name='check[".$dat['id']."]' type='checkbox' value='ON'></td>
                    <td align='center'>".ico("?unit=blacklist&act=edit&onpage=".$_GET['onpage']."&page=".$_GET['page']."&id=".$dat['id'], 'e')."</td>
                    <td align='center'>".ico("?unit=blacklist&act=del&onpage=".$_GET['onpage']."&page=".$_GET['page']."&id=".$dat['id'], 'd')."</td>
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
    elseif($act == 'edit' && isset($_GET['id']))
        {
        $id = $_GET['id'];
        
        if($_POST['submit'] != "")
            {
            dbquery("UPDATE ".PREF."blacklist SET k='".$_POST['type']."', v='".$_POST['v']."' WHERE id=".$id);
            }
        
        $dat = dbarray(dbquery("SELECT * FROM ".PREF."blacklist WHERE id=".$id));
        
        echo "
        <form action='?unit=blacklist&act=edit&id=".$id."' method='POST'>
        <div align='center'><b>".$locale[911]."</b><br /><br />
       
        <table border='0'>
        <tr>
            <td>".$locale[909]."</td>
            <td>
            
                <select type='select' name='type' size='1' >
                    <option "; if($dat['k'] == 'i'){echo " selected ";} echo " value='i'>IP</option>
                    <option "; if($dat['k'] == 'e'){echo " selected ";} echo " value='e'>E-mail</option>
                    <option "; if($dat['k'] == 'u'){echo " selected ";} echo " value='u'>".$locale[912]."</option>
                    <option "; if($dat['k'] == 't'){echo " selected ";} echo " value='t'>".$locale[913]."</option>
                </select>
            </td>
        </tr>
        <tr><td>".$locale[910]."</td><td><input type='text' name='v' style='width:100%;' value='".$dat['v']."' /></td></tr>
        <tr><td colspan='2' align='center'><input type='submit' name='submit' value='".$locale[34]."'/></td></tr>
        </table>
        	<br /><br /><div align='center'><input type='button' name='submit' onclick=\"go('?unit=blacklist')\" value='&larr; ".$locale[324]."'></div>
        </div>
        </form>
        ";
        }
    }
?>