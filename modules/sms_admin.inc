<?php //790
if(!$exe)
	{
	$act = $_GET['act'];
    if(!isset($_GET['act2'])) $_GET['act2'] = "";
	$act2 = $_GET['act2'];
    if($act == 'on')
	    {
	    if(!isset($settings['sms']))
		    {
	 	    dbquery("INSERT INTO ".PREF."settings SET v=1, k='sms'");
		    }
	    else
		    {
		    dbquery("UPDATE ".PREF."settings SET v='1' WHERE k='sms'");
	        }
        header('Location: ?unit=sms');
        exit();
	    }
	}
if($exe)
	{
	if($settings['sms'] != 1)
		{
		echo "
		<div align='center'>
		<div class='error' style='width:90%;margin:15px;text-align:center;font-size:15px;'>
		".$locale[791]."
		<br>
		<button onclick=\"go('?unit=sms&act=on')\">".$locale[793]."</button>
		</div>
		</div>
		";
		}

	if($act == '')
		{
	    echo "
	    <ul id='mod_a'>
		    <li><a href='?unit=sms&act=settings'>".$locale[792]."</li>
	    </ul>
	    ";

		}
  	elseif($act == 'settings')
       {

       echo "
       <div align='center' id='div_h2'>".$locale[792]."</div>
       ";
       if($_POST['submit'] != "")
	       {

	       $err = array();
           $winsender = iconv('utf-8', 'windows-1251', $_POST['sms_sender']);
           $wintext   = iconv('utf-8', 'windows-1251', $_POST['sms_text']);

           if($_POST['sms_username'] == "" || $_POST['sms_password'] == "" || $_POST['sms_text'] == "" || $_POST['sms_sender'] == "")
	           {
               $err[] = $locale[804];
	           }
	       else
		       {
	           if(strlen($winsender) > 14 && is_numeric($winsender))
		           {
	               $err[] = $locale[801] .' ('.$locale[798].')';
		           }
	           elseif(strlen($winsender) > 11 && !is_numeric($winsender))
		           {
	               $err[] = $locale[801] .' ('.$locale[798].')';
		           }

				if(preg_match("/[^a-z,0-9,A-z]/", $winsender))
					{
					$err[] = $locale[802];
					}

/*				if(preg_match("/[^a-z,0-9,A-z]/", $wintext))
					{
					$err[] = $locale[802];
					}*/

				if(preg_match("/^[0-9a-zA-Z -_=:\/\.\,]+$/i", $wintext))
					{
					if(strlen($wintext) > 160)
						{
					    $err[] = $locale[803];
						}
					}
				else
					{
					if(strlen($wintext) > 70)
						{
					    $err[] = $locale[803];
						}
					}
	           }


           if(count($err) == 0)
	           {
               unset($_POST['submit']);
               foreach($_POST as $k => $v)
	                {
				    if(!isset($settings[$k]))
					    {
				 	    dbquery("INSERT INTO ".PREF."settings SET v='".$v."', k='".$k."'");
					    }
				    else
					    {
					    dbquery("UPDATE ".PREF."settings SET v='".$v."' WHERE k='".$k."'");
	        			}
	        		$settings[$k] = $v;
	                }
	        	echo "
	        	<div align='center'>
		        	<div class='ok'>
		        	".$locale[525]."
		        	</div>
	        	</div>
	        	";

	           }
	       else
		      {
	   	      echo "
	   	      <div align='center'>
		   	      <div class='error'>
		   	      <b>".$locale[805]."*</b>
			   	      <ul>";
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

	       }

       if(!isset($settings['sms_text']))
	       {
           $settings['sms_text'] = $locale[811].' %code%';
	       }
       echo "
       <br />
	   <div id='s123123'>
	       <form action='?unit=".$unit."&act=".$act."' method='POST'>
	           <table align='center' border='0' class='add_item'>
		           <tr>
		           		<td>".$locale[794]."</td>
		           		<td><input name='sms_username' type='text' value='".$settings['sms_username']."' style='width:200px;'></td>
		           </tr>
		           <tr>
		           		<td>".$locale[795]."</td>
		           		<td><input name='sms_password' type='text' value='".$settings['sms_password']."' style='width:200px;'></td>
		           </tr>
		           <tr>
		           		<td>".hlp($locale[798])." ".$locale[797]."</td>
		           		<td><input name='sms_sender' type='text' value='".$settings['sms_sender']."' style='width:200px;'></td>
		           </tr>
		           <tr>
		           		<td>".hlp($locale[800])." ".$locale[799]."</td>
		           		<td><input name='sms_text' type='text' value='".$settings['sms_text']."' style='width:200px;'></td>
		           </tr>
	           </table>
	          <div id='sms_center'> <div align='center'><input type='submit' name='submit' value='".$locale[34]."'></div>  <div align='center'><input type='button' onclick=\"go('?unit=sms')\" value='&larr; ".$locale[324]."'></div></div>
	       </form>
		   </div>
	
       ";
       }


	}

?>