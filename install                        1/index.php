<?php

if(!isset($_GET['step'])) $_GET['step'] = "";
if(!isset($_GET['loc'])) $_GET['loc'] = "";

$_path_ = str_replace('install/index.php', '', $_SERVER['PHP_SELF']);

$step = $_GET['step'];
$loc = $_GET['loc'];

if(isset($_POST['db_host']))
	{
	setcookie('db_host', $_POST['db_host'], time() + 172800);
	}
if(isset($_POST['db_name']))
	{
	setcookie('db_name', $_POST['db_name'], time() + 172800);
	}
if(isset($_POST['db_pref']))
	{
	setcookie('db_pref', $_POST['db_pref'], time() + 172800);
	}
if(isset($_POST['fullpatch']))
	{
	//setcookie('fullpatch', $_POST['fullpatch'], time() + 172800);
	}
if(isset($_POST['db_user']))
	{
	setcookie('db_user', $_POST['db_user'], time() + 172800);
	}

if($step == "") $step = 1;
if($loc == "") $loc = 'russian';

if(!is_numeric($step)) exit();

$conf = array();

require('locale/'.$loc.'.php');
require('funct.php');
require('conf.php');

echo file_get_contents('tpl/top.html');


switch($step)
	{
	case 1:
	echo "
	<form name='form' action='?' method='get'>
	<input name='step' type='hidden' value='2'>
    <table border='0' width='100%' height='100%'>
    	<tr>
			<td height='40' colspan='2'>
				<div class='title'>".$locale[1]." #".$step."</div>
				<div class='subtitle'>".$locale[2]."</div>
			</td>
		</tr>
	    <tr>
		    <td colspan='2' height='100%'>
				<div class='choice'>
				";

				$files = get_file_list('locale/');

				foreach($files as $v)
					{
					$v = substr($v, 0, -4);
				    echo "<input name='loc' type='radio' value='".$v."'";

			        if($v == $loc)
				        {
				        echo ' checked';
				        }

				    echo "> ".$v."<br />";
					}

				echo "
				</div>
		    </td>
	    </tr>
        <tr>
		<td align='left' height='20'><input type='button' value='&larr; ".$locale[4]."' style='position:relative;'  disabled></td>
		<td align='right'><input type='submit' value='".$locale[3]." &rarr;' ></td>
        </tr>
  	</table>
	</form>
	";
	break;

	case 2:
	echo "
	<form name='form' action='?' method='get'>
	<input name='step' type='hidden' value='3'>
	<input name='loc' type='hidden' value='".$loc."'>
    <table border='0' width='100%' height='100%'>
    	<tr>
			<td height='40' colspan='3'>
				<div class='title'>".$locale[1]." #".$step."</div>
				<div class='subtitle'>".$locale[5]."</div>
			</td>
		</tr>
	    <tr>
		    <td colspan='3' height='100%'>
				<div class='choice'>
				";

				$files = array();
                $files[] = '../images/cat/';
                $files[] = '../smarty/cache/';
                $files[] = '../smarty/compile/';
                $files[] = '../uploads/temp/';
                $files[] = '../uploads/files/';
                $files[] = '../uploads/files/file/';
                $files[] = '../uploads/files/flash/';
                $files[] = '../uploads/files/image/';
                $files[] = '../uploads/files/media/';
                $files[] = '../uploads/images/';
                $files[] = '../admin/dbbackup/';
                $files[] = '../config.php';

				echo "

				<table border='0' width='100%' class='files'>
					<tr class='tit'>
						<td>".$locale[6]."</td>
						<td>".$locale[7]."</td>
						<td>".$locale[8]."</td>
					</tr>

				";

				foreach($files as $v)
					{
					if(is_readable($v))
						{
					    $read = "<font style='color:#80FF00;'>".$locale[9]."</font>";
						}
					else
						{
					    $read = "<font style='color:red;'>".$locale[10]."</font>";
						}
					if(is_writable($v))
						{
					    $write = "<font style='color:#80FF00;'>".$locale[9]."</font>";
						}
					else
						{
					    $write = "<font style='color:red;'>".$locale[10]."</font>";
						}

					echo "
					<tr>
						<td>".$v."</td>
						<td align='center'>".$read."</td>
						<td align='center'>".$write."</td>
					</tr>
					";
					}

				echo "
				</table>
				</div>
		    </td>
	    </tr>
        <tr>
		<td align='left' height='20'><input type='button' value='&larr; ".$locale[4]."' onclick='history.back(1);'></td>
		<td align='center'><input type='button' value='".$locale[28]."' onclick=\"document.location.href = '?step=2&loc=".$loc."'\"></td>
		<td align='right'><input id=nextbtn type='submit' value='".$locale[3]." &rarr;' ></td>
        </tr>
  	</table>
	</form>
	";
	break;


	case 3:


        echo "
    	<form name='form' action='?' method='get'>
    	<input name='step' type='hidden' value='4'>
        <table border='0' width='100%' height='100%'>
        	<tr>
    			<td height='40' colspan='3'>
    				<div class='title'>".$locale[1]." #".$step."</div>
    				<div class='subtitle'>".$locale[47]."</div>
    			</td>
    		</tr>
    	    <tr>
    		    <td colspan='3' height='100%'>
    				<div class='choice'>
                    
        ";  
	$trueversion = 1;
    
    if(file_exists('../version.ver'))
        {
        $version = trim(file_get_contents('../version.ver'));
        if(substr($version, 0, 3) == '2.2') $trueversion = 5;
        }  
  
    if(file_exists('../version') && $trueversion == 1)
        {
        $version = trim(file_get_contents('../version'));
        $version = (int) str_replace('2.1.', '', $version);
        if($version >= 140219)
            {
            $trueversion = 4;
            }
        }
    if(file_exists('../version.txt') && $trueversion == 1)
        {
        $version = trim(file_get_contents('../version.txt'));
        $version = str_replace('2.0.', '', $version);
        if($version >= 20111029)
            {
            $trueversion = 2;
            }
        }
 
    if(file_exists('../files/db.dat')  && $trueversion == 1)
        {
        $trueversion = 3;
        }   
        
    if($trueversion == 2)
        {
        echo "<b>".$locale[48]."</b>
        <br /><br />
        <label><input type='radio' name='upd' value='2021' checked /> ".$locale[49]."</label><br />
        <label><input type='radio' name='upd' value='false' /> ".$locale[50]."</label><br />
        ";
        }
    elseif($trueversion == 3)
        {
        echo "<b>".$locale[51]."</b>
        <br /><br />
        <label><input type='radio' name='upd' value='1421' checked /> ".$locale[49]."</label><br />
        <label><input type='radio' name='upd' value='false' /> ".$locale[50]."</label><br />
        ";   
        }
    elseif($trueversion == 4)
        {
        echo "<b>".$locale[55]."</b>
        <br /><br />
        <label><input type='radio' name='upd' value='2122' checked /> ".$locale[49]."</label><br />
        <label><input type='radio' name='upd' value='false' /> ".$locale[50]."</label><br />
        ";   
        }
    elseif($trueversion == 5)
        {
        if($trueversion == 5){
            $locale[55] = substr($locale[55], 0, -1).'2';
        }
        echo "<b>".$locale[55]."</b>
        <br /><br />
        <label><input type='radio' name='upd' value='2123' checked /> ".$locale[49]."</label><br />
        <label><input type='radio' name='upd' value='false' /> ".$locale[50]."</label><br />
        ";   
        }
    else
        {
        echo $locale[52];
        }
    echo "
                    </div>
    		    </td>
    	    </tr>
            <tr>
    		<td align='left' height='20'><input type='button' value='&larr; ".$locale[4]."' onclick='history.back(1);'></td>
 		<td align='center'><input type='button' value='".$locale[28]."' onclick=\"document.location.href = '?step=3&loc=".$loc."'\"></td>

    		<td align='right'><input id=nextbtn type='submit' value='".$locale[3]." &rarr;' ></td>
            </tr>
      	</table>
    	</form>
    ";
	break;


    case 4:
    
    if(!isset($_GET['upd'])) $_GET['upd'] = 'false';
    
    if(($_GET['upd'] == '2021' || $_GET['upd'] == '2122' || $_GET['upd'] == '2123') && file_exists('../config.php'))
        {
        include('../config.php');
        $_COOKIE['db_host'] = $db_host;
        $_COOKIE['db_user'] = $db_user;
        $_COOKIE['db_name'] = $db_name;
        $_COOKIE['db_pass'] = $db_pass;
        $_COOKIE['db_pref'] = $db_pref;
        }

	echo "
	<form name='form' action='?step=5&loc=".$loc."&upd=".$_GET['upd']."' method='POST'>
    <table border='0' width='100%' height='100%'>
    	<tr>
			<td height='40' colspan='2'>
				<div class='title'>".$locale[1]." #".$step."</div>
				<div class='subtitle'>".$locale[20]."</div>
			</td>
		</tr>
	    <tr>
		    <td colspan='2' height='100%'>
				<div class='choice'>
				";

				echo "
				<style>
				table.files
					{
				    background-color:#FFFFFF;
					}
				table.files tr td
					{
				    background-color:#616161;
					}
				table.files tr td font
					{
				    font-weight:bold;
				    text-align:center;
					}
				table.files tr td input
					{
				    width:100%;
					}
				td.tit
					{
				    background-color:#000000;
				    color:#FFFF00;
				    font-weight:bold;
				    text-align:center;
					}
				</style>
				";
				if(!isset($_POST['db_host']))
					{
					if(isset($_COOKIE['db_host'])){$_POST['db_host'] = $_COOKIE['db_host'];}
					else{$_POST['db_host'] = 'localhost';}
					}
				if(!isset($_POST['db_pref']))
					{
					if(isset($_COOKIE['db_pref'])){$_POST['db_pref'] = $_COOKIE['db_pref'];}
					else{$_POST['db_pref'] = 'eboard_';}
					}
				if(!isset($_POST['fullpatch']))
					{
					if(isset($_COOKIE['fullpatch'])){$_POST['fullpatch'] = stripslashes($_COOKIE['fullpatch']);}
					else{$_POST['fullpatch'] = substr(dirname(__FILE__), 0, -7);}
					}

					if(isset($_COOKIE['db_user'])){$_POST['db_user'] = $_COOKIE['db_user'];}
					if(isset($_COOKIE['db_name'])){$_POST['db_name'] = $_COOKIE['db_name'];}
					if(!isset($_POST['db_user'])){$_POST['db_user'] = "";}
					if(!isset($_POST['db_name'])){$_POST['db_name'] = "";}
					if(!isset($_POST['db_pass'])){$_POST['db_pass'] = "";}


				echo "
				<table border='0' width='400' class='files' align='center'>
	                <tr>
	                	<td colspan='2' class='tit'>".$locale[11]."</td>
	                </tr>
	                <tr>
	                	<td width='50%'>".$locale[16]."</td>
	                	<td width='50%'>"; 
                        if($_GET['upd'] == '2021' || $_GET['upd'] == '2122' || $_GET['upd'] == '2123')
                            {
                            echo $_POST['db_host'];
                            }
                        else
                            {
                            echo "<input name='db_host' type='text' value='".$_POST['db_host']."'>";
                            }
                        echo "</td>
	                </tr>
	                <tr>
	                	<td>".$locale[12]."</td>
	                	<td>";
                        if($_GET['upd'] == '2021' || $_GET['upd'] == '2122' || $_GET['upd'] == '2123'){echo $_POST['db_name'];} 
                        else
                            {
                            echo "<input name='db_name' type='text' value='".$_POST['db_name']."'>";
                            }
                        echo "</td>
	                </tr>
	                <tr>
	                	<td>".$locale[13]."</td>
	                	<td>";
                        if($_GET['upd'] == '2021' || $_GET['upd'] == '2122' || $_GET['upd'] == '2123')
                            {
                            echo $_POST['db_user'];
                            }
                        else
                            {                        
                            echo "<input name='db_user' type='text' value='".$_POST['db_user']."'>";
                            }
                        echo "</td>
	                </tr>
	                <tr>
	                	<td>".$locale[14]."</td>
	                	<td>";
                        if($_GET['upd'] == '2021' || $_GET['upd'] == '2122' || $_GET['upd'] == '2123')
                            {
                            echo $_POST['db_pass'];
                            }
                        else
                            {  
                            echo "<input name='db_pass' type='password' value='".$_POST['db_pass']."'>";
                            }
                        echo "</td>
	                </tr>
	                <tr>
	                	<td>".$locale[15]."</td>
	                	<td>";
                        if($_GET['upd'] == '2021' || $_GET['upd'] == '2122' || $_GET['upd'] == '2123')
                            {
                            echo $_POST['db_pref'];
                            }
                        else
                            {  
                            echo "<input name='db_pref' type='text' value='".$_POST['db_pref']."'>";
                            }
                        echo "</td>
	                </tr>
                    ";
   
                    echo "

				</table>
				</div>
		    </td>
	    </tr>
        <tr>
		<td align='left' height='20'><input type='button' value='&larr; ".$locale[4]."' onclick='history.back(1);'></td>
		<td align='right'><input id=nextbtn type='submit' value='".$locale[3]." &rarr;' ></td>
        </tr>
  	</table>

	</form>
	";
    break;

	case 5:

    	echo "
    
    	<form name='form' action='?' method='get'>
    	<input name='step' type='hidden' value='6'>
    	<input name='loc' type='hidden' value='".$loc."'>
    	<input name='upd' type='hidden' value='".$_GET['upd']."'>
    
        <table border='0' width='100%' height='100%'>
        	<tr>
    			<td height='40' colspan='2'>
    				<div class='title'>".$locale[1]." #".$step."</div>
    				<div class='subtitle'>".$locale[23]."</div>
    			</td>
    		</tr>
    	    <tr>
    		    <td colspan='2' height='100%'>
    	";

        if(($_GET['upd'] == '2021'  || $_GET['upd'] == '2122' || $_GET['upd'] == '2123') && file_exists('../config.php'))
            {
            include('../config.php');
            $_POST['db_host'] = $db_host;
            $_POST['db_user'] = $db_user;
            $_POST['db_name'] = $db_name;
            $_POST['db_pass'] = $db_pass;
            $_POST['db_pref'] = $db_pref;
            }
            
  
    	if(@dbconnect_test($_POST['db_host'], $_POST['db_user'], $_POST['db_pass'], $_POST['db_name']))
    		{
    		if(is_writable('../config.php'))
                {

				$string  = '<?php'."\n";
				
				$string .= '$db_host  = \''.$_POST['db_host']."';\n";
				$string .= '$db_user  = \''.$_POST['db_user']."';\n";
				$string .= '$db_name  = \''.$_POST['db_name']."';\n";
				$string .= '$db_pass  = \''.$_POST['db_pass']."';\n";
				$string .= '$db_pref  = \''.$_POST['db_pref']."';\n";
				
				$string .= '$path = str_replace(\'index.php\', \'\', $_SERVER[\'PHP_SELF\']);'."\n";
				$string .= '$host = $_SERVER[\'HTTP_HOST\'];'."\n";
				$string .= '$fullpath = dirname(__FILE__) . \'/\''.";\n";
				$string .= '$install = false;'."\n";

				$string .= '?>';

	            $fp = fopen('../config.php', 'w');
	            fwrite($fp, $string);
	            fclose($fp);
                
	            $err = false;

    			}
    		else
    			{
    		    echo "
    		    <center>
    			    <div class='error'>
    			    ".$locale[19]."
    			    </div>
    		    </center>
    		    ";
    		    $err = true;
    		    }
    		}
    	else
    		{
    	    echo "
    	    <center>
    		    <div class='error'>
    		    ".$locale[18]."
    		    </div>
    	    </center>
    	    ";
    	    $err = true;
    		}
    
        if(!$err)
    	    {
    	    echo "
    	    <center>
    		    <div class='ok'>
    		    ".$locale[24]."
    		    </div>
    	    </center>
    	    ";
    	    }
    
    	echo "
    
    		    </td>
    	    </tr>
            <tr>
    		<td align='left' height='20'><input type='button' value='&larr; ".$locale[4]."' onclick='history.back(1);'></td>
    		<td align='right'><input id=nextbtn type='submit' value='".$locale[3]." &rarr;' "; if($err){echo " disabled ";} echo " ></td>
            </tr>
      	</table>
    	</form>
    	";
    
	break;




	case 6:

	include('../config.php');
	dbconnect($db_host, $db_user, $db_pass, $db_name);
	dbquery('SET NAMES utf8');
	define('PREF', $db_pref);



	if($_GET['upd'] == '2123')
	    {
        echo "
        <form name='form' action='?step=7&loc=".$loc."' method='GET'>
		<input name='step' type='hidden' value='7'>
		<input name='loc' type='hidden' value='".$loc."'>
        <input name='upd' type='hidden' value='".$_GET['upd']."'>
        	   <table border='0' width='100%' height='100%'>
        	   	<tr>
        			<td height='40' colspan='3'>
        				<div class='title'>".$locale[1]." #".$step."</div>
        				<div class='subtitle'>".$locale[53]."</div>
        			</td>
        		</tr>
        	    <tr>
        		    <td colspan='3' height='100%'>
        	              ";
                         
                         $cn = 0;
                             
                         include('inc/update4.php');   

                         echo "
                        <div class='choice'>
                        ".$locale[31].": ".$cn."
                        </div>
                        ";
        
        	              echo "
        		    </td>
        	    </tr>
        	       <tr>
        		<td align='left' height='20'><input type='button' value='&larr; ".$locale[4]."' onclick='history.back(1);'></td>
        		<td align='center'></td>
        		<td align='right'><input id=nextbtn type='submit' value='".$locale[3]." &rarr;' ></td>
        	       </tr>
        	 	</table>
        	</form>"; 
           
           
        
  }elseif($_GET['upd'] == '2122')
	    {
        echo "
        <form name='form' action='?step=7&loc=".$loc."' method='GET'>
		<input name='step' type='hidden' value='7'>
		<input name='loc' type='hidden' value='".$loc."'>
        <input name='upd' type='hidden' value='".$_GET['upd']."'>
        	   <table border='0' width='100%' height='100%'>
        	   	<tr>
        			<td height='40' colspan='3'>
        				<div class='title'>".$locale[1]." #".$step."</div>
        				<div class='subtitle'>".$locale[53]."</div>
        			</td>
        		</tr>
        	    <tr>
        		    <td colspan='3' height='100%'>
        	              ";
                         
                         $cn = 0;
                             
                         include('inc/update3.php');   
                            
                         echo "
                        <div class='choice'>
                        ".$locale[31].": ".$cn."
                        </div>
                        ";
        
        	              echo "
        		    </td>
        	    </tr>
        	       <tr>
        		<td align='left' height='20'><input type='button' value='&larr; ".$locale[4]."' onclick='history.back(1);'></td>
        		<td align='center'></td>
        		<td align='right'><input id=nextbtn type='submit' value='".$locale[3]." &rarr;' ></td>
        	       </tr>
        	 	</table>
        	</form>"; 
           
           
        
	    }
	elseif($_GET['upd'] == '2021')
	    {
        include('inc/update2.php');
	    }
    elseif($_GET['upd'] == '1421')
	    {
        include('inc/update.php');
	    }
	else
		{
		echo "
		<form name='form' action='?step=7&loc=".$loc."' method='post'>
		<input name='step' type='hidden' value='6'>
		<input name='loc' type='hidden' value='".$loc."'>
		   <table border='0' width='100%' height='100%'>
		   	<tr>
				<td height='40' colspan='2'>
					<div class='title'>".$locale[1]." #".$step."</div>
					<div class='subtitle'>".$locale[33]."</div>
				</td>
			</tr>
		    <tr>
			    <td colspan='2' height='100%'>
				<div align='center'>
				<select size='1' name='sql'>
		";
		$files = get_file_list('sql/');

		foreach($files as $v)
			{
			echo "
			<option value='".$v."'";
			if($v == 'rus_general_topics.sql')
				{
				echo ' selected ';
				}
			echo ">".$v."</option>
  			";
			}
		echo "
				</select>
				</div>
			    </td>
		    </tr>
		       <tr>
			<td align='left' height='20'><input type='button' value='&larr; ".$locale[4]."' onclick='history.back(1);'></td>
			<td align='right'><input id=nextbtn type='submit' value='".$locale[3]." &rarr;' ></td>
		       </tr>
		 	</table>
		</form>
		";
		}
	break;




	case 7:

	include('../config.php');
	dbconnect($db_host, $db_user, $db_pass, $db_name);
	dbquery('SET NAMES utf8');
	define('PREF', $db_pref);

	if(isset($_POST['sql']))
		{
		$sqlfile = file_get_contents('sql/'.$_POST['sql']);
        $sqlfile = str_replace('%_PATH_%', $_path_, $sqlfile);
		$sqlfile = parce_sql_file($sqlfile);
		$lines = array();

		splitSqlFile($lines, $sqlfile);
	    $cn = 0;
	    if(count($lines) > 0)
		    {
			foreach($lines as $sql)
				{
				if($sql['query'] != "")
					{
					dbquery($sql['query']);
					$cn++;
					}
				}
		    }
		}

	$settings = array();
	$res = dbquery("SELECT * FROM ".PREF."settings");
	while($dat = dbarray($res))
		{
	    $settings[$dat['k']] = stripslashes($dat['v']);
		}

	$pt = $_SERVER['PHP_SELF'];
    $pt = str_replace('install/index.php', '', $pt);


    if($pt == '/'){$pt = '';}
    if(substr($pt, 0, 1) == '/'){$pt = substr($pt, 1);}
	echo "
	<form name='form' action='?step=8&loc=".$loc."' method='POST'>
    <table border='0' width='100%' height='100%'>
    	<tr>
			<td height='40' colspan='2'>
				<div class='title'>".$locale[1]." #".$step."</div>
				<div class='subtitle'>".$locale[34]."</div>
			</td>
		</tr>
	    <tr>
		    <td colspan='2' height='100%'>
				<div class='choice'>
				";

				echo "
				<table border='0' width='400' class='files' align='center'>
	                <tr>
	                	<td width='50%'>".$locale[35]."</td>
	                	<td width='50%'><input name='title' type='text' value='".$settings['title']."'></td>
	                <tr>
	                <tr>
	                	<td width='50%'>".$locale[36]."</td>
	                	<td width='50%'><input name='admin_login' type='text' value='".$settings['admin_login']."'></td>
	                <tr>
	                <tr>
	                	<td width='50%'>".$locale[40]."</td>
	                	<td width='50%'><input name='email' type='text' value='".$settings['email']."'></td>
	                <tr>
	                <tr>
	                	<td width='50%'>".$locale[37]."</td>
	                	<td width='50%'><input name='admin_password1' type='password' value=''></td>
	                <tr>
	                <tr>
	                	<td width='50%'>".$locale[38]."</td>
	                	<td width='50%'><input name='admin_password2' type='password' value=''></td>
	                <tr>
	                <tr>
	                	<td width='50%'>".$locale[39];
                        if(isset($_GET['upd']))
                            {
                            if($_GET['upd'] == '2021')
                                {
                                echo "<br /><br /><small>".$locale[54]."</small>";
                                }
                            }
                        
                        echo "</td>
		                	<td width='50%'>
		                		<textarea name='license_key' rows='5' style='width: 200px;' wrap='on'></textarea>
		                	</td>
	                <tr>
				</table>
				</div>
        	</td>
	    </tr>
        <tr>
		<td align='left' height='20'><input type='button' value='&larr; ".$locale[4]."' onclick='history.back(1);'></td>
		<td align='right'><input id=nextbtn type='submit' value='".$locale[3]." &rarr;' ></td>
        </tr>
  	</table>
	</form>
	";
	break;



	case 8:

	include('../config.php');
	dbconnect($db_host, $db_user, $db_pass, $db_name);
	dbquery('SET NAMES utf8');
	define('PREF', $db_pref);


	echo "
	<form name='form' action='?step=8&loc=".$loc."' method='POST'>
    <table border='0' width='100%' height='100%'>
    	<tr>
			<td height='40' colspan='2'>
				<div class='title'>".$locale[1]." #".$step."</div>
				<div class='subtitle'>".$locale[42]."</div>
			</td>
		</tr>
	    <tr>
		    <td colspan='2' height='100%'>
			<div align='center'>
			";
	if($_POST['admin_password1'] != $_POST['admin_password2'] || $_POST['admin_password2'] == '' || $_POST['admin_password1'] == '')
		{
		echo "
	    <div class='error'>
	    ".$locale[41]."
	    </div>
		";
		}
	else
		{

        $_POST['license_key'] = str_replace("\n", "", $_POST['license_key']);
		$_POST['license_key'] = str_replace("\r", "", $_POST['license_key']);
		$_POST['license_key'] = str_replace("\t", "", $_POST['license_key']);
		//$_POST['license_key'] = str_replace(" ", "",  $_POST['license_key']);
        
        if(!isset($_POST['patch'])) $_POST['patch'] = "";
		if($_POST['patch'] == '/'){$_POST['patch'] = "";}
	    dbquery("UPDATE ".PREF."settings SET v='".addslashes($_POST['title'])."' WHERE k='title'");
	    dbquery("UPDATE ".PREF."settings SET v='".addslashes($_POST['admin_login'])."' WHERE k='admin_login'");
	    dbquery("UPDATE ".PREF."settings SET v='".addslashes($_POST['email'])."' WHERE k='email'");
	    dbquery("UPDATE ".PREF."settings SET v='".md5($_POST['admin_password1'])."' WHERE k='admin_password'");
	    dbquery("UPDATE ".PREF."settings SET v='".$_POST['license_key']."' WHERE k='license_key'");
	    dbquery("UPDATE ".PREF."settings SET v='".$_POST['patch']."' WHERE k='patch'");
		
		$theme = dbarray(dbquery("SELECT * FROM ".PREF."settings WHERE k='theme'"));

		if(!file_exists('../templates/'.$theme['v'].'/body1.html'))
			{
			dbquery("UPDATE ".PREF."settings SET v='eco' WHERE k='theme'");
			}
		
		echo "
	    <div class='ok'>
	    ".$locale[43]."
	    <br /><br />
	    <a href='../'>".$locale[44]."</a>
	    &nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;&nbsp;
	    <a href='../admin/'>".$locale[45]."</a>
	    </div>
		";
		}
			echo "
			</div>
        	</td>
	    </tr>
        <tr>
		<td align='left' height='20'><input type='button' value='&larr; ".$locale[4]."' onclick='history.back(1);'></td>
		<td align='right'></td>
        </tr>
  	</table>
	</form>
	";
	break;


	}

echo file_get_contents('tpl/bottom.html');

?>