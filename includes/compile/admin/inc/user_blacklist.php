<?php

if(!isset($_GET['id'])){die();}

 $writed = false;
if($_POST['submit'] != "" && isset($_POST['type']))
    {
    if(in_array('u', $_POST['type']))
        {
        dbquery("INSERT INTO ".PREF."blacklist SET k='u', v='".$_GET['id']."' ");
        }
    if(in_array('i', $_POST['type']))
        {
        dbquery("INSERT INTO ".PREF."blacklist SET k='i', v='".$_POST['ip']."' ");
        }
    if(in_array('e', $_POST['type']))
        {
        dbquery("INSERT INTO ".PREF."blacklist SET k='e', v='".$_POST['email']."' ");
        }
    if(in_array('t', $_POST['type']))
        {
        dbquery("INSERT INTO ".PREF."blacklist SET k='t', v='".$_POST['text']."' ");
        }
    $writed = true;
    }


$mess = dbarray(dbquery("SELECT * FROM ".PREF."db WHERE id=".$_GET['id']));
$email = $mess['email'];
if(is_numeric($mess['user_id']) && $mess['user_id'] != 0)
    {
    $user = dbarray(dbquery("SELECT name, id, email FROM ".PREF."users WHERE id = ".$mess['user_id']." "));
    $email = $user['email'];
    }

echo "<html>

<head>
    <meta charset='".$locale['charset']."'>
	<title>".$locale[904]."</title>
	<meta http-equiv='pragma' content='no-cache'>
	<link href='".PATH."admin/tpl/css/style.css' rel='stylesheet' type='text/css'>
	
    <div align='center'>".$locale[905]."</div>
    
    ";
    if($writed)
        {
        echo "
        <div align='center'><div class='ok'>".$locale[525]."</div></div>
        ";
        }
    else
        {
        echo "
        
        <form method='post' action='?blacklist&id=".$_GET['id']."'>
        <table border='0' width='80%'>
        ";
        if(is_numeric($mess['user_id']) && $mess['user_id'] != 0)
            {
            echo "<tr><td><input name='type[]' type='checkbox' value='u'></td><td>".$locale[906].": <b>".$user['name']."</b></td></tr>";
            }
        echo "
        <tr><td><input name='type[]' type='checkbox' value='i'></td><td>IP: <b>".$mess['ip']."</b></td></tr>
        <tr><td><input name='type[]' type='checkbox' value='e'></td><td>Email: <b>".$email."</b></td></tr>
        <tr><td><input name='type[]' type='checkbox' value='t'></td><td>".$locale[907].": </td></tr>
        <tr><td> </td><td><input name='text' value=''></td></tr>
        
        </table>
        <input type='hidden' name='ip' value='".$mess['ip']."'>
        <input type='hidden' name='email' value='".$email."'>
        <br />
        <div align='center'><input name='submit' type='submit' value='".$locale[904]."'></div>
        
        </form>
        ";
        }






echo "
</body>

</html>";
?>