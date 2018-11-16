<?php
    include('../config.php');
	mysql_connect($db_host, $db_user, $db_pass) or die("Unable to connect to SQL Server");
	mysql_select_db($db_name) or die("Unable to select database");
    mysql_query("SET NAMES UTF8");
	$for = (isset($_GET['for'])) ? $_GET['for'] : 1;
    $file = file('fields.sql');
    $to = $for+300;
    $count = count($file);
    if($to > count($file)){
        $to = count($file);
    }
    
    $sql = "INSERT INTO `".$db_pref."db_fields` (`message`, `field`, `value`) VALUES\n";
    for($i = $for; $i < $to; $i++){
       $sql .= $file[$i];
    }
	$sql = trim($sql);
	if(substr($sql, -1) == ','){
		$sql = substr($sql, 0, -1);
	}
	mysql_query($sql);
	//echo "<pre>$sql</pre>";
?><!DOCTYPE HTML>
<html>
<head>
	<meta http-equiv="content-type" content="text/html" />
	<meta name="author" content="Georgy" />

	<title>Filling table fields_db</title>
<?php
	if($to < $count){
	   echo "
       <meta http-equiv='Refresh' CONTENT='3; URL=?for=".$to."'>
       ";
	}
?>
    
</head>

<body>

<?php
    
	echo ceil($to/$count*100)."%";
    
?>

</body>
</html>