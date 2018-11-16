<?php
/*
	Скрипт доски объявлений
	Elite-Board 2
	Тихомиров Юрий
	Санкт-Петербург
	2009 - 2010

	версия модуля: 260110
*/

echo "<html>

<head>
  <meta charset='".$locale['charset']."'>
  <title>".$locale[316]."</title>

<script language=\"JavaScript\">
function selectimg(img)
	{
	opener.document.getElementById('image').value = img;
	window.close();
	}
</script>
<link rel='stylesheet' type='text/css' href='".PATH."admin/tpl/css/style.css' />
<meta http-equiv='Content-Type' content='text/html; charset=UTF-8'/>
</head>

<body class='select_img'>
<div>
";

if(file_exists($_FILES['file']['tmp_name']))
	{
	$filename = cpu($_FILES['file']['name'], $locale['symb']);
    $r = get_ext($_FILES['file']['name']);
    if($r == 'jpg' || $r == 'bmp' || $r == 'gif' || $r == 'jpeg' || $r == 'png')
	    {
        move_uploaded_file($_FILES['file']['tmp_name'], FULLPATCH.'images/cat/'.$filename);
	    }
    else
	    {
    	echo "
        <center><div class='error'>".$locale[319]."</div></center>
        ";
	    }
	}


$fp = opendir(FULLPATCH.'images/cat/');
while(($file = readdir($fp)) !== false)
	{
	if(substr($file, -4) == '.png' || substr($file, -4) == '.gif' || substr($file, -4) == '.jpg' || substr($file, -5) == '.jpeg' || substr($file, -4) == '.bmp')
		{
		echo "
		<a href=\"javascript:selectimg('".$file."');\"><img src='../images/cat/".$file."' alt='' border='0'></a>
		";
		}
	}

echo "
</div>
<div>
    <form name='form' action='?selectimage' method='post' enctype='multipart/form-data'>
    ".$locale[317].": <input type='file' name='file' >
    <input type='submit' name='submit' value='".$locale[318]."'>
</form>

</div>
</body>

</html>";

?>