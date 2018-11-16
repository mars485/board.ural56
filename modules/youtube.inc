<?php

$w = 530;
$h = 320;

$id = $_GET['id'];
$field = $_GET['f'];
if(!is_numeric($id)) exit();
if(!is_numeric(substr($field, 2))) exit();


$res = dbquery("SELECT `".$field."` FROM ".PREF."db WHERE id=".$id);
$dat = dbarray($res);

$query = parse_url($dat[$field]);
$ident = @parse_request($query['query']);
$ident = $ident['v'];


echo '<html>

<head>
  <title></title>
</head>

<body>



<div align="center">
<object width="'.$w.'" height="'.$h.'"><param name="movie" value="http://www.youtube.com/v/'.$ident.'"></param><param name="allowFullScreen" value="true"></param><param name="allowscriptaccess" value="always"></param><embed src="http://www.youtube.com/v/'.$ident.'" type="application/x-shockwave-flash" allowscriptaccess="always" allowfullscreen="true" width="'.$w.'" height="'.$h.'"></embed></object>
</div>

</body>

</html>';

exit();
?>