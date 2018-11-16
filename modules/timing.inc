<?php

include(COREPATH.'admin/inc/services_list.php');

$days = $_GET['days'];
$content = "";

$service = $services['a'];

if(is_numeric($days))
	{
	$count = ($service['price'] * $days)." ".$currency_names[$settings['currency']]['name2'];
	}

?><html>

<head>
  <title></title>
<script type="text/javascript" src="<?=$settings['path']?>js/jquery.js"></script>
<script type='text/javascript' src='<?=$settings['path']?>js/functions.js'></script>
<link rel="stylesheet" type="text/css" href="<?=THEME?>style.css" />
<!--[if IE]>
	<link rel="stylesheet" href="<?=THEME?>style_ie.css" type="text/css" />
<![endif]-->
<script>
function IsNumeric(sText)
	{
   var ValidChars = "0123456789.";
   var IsNumber=true;
   var Char;
   for (i = 0; i < sText.length && IsNumber == true; i++)
      {
      Char = sText.charAt(i);
      if (ValidChars.indexOf(Char) == -1)
         {
         IsNumber = false;
         }
      }
   return IsNumber;
   }

function calc(num)
	{
	var pr;
	pr = parseInt(document.getElementById('days').value) * <?=$service['price']?>;
	if(isNaN(pr))
		{
		document.getElementById('count').innerHTML = '<?=$locale[636]?>';
		top.document.getElementById('active_service').value = '';
		top.document.getElementById('active_days').value = '';
		}
	else if(parseInt(document.getElementById('days').value) > <?=$service['max']?>)
		{
		document.getElementById('count').innerHTML = '<?=$locale[637]?>';
		top.document.getElementById('active_service').value = '';
		top.document.getElementById('active_days').value = '';
		}
	else if(parseInt(document.getElementById('days').value) < <?=$service['min']?>)
		{
		document.getElementById('count').innerHTML = '<?=$locale[638]?>';
		top.document.getElementById('active_service').value = '';
		top.document.getElementById('active_days').value = '';
		}
<?php
if($settings['user'])
	{
	echo "
		else if(pr > ".$settings['user']['balance'].")
			{
			document.getElementById('count').innerHTML = '".$locale[295]." <a target=\'_top\' href=\'".$settings['path']."users/pay/\'>".$locale[296]."</a>';
			top.document.getElementById('active_service').value = 'b';
			top.document.getElementById('active_days').value = '';
			}
	";
	}
?>
	else
		{
		document.getElementById('count').innerHTML = pr + ' ' + '<?=$currency_names[$settings['currency']]['name2']?>';
		top.document.getElementById('active_service').value = pr;
		top.document.getElementById('active_days').value = parseInt(document.getElementById('days').value);
		}

	}

    function selectChange(obj){
		top.document.getElementById('active_service').value =  parseInt(obj.options[obj.selectedIndex].value) * <?=$service['price']?>;
		top.document.getElementById('active_days').value = obj.options[obj.selectedIndex].value;
        }

                
    $(function() {
        var iframe = $('#frame_timing', parent.document.body);
        iframe.height($(document.body).height() + 10);
    });
</script>
</head>
<body style='font-size:12px;'>
<?php


if(count($services_packages['a']) > 0){
	$v = current($services_packages['a']);
    

    echo "
    <script>
    top.document.getElementById('active_service').value =  ".($service['price']*$v['days']).";
	top.document.getElementById('active_days').value =  ".$v['days'].";
    </script>
    <select name='days' onchange='selectChange(this);'>
    ";
        foreach($services_packages['a'] as $v){
            echo "
                <option value='".$v['days']."'>".$v['text']." &mdash; ".($service['price'] * $v['days']).' '.$currency_names[$settings['currency']]['name2']."</option>
            ";    
        }
    echo "
    </select>
    ";
    
}else{
    echo "
    <ul>
    	<li>".$locale[736]." <input style='font-size:12px;' id='days' name='days' type='text' value='".$days."' size='3' onchange='calc();' onkeyup=\"var n=this.value.replace(/([^0-9])/g,''); if(n!=this.value) this.value=n; calc();\"> ".$locale[175]."</li>
    	<li>".$locale[737].": <b><span id='count'>".$count."</span></b></li>
    </ul>
    ";    
}



exit('</body>
</html>');
?>