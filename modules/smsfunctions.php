<?php

define('SMSHOST', 'http://atompark.com/members/sms/xml.php');




function sendsms($text, $num)
	{
	global $settings;    $xml = '<SMS>
<operations>
<operation>SEND</operation>
</operations>
<authentification>
<username>'.$settings['sms_username'].'</username>
<password>'.$settings['sms_password'].'</password>
</authentification>
<message>
<sender>'.$settings['sms_sender'].'</sender>
<text>'.$text.'</text>
</message>
<numbers>
<number>'.$num.'</number>
</numbers>
</SMS>';

	if(function_exists('curl_init'))
		{
		//инициализируем сеанс
		$curl = curl_init();

		//уcтанавливаем урл, к которому обратимся
		curl_setopt($curl, CURLOPT_URL, SMSHOST);

		//включаем вывод заголовков
		curl_setopt($curl, CURLOPT_HEADER, 1);

		//передаем данные по методу post
		curl_setopt($curl, CURLOPT_POST, 1);

		//теперь curl вернет нам ответ, а не выведет
		curl_setopt($curl, CURLOPT_RETURNTRANSFER, 1);

		//переменные, которые будут переданные по методу post
		curl_setopt($curl, CURLOPT_POSTFIELDS, 'XML='.urlencode($xml));

		$res = curl_exec($curl);

		//проверяем, если ошибка, то получаем номер и сообщение
		if(!$res)
			{
			$return = false;
			}
		//если не ошибка, то выводим результат
		else
			{
			$return = get_status($res);
			}

		curl_close($curl);		}
	else
		{
        $res = http_post_request($xml);
		if(!$res)
			{
			$return = false;
			}
		else
			{
			$return = get_status($res);
			}		}
	return $return;	}



function get_status($xml)
	{
	preg_match("|<status>(.*)</status>|is", $xml, $result);
	return $result[1];
	}
function randbound($c)
	{
	$symb = 'Q.W.E.R.T.Y.U.I.O.P.A.S.D.F.G.H.J.K.L.Z.X.C.V.B.N.M.0.1.2.3.4.5.6.7.8.9';
	$symb = explode('.', $symb);
	$bound = '';
	for($i=0; $i<$c; $i++)
		{
	    $bound .= $symb[rand(0,35)];
		}
	return($bound);
	}

function http_post_request($xml)
	{

	$bound = randbound(19);

	$xml = urlencode($xml);
    $data = 'XML='.$xml;
	preg_match("/^(http:\/\/)?([^\/]+)/i", SMSHOST, $matches);
	$host = $matches[2];
    $page = str_replace('http://'.$host, '', SMSHOST);

	$req  = "POST ".$page." HTTP/1.0\r\n";
	$req .= "Host: ".$host."\r\n";
	$req .= "Content-Type: application/x-www-form-urlencoded\r\n";
	$req .= "Content-Length: ".strlen( $data )."\r\n\r\n";
	$req .= $data."\r\n";
	$req .= "\r\n";

	return go_request($host, $req);

	}
function go_request($host, $rq)
	{
	$fp = @fsockopen ($host, 80, $errno, $errstr, 30);
	if (!$fp)
		{
		$text = false;
		}
	else
		{
	    fputs ($fp, $rq);
	    while (!feof($fp))
		    {
		    $text .= fgets ($fp,128);
		    }
	    fclose ($fp);
		}
	return($text);
	}
?>