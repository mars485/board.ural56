<?php
if(is_numeric($_GET['id']) && $billing[$_GET['p']]['status'] == 1)
	{

	$res = dbquery("SELECT * FROM ".PREF."payments WHERE id=".$_GET['id']);
	$dat = dbarray($res);

	if($dat['status'] == 0)
		{
		$abilling = $billing[$_GET['p']];

		$num = $dat['amount'];
		$code = stripslashes($billing['code']);

		$comment = $services[$_GET['service']]['name'].' '.$_GET['message_id'];
		if(strlen($comment) > 255)
			{
			$comment = 'message '.$message['id'];
			}

		$pay = array();
		$pay['amount'] = $num;
		$pay['order'] = $_GET['id'];
		$pay['comment'] = $comment;
		$pay['currency'] = $abilling['cur'][$settings['currency']];

		$smarty->assign('abilling', $abilling);
		$smarty->assign('pay', $pay);

		$html = "\r\n<p align='center'>".$locale[664].": <b>".$abilling['name']."</b>, ".$locale[666].": <b>".$num."</b> ".$currency_names[$settings['currency']]['name2'].". <b>".$services[$_GET['service']]['name']."</b></p>\r\n";

		$file = make_template_file($abilling['html_1']);
		$html .= $smarty->fetch($file);
		unlink($file);
		$smarty->assign('html', $html);
		$smarty->assign('payment_id', $payment_id);
		$smarty->assign('Count', $num);

		$smarty->assign('status', 'go');
		$smarty->assign('Currency', $currency_names[$settings['currency']]['name2']);
		$smarty->assign('rand', rand(1000, 9999));
		$smarty->assign('service', $services['a']);

		$smarty->display('popup_services.html');
		}
	}
else
	{	$payment_id = $_GET['payment_id'];
	if(!is_numeric($payment_id)){exit();}

	$res = dbquery("SELECT * FROM ".PREF."payments WHERE id=".$payment_id);
	$dat = dbarray($res);
	if(!is_numeric($dat['id'])){exit();}

	$num = $dat['amount'];
	$message_id = $dat['message_id'];

	$res = dbquery("SELECT * FROM ".PREF."db WHERE id=".$message_id);
	$dat = dbarray($res);
	if(!is_numeric($dat['id'])){exit();}

	$message = $dat;

	$smarty->assign('payment_id', $payment_id);
	$smarty->assign('Count', $num);

	$smarty->assign('status', 'select');
	$smarty->assign('Currency', $currency_names[$settings['currency']]['name2']);
	$smarty->assign('rand', rand(1000, 9999));
	$smarty->assign('message', $message);
	$smarty->assign('service', $services['a']);

	$smarty->display('popup_services.html');	}

exit();
?>