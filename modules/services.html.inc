<?php

if(!is_array($services[$_GET['service']]) || !is_numeric($_GET['message_id']))
	{
	//echo '<center>ERROR</center>'; exit();
	}

$message = false;

if(isset($_GET['message_id'])){
    $dop_sql = " WHERE id = ".intval($_GET['message_id'])." AND status = 1 LIMIT 0, 1";
    include(COREPATH . 'messages.php');
    $message = isset($messages[0]) ? $messages[0] : false;
}


if(!is_numeric($_POST['days']))
	{
	$_POST['days'] = $services[$_GET['service']]['min'];
	}
elseif($_POST['days'] > $services[$_GET['service']]['max'] && $_POST['days'] < $services[$_GET['service']]['min'])
	{
	$_POST['days'] = $services_days;
	}



$status = 'calc';



if($is_billing)
	{
	
    $act = isset($_GET['act']) ? $_GET['act'] : '';
    
    
    if($act == 'buy'){


        $action = false;
        $price = false;
        if(isset($_GET['package_id'])){
            $serv = false;
            if(cnt($packages)){
                foreach($packages as $v){
                    if(cnt($v)){
                        foreach($v as $vv){
                            if($vv['id'] == $_GET['package_id']){
                                $serv = $vv;
                                break;
                            }
                        }
                    }
                }
            }
            if($serv){
                $price = $serv['price'];
                
                $action=array(
                    'type'=>1, 
                    'pkg'=>$serv['id'], 
                    'text'=>$serv['text']
                    );
            }
        }else{
            $days = intval($_GET['days']);
            if(!($_GET['days'] > $services[$_GET['service']]['max'] && $_GET['days'] < $services[$_GET['service']]['min'])){
                
                $price = round(($services[$_GET['service']]['price'] * $_GET['days']), 2);
                $serv_name = $services[$_GET['service']]['name'];
                if(is_numeric($serv_name)) $serv_name = $locale[$serv_name];
                                
                $action=array(
                    'type'=>0, 
                    'days'=> intval($_GET['days']),
                    'serv'=>$_GET['service'],
                    'text'=>$serv_name
                    );
            }
        }
        
        $status = false;
        if($price){
            
            $action['msg'] = intval($_GET['message_id']);
            $action['usr'] = intval($settings['user']['id']);
            $message = $action['msg'];
            if($price > $settings['user']['balance']){
                $status = 'select';
                $price = $price - $settings['user']['balance'];
                $payment_id = make_payment($price, $action['usr'], $action['msg'], 'p', serialize($action));                                   
				$smarty->assign('payment_id', $payment_id);
                $smarty->assign('Count', $price);
            	$smarty->assign('Currency', $currency_names[$settings['currency']]['name2']);
            	$smarty->assign('rand', rand(1000, 9999));
            	$smarty->assign('service', $services[$_GET['service']]);
            }else{
                $status = 'done';
                update_balance($settings['user']['id'], 'o', $price, $action['text']);
                custom_make_order($action);
                $settings['user']['balance'] =  $settings['user']['balance'] - $price;
                $smarty->assign('settings', $settings);
            }
        }
    }else{
    	if(is_numeric($_GET['id']) && $billing[$_GET['p']]['status'] == 1)
    		{
    		$res = dbquery("SELECT * FROM ".PREF."payments WHERE id=".$_GET['id']);
    		$dat = dbarray($res);
    		if($dat['status'] == 0)
    			{
    			$status = 'go';
    			$abilling = $billing[$_GET['p']];
    
    			$num = $dat['amount'];
    			$code = stripslashes($billing['code']);
    
    			$comment = $services[$_GET['service']]['name'].' '.$message['id'];
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
    			}
    		}
    	else
    		{
    		if($_POST['submit'] != "")
    			{
    			if(($_POST['days'] > $services[$_GET['service']]['max'] && $_POST['days'] < $services[$_GET['service']]['min']) || !is_numeric($_POST['days']))
    				{
    				echo "error";
    				}
                else
    	            {
    	            $status = 'select';
    
    				$num = round(($services[$_GET['service']]['price'] * $_POST['days']), 2);
    
    				$payment_id = make_payment($num, 0, $message['id'], $_GET['service']);
    				$smarty->assign('payment_id', $payment_id);
                    $smarty->assign('Count', $num);
    				}
    			}
            else
    	        {
    	        $status = 'calc';
                
    			$smarty->assign('err', $err);
               
    			$smarty->assign('days', $_POST['days']);
    			$smarty->assign('count', round(($_POST['days'] * $services[$_GET['service']]['price']), 2).' '.$currency_names[$settings['currency']]['name2']);
    			}
    
    		}
    
    	$smarty->assign('services', $services);
    	
    	$smarty->assign('Currency', $currency_names[$settings['currency']]['name2']);
    	$smarty->assign('rand', rand(1000, 9999));
    	$smarty->assign('service', $services[$_GET['service']]);
    	$smarty->assign('service_packages', $services_packages[$services[$_GET['service']]['type']]);

    }
    $smarty->assign('status', $status);
    $smarty->assign('message', $message);
	$smarty->display('popup_services.html');
	}


exit();
?>