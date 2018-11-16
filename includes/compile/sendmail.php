<?php
	function send_mail($to, $theme, $text, $vars, $from = EMAIL, $content_type = 'text/html')
		{
		global $locale, $settings, $thisisdemosite;
        if($thisisdemosite) return true;
        if(!email_check($to)) return false;
        
		if(is_array($vars)){
			 if(count($vars) > 0){
    			foreach($vars as $k => $v){
    			     $text = str_replace('%'.$k.'%', $v, $text);
    				}
			 }
		}

        require_once(COREPATH.'smtp_lib/class.phpmailer.php');
        $err = false;
		$mail = new PHPMailer(true);
		$mail->IsSMTP();
		try {
		  $mail->Host       = $settings['smtp_host']; 
		  $mail->SMTPDebug  = 1; 
		  $mail->SMTPAuth   = true;
		  $mail->SMTPSecure = $settings['smtp_crypt'];
		  $mail->Port       = $settings['smtp_port']; 
		  $mail->Username   = $settings['smtp_login'];
		  $mail->Password   = $settings['smtp_password'];
		  $mail->AddAddress($to); 
		  $mail->Subject = $theme;
          $mail->MsgHTML($text, FULLPATH);
          if($content_type == 'text/html'){
            $mail->IsHTML(true);
          }else{
            $mail->IsHTML(false);
          }
          if(isset($settings['smtp_debug'])){
            $mail->SMTPDebug = 1;
          }else{
            $mail->SMTPDebug = 0;
          }
          if($settings['smtp'] == '1'){
            if($settings['smtp_from'] != $from){
                $mail->AddReplyTo($from, TITLE);
            }
            $mail->SetFrom($settings['smtp_from'], TITLE);
            
            if($settings['smtp_pop'] != ""){
                require_once(COREPATH.'smtp_lib/class.pop3.php');
                $pop = new POP3;
                $pop->Authorise($settings['smtp_pop'], 110, 30, $settings['smtp_login'], $settings['smtp_password'], $mail->SMTPDebug);
            }
            
            $mail->Send();
          }else{
            $mail->SetFrom(EMAIL, TITLE);
            $mail->AddReplyTo($from);
            
            $mail->IsMail();
            $mail->Send();
          }
		} catch (phpmailerException $e) {
		  $err = $e->errorMessage(); 
		} catch (Exception $e) {
		  $err = $e->getMessage(); 
		}
        if(isset($settings['smtp_debug']) && $err){
            echo $err;
        }
        if($err) return false;
        else return true;
 
		}



?>