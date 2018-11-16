<?php
if(!$exe){
	$settings['title'] = $locale[1047];
	$title_normal[1] = array('link' => $settings['patch'].$cat.'/', 'name' => $settings['title']);
	}else{
        $err = false;
        $email = false;
        $form = false;
        $sended = false;
        if(isset($_POST['email'])){
            if(!email_check($_POST['email'])){
                $err['err'] = $locale[37];
            }else{
                $email = $_POST['email'];
            }
        }elseif(isset($_GET['email'])){
            $_GET['email'] = base64_decode($_GET['email']);
            if(!email_check($_GET['email'])){
                $err['err'] = $locale[37];
            }else{
                $email = $_GET['email'];
            }
        }  
        
        if($email && isset($_POST['submit'])){
          $dat = dbarray(dbquery("SELECT * FROM ".PREF."users WHERE email='".$email."'"));
          if(!$dat){
            $err[] = $locale[1048];
            $form = true;
          }else{
            if($dat['email_status'] == 1){
                $err[] = $locale[1049];
            }else{
                if($settings['captcha'] == 1 && !captcha($settings, 'check')){
                    $err[] = $locale[46];
                }else{
                    //upd1701270
        		    $link = $settings['http']."://".$settings['site_address'].$settings['path']."users/email_confirmation/?user_id=".$dat['id']."&key=".md5($dat['id'].$dat['pass'].$settings['rand']);
                    $vars['title'] = TITLE;
                    $vars['user'] = $dat['name'];
                    $vars['link'] = "<a href='".$link."'>".$link."</a>";
                    if(send_mail($dat['email'], TITLE.' / '.$locale[131], $board_msg['reg_check'], $vars)){
        			    $sended = true;
                    }else{
                        $err[] = $locale[40];
                        $form = true;
        			}
                }
            }

          }
        }
        
      $smarty->assign('email', $email);
      $smarty->assign('sended', $sended);
      $smarty->assign('err', $err);
      $smarty->display('email_confirmation.html');
      
      
      
      
      
	}
?>