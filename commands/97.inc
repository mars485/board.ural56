<?php


$settings['mailing_limit'] = (isset($settings['mailing_limit'])) ? $settings['mailing_limit'] : 20;                      
$settings['cron_eml'] = (isset($settings['cron_eml'])) ? $settings['cron_eml'] : 1200;  
$settings['mailing'] = (isset($settings['mailing'])) ? $settings['mailing'] : 0;  
$customconfig['mailing_group'] = (isset($customconfig['mailing_group'])) ? $customconfig['mailing_group'] : true;

function quotfix($txt){
    return str_replace('&quot;', '"', $txt);
}
if($settings['mailing'] == 1){
    if(ebcron('cron_eml', $ebcron)){
        $res1 = dbquery("SELECT * FROM ".PREF."mailing_db WHERE single=0");
        while($mailing = dbarray($res1)){
    
            $checktime = $settings['time'] - 86400 * $mailing['time'];
            /*
            $sql = "SELECT 
                                    id as message_id, 
                                    title as message_title, 
                                    email as message_email, 
                                    user as message_user, 
                                    (SELECT ".PREF."users.name FROM ".PREF."users WHERE id = ".PREF."db.user_id) as user,   
                                    (SELECT ".PREF."users.email FROM ".PREF."users WHERE id = ".PREF."db.user_id) as email 
                            FROM 
                                    ".PREF."db
                            WHERE   
                                    date_add < ".($checktime)." 
                                    AND 
                                    id NOT IN (SELECT message FROM ".PREF."mailing_sended WHERE db=".$mailing['id']." )
                                    AND 
                                    status = 1
                                    ";
             */                
            $sql = "
                SELECT 
                	db.id as message_id, 
                	db.title as message_title, 
                	db.email as message_email, 
                	db.user as message_user, 
                	usr.name as user, 
                	usr.email as email
                FROM 
                	".PREF."db db
                LEFT OUTER JOIN ".PREF."users usr ON usr.id = db.user_id
                LEFT OUTER JOIN ".PREF."mailing_sended snd ON (db.id = snd.message AND snd.db=".$mailing['id'].")
                WHERE   
                	db.date_add < ".$checktime." AND 
                	db.status = 1 AND 
                	snd.id IS NULL        
                ";
                
            

            $res2 = dbquery($sql);
            $mails = array();                        
            while($dat2 = dbarray($res2)){
                
                $email = ($dat2['email'] == NULL) ? $dat2['message_email'] : $dat2['email'];
    			$m_title = stripslashes($dat2['message_title']);
    			$m_link = $settings['http'].'://'.$settings['site_address'].$settings['path'].MESSAGES.'/'.$dat2['message_id'].'-'.cpu($dat2['message_title'], $locale['symb']).'.html';
    			$m_link = '<a href="'.$m_link .'">'.$m_title.'</a>';
                if($customconfig['mailing_group']){
                    if(!isset($mails[$email]['msg'])) $mails[$email]['msg'] = $dat2;
                    $mails[$email]['links'][] = $m_link;
                    $mails[$email]['ids'][] = $dat2['message_id'];
                }else{
                    $mails[] = array('msg' => $dat2, 'links'=>array($m_link), 'ids' => array($dat2['message_id']));
                }
                
                
            }
            
            if(count($mails) > 0){
                foreach($mails as $m){
                    $dat2 = $m['msg'];
                    $links = $m['links'];
                    $email = ($dat2['email'] == NULL) ? $dat2['message_email'] : $dat2['email'];
                    $user  = ($dat2['user'] == NULL)  ? $dat2['message_user']  : $dat2['user'];
                    $array = array();
        			$array['title'] = $settings['title'];
        			$array['user'] = $user;
        			$array['message_title'] = stripslashes($dat2['message_title']);
        			$array['link'] = $links[0];
                    $links_ul = "";
                    if(count($links) > 0){
                        $links_ul = array();
                        foreach($links as $link){
                            $links_ul[] = '<li>'.$link.'</li>';
                        }
                        $links_ul = '<ul>'.implode('', $links_ul).'</ul>';
                    }
                    $array['links'] = $links_ul;
        			$array['link_unsubscribe'] = $settings['http'].'://'.$settings['site_address'].$settings['path'].'unsubscribe/?email='.base64_encode($email).'&key='.md5($email.$settings['rand']);
        			$array['unsubscribe'] = '<a href="'.$array['link_unsubscribe'].'">'.$locale[1059].'</a>';
                    sendmail_queue_add($mailing, $email, $array, $m['ids']);
                }

            }
            
        }

        $res = dbquery("SELECT * FROM ".PREF."mailing_queue ORDER BY id ASC LIMIT 0, ".$settings['mailing_limit']);
        while($dat = dbarray($res)){
            if($settings['mailing'] == 1){
                if(!strpos($dat['text'], "/unsubscribe/")){
                    $link_unsubscribe = $settings['http'].'://'.$settings['site_address'].$settings['path'].'unsubscribe/?email='.base64_encode($dat['email']).'&key='.md5($dat['email'].$settings['rand']);
                    $dat['text'] .= '
                        <hr />
                        <p><a href="'.$link_unsubscribe.'">'.$locale[1059].'</a></p>
                    ';
                }
                if(!dbarray(dbquery("SELECT * FROM ".PREF."mailing_unsubscribe WHERE email='".$dat['email']."'"))){
                    send_mail($dat['email'], quotfix($dat['title']), $dat['text'], array());
                }
                dbquery("DELETE FROM ".PREF."mailing_queue WHERE id=".$dat['id']);            
            }
        }

        dbquery("DELETE FROM ".PREF."mailing_sended WHERE message NOT IN (SELECT id FROM ".PREF."db)");

    }
}

?>