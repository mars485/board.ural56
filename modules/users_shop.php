<?php
    
    $image_size = array(
        'width' => $settings['shop_img_w'],
        'height' => $settings['shop_img_h']
    );
    $image_folder = $settings['shop_img_folder'];


	$act = isset($_GET['act']) ? $_GET['act'] : '';

    //upd170216
    $shop = dbarray(dbquery("SELECT *, UNIX_TIMESTAMP(next_pay) as next_pay_timestamp FROM ".PREF."users_shop WHERE user_id=".$settings['user']['id']));
    if($shop){
        $shop['next_pay_diff'] = 0;
        if(!empty($shop['next_pay_timestamp'])){
            if($shop['next_pay_timestamp'] > 0){
                $shop['next_pay_diff'] = ceil(($shop['next_pay_timestamp'] - $settings['time']) / 86400);
            }
        }
        $shop['payed'] = ($shop['next_pay_diff'] > 0) ? true : false; 
    }

    $Currency = $currency_names[$settings['currency']]['name2'];
    $smarty->assign('Currency', $Currency);

    $reload = false;
    if($shop){
        if(file_exists(FULLPATH.'uploads/images/'.$image_folder.'/logo_'.$shop['id'].'.png')){
            $logo = $settings['path'].'uploads/images/'.$image_folder.'/logo_'.$shop['id'].'.png';
        }else{
            $logo = $settings['path'].'images/no_photo.jpg';
        }
        $shop['logo'] = $logo;
        if($shop['map'] != ""){
            $shop['point'] = explode(',', $shop['map']);
        }else{
            $shop['point'] = $settings['shop_point'];
        }
    }
    
    $err = array();

    if(!$shop){
        
        if(isset($_POST['name'])){
            shop_get_err($err, 'name', $locale[1145]);
            shop_get_err($err, 'description', $locale[358]);
                        
            if(count($err) == 0){
                dbquery("INSERT INTO ".PREF."users_shop SET 
                            user_id=".$settings['user']['id'].",
                            name='".addslashes($_POST['name'])."',
                            description='".addslashes($_POST['description'])."',
                            status='".$settings['shop_status']."'
                ");
                //$shop = dbarray(dbquery("SELECT * FROM ".PREF."users_shop WHERE user_id=".$settings['user']['id']));
                echo '
                    <div class="ok">'.$locale[322].'</div>
                    <script>
                        document.location.href="?act=create";
                    </script>
                ';
            }
        }            

    }elseif($act == ""){
        if($settings['fckeditor'] != 1){
            ImgSave::brtonl($shop['description']);
        }
        
        if(isset($_POST['name'])){
            

            shop_get_err($err, 'name', $locale[1145]);
            shop_get_err($err, 'description', $locale[358]);

            if(count($err) == 0){
                $img = new ImgSave;
                $img->image_folder = $image_folder;
                $img->shop = $shop;
                $img->image_size = $image_size;
                $img->convert(); 
    
                $c = $__POST['description'];
    		    if($settings['fckeditor'] != 1){
    		          $c = save_text($c);
                    ImgSave::nltobr($c);
    		    }else{
    		      $c = save_html($c);
    		    }
                //upd1701192
                dbquery("UPDATE ".PREF."users_shop SET 
                            name='".$_POST['name']."',
                            description='".$c."',
                            region='".intval($_POST['add_region'])."',
                            cat='".intval($_POST['add_cat'])."',
                            status='".$settings['shop_status']."'
                            WHERE id=".$shop['id']."
                            "
                        );
                        
                $reload = true;
            }

        }
        
        
    }elseif($act == "contacts"){

        
        if(isset($_POST['addr'])){
            
            shop_get_err($err, 'addr', $locale[458]);
            shop_get_err($err, 'phone1', $locale[1109], false);
            shop_get_err($err, 'site', $locale[410], false);
            
            $site_error = false;
            $save_site = '';
            if($_POST['site'] != ""){
                $site_error = true;
                $site = $_POST['site'];
                $site = @parse_url($site);
                if(isset($site['host'])){
                    if(strpos($site['host'], '.') !== false){
                        $site_error = false;
                        if(!isset($site['scheme'])){
                            $site['scheme'] = 'http';
                        }
                        $save_site = $site['scheme'].'://'.$site['host'];
                        if($site['path'] != ""){
                            $save_site .= $site['path'];
                        }
                        if($site['query'] != ""){
                            $save_site .= '?'.$site['query'];
                        }
                        $save_site = addslashes($save_site);
                    }
                } 
            }
            if($site_error) $err[] = $locale[87].' &laquo;'.$locale[410].'&raquo;';
            
            if($_POST['phone2'] != ""){
                shop_get_err($err, 'phone2', $locale[1110], false);
            }

            if(count($err) == 0){
                dbquery("UPDATE ".PREF."users_shop SET 
                            addr='".$_POST['addr']."',
                            phone1='".$_POST['phone1']."',
                            phone2='".$_POST['phone2']."',
                            site='".$save_site."',
                            map='".$_POST['map']."',
                            status='".$settings['shop_status']."'
                            WHERE id=".$shop['id']."
                            "
                        );
                $reload = true;
            }

        }
    }elseif($act == "delivery"){
        if($settings['fckeditor'] != 1){
                ImgSave::brtonl($shop['delivery']);
                ImgSave::brtonl($shop['payment']);  
        }
        
        if(isset($_POST['delivery'])){
		    if($settings['fckeditor'] != 1){
                $__POST['delivery'] = save_text($__POST['delivery']);
                $__POST['payment'] = save_text($__POST['payment']);
                ImgSave::nltobr($__POST['delivery']);
                ImgSave::nltobr($__POST['payment']);
		    }else{
                $__POST['delivery'] = save_html($__POST['delivery']);
                $__POST['payment'] = save_html($__POST['payment']);
		    }

            shop_get_err($err, 'delivery', $locale[1107], false);
            shop_get_err($err, 'payment', $locale[1108], false);
            
            if(count($err) == 0){
                dbquery("UPDATE ".PREF."users_shop SET 
                            delivery='".$__POST['delivery']."',
                            payment='".$__POST['payment']."',
                            status='".$settings['shop_status']."'
                            WHERE id=".$shop['id']."
                            "
                        );
                $reload = true;
            }
        }
        
        
    }elseif($act == "worktime"){

        function check_time($time, $time_prev = false){
            $time = trim($time);
            if($time == "") return false;
            $tmp = str_replace(':', '', $time);
            if(is_numeric($tmp)){
                $tmp = explode(':', $time);
                if(count($tmp) == 2){
                    list($h, $m) = $tmp;
                    $h = intval($h);
                    $m = intval($m);
                    if($h < 24 && $m < 60){
                        if($time_prev){
                            list($h_prev, $m_prev) = explode(':', $time_prev);
                            $date_start = mktime($h_prev, $m_prev);
                            $date_end = mktime($h, $m);
                            if($date_end > $date_start) return true;
                        }else{
                            return true;
                        }
                    }
                }
            }
            return false;
        }

        if(isset($_POST['wt'])){
            if(is_array($_POST['wt'])){
                
                $wt = array();
                if(count($_POST['wt'] > 0)){
                    foreach($_POST['wt'] as $k=>$v){
                        if(is_numeric($k)){
                            
                            if($k > 0 && $k < 8){
                                if(isset($v['from'])){
                                    if(check_time($v['from'])){
                                        if(isset($v['to'])){
                                            if(check_time($v['to'], $v['from'])){
                                                $disable_pause = true;
                                                if(isset($v['p_from'])){
                                                    if(check_time($v['p_from'])){
                                                        if(isset($v['p_to'])){
                                                            if(check_time($v['p_to'], $v['p_from'])){
                                                                $disable_pause = false;
                                                            }
                                                        }
                                                    }
                                                }
                                                if($disable_pause){
                                                    unset($v['p_to']);
                                                    unset($v['p_from']);
                                                }
                                                $wt[$k] = $v;
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
                dbquery("UPDATE ".PREF."users_shop SET 
                            worktime='".addslashes(serialize($wt))."'
                            WHERE id=".$shop['id']."
                            "
                        );

            }
            
          /*

            */
        }
        
        $dat = dbarray(dbquery("SELECT worktime FROM ".PREF."users_shop WHERE id=".$shop['id']));
        $worktime = ($dat['worktime'] == "") ? array() : @unserialize(stripslashes($dat['worktime']));
        $shop['worktime_array'] = $worktime;
        
        $weeks = array('', $locale[1233], $locale[1234], $locale[1235], $locale[1236], $locale[1237], $locale[1238], $locale[1239]);
        unset($weeks[0]);
        $smarty->assign('weeks', $weeks);
        
        
    }    
    //upd170216
    elseif($act == 'prolong' && isset($_GET['id'])){
        if(isset($settings['shop_pay_types'][$_GET['id']])){
            
            $pay_type = $settings['shop_pay_types'][$_GET['id']];
            $price = $pay_type['price'];
            $smarty->assign('pay_type', $pay_type);

            if($price > $settings['user']['balance']){
                $price = $price - $settings['user']['balance'];
                $payment_id = make_payment($price, $settings['user']['id'], $_GET['id'], 's');
                $smarty->assign('go', true);
                $smarty->assign('payment_id', $payment_id);
                $smarty->assign('Count', $price);
            }else{
               
                $shop_date = dbarray(dbquery("SELECT UNIX_TIMESTAMP(next_pay) as date FROM ".PREF."users_shop WHERE  user_id = ".$settings['user']['id']));
                if($shop_date['date'] < $settings['time']){
                    $upd_sql = "NOW()";
                }else{
                    $upd_sql = "next_pay";
                }
                $settings['shop_pay_types'][$price_type]['time'] = $settings['shop_pay_types'][$price_type]['time'] + 43200;
                $sql = "UPDATE ".PREF."users_shop SET next_pay=DATE_ADD(".$upd_sql.", INTERVAL ".$pay_type['time']." SECOND) WHERE user_id = ".$settings['user']['id'];
                dbquery($sql);
                update_balance($settings['user']['id'], 'o', $price, $locale[1173]);
                $settings['user']['balance'] =  $settings['user']['balance'] - $price;
                $smarty->assign('settings', $settings);
                
            }
            

            
            
            
        }

        

    }
    
    if(isset($_GET['p']) && isset($_GET['id'])){
            echo '
                <script>
                    document.location.href="'.$settings['path'].$_GET['cat'][0].'/pay/?p='.$_GET['p'].'&id='.$_GET['id'].'";
                </script>
            ';
    }
    
    if(count($err) == 0) $err = false;
    $submit_text = ($settings['shop_status'] == 1) ? $locale[55] : $locale[1157];
        
    $smarty->assign('image_size', $image_size);
    $smarty->assign('err', $err);
    $smarty->assign('shop', $shop);
    $smarty->assign('act', $act);
    $smarty->assign('submit_text', $submit_text);
    
    if($settings['shop'] == 1){
        if(!$reload){
            $panel_right = $smarty->fetch('users_shop.html');
        }else{
            $panel_right = '
                <div class="ok">'.$locale[322].'</div>
                <script>
                    document.location.href="'.$_SERVER['REQUEST_URI'].'";
                </script>
            ';
        }
    }

   
   
    class ImgSave{
        public $info, $image_size, $save_wight, $save_height, $image_folder, $shop;
        public function __construct(){
            $this->info = false;
        }
        public function convert(){
            if(isset($_FILES['img']['tmp_name'])){
                $type = get_ext($_FILES['img']['name']);
                if(file_exists($_FILES['img']['tmp_name'])
                        && in_array($type, array('png', 'jpg', 'jpeg', 'gif'))){
                    $this->info = @getimagesize($_FILES['img']['tmp_name']);
                    if($this->info){
                        if($this->info[0] <= $this->image_size['width'] && $this->info[1] <= $this->image_size['height'] && $type == 'png'){
                            if(move_uploaded_file($_FILES['img']['tmp_name'], FULLPATH.'uploads/images/'.$this->image_folder.'/logo_'.$this->shop['id'].'.png')){
                                return true;
                            }
                        }else{
                            $this->calc_size();
                        	if ($type == 'jpg' || $type == 'jpeg'){
                        		$big_photo = imagecreatefromjpeg($_FILES['img']['tmp_name']);
                        	}elseif ($type == 'gif'){
                        		$big_photo = imagecreatefromgif($_FILES['img']['tmp_name']);
                        	}elseif ($type == 'png'){
                        		$big_photo = imagecreatefrompng($_FILES['img']['tmp_name']);
                        	}
                        	$small_photo = imagecreatetruecolor ($this->save_wight, $this->save_height);
                        	imagecopyresampled($small_photo, $big_photo, 0,0,0,0, $this->save_wight, $this->save_height, $this->info[0], $this->info[1]);
                            if(!file_exists(FULLPATH.'uploads/images/'.$this->image_folder)){
                        	   mkdir(FULLPATH.'uploads/images/'.$this->image_folder);
                        	}
                            if(imagepng($small_photo, FULLPATH.'uploads/images/'.$this->image_folder.'/logo_'.$this->shop['id'].'.png')){
                                return true;
                            }
                            
                        }
                    }                
                }
            }
            return false;
        }
        public function calc_size(){
                $w = $this->image_size['width'];
                $h = $this->image_size['height'];
                $photo_width = $this->info[0];
                $photo_height = $this->info[1];
            	if($w >= $h){
            		if($w > $photo_width){
            			$mn = $photo_width / $w;
            			$w1 = round($w * $mn);
            			$h1 = round($h * $mn);
            		}else{
            			$w1 = $w;
            			$h1 = $h;
            		}
            	}else{
            		if($h > $photo_height){
            			$mn = $photo_height / $h;
            			$w1 = round($w * $mn);
            			$h1 = round($h * $mn);
            		}else{
            			$w1 = $w;
            			$h1 = $h;
            		}
            	}

            	$kw = $photo_width / $w1;
            	$kh = $photo_height / $h1;
            	if ($kh != 0 && $kw != 0){
            		if ($kw > $kh){
            			$photo_width = $photo_width / $kw;
            			$photo_height = $photo_height / $kw;
            		}else{
            			$photo_width = $photo_width / $kh;
            			$photo_height = $photo_height / $kh;
            		}
            	}
                $this->save_wight = $photo_width;
                $this->save_height = $photo_height;
            }
            static function nltobr(&$text){
                $text = trim($text);
                $text = wordwrap_utf8($text, 30);
                $text = str_replace("\r", "", $text);
                $text = str_replace("\n", "<br />", $text);
            }
            static function brtonl(&$text){
                $text = str_replace("<br />", "\n", $text);
            }
        
        }
 
        function shop_get_err(&$err, $field, $name, $must = true){
            
            global $settings, $locale;
            $t = $_POST[$field];
            $t = strip_tags($t);
            //upd170216
            $t = htmlspecialchars_decode($t, ENT_QUOTES);
            $t = trim($t);
            $strlen = mb_strlen($t, 'UTF-8');
            if($strlen == 0){
                if($must) $err[] = $locale[86].' &laquo;'.$name.'&raquo;';
            }else{
                if(isset($settings['shop_min_'.$field])){
                    if($strlen < $settings['shop_min_'.$field]){
                        $err[] = $locale[1152].' &laquo;'.$name.'&raquo; ('.$locale[1156].' &mdash; '.$strlen.' '.$locale[1154] .' '.$settings['shop_min_'.$field].')';
                    }
                }
                if(isset($settings['shop_max_'.$field])){
                    if($strlen > $settings['shop_max_'.$field] && $settings['shop_max_'.$field] != 0){
                        $err[] = $locale[1153].' &laquo;'.$name.'&raquo; ('.$locale[1156].' &mdash; '.$strlen.' '.$locale[1155] .' '.$settings['shop_max_'.$field].')';
                    }
                }
            }

        }


?>