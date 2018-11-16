<?php

    if($_GET['cat'][1] == 'autocomplete'){
    	$q = urldecode($_GET['query']);
        $q = trim($q);
        $q = mb_strtolower($q, 'UTF-8');
        if(mb_strlen($q, 'UTF-8') > 0){
            header('Content-type: application/json');
            $search = array();
            $res = array();
            if(count($regions_id_) > 0){
                foreach($regions_id_ as $k=>$v){
                    $check = mb_strtolower($v['name'], 'UTF-8');
                    $check = trim($check);
                    if(strpos($check, $q) !== FALSE){
                        $res[] = array(
                                'value' => $v['name'],
                                'data' => $v['id']
                        );
                    }
                }
            }
            $res = array('suggestions' => $res);
            echo json_encode($res);
        }

    }elseif( $_GET['cat'][1] == 'list' && isset($_GET['cat'][2]) && isset($_GET['id'])){
        header('Content-type: application/json');
        $res = array();
        if($_GET['cat'][2] == 'region'){
            $c = $regions_id_;
        }else{
            $c = $cats_id;
        }
        if(count($c) > 0){
            foreach($c as $k=>$v){
                if($v['parent'] == $_GET['id']){
                    $res[] = $v;
                }
            }
        }
        echo json_encode($res);
        
    }elseif( $_GET['cat'][1] == 'redirect'){
        if(isset($_GET['region'])){
            $par = get_parents(intval($_GET['region']), $regions_id_);
            if(count($par) > 0){
	            $par = array_reverse($par);
            }
            $par[] = intval($_GET['region']);
            
            $uri = PATH;
            foreach($par as $v){
                $uri .= $regions_id_[$v]['uri'].'/';
            }
            header('Location: '.$uri);
        }
        
    }elseif($_GET['cat'][1] == 'phone' && isset($_GET['data'])){
        header('Content-type: application/json');
        $data = substr($_GET['data'], 2);
        $data = explode('_', $data);
        $res = array();
        if(is_numeric($data[0]) && is_numeric($data[1])){
            $field = dbarray(dbquery("SELECT * FROM ".PREF."fields WHERE id='".$data[0]."'"));
            if($field){
                if($field['hide'] == 0 || ($field['hide'] == 1 && $settings['user'])){
                    $dat = dbarray(dbquery("SELECT value FROM ".PREF."db_fields WHERE field='".$data[0]."' AND message='".$data[1]."'"));
                    if($dat){
                        $field['phone'] = $dat['value'];
                    }else{
                        $field['phone'] = '';
                    }
                    $field['hide'] = 0;
                }else{
                    $field['hide'] = 1;
                }
            }
        }elseif($data[0] == 'er' && is_numeric($data[1])){
            $dat = dbarray(dbquery("SELECT phone FROM ".PREF."users WHERE id='".$data[1]."'"));
            if($dat){
                $field['phone'] = '+'.$dat['phone'];
            }else{
                $field['phone'] = '';
            }
        }
        echo json_encode($field);
    }elseif( $_GET['cat'][1] == 'msg'){
        if(is_numeric($_GET['id'])){
            $type = isset($_GET['type']) ? intval($_GET['type']) : 0;
            if($type == 2){
                $message = dbarray(dbquery("SELECT * FROM ".PREF."users_shop WHERE id=".$_GET['id']." AND status=1"));
                $img = 'uploads/images/'.$settings['shop_img_folder'].'/logo_'.$_GET['id'].'.png';
                if(file_exists(FULLPATH.$img)){
                    $img = '<img style="float: left; margin:3px; max-width:100px" src="'.PATH.$img.'" />';
                }else{
                    $img = '';
                }
                
                $link = $settings['path'].'shops/'.$message['id'].'-'.cpu($message['name']).'/';
                $body = '
                <h2><a href="'.$link.'">'.$message['name'].'</a></h2>
                <div class="text-left">
                '.$img.$message['description'].'
                </div>
                ';
                $message['title'] = $message['name'];
                $message['text'] = $message['description'];
                $message['link'] = $link;
            }else{
                $dop_sql = "WHERE status=1 AND id=".$_GET['id'];
                include(COREPATH."messages.php");
                $message = $messages[0];
                $img = '';
                if(isset($message['fields']['i'][0])){
                    $img = '<img style="float: left; margin:3px; max-width:100px" src="'.$settings['path'].'uploads/images/ts/'.$message['fields']['i'][0]['value'].'" />';
                }
                $body = '
                <h2><a href="'.$settings['path'].MESSAGES.'/'.$message['link'].'">'.$message['title'].'</a></h2>
                <div class="text-left">
                '.$img.$message['text'].'
                </div>
                ';
            }

            $array = array('id'=>$message['id'],
                    'title'=>$message['title'],
                    'text'=>$message['text'],
                    'link'=>$message['link'],
                    'body'=>$body);
                    
            if(isset($_GET['point_id'])) $array['point_id'] = intval($_GET['point_id']);
            
            $json = json_encode($array);
            header('Content-type: application/json');
            echo $json;
            exit();
        }
        
    }

    exit();
?>