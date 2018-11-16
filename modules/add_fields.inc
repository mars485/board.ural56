<?php
if(!$exe)
	{
	$fields_cat = 0;
    $form_id = $_GET['form_id'];
    if(is_numeric($_GET['c']))
	    {
        $fields_cat = $_GET['c'];
	    }
	unset($fields);
    
	include(COREPATH.'fields.php');

    if(is_numeric($form_id))
        {
        $res = dbquery("SELECT * FROM ".PREF."db WHERE id=".$form_id);
        $dat = dbarray($res);
        
        if($dat){
            $res1 = dbquery("SELECT * FROM ".PREF."db_fields WHERE message=".$dat['id']);
            while($dat1 = dbarray($res1)){
                if($fields['f_'.$dat1['field']]['type'] == 'c'){
                    $dat['f_'.$dat1['field']][$dat1['id']] = $dat1['value'];
                }else{
                    $dat['f_'.$dat1['field']] = $dat1['value'];
                }
            }
                        
        }
        }
    
    if(count($fields) > 0)
        {
        foreach($fields as $k => $v)
            {
            $fields[$k]['file'] = false;
            if($v['type'] == 'i' || $v['type'] == 'f')
                {
                    
                if(is_numeric($form_id))
                    {
                    $value = $dat['f_'.$v['id']];
                    if($value != "")
                        {
                        $fl2 = $settings['path'].'gettmpfile/?file='.$value;
                        if($settings['uploadtype'] == 1){
                            $fl2 = base64_encode($fl2);
                        }
                        
                        $fl3 = $value;   

                        $ext = get_ext($value); 

                        if($v['type'] == 'i')
                            {
                            $fields[$k]['file'] = $fl2;
                            }
                        else
                            {
                            $fields[$k]['file'] = $settings['path'].'images/ico/'.get_ico($ext);
                            }                      
                        }else{
                            
                            
                            if(count($v['values_array']) > 0)
                                {
                                foreach($v['values_array'] as $vvv)
                                    {
                                    $fl1 = FULLPATH.'uploads/temp/'.$form_id.'-'.$v['id'].'.'.$vvv;
                                    $fl2 = $settings['path'].'gettmpfile/?file='.$form_id.'-'.$v['id'].'.'.$vvv;
                                    $fl3 = $form_id.'-'.$v['id'].'.'.$vvv;
                                    
                                    if($settings['uploadtype'] == 1){
                                        $fl2 = base64_encode($fl2);
                                        $fl3 = base64_encode($fl3);
                                    }
                                    
                                    if(file_exists($fl1))
                                        {  
                                        $fields[$k]['file1'] = $fl3;
                                        if($v['type'] == 'i')
                                            {
                                            $fields[$k]['file'] = $fl2;
                                            }
                                        else
                                            {
                                            $fields[$k]['file'] = $settings['path'].'images/ico/'.get_ico($vvv);
                                            }
                                        break;
                                        }
                                    }
                                }                            
                            
                            
                            
                            
                            
                        }
                    }
                else
                    {    
                        
                    if(count($v['values_array']) > 0)
                        {
                        foreach($v['values_array'] as $vvv)
                            {
                            $fl1 = FULLPATH.'uploads/temp/'.$form_id.'-'.$v['id'].'.'.$vvv;
                            $fl2 = $settings['path'].'gettmpfile/?file='.$form_id.'-'.$v['id'].'.'.$vvv;
                            $fl3 = $form_id.'-'.$v['id'].'.'.$vvv;
                            
                            if($settings['uploadtype'] == 1){
                                $fl2 = base64_encode($fl2);
                                $fl3 = base64_encode($fl3);
                            }
                            
                            if(file_exists($fl1))
                                {  
                                $fields[$k]['file1'] = $fl3;
                                if($v['type'] == 'i')
                                    {
                                    $fields[$k]['file'] = $fl2;
                                    }
                                else
                                    {
                                    $fields[$k]['file'] = $settings['path'].'images/ico/'.get_ico($vvv);
                                    }
                                break;
                                }
                            }
                        }
                    }
                }
            }
        }

	$smarty->assign('fields', $fields);
	$smarty->display('fields.html');
	}
    
exit();
?>