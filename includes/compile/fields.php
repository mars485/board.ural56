<?php

/*
	Скрипт доски объявлений
	Elite-Board 2
	Тихомиров Юрий
	Санкт-Петербург
	2009 - 2010

	версия модуля: 260110
*/

if(!isset($fields))
	{

    $dop_sql_fields = "";
    if(!isset($fields_cat)){$fields_cat = '';}
    if(is_numeric($fields_cat) && $fields_cat != 0)
	    {
	    $childres = array();
	    $childres = get_parents($fields_cat, $cats_id);
	    $childres[] = $fields_cat;
	    $childres[] = '0';

        $dop_sql_fields = 'WHERE ('.make_sql('cat', $childres).')';
	    }
    elseif(is_numeric($fields_cat) && $fields_cat == 0)
	    {
        $dop_sql_fields = 'WHERE cat=0';
	    }

    $rates = array();
    $rates_dafault = 0;
    $res = dbquery("SELECT * FROM ".PREF."rates");
    while($dat = dbarray($res))
        {
        $dat['text'] = explode(',', $dat['text']);
        $rates[$dat['id']] = $dat;
        if($dat['def'] == 1){$rates_default = $dat;}
        }

	$fields = array();
	$res = dbquery("SELECT * FROM ".PREF."fields ".$dop_sql_fields." ORDER by sort");
	while($data= dbarray($res))
		{
		$fields['f_'.$data['id']] = $data;
        if($data['type'] == 'i')
            {
            $fields['f_'.$data['id']]['values_array'] = array('jpg','jpeg','png','gif');
            }
        else
            {
    		$fields['f_'.$data['id']]['values_array'] = explode_string($data['values']);
    		}
        if($data['type'] == 'p')
            {
            $fields['f_'.$data['id']]['rates'] = $rates;
            }
        
        }
	}

?>