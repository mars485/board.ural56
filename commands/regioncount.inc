<?php
/*
$res = dbquery("SELECT * FROM ".PREF."counter_cr 
            WHERE region != 0  AND cat=0  
            GROUP by region 
            ORDER by counter DESC 
            LIMIT 0, 10");
$top10regioncount = array();
while($dat = dbarray($res))
    {
    $top10regioncount[] = $dat;
    }
$smarty->assign('top10regioncount', $top10regioncount);   
*/
function linenav2($cat, $cats_id, $count)
	{
    global $settings;
    $array = get_array_linenav($cat, $cats_id, $first = true);
    $uri = $settings['path'];
    $name = "";
    if(count($array) > 0)
        {
        foreach($array as $k=>$v)
            {
            $uri .= $v['uri'].'/';
            $name = $v['name'];
            }
        }
    return "<a href='".$uri."'>".$name."&nbsp;<span class='badge btn-info'>".$count."</span></a>";
	}

?>