<?php
unset($fields);
$fields_cat = $_GET['cat_id'];
if($fields_cat == ""){$fields_cat = 0;}
include(COREPATH."fields.php");
foreach($fields as $k=>$v)
    {
    if($v['block'] == 0)
        {
        unset($fields[$k]);
        }
    }
$smarty->assign('fields', $fields);   
$smarty->display('search_fields.html');
exit();

?>