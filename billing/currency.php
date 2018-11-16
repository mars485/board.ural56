<?php
$currency_names = array();

$currency_names['rur']['name1'] = $locale[652];
$currency_names['rur']['name2'] = $locale[657];
$currency_names['usd']['name1'] = $locale[653];
$currency_names['usd']['name2'] = $locale[658];
$currency_names['eur']['name1'] = $locale[654];
$currency_names['eur']['name2'] = $locale[660];
$currency_names['uah']['name1'] = $locale[655];
$currency_names['uah']['name2'] = $locale[659];
$currency_names['byr']['name1'] = $locale[1044];
$currency_names['byr']['name2'] = $locale[1045];

$smarty->assign('currency_names', $currency_names);

?>