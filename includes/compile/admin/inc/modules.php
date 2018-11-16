<?php

$modules_classes = array();
$modules_classes['ind'] = 'fa-exclamation-circle';
$modules_classes['cat'] = 'fa-sitemap';
$modules_classes['region'] = 'fa-globe';
$modules_classes['fields'] = 'fa-table';
$modules_classes['rates'] = 'fa-money';
$modules_classes['edit'] = 'fa-folder-open';
$modules_classes['users'] = 'fa-user-plus';
$modules_classes['blacklist'] = 'fa-ban';
$modules_classes['orders'] = 'fa-rocket';
$modules_classes['services'] = 'fa-star-half-o';
$modules_classes['nav'] = 'fa-bars';
$modules_classes['timing'] = 'fa-calendar';
$modules_classes['templates'] = 'fa-pencil-square-o';
$modules_classes['tags'] = 'fa-tags';
$modules_classes['stat'] = 'fa-bar-chart';
$modules_classes['blocks'] = 'fa-object-ungroup';
$modules_classes['mods'] = 'fa-file-code-o';
$modules_classes['bil'] = 'fa-cc-visa';
$modules_classes['bk'] = 'fa-database';

$modules_classes['conf'] = 'fa-cog';
$modules_classes['messages'] = 'fa-exclamation-circle';
$modules_classes['import'] = 'fa-cloud-download';
$modules_classes['sms'] = 'fa-mobile';
$modules_classes['seo'] = 'fa-google';
$modules_classes['articles'] = 'fa-newspaper-o';
$modules_classes['mailling'] = 'fa-envelope';
$modules_classes['packages'] = 'fa-clone';

$smarty->assign('modules_classes', $modules_classes);

$modules = array();

$modules[] = array('name' => $locale[307], 'id' => 'ind', 'file' => COREPATH.'admin/inc/ind.php');
$modules[] = array('name' => $locale[302], 'id' => 'cat', 'file' => COREPATH.'admin/inc/cat.php');
$modules[] = array('name' => $locale[327], 'id' => 'region', 'file' => COREPATH.'admin/inc/region.php');
$modules[] = array('name' => $locale[381], 'id' => 'fields', 'file' => COREPATH.'admin/inc/fields.php');
$modules[] = array('name' => $locale[879], 'id' => 'rates', 'file' => COREPATH.'admin/inc/rates.php');
$modules[] = array('name' => $locale[303], 'id' => 'edit', 'file' => COREPATH.'admin/inc/edit.php');
$modules[] = array('name' => $locale[304], 'id' => 'users', 'file' => COREPATH.'admin/inc/users.php');
$modules[] = array('name' => $locale[908], 'id' => 'blacklist', 'file' => COREPATH.'admin/inc/blacklist.php');
//$modules[] = array('name' => $locale[783], 'id' => 'users_group', 'file' => COREPATH.'admin/inc/users_group.php');
$modules[] = array('name' => $locale[360], 'id' => 'orders', 'file' => COREPATH.'admin/inc/orders.php');
$modules[] = array('name' => $locale[356], 'id' => 'services', 'file' => COREPATH.'admin/inc/services.php');
$modules[] = array('name' => $locale[456], 'id' => 'nav', 'file' => COREPATH.'admin/inc/nav.php');
$modules[] = array('name' => $locale[471], 'id' => 'timing', 'file' => COREPATH.'admin/inc/timing.php');
$modules[] = array('name' => $locale[487], 'id' => 'templates', 'file' => COREPATH.'admin/inc/templates.php');
$modules[] = array('name' => $locale[139], 'id' => 'tags', 'file' => COREPATH.'admin/inc/tags.php');
$modules[] = array('name' => $locale[596], 'id' => 'stat', 'file' => COREPATH.'admin/inc/stat.php');

$modules[] = array('name' => $locale[414], 'id' => 'blocks', 'file' => COREPATH.'admin/inc/blocks.php');
$modules[] = array('name' => $locale[305], 'id' => 'mods', 'file' => COREPATH.'admin/inc/mods.php');
$modules[] = array('name' => $locale[640], 'id' => 'bil', 'file' => COREPATH.'admin/inc/bil.php');
$modules[] = array('name' => $locale[615], 'id' => 'bk', 'file' => COREPATH.'admin/inc/bk.php');


$reserved_id = array();
$fp = opendir(FULLPATCH.'modules/');
$modules2 = array();
while(($file = readdir($fp)) !== false)
	{
	if(substr($file, -10) == '_admin.inc')
		{

		$fileid = str_replace('_admin.inc', '', $file);

		$filetext = file(FULLPATCH.'modules/'.$file);
		$filetext = $filetext[0];
		$filetext = explode('//', $filetext);
        if(!isset($filetext[1])) $filetext[1] = "";
		$filetext = trim($filetext[1]);
		if(is_numeric($filetext))
			{
		    $filetext = $locale[$filetext];
			}
		$modules[] = array('name' => $filetext, 'id' => $fileid, 'file' => FULLPATCH.'modules/'.$file);
		$modules2[] = array('name' => $filetext, 'id' => $fileid, 'file' => FULLPATCH.'modules/'.$file);
		}
	if(substr($file, -4) == '.inc')
		{
	    $reserved_id[] = substr($file, 0, -4);
		}
	}

$reserved_id[] = 'ind';
$reserved_id[] = 'cat';
$reserved_id[] = 'modules';

$res = dbquery("SELECT cat FROM ".PREF."modules");
while($dat = dbarray($res))
	{
	$reserved_id[] = $dat['cat'];
	}

$modules[] = array('name' => $locale[306], 'id' => 'conf', 'file' => COREPATH.'admin/inc/conf.php');

?>