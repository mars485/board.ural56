<?php

$file = file('../files/db.dat');

$images = get_file_list('../images/thumb_small/');
$images_array = array();

dbquery("TRUNCATE TABLE `".PREF."db`");

if(count($images) == 0 || !is_array($images))
	{
    $images = get_file_list('../uploads/images/ts/');
	}

if(count($images) > 0)
	{

	foreach($images as $v)
		{
		$code = substr($v, 0, 7);
        if(is_numeric($code))
	        {
		    $images_array[$code] = $v;
			}
		}

	}

$images_fiels = array();
$images_fiels[0] = 'f_6';
$images_fiels[1] = 'f_7';
$images_fiels[2] = 'f_8';
$images_fiels[3] = 'f_18';

foreach($file as $str)
	{ 	list($code, $kat, $skat, $sskat, $region_, $deltime, $dat, $autor, $adress, $tel, $faks, $site, $email, $status, $tema, $usertext, $lock) = explode ('<>', w2u(trim($str)));

    $cat = $cats[$kat.'|'.$skat.'|'.$sskat];
    $region = $regions[$region_];



	list($d, $m, $y) = explode('.', $dat);

	$date = @mktime(0,0,0,$m,$d,'20'.$y);

	if(isset($users[$autor]['id']))
		{	    $is_reg_user = true;		}
	else
		{	    $is_reg_user = false;		}

	if($cat != "" && $region != "")
		{

		$sql = "INSERT INTO ".PREF."db  SET
		        cat = '".$cat."',
		        region = '".$region."',
	            date_add = '".$date."',
	            date_del = '".$deltime."',
	            ";
	    if($is_reg_user)
		    {	 	    $sql .= "user_id = '".$users[$autor]['id']."',";		    }
		else
			{		    $sql .= "user = '".addslashes($autor)."',
		    	email = '".addslashes($email)."',";			}

		if($lock != "")
			{		    $sql .= "raised = 1,";			}

		if($conf['convert_images'])
			{
	        for($i = 0; $i<4; $i++)
				{
			    if(isset($images_array[$code.$i]))
				    {
				    if($conf['copy_images'])
					    {
						    if(
						    	@copy('../images/thumb_small/'.$images_array[$code.$i], '../uploads/images/ts/'.$images_array[$code.$i])
						    	AND
						    	@copy('../images/thumb_big/'.$images_array[$code.$i], '../uploads/images/tb/'.$images_array[$code.$i])

						    	)
							{
							@chmod('../uploads/images/ts/'.$images_array[$code.$i], 0777);
							@chmod('../uploads/images/tb/'.$images_array[$code.$i], 0777);
		                    $sql .= $images_fiels[$i]." = '".$images_array[$code.$i]."', ";							}	                    }
	   				else
		   				{	   				    $sql .= $images_fiels[$i]." = '".$images_array[$code.$i]."', ";		   				}				    }
				}
	        }
	    $sql .= "
	            status = 1,
	            title = '".addslashes($tema)."',
	            text = '".addslashes($usertext)."',
	            f_3 = '".$adress."',
	            f_15 = '".$faks."',
	            f_16 = '".$site."',
	            f_14 = '".$tel."'
				";
		dbquery($sql);
	    }

	}

?>