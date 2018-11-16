<?php
$smarty->register_modifier("sslash","stripslashes");
$smarty->register_modifier("cpu","cpu");
$smarty->register_modifier("userdate","dateFormat");

function droblenie($str)
	{
    $str = (float) $str;
	return number_format($str, 2, ',', ' ');
	}

$smarty->register_modifier("linenav","linenav");
$smarty->register_modifier("count_msg","count_msg");
$smarty->assign('categories', $cats_id);
$smarty->assign('allregions', $regions_id_);

function truncate_html($string, $length, $dop)
	{
	$string = str_replace("&nbsp;", " ", $string);
	$string = iconv('UTF-8', 'CP1251', $string);
	$dop = iconv('UTF-8', 'CP1251', $dop);
	$string = wordwrap($string, 30, " ", 1);
	if( !empty( $string ) && $length>0 )
		{
		$isText = true;
		$ret = "";
		$i = 0;
		$currentChar = "";
		$lastSpacePosition = -1;
		$lastChar = "";
		$tagsArray = array();
		$currentTag = "";
		$tagLevel = 0;
		$noTagLength = strlen( strip_tags( $string ) );
		// Parser loop
		for( $j=0; $j<strlen( $string ); $j++ )
			{
			$currentChar = substr( $string, $j, 1 );
			$ret .= $currentChar;
			// Lesser than event
			if( $currentChar == "<") $isText = false;
			// Character handler
			if( $isText )
				{
				// Memorize last space position
				if( $currentChar == " " ) { $lastSpacePosition = $j; }
				else { $lastChar = $currentChar; }
				$i++;
				}
			else
				{
				$currentTag .= $currentChar;
				}
			// Greater than event
			if( $currentChar == ">" )
				{
				$isText = true;
				// Opening tag handler
				if( ( strpos( $currentTag, "<" ) !== FALSE ) &&	( strpos( $currentTag, "/>" ) === FALSE ) && ( strpos( $currentTag, "</") === FALSE ) )
					{

					// Tag has attribute(s)
					if( strpos( $currentTag, " " ) !== FALSE )
						{
						$currentTag = substr( $currentTag, 1, strpos( $currentTag, " " ) - 1 );
						}
					else
						{
						// Tag doesn't have attribute(s)
						$currentTag = substr( $currentTag, 1, -1 );
						}

					array_push( $tagsArray, $currentTag );

					}
				else if( strpos( $currentTag, "</" ) !== FALSE )
					{
	    			array_pop( $tagsArray );
					}

				$currentTag = "";
				}

			if( $i >= $length)
				{
				break;
				}
			}

		// Cut HTML string at last space position
		if( $length < $noTagLength )
			{
			if( $lastSpacePosition != -1 )
				{
				$ret = substr( $string, 0, $lastSpacePosition );
				$ret .= $dop;
				}
			else
				{
				$ret = substr( $string, $j );
				}
			}

		// Close broken XHTML elements
		while( sizeof( $tagsArray ) != 0 )
			{
			$aTag = array_pop( $tagsArray );
			$ret .= "</" . $aTag . ">\n";
			}

		}
	else
		{
		$ret = "";
		}

	$ret = iconv('CP1251', 'UTF-8', $ret);
	return($ret);
	}
function truncate_utf($string, $length, $dop){
        $string = wordwrap_utf8($string, 30);
        if(mb_strlen($string, 'UTF-8') > $length){
            $string = mb_substr($string, 0, $length, 'UTF-8') . $dop;
        }
    return $string;
	}

function breadcrumb($id, $cats, $uri_prefix=PATH, $uri_suffix='',$run=true){
    static $return = array();
    if($run) $return = array();
    if($id != 0){
        foreach($cats as $k => $v){
            if($k == $id){
                $return[] = $v;
                breadcrumb($v['parent'], $cats, $uri_prefix, $uri_suffix, false);
            }
        }
    }else{
        $return = array_reverse($return);
        $saved_uri = '';
        if(count($return) > 0){
            foreach($return as $k=>$v){
                $saved_uri .= $v['uri'].'/';
                $v['href'] = $uri_prefix.$saved_uri.$uri_suffix;
                $return[$k] = $v;
            }
        }
    }
    return $return;
}

$smarty->register_modifier("breadcrumb", "breadcrumb");   
$smarty->register_modifier("truncate_utf", "truncate_utf");
$smarty->register_modifier("wordwrap_utf8", "wordwrap_utf8");
$smarty->register_modifier("truncate_html", "truncate_html");
function om_number_smarty($number, $text1, $text2, $text3){
    $titles = array($text1, $text2, $text3);
	$cases = array (2, 0, 1, 1, 1, 2);
	return $titles[ ($number%100>4 && $number%100<20)? 2 : $cases[min($number%10, 5)] ];
}
$smarty->register_modifier("om_number", "om_number_smarty");
$smarty->register_modifier("worktime", "worktime");
?>