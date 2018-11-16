<?php

$limit = 20;

define('DATE_FORMAT_RFC822','r');
header("Content-type: text/xml; charset=utf-8");
$lastBuildDate=date(DATE_FORMAT_RFC822, $settings['time']);

echo '<?xml version="1.0" encoding="utf-8"?>
<rss version="2.0">
<channel>
    <title>'.TITLE.' RSSFeed</title>
    <link>'.$settings['http'].'://'.$settings['site_address'].$settings['patch'].'</link>
    <description>'.$settings['description'].'</description>
    <pubDate>'.$lastBuildDate.'</pubDate>
    <lastBuildDate>'.$lastBuildDate.'</lastBuildDate>
    <docs>'.$settings['http'].'://blogs.law.harvard.edu/tech/rss</docs>
    <generator>Elite-Board 2, illusionweb.ru</generator>
    <copyright>Copyright '.date('Y', $settings['time']).' '.$settings['site_address'].'</copyright>
    <managingEditor>'.$settings['email'].'</managingEditor>
    <webMaster>'.$settings['email'].'</webMaster>
    <language>'.$settings['locale'].'</language>
';

include(COREPATH.'fields.php');
$imagefields = array();
foreach($fields as $k => $v){
    if($v['type'] == 'i'){ 
        $imagefields[] = $v['id'];
    }
}
$imagefields = (count($imagefields) > 0) ? ' AND field IN ('.implode(',', $imagefields).')' : '';


$res = dbquery("SELECT * FROM ".PREF."db WHERE status = 1 ORDER by date_add desc LIMIT 0, ".$limit);
while($dat = dbarray($res))
	{
	$title   = strip_tags(stripslashes(trim($dat['title'])));
	$anon   = stripslashes(trim($dat['text']));
	$region1 = get_array_linenav($dat['region'], $regions_id_);
	$region2 = "";

    $images = array();
    $res1 = dbquery("SELECT * FROM ".PREF."db_fields WHERE message=".$dat['id'].$imagefields);
    while($dat1 = dbarray($res1)){
        $images[] = $dat1['value'];
    }


	$url     = $settings['http'].'://'.$settings['site_address'].$settings['patch'].$region2.MESSAGES.'/'.$dat['id'].'-'.cpu($dat['title'], $locale['symb']).'.html';
	$pubDate = date(DATE_FORMAT_RFC822, $dat['date_add']);
	echo '
	    <item>
	        <title>'.$title.'</title>
	        <description><![CDATA[';
            
            if(count($images) > 0)
                {
                echo '
                <a href="'.$settings['http'].'://'.$settings['site_address'].$settings['patch']."uploads/images/tb/".$images[0].'" target="_blank">
                <img src="'.$settings['http'].'://'.$settings['site_address'].$settings['patch']."uploads/images/ts/".$images[0].'" align="left">
                </a>
                ';
                }
            
            echo $anon.']]></description>
	        <link>'.$url.'</link>
	        <guid isPermaLink="true">'.$url.'</guid>
	        <pubDate>'.$pubDate.'</pubDate>
	    </item>
	';
	}


echo <<<END
</channel>
</rss>
END;

exit();
?>