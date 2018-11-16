<?php
/// Don't forget copy into DEV!!!!
$sqlfile = 'upd2122/'.$loc.'.sql';
$delfiles = array(  'version',
                    'version.txt',
                    'js/uploadify/uploadify.php'
                    );
                    
                    
function unlinkRecursive($dir, $deleteRootToo=true){
    if (!$dh = @opendir($dir)) {
        return;
    }
    while (false !== ($obj = readdir($dh))) {
        if ($obj == '.' || $obj == '..') {
            continue;
        }

        if (!@unlink($dir . '/' . $obj)) {
            unlinkRecursive($dir . '/' . $obj, true);
        }
    }
    closedir($dh);
    if ($deleteRootToo) {
        @rmdir($dir);
    }
    return;
}

if(file_exists($sqlfile))
    {

    echo "
    <div class='choice'>
    ".$locale[58].":";
    
    $sqlfile = file_get_contents($sqlfile);
    $sqlfile = str_replace('%DB_PREF%', $db_pref, $sqlfile);
    $sqlfile = str_replace('%_PATH_%', $_path_, $sqlfile);
	$sqlfile = parce_sql_file($sqlfile);
	$lines = array();
	splitSqlFile($lines, $sqlfile);
    if(!isset($cn)) $cn = 0;
    $cc = 0;
    if(count($lines) > 0)
	    {
		foreach($lines as $sql)
			{
			if($sql['query'] != "")
				{
				dbquery($sql['query']);
				$cn++;
                $cc++;
				}
			}
	    }
    echo $cc."</div>
    ";
    
    echo "
    <div class='choice'>
    ".$locale[56].":";
    $fields = array();
    $drop_fields = array(); 
    $sql_fields = array();
    $sql_tags = array();
    $num_fields = 0;
    $num_tags = 0;
    $tags = array();
    
    $res = dbquery("SELECT * FROM ".$db_pref."fields");
    while($dat = dbarray($res)){
        $fields[$dat['id']] = $dat;
        $drop_fields[] = "DROP `f_".$dat['id']."`"; 
    }
    
    $res = dbquery("SELECT * FROM ".$db_pref."db");
    while($dat = dbarray($res)){
        foreach($fields as $id => $f){
            if($dat['f_'.$id] != ""){
                $sql_fields[] = "(".$dat['id'].", ".$id.", '".$dat['f_'.$id]."')";
                $num_fields++;
            }
        }
        
        for($i=0; $i<10; $i++){
            if($dat['tag'.$i] != 0){
                $sql_tags[] = "(".$dat['id'].", ".$dat['tag'.$i].")";
                $num_tags++;
                if(!isset($tags[$dat['tag'.$i]])){
                    $tags[$dat['tag'.$i]] = 0;
                }
                if($dat['status'] == 1){
                    $tags[$dat['tag'.$i]]++;
                }
            }
        }
    }

    dbquery("TRUNCATE TABLE ".$db_pref."db_fields"); $cn++;   
    
    if(count($sql_fields) > 0){
        $fields_sql_txt = "INSERT INTO `".$db_pref."db_fields` (`message`, `field`, `value`) VALUES
                ".implode(",\n", $sql_fields);
        dbquery($fields_sql_txt); $cn++;
	    file_put_contents("fields.sql", $fields_sql_txt);
    }


    echo $num_fields."
    </div>
    ";    
       
    
    echo "
    <div class='choice'>
    ".$locale[57].":";

    dbquery("TRUNCATE TABLE ".$db_pref."db_tags"); $cn++;   
  
    if(count($sql_tags) > 0){
        dbquery("INSERT INTO `".$db_pref."db_tags` (`message`, `tag`) VALUES
                ".implode(",\n", $sql_tags)); $cn++;          
    }   
       
                 
    echo $num_tags."
    </div>
    ";    
       
 
     echo "
    <div class='choice'>
    ".$locale[60].":";
    $cc = 0;
    if(count($tags) > 0){
        $sql = "UPDATE `".$db_pref."tags` SET `counter` = CASE\n";
        foreach($tags as $tag => $count){
            $sql .= "WHEN `id`=".$tag." THEN '".$count."'\n";
            $cc++;
        }    
        $sql .= "ELSE `counter`\nEND\nWHERE 1";
        dbquery($sql); $cn++;    
    }
      
    echo $cc."
    </div>
    ";    
    
    
    echo "
    <div class='choice'>
    ".$locale[59]."..."; 
    $cc = 0;   
    $dat = dbarray(dbquery("SELECT * FROM ".$db_pref."counter_vars LIMIT 1"));
    if(!isset($dat['id'])){
        dbquery("ALTER TABLE ".$db_pref."counter_vars ADD `id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY FIRST");
        $cn++; 
    }
    dbquery("ALTER TABLE `".$db_pref."db`
                                      DROP `tag0`,
                                      DROP `tag1`,
                                      DROP `tag2`,
                                      DROP `tag3`,
                                      DROP `tag4`,
                                      DROP `tag5`,
                                      DROP `tag6`,
                                      DROP `tag7`,
                                      DROP `tag8`,
                                      DROP `tag9`");
    $cn++;
    dbquery("ALTER TABLE `".$db_pref."db` 
                                        ".implode(",\n", $drop_fields));
    $cn++;

    if(count($tags) > 0){
        $tags_id = array_keys($tags);
        $sql = "DELETE FROM `".$db_pref."tags` WHERE id NOT IN (".implode(',', $tags_id).")"; 
        dbquery($sql); $cn++;
    }
    
    foreach($delfiles as $file){
        if(file_exists('../'.$file)){
/////////////////////////////////////////////////
//            @unlink('../'.$file);
/////////////////////////////////////////////////
        }
    }

    echo "</div>";
    
    
    include('inc/update4.php');   
    }
else
    {
    $err = true;
    }
?>