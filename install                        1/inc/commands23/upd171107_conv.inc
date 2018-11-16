<?php
    $ajax_key = md5($settings['admin_login'].$settings['admin_password']);
    $upd1 = true;
    $upd2 = true;
    $res = dbquery("SHOW TABLES FROM `".$db_name."`");
    while($dat = dbarray($res)){
    	if($dat['Tables_in_'.$db_name] == PREF."ind_cat") $upd1 = false;
    	if($dat['Tables_in_'.$db_name] == PREF."ind_region") $upd2 = false;	
    }    
    if($upd1){
        dbquery('
            CREATE TABLE `'.PREF.'ind_cat` (
              `message` int(11) NOT NULL,
              `cat` int(11) NOT NULL,
              PRIMARY KEY (`message`,`cat`),
              KEY `cat` (`cat`),
              KEY `message` (`message`)
            ) ENGINE=MyISAM DEFAULT CHARSET=utf8
        ');
    }
    if($upd2){
        dbquery('
            CREATE TABLE `'.PREF.'ind_region` (
              `message` int(11) NOT NULL,
              `cat` int(11) NOT NULL,
              PRIMARY KEY (`message`,`cat`)
            ) ENGINE=MyISAM DEFAULT CHARSET=utf8;
        ');
    }     
      
    dbquery('INSERT INTO '.PREF.'settings SET `k`="indexing", `v`="0"');
	echo '
    <script type="text/javascript" src="../js/jquery.js"></script>
    <script>
    $(document).ready(function(){
        function reindex5(){
            $.ajax({
                type: "POST",
                url: "../?indexing=recount",
                data: "key='.$ajax_key.'",
                success: function(data) {
                    if(data.status == 1){
                        $("#reindex_info").html("'.$locale[64].' "+data.load+"...");
                        reindex5();
                    }else{
                        if(data.status == 0){
                            $("#reindex_info").html("'.$locale[63].'");
                            $("#nextbtn").removeAttr("disabled");
                            $("#nextbtn").css("color", "black");
                        }else{
                            reindex5();
                        }
                    }
                }, 
                error: function(jqXHR) {
                    console.log(jqXHR);
                    reindex5();
                }
            });  
        }
        $("#reindex_info").html("'.$locale[62].'");
        $("#nextbtn").attr("disabled", "disabled");
        $("#nextbtn").css("color", "silver");
        reindex5();
    });
    </script>
    <div id=reindex_info></div>
    ';
?>