<?php
if(!$exe)
	{
	if($act == 'down' && $_GET['file'] != "")
		{
		$fullpath = FULLPATCH.'admin/dbbackup/'.$_GET['file'];
		if(file_exists($fullpath))
			{
			header("Content-Type: application/sql");
			header("Content-Length: ".filesize($fullpath));
			header("Content-Disposition: attachment; filename=".$_GET['file']);

			readfile($fullpath);
			}


		exit();

		}
    function mysql_fetch_row_u($res){
        if(version_compare(phpversion(), '5.5') >= 0){
            return mysqli_fetch_row($res);
        }else{
            return mysql_fetch_row($res);
        }
    }
    
	function mysql_dump($db, $file)
		{
		$pref = PREF;
		$cp = strlen($pref);

		 $ret = array();
		 $ret["err"] = array();
		 if (empty($db)) {$db = "db";}
		 if (empty($print)) {$print = 0;}
		 if (empty($nl2br)) {$nl2br = 0;}
         if(!isset($tabs)) $tabs = "";
		 if (!is_array($tabs)) {$tabs = array();}
		 if (empty($add_drop)) {$add_drop = TRUE;}
		 if (sizeof($tabs) == 0)
		 {
		  // retrive tables-list
		  $res = dbquery("SHOW TABLES FROM ".$db);
		  if (dbrows($res) > 0) {while ($row = mysql_fetch_row_u($res)) {$tabs[] = $row[0];}}
		 }
$out = "# Dumped by EliteBoard v2
# Home page: http://illusionweb.ru
#
# MySQL version: (".mysql_get_server_info_u().") running on ".getenv("SERVER_ADDR")." (".getenv("SERVER_NAME").")"."
# Date: ".date("d.m.Y H:i:s")."
# DB: \"".$db."\"
# Prefix: \"".$pref."\"
#---------------------------------------------------------

SET NAMES utf8;

";

		 foreach($tabs as $tab)
		 {
		  if (substr($tab, 0, $cp) == $pref)
		  {
          $out .= "\n\nDROP TABLE IF EXISTS `".$tab."`;\n";
		   // recieve query for create table structure
		   $res = dbquery("SHOW CREATE TABLE `".$tab."`");
		   if (!$res) {$ret["err"][] = 'error';}
		   else
		   {
		    $row = mysql_fetch_row_u($res);
		    $out .= $row["1"].";\n\n";
		    // recieve table variables
		    $res = dbquery("SELECT * FROM `$tab`");
		    if (dbrows($res) > 0)
		    {
		     while ($row = dbarray($res))
		     {
		      $keys = implode("`, `", array_keys($row));
		      $values = array_values($row);
		      foreach($values as $k=>$v) {$values[$k] = addslashes($v);}
		      $values = implode("', '", $values);
		      $sql = "INSERT INTO `$tab`(`".$keys."`) VALUES ('".$values."');\n";
		      $out .= $sql;
		     }
		    }
		   }
		  }
		 }
		 $out .= "#---------------------------------------------------------------------------------\n\n";
		 if ($file)
		 {
		  $fp = fopen($file, "w");
		  if (!$fp) {$ret["err"][] = 2;}
		  else
		  {
		   fwrite ($fp, $out);
		   fclose ($fp);
		  }
		 }
		 return $out;
		}



	function splitSqlFile(&$ret, $sql)
		{
	    // do not trim, see bug #1030644
	    //$sql          = trim($sql);
	    $sql          = rtrim($sql, "\n\r");
	    $sql_len      = strlen($sql);
	    $char         = '';
	    $string_start = '';
	    $in_string    = FALSE;
	    $nothing      = TRUE;
	    $time0        = time();

	    for ($i = 0; $i < $sql_len; ++$i) {
	        $char = $sql[$i];

	        // We are in a string, check for not escaped end of strings except for
	        // backquotes that can't be escaped
	        if ($in_string) {
	            for (;;) {
	                $i         = strpos($sql, $string_start, $i);
	                // No end of string found -> add the current substring to the
	                // returned array
	                if (!$i) {
	                    $ret[] = array('query' => $sql, 'empty' => $nothing);
	                    return TRUE;
	                }
	                // Backquotes or no backslashes before quotes: it's indeed the
	                // end of the string -> exit the loop
	                else if ($string_start == '`' || $sql[$i-1] != '\\') {
	                    $string_start      = '';
	                    $in_string         = FALSE;
	                    break;
	                }
	                // one or more Backslashes before the presumed end of string...
	                else {
	                    // ... first checks for escaped backslashes
	                    $j                     = 2;
	                    $escaped_backslash     = FALSE;
	                    while ($i-$j > 0 && $sql[$i-$j] == '\\') {
	                        $escaped_backslash = !$escaped_backslash;
	                        $j++;
	                    }
	                    // ... if escaped backslashes: it's really the end of the
	                    // string -> exit the loop
	                    if ($escaped_backslash) {
	                        $string_start  = '';
	                        $in_string     = FALSE;
	                        break;
	                    }
	                    // ... else loop
	                    else {
	                        $i++;
	                    }
	                } // end if...elseif...else
	            } // end for
	        } // end if (in string)

	        // lets skip comments (/*, -- and #)
	        else if (($char == '-' && $sql_len > $i + 2 && $sql[$i + 1] == '-' && $sql[$i + 2] <= ' ') || $char == '#' || ($char == '/' && $sql_len > $i + 1 && $sql[$i + 1] == '*')) {
	            $i = strpos($sql, $char == '/' ? '*/' : "\n", $i);
	            // didn't we hit end of string?
	            if ($i === FALSE) {
	                break;
	            }
	            if ($char == '/') $i++;
	        }

	        // We are not in a string, first check for delimiter...
	        else if ($char == ';') {
	            // if delimiter found, add the parsed part to the returned array
	            $ret[]      = array('query' => substr($sql, 0, $i), 'empty' => $nothing);
	            $nothing    = TRUE;
	            $sql        = ltrim(substr($sql, min($i + 1, $sql_len)));
	            $sql_len    = strlen($sql);
	            if ($sql_len) {
	                $i      = -1;
	            } else {
	                // The submited statement(s) end(s) here
	                return TRUE;
	            }
	        } // end else if (is delimiter)

	        // ... then check for start of a string,...
	        else if (($char == '"') || ($char == '\'') || ($char == '`')) {
	            $in_string    = TRUE;
	            $nothing      = FALSE;
	            $string_start = $char;
	        } // end else if (is start of string)

	        elseif ($nothing) {
	            $nothing = FALSE;
	        }

	        // loic1: send a fake header each 30 sec. to bypass browser timeout
	        $time1     = time();
	        if ($time1 >= $time0 + 30) {
	            $time0 = $time1;
	            header('X-pmaPing: Pong');
	        } // end if
	    } // end for

	    // add any rest to the returned array
	    if (!empty($sql) && preg_match('@[^[:space:]]+@', $sql)) {
	        $ret[] = array('query' => $sql, 'empty' => $nothing);
	    }

	    return TRUE;
		}


	}
if($exe)
	{

	if($act == 'del')
		{
			echo "
			<script>
			setTimeout(\"document.location.href='?unit=bk'\",1000);
			</script>
			<center><div class='ok'>".$locale[351]."</div></center>
			";
	    @unlink(FULLPATCH.'admin/dbbackup/'.$_GET['file']);
		}

	if($act == 'make')
		{
 		if(mysql_dump($db_name, FULLPATCH.'admin/dbbackup/'.date("Y-m-d_H-i-s").'.sql'))
	 		{
			echo "
			<script>
			setTimeout(\"document.location.href='?unit=bk'\",1000);
			</script>
			<center><div class='ok'>".$locale[351]."</div></center>
			";
			}
		}

	if($act == 'res' && $_GET['file'] != "")
		{
		$fullpath = FULLPATCH.'admin/dbbackup/'.$_GET['file'];
		$tabs = array();
		$deltabs = array();

		if(file_exists($fullpath))
			{
			$sql = file_get_contents($fullpath);
			$lines = array();
			splitSqlFile($lines, $sql);
			//pr($lines);

			foreach($lines as $v)
				{
				//pr($v['query']);
				dbquery($v['query']);
				}
			echo "
			<script>
			setTimeout(\"document.location.href='?unit=bk'\",1000);
			</script>
			<center><div class='ok'>".$locale[351]."</div></center>
			";
			}
		}

	if($act == '')
		{
		echo "
		<div align='left'>
		<input type='button' value=' &rarr; ".$locale[618]."' onclick=\"go('?unit=bk&act=make')\">
		</div>
		";

		echo "<br /><br />
		<table align='center' width='90%' border='0' cellpadding='1' cellspacing='1' class='tbl'>
			<tr class='tbl_head'>
				<td width='70%'>".$locale[616]."</td>
				<td width='10%'>".$locale[201]."</td>
				<td width='10%'>".$locale[617]."</td>
				<td width='10%'>".$locale[619]."</td>
			</tr>
	    ";



		$filelist = get_file_list('admin/dbbackup/');
		sort($filelist);
		$filelist = array_reverse($filelist);
		if(count($filelist) > 0)
			{
			foreach($filelist as $file)
				{
				echo "
				<tr>
					<td>".$file."</td>
					<td align='center'>".ico("?unit=bk&act=del&file=".$file, 'd')."</td>
					<td align='center'><a href='?unit=bk&act=down&file=".$file."'>".$locale['617']."</a></td>
					<td align='center'><a onclick=\"if(confirm('".$locale[43]."')){go('?unit=bk&act=res&file=".$file."');}\" href='#'>".$locale['619']."</a></td>
				</tr>
				";
				}
			}
	    echo "
		</table>
		";

		}





	}
?>