<?php

function get_file_list($dir)
	{
	$return = array();

	if($fp = @opendir($dir))
		{
		while(($file = readdir($fp)) !== false)
			{
			if($file != '.' && $file != '..')
			$return[] = $file;
			}
		}
	return $return;
	}

function dbconnect($db_host, $db_user, $db_pass, $db_name)
	{
	  if(version_compare(phpversion(), '5.5') >= 0){
        global $_mysqli_link;
        $_mysqli_link = mysqli_connect($db_host, $db_user, $db_pass, $db_name);
	  }else{
		mysql_connect($db_host, $db_user, $db_pass) or die("Unable to connect to SQL Server");
		mysql_select_db($db_name) or die("Unable to select database");
	  }
	}

function dbconnect_test($db_host, $db_user, $db_pass, $db_name) {
    	  if(version_compare(phpversion(), '5.5') >= 0){
            global $_mysqli_link;
            return mysqli_connect($db_host, $db_user, $db_pass, $db_name); 
    	  }else{
    		mysql_connect($db_host, $db_user, $db_pass);
    		return mysql_select_db($db_name);
    	  }
}


function dbquery($query, $get_counter = false)
	{
	static $sqlquerycounter = 0;
	if(isset($_GET['_dbg']) && isset($_GET['_sql'])){pr('['.$sqlquerycounter.'] '.$query);}

	if(!$get_counter)
		{
		  $mt1 = getmicrotime();
          $query1 = $query;
 		  if(version_compare(phpversion(), '5.5') >= 0){
            global $_mysqli_link;
            if (!$query = mysqli_query($_mysqli_link, $query)) echo mysqli_error($_mysqli_link);
          }else{
            if (!$query = mysql_query($query)) echo mysql_error();
          }
          if(isset($GLOBALS['longquery'])){
                global $timepointer;
                $mt2 = getmicrotime();
                $c = round(($mt2 - $mt1), 4);
                $sqlquerytime = $sqlquerytime+$c;
                $txt = '['.$sqlquerycounter.'] ['.$c.'] ['.$sqlquerytime.'] ['.$timepointer.'] '.$query1;
                if($c > $GLOBALS['longquery']){
                    //file_put_contents(FULLPATH.'longquery.log', $txt.' ['.$_SERVER['REQUEST_URI'].']'."\r\n", FILE_APPEND);
                }
          }

		$sqlquerycounter++;
		return $query;
		}
	else {return $sqlquerycounter;}
	}

function dbrows($query)
	{
	  if(version_compare(phpversion(), '5.5') >= 0){
        global $_mysqli_link;
        return mysqli_num_rows($query);
	  }else{
		return mysql_num_rows($query);

	  }

	}

function dbarray($query)
	{
	  if(version_compare(phpversion(), '5.5') >= 0){
        global $_mysqli_link;
        if (!$query = mysqli_fetch_assoc($query)) echo mysqli_error($_mysqli_link);
	  }else{
		if (!$query = mysql_fetch_assoc($query)) echo mysql_error();
	  }
	return $query;
	}


function dbresult($query, $row) {
        if (!$query = mysql_result($query, $row)) echo mysql_error();
        return $query;
}


function dbarraynum($query) {
        if (!$query = mysql_fetch_row($query)) echo mysql_error();
        return $query;
}

function parce_sql_file($sqlfile)
	{
	$sqlfile = str_replace('%DB_PREF%', PREF, $sqlfile);
	return $sqlfile;
	}


function getmicrotime()
	{
	list($usec, $sec) = explode(" ",microtime());
	return ((float)$usec + (float)$sec);
	}

function pr($text)
	{
	echo "<pre style='border:1px solid red; width:100%;  background-color:#FFECEC; color: black;'>";
	if(is_array($text))
		{
	   	print_r($text);
		}
	else
		{
	    echo $text;
		}
	echo "</pre>";
	}

function w2u($str)
	{
	return iconv('windows-1251', 'utf-8', $str);
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


?>