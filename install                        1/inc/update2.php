<?php
        echo "
        <form name='form' action='?step=7&loc=".$loc."' method='GET'>
		<input name='step' type='hidden' value='7'>
		<input name='loc' type='hidden' value='".$loc."'>
        <input name='upd' type='hidden' value='".$_GET['upd']."'>
        	   <table border='0' width='100%' height='100%'>
        	   	<tr>
        			<td height='40' colspan='3'>
        				<div class='title'>".$locale[1]." #".$step."</div>
        				<div class='subtitle'>".$locale[53]."</div>
        			</td>
        		</tr>
        	    <tr>
        		    <td colspan='3' height='100%'>
        	              ";
                            
                            $sqlfile = 'upd2021/'.$loc.'.sql';
                            if(file_exists($sqlfile))
                                {
                                $sqlfile = file_get_contents($sqlfile);
                                $sqlfile = str_replace('%DB_PREF%', $db_pref, $sqlfile);
                                $sqlfile = str_replace('%_PATH_%', $_path_, $sqlfile);
                            	$sqlfile = parce_sql_file($sqlfile);
                            	$lines = array();
                            	splitSqlFile($lines, $sqlfile);
                                $cn = 0;
                                if(count($lines) > 0)
                            	    {
                            		foreach($lines as $sql)
                            			{
                            			if($sql['query'] != "")
                            				{
                            				dbquery($sql['query']);
                            				$cn++;
                            				}
                            			}
                            	    }
                                    
                                    
                                    
                                    
                                 include('inc/update3.php');   
                                    
                                 echo "
                                <div class='choice'>
                                ".$locale[31].": ".$cn."
                                </div>
                                ";
                                }
                            else
                                {
                                $err = true;
                                }
        	              echo "
        		    </td>
        	    </tr>
        	       <tr>
        		<td align='left' height='20'><input type='button' value='&larr; ".$locale[4]."' onclick='history.back(1);'></td>
        		<td align='center'></td>
        		<td align='right'><input type='submit' value='".$locale[3]." &rarr;' ></td>
        	       </tr>
        	 	</table>
        	</form>"; 
    
    
    


?>