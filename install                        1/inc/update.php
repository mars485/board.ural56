<?php

$fullpath = dirname(__FILE__) . '/';
define('FULLPATCH', $fullpath);
if(!isset($_GET['convert'])) $_GET['convert'] = "";
if($_GET['convert'] != 'true')
	{
	echo "
	<form name='form' action='?' method='get'>
	<input name='step'      type='hidden' value='6'>
	<input name='update'    type='hidden' value='yes'>
	<input name='convert'   type='hidden' value='true'>
    <input name='upd' type='hidden' value='".$_GET['upd']."'>
	<input name='loc' type='hidden' value='".$loc."'>
	   <table border='0' width='100%' height='100%'>
	   	<tr>
			<td height='40' colspan='2'>
				<div class='title'>".$locale[1]." #".$step.".1</div>
				<div class='subtitle'>".$locale[29]."</div>
			</td>
		</tr>
	    <tr>
		    <td colspan='2' height='100%'>
	              ";

	$sqlfile = file_get_contents('sql/rus_general_topics.sql');
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

	              echo "
    <div class='choice'>
    ".$locale[31].": ".$cn."
    </div>

		    </td>
	    </tr>
	       <tr>
		<td align='left' height='20'><input type='button' value='&larr; ".$locale[4]."' onclick='history.back(1);'></td>
		<td align='right'><input type='submit' value='".$locale[3]." &rarr;' ></td>
	       </tr>
	 	</table>
	</form>
	";
	}
else
	{
	function msg($text)
		{
	    echo "
	    <div class='choice'>
	    ".$text."
	    </div>
	    ";
		}
	echo "
	<form name='form' action='?' method='get'>
	<input name='step' type='hidden' value='7'>
	<input name='loc' type='hidden' value='".$loc."'>
	   <table border='0' width='100%' height='100%'>
	   	<tr>
			<td height='40' colspan='3'>
				<div class='title'>".$locale[1]." #".$step.".2</div>
				<div class='subtitle'>".$locale[30]."</div>
			</td>
		</tr>
	    <tr>
		    <td colspan='3' height='100%'>
	              ";

    	foreach($conf['update'] as $table)
    		{
    	    msg($locale[32].' '.$table);
    	    include(FULLPATCH."conv_".$table.".php");
    		}

        include('inc/update3.php');

	              echo "
		    </td>
	    </tr>
	       <tr>
		<td align='left' height='20'><input type='button' value='&larr; ".$locale[4]."' onclick='history.back(1);'></td>
		<td align='center'><input type='button' value='".$locale[28]."' onclick=\"document.location.href = '?step=6&update=".$_GET['update']."&convert=".$_GET['convert']."&loc=".$_GET['loc']."'\"></td>
		<td align='right'><input type='submit' value='".$locale[3]." &rarr;' ></td>
	       </tr>
	 	</table>
	</form>
	";
	}
?>