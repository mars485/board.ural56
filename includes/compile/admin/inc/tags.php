<?php
/*
	Скрипт доски объявлений
	Elite-Board 2
	Тихомиров Юрий
	Санкт-Петербург
	2009 - 2010

	версия модуля: 260110
*/


if(!$exe)
	{
	   	   
    if(!isset($_GET['onpage'])) $_GET['onpage'] = $on_page_default; 
    if(!isset($_GET['sort'])) $_GET['sort'] = 'word'; 
    if(!isset($_GET['word'])) $_GET['word'] = ''; 
    if(!isset($_GET['page'])) $_GET['page'] = '';
            
	echo "
    <script type='text/javascript'>
	    function select_all()
		    {
			for (i = 0; i < ".$_GET['onpage']."; i++)
				{
				if(document.getElementById('check' + i))
					{
					if(document.getElementById('check' + i).checked == true)
						{
			            document.getElementById('check' + i).checked = false;
						}
					else
						{
					    document.getElementById('check' + i).checked = true;
						}
					}
				}
		    }
    </script>
	";

	$save = "";

	if(!is_numeric($_GET['onpage']))
		{
	    $_GET['onpage'] = $on_page_default;
		}
	if($act == 'del' && is_numeric($_GET['id']))
		{
                        dbquery("DELETE FROM ".PREF."db_tags WHERE tag=".$_GET['id']);                        
                        dbquery("DELETE FROM ".PREF."tags WHERE id=".$_GET['id']);
		}
	if($_POST['submit'] != "")
		{
	    if(count($_POST['words']) > 0)
		    {
	 	    foreach($_POST['words'] as $k => $v)
		 	    {
		 	    if(is_numeric($k))
			 	    {
		 		    dbquery("UPDATE ".PREF."tags SET word = '".$_POST['words'][$k]."', counter = '".$_POST['counters'][$k]."' WHERE id=".$k);
		 		    $save = "<div align='center'><div class='ok'>".$locale[351]."</div></div>";
			 	    }
		 	    }
		    }
		}

        if(isset($_POST['check']))
            {
    	    if(is_array($_POST['check']) && count($_POST['check']) > 0)
    		    {
    	 	    foreach($_POST['check'] as $k => $v)
    		 	    {
    	 		    if(isset($k) && $v == 'ON')
    		 		    {
                        dbquery("DELETE FROM ".PREF."db_tags WHERE tag=".$k);                        
                        dbquery("DELETE FROM ".PREF."tags WHERE id=".$k);
    		 		    }
    		 	    }
    		    }
            }
	}
if($exe)
	{
    $page = $_GET['page'];
    $limit = "";
	$sql = "SELECT * FROM ".PREF."tags ";
    if($_GET['word'] != ""){
        $sql .= "WHERE word LIKE '%".$_GET['word']."%'";
            
    }
    $count_messages = dbrows(dbquery($sql));
	$page_count = ceil($count_messages/$_GET['onpage']);
	if($page > $page_count)
		{
		$page = $page_count;
		}
	if($page <= 0 )
		{
		$page = 1;
		}
	$offset = ( $page - 1 ) * $_GET['onpage'];
	$limit = " LIMIT ".$offset.", ".$_GET['onpage'];


	echo "
    <script type='text/javascript'>
	    function select_all()
		    {
			for (i = 0; i < ".$_GET['onpage']."; i++)
				{
				if(document.getElementById('check' + i))
					{
					if(document.getElementById('check' + i).checked == true)
						{
			            document.getElementById('check' + i).checked = false;
						}
					else
						{
					    document.getElementById('check' + i).checked = true;
						}
					}
				}
		    }
    </script>
	";


	echo "
	<form name='form' action='?' method='get' id='form'>
	<input name='unit' type='hidden' value='tags'>
	    <div align='center'>
		    <div class='sort'>
				".$locale[333].":
				<select size='1' name='onpage'>
				<option "; if($_GET['onpage'] == 5){echo ' selected ';} echo "value='5'>5</option>
				<option "; if($_GET['onpage'] == 15){echo ' selected ';} echo "value='15'>15</option>
				<option "; if($_GET['onpage'] == 30){echo ' selected ';} echo "value='30'>30</option>
				<option "; if($_GET['onpage'] == 60){echo ' selected ';} echo "value='60'>60</option>
				<option "; if($_GET['onpage'] == 100){echo ' selected ';} echo "value='100'>100</option>
				<option "; if($_GET['onpage'] == 150){echo ' selected ';} echo "value='150'>150</option>
				<option "; if($_GET['onpage'] == 200){echo ' selected ';} echo "value='200'>200</option>
				<option "; if($_GET['onpage'] == 300){echo ' selected ';} echo "value='300'>300</option>
				</select>
			     <img src='".$settings['path']."admin/tpl/img/vert.gif' width='5' alt='' border='0' style='vertical-align:middle;'>
				".$locale[67].":
				<select size='1' name='sort'>
				<option "; if($_GET['sort'] == 'word'){echo ' selected ';} echo "value='word'>".$locale[526]."</option>
				<option "; if($_GET['sort'] == 'counter'){echo ' selected ';} echo "value='counter'>".$locale[427]."</option>
				</select>
   			<img src='".$settings['path']."admin/tpl/img/hor.gif' width='500' alt='' border='0' style='vertical-align:middle; margin:4px;'>
			".$locale[270].": <input name='word' type='text' size='50' value='".$_GET['word']."'>
   			<img src='".$settings['path']."admin/tpl/img/hor.gif' width='500' alt='' border='0' style='vertical-align:middle; margin:4px;'>
				<input type='submit' value='".$locale[335]."'>
			</div>
		</div>
	</form>
    ".$save."
    
	    <table border='0' width='100%'>
	    <tr><td align='center' style='font-size:13px;'>
	    ".$locale[2]." <b>".$count_messages."</b>
	    </td></tr>
	    <tr><td>
	    ";
	    if($page_count > 1)
		    {
		    echo "
		    <div style='width:90%;'>
		    <div class='page unsel' >".$locale[140].":</div>
		    ";
		    for($i=1; $i <= $page_count; $i++)
			    {
		        echo "<div class='page ";
		        if($i == $_GET['page'])
			        {
			        echo "sel";
			        }
			    else
				    {
			 	    echo "unsel";
				    }
				echo "' onclick=\"go('?unit=tags&word=".$_GET['word']."&sort=".$_GET['sort']."&onpage=".$_GET['onpage']."&page=".$i."')\">".$i."</div>";
			    }
		    echo "
		    </div>
		    ";
		    }

//email pass date status  email_status  actions    name    balance


	    echo "
	    </td></tr>
	    </table>


	";

    echo "
	<form name='form2' action='?unit=tags&onpage=".$_GET['onpage']."&page=".$_GET['page']."' method='post'>
    <table align='center' border='0' cellpadding='1' cellspacing='1' class='tbl' style='width:550px;'>
	    <tr class='tbl_head' >
		    <td width='450'>".$locale[526]."</td>
		    <td width='50'>".$locale[427]."</td>
		    <td width='60' colspan='2'>".$locale[201]."</td>
	    </tr>
	    ";


    $sql .= " ORDER by ".$_GET['sort']." ".$limit;
	$i = 0;
	$res = dbquery($sql);
	while($dat = dbarray($res))
		{
		echo "
			<tr>
				<td><input name='words[".$dat['id']."]' type='text' value='".$dat['word']."' style='width:100%;'></td>
				<td><input name='counters[".$dat['id']."]' type='text' value='".$dat['counter']."' style='width:100%;'></td>
				<td align='center'><input id='check".$i."' name='check[".$dat['id']."]' type='checkbox' value='ON'></td>
                <td align='center'>".ico("?unit=tags&act=del&onpage=".$_GET['onpage']."&page=".$_GET['page']."&id=".$dat['id'], 'd')."</td>
			</tr>
		";
        $i++;
		}
	echo "
   
	</table>
<div align='center'><br />
	    <a href='javascript:select_all();'>".$locale[341]."</a>
	    <br /><br />
	<input type='submit' name='submit' value='".$locale[335]."'></div>
	</form>
    ";
    }
?>