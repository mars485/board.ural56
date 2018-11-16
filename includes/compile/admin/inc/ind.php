<?php
/*
	Скрипт доски объявлений
	Elite-Board 2
	Тихомиров Юрий
	Санкт-Петербург
	2009 - 2010

	версия модуля: 260110
*/

if($exe)
	{
    foreach($modules as $val)
	    {
	    if($val['name'] != "")
		    {
	        echo "
	        <div class='mod' onclick=\"go('?unit=".$val['id']."');\">
			<div id='mod_a'>
	        <a href='?unit=".$val['id']."'>
            <i class='fa ";
            if(isset($modules_classes[$val['id']])) echo $modules_classes[$val['id']];
            else echo 'fa-square-o';            
            echo "'></i> ".$val['name']."
            </a>
			</div>
	        </div>
	        ";
	        }
	    }
	}
?>