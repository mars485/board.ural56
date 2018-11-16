<?php
if(!$exe)
	{
	if($_GET['cat'][1] == 'add')
		{
		$smarty->display('comment_add.html');
		}
	}

exit();
?>