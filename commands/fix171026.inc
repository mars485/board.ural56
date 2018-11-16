<?php
	if(isset($_GET['text'])){
	   $_GET['text'] = str_replace("\'", '', $_GET['text']);
	   $_GET['text'] = str_replace('%27', '', $_GET['text']);
	}
?>