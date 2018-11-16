<?php

    if($settings['prevent_indexing_region'] == 1 && isset($_GET['region']) && ($modtype == 'cat' || $modtype == 'ind')){
        if(count($_GET['region']) > 0){
                $noindex = true;
        	}
        }
    if($settings['prevent_indexing_sort'] == 1 && isset($_GET['cat']['0'])){
        if($_GET['cat']['0'] == 'search'){
                $noindex = true;
        	}
        }
    if($settings['prevent_indexing_cat'] == 1 && $modtype == 'cat' && isset($count_messages)){
            if($count_messages == 0){
                $noindex = true;
            }
    	}
?>