<?php

$fl = FULLPATH.'smarty/compile/';
if ($dh = opendir($fl)) {
    while (($file = readdir($dh)) !== false) {
        if(substr($file, 0, 1) != '.'){
            unlink($fl.$file);
        }
    }
    closedir($dh);
}
$fl = FULLPATH.'uploads/temp/';
if ($dh = opendir($fl)) {
    while (($file = readdir($dh)) !== false) {
        if(substr($file, 0, 1) != '.'){
            unlink($fl.$file);
        }
    }
    closedir($dh);
}

cache_flush();

exit($locale[958]);
?>