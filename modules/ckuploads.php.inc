<?php

function getex($filename)
{
    return end(explode(".", $filename));
}

if ($_FILES['upload']) {
    
    if (($_FILES['upload'] == "none") or (empty($_FILES['upload']['name']))) {
        $message = $locale[1021];
    } else
        if ($_FILES['upload']["size"] == 0 or $_FILES['upload']["size"] > 30050000) {
            $message = $locale[1022];
        } else
            if (($_FILES['upload']["type"] != "image/jpeg") and ($_FILES['upload']["type"] !=
                "image/jpeg") and ($_FILES['upload']["type"] != "image/png") and ($_FILES['upload']["type"] != "image/gif")) {
                $message = $locale[1023];
            } else
                if (!is_uploaded_file($_FILES['upload']["tmp_name"])) {
                    $message = $locale[1024];
                } else {
                    $name = rand(1, 1000) . '-' . md5($_FILES['upload']['name']) . '.' . getex($_FILES['upload']['name']);
                    move_uploaded_file($_FILES['upload']['tmp_name'], FULLPATH."uploads/images/" . $name);
                    $full_path = PATH.'uploads/images/' . $name;
                    $message = "Файл " . $_FILES['upload']['name'] . " загружен";
                    $size = @getimagesize(FULLPATH.'uploads/images/' . $name);
                    if ($size[0] < 50 or $size[1] < 50) {
                        unlink(FULLPATH.'uploads/images/' . $name);
                        $message = $locale[1025];
                        $full_path = "";
                    }
                }
                $callback = $_REQUEST['CKEditorFuncNum'];
    echo '<script type="text/javascript">window.parent.CKEDITOR.tools.callFunction("' . 
    $callback . '", "' . $full_path . '", "' . $message . '" );</script>';
}

exit();
?>