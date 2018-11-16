<?php



if($settings['editable'])
    {
    if(is_numeric($_REQUEST['id']))
        {
        $dat = dbarray(dbquery("SELECT text FROM ".PREF."comments WHERE id=".$_REQUEST['id']));
        if($_REQUEST['act'] == 'show')
            {
            echo stripslashes(nl2br($dat['text']));
            }
        elseif($_REQUEST['act'] == 'edit')
            {
            echo "
            <div class='edit_comment'><textarea id='text-".$_REQUEST['id']."'>".stripslashes($dat['text'])."</textarea>
            <br />
            <input type='button' id='commmentbuttoncansel' name='".$_REQUEST['id']."'  value='".$locale[184]."' onclick=\"canselcomment(this, '".$_REQUEST['id']."');\">
            <input type='button' id='commmentbuttonsave'   name='".$_REQUEST['id']."'  value='".$locale[335]."' onclick=\"savecomment(this, '".$_REQUEST['id']."');\">
            </div>
            ";
            }
        elseif($_REQUEST['act'] == 'save')
            {
            $text = urldecode(trim($_REQUEST['content']));
            dbquery("UPDATE ".PREF."comments SET text='".$text."' WHERE id=".$_REQUEST['id']);
            echo stripslashes(nl2br($text));
            }
        elseif($_REQUEST['act'] == 'delete')
            {
            dbquery("DELETE FROM ".PREF."comments WHERE id=".$_REQUEST['id']);
            echo 'ok';
            }
        }
    }
exit();
?>