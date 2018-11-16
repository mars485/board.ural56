<?php /* Smarty version 2.6.25, created on 2018-11-16 16:44:10
         compiled from /var/www/mars485/data/www/board.itgsystem.ru/uploads/temp/IVhCeKDhIe.tmp */ ?>


<br /><br />
<div align="center">

<form name="payment" method="post" action="https://sci.interkassa.com/" accept-charset="UTF-8" target="_top">
<input type="hidden" name="ik_co_id" value="<?php echo $this->_tpl_vars['abilling']['key1']; ?>
" /> 
<input type="hidden" name="ik_pm_no" value="<?php echo $this->_tpl_vars['pay']['order']; ?>
" /> 
<input type="hidden" name="ik_am" value="<?php echo $this->_tpl_vars['pay']['amount']; ?>
" /> 
<input type="hidden" name="ik_cur" value="<?php echo $this->_tpl_vars['pay']['currency']; ?>
" /> 
<input type="hidden" name="ik_sign" value="<?php echo $this->_tpl_vars['abilling']['key2']; ?>
" />
<input type="hidden" name="ik_usr" value="<?php echo $this->_tpl_vars['settings']['user']['email']; ?>
" />

 
  
<input type="hidden" name="ik_desc" value="<?php echo $this->_tpl_vars['pay']['comment']; ?>
" /> 
<input type="submit" value="<?php echo $this->_tpl_vars['locale']['831']; ?>
" />
</form>
</div>
