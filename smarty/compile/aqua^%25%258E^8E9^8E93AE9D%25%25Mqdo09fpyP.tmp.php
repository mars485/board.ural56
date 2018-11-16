<?php /* Smarty version 2.6.25, created on 2018-11-16 16:26:30
         compiled from /var/www/mars485/data/www/board.itgsystem.ru/uploads/temp/Mqdo09fpyP.tmp */ ?>
<?php require_once(SMARTY_CORE_DIR . 'core.load_plugins.php');
smarty_core_load_plugins(array('plugins' => array(array('modifier', 'md5', '/var/www/mars485/data/www/board.itgsystem.ru/uploads/temp/Mqdo09fpyP.tmp', 10, false),array('modifier', 'substr', '/var/www/mars485/data/www/board.itgsystem.ru/uploads/temp/Mqdo09fpyP.tmp', 11, false),)), $this); ?>


<br /><br />
<div align="center">
<form action='<?php if ($this->_tpl_vars['abilling']['key4'] != ""): ?><?php echo $this->_tpl_vars['abilling']['key4']; ?>
<?php else: ?>https://merchant.roboxchange.com/Index.aspx<?php endif; ?>' method=GET target='_blank'>
<input type=hidden name=MrchLogin value=<?php echo $this->_tpl_vars['abilling']['key1']; ?>
>
<input type=hidden name=OutSum value=<?php echo $this->_tpl_vars['pay']['amount']; ?>
>
<input type=hidden name=InvId value=<?php echo $this->_tpl_vars['pay']['order']; ?>
>
<input type=hidden name=Desc value='<?php echo $this->_tpl_vars['pay']['comment']; ?>
'>
<input type=hidden name=SignatureValue value=<?php echo ((is_array($_tmp=($this->_tpl_vars['abilling']['key1']).":".($this->_tpl_vars['pay']['amount']).":".($this->_tpl_vars['pay']['order']).":".($this->_tpl_vars['abilling']['key2']))) ? $this->_run_mod_handler('md5', true, $_tmp) : md5($_tmp)); ?>
>
<input type=hidden name=Culture value=<?php echo ((is_array($_tmp=$this->_tpl_vars['settings']['locale'])) ? $this->_run_mod_handler('substr', true, $_tmp, 0, 2) : substr($_tmp, 0, 2)); ?>
>
<input type=submit value='<?php echo $this->_tpl_vars['locale']['748']; ?>
'></form>
</div>
<!--//<html><script language=JavaScript
src='https://merchant.roboxchange.com/Handler/MrchSumPreview.ashx?MrchLogin=<?php echo $this->_tpl_vars['abilling']['key1']; ?>
&OutSum=<?php echo $this->_tpl_vars['pay']['amount']; ?>
&InvId=<?php echo $this->_tpl_vars['pay']['order']; ?>
&IncCurrLabel=<?php echo $this->_tpl_vars['pay']['currency']; ?>
&Desc=<?php echo $this->_tpl_vars['pay']['comment']; ?>
&SignatureValue=<?php echo ((is_array($_tmp=($this->_tpl_vars['abilling']['key1']).":".($this->_tpl_vars['pay']['amount']).":".($this->_tpl_vars['pay']['order']).":".($this->_tpl_vars['abilling']['key2']))) ? $this->_run_mod_handler('md5', true, $_tmp) : md5($_tmp)); ?>
&Culture=<?php echo ((is_array($_tmp=$this->_tpl_vars['settings']['locale'])) ? $this->_run_mod_handler('substr', true, $_tmp, 0, 2) : substr($_tmp, 0, 2)); ?>
&Encoding=<?php echo $this->_tpl_vars['locale']['charset']; ?>
'></script></html>//-->
