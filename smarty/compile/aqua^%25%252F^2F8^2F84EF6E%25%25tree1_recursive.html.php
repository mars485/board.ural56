<?php /* Smarty version 2.6.25, created on 2018-04-19 18:25:44
         compiled from tree1_recursive.html */ ?>
<?php require_once(SMARTY_CORE_DIR . 'core.load_plugins.php');
smarty_core_load_plugins(array('plugins' => array(array('modifier', 'count_msg', 'tree1_recursive.html', 4, false),array('modifier', 'cat', 'tree1_recursive.html', 7, false),)), $this); ?>
<?php $_from = $this->_tpl_vars['el']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['el']):
?>
    <li>
        <?php $this->assign('uri2', $this->_tpl_vars['uri']); ?>
        <?php $this->assign('count', ((is_array($_tmp=$this->_tpl_vars['el']['id'])) ? $this->_run_mod_handler('count_msg', true, $_tmp) : count_msg($_tmp))); ?>
        <a href="<?php echo $this->_tpl_vars['uri']; ?>
<?php echo $this->_tpl_vars['el']['uri']; ?>
/"><?php echo $this->_tpl_vars['el']['name']; ?>
</a><?php if ($this->_tpl_vars['count'] > 0): ?>&nbsp;<span class="badge"><?php echo $this->_tpl_vars['count']; ?>
</span><?php endif; ?>
        <?php if ($this->_tpl_vars['el']['cat']): ?>
            <?php $this->assign('uri', ((is_array($_tmp=((is_array($_tmp=$this->_tpl_vars['uri'])) ? $this->_run_mod_handler('cat', true, $_tmp, $this->_tpl_vars['el']['uri']) : smarty_modifier_cat($_tmp, $this->_tpl_vars['el']['uri'])))) ? $this->_run_mod_handler('cat', true, $_tmp, "/") : smarty_modifier_cat($_tmp, "/"))); ?>
            <ul><?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => "tree1_recursive.html", 'smarty_include_vars' => array('el' => $this->_tpl_vars['el']['cat'])));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?></ul>
        <?php endif; ?>
        <?php $this->assign('uri', $this->_tpl_vars['uri2']); ?>
    </li>
<?php endforeach; endif; unset($_from); ?>