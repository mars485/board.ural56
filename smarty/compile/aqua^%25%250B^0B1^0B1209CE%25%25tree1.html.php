<?php /* Smarty version 2.6.25, created on 2018-04-19 18:25:44
         compiled from tree1.html */ ?>
<?php require_once(SMARTY_CORE_DIR . 'core.load_plugins.php');
smarty_core_load_plugins(array('plugins' => array(array('modifier', 'count_msg', 'tree1.html', 4, false),array('modifier', 'cat', 'tree1.html', 22, false),)), $this); ?>
<div class="row tree1">
<?php $_from = $this->_tpl_vars['tree']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['el']):
?>
    <?php $this->assign('uri', $this->_tpl_vars['settings']['path_rel']); ?>
    <?php $this->assign('count', ((is_array($_tmp=$this->_tpl_vars['el']['id'])) ? $this->_run_mod_handler('count_msg', true, $_tmp) : count_msg($_tmp))); ?>
    <div class='cat-list maintree'>
        <h3 class="cat-title">
            <a href='<?php echo $this->_tpl_vars['uri']; ?>
<?php echo $this->_tpl_vars['el']['uri']; ?>
/' <?php if ($this->_tpl_vars['el']['img'] == ""): ?>class="noimg"<?php endif; ?>>
            <?php if ($this->_tpl_vars['el']['img'] != ""): ?>
                <img class="ln-shadow" src='<?php echo $this->_tpl_vars['settings']['path']; ?>
images/cat/<?php echo $this->_tpl_vars['el']['img']; ?>
' alt='<?php echo $this->_tpl_vars['el']['name']; ?>
' />
            <?php endif; ?>
            <?php echo $this->_tpl_vars['el']['name']; ?>

            <span class="count"><?php echo $this->_tpl_vars['count']; ?>
</span>
            </a>
            <?php if ($this->_tpl_vars['el']['cat']): ?>
                <span data-target=".cat-id-<?php echo $this->_tpl_vars['el']['id']; ?>
" data-toggle="collapse"
                      class="btn-cat-collapsed collapsed">   <span
                        class=" icon-down-open-big"></span> </span>
            <?php endif; ?>
        </h3>
        
        <?php if ($this->_tpl_vars['el']['cat']): ?>
            <?php $this->assign('uri', ((is_array($_tmp=((is_array($_tmp=$this->_tpl_vars['uri'])) ? $this->_run_mod_handler('cat', true, $_tmp, $this->_tpl_vars['el']['uri']) : smarty_modifier_cat($_tmp, $this->_tpl_vars['el']['uri'])))) ? $this->_run_mod_handler('cat', true, $_tmp, "/") : smarty_modifier_cat($_tmp, "/"))); ?>
            <ul class="cat-collapse collapse in cat-id-<?php echo $this->_tpl_vars['el']['id']; ?>
"><?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => "tree1_recursive.html", 'smarty_include_vars' => array('el' => $this->_tpl_vars['el']['cat'])));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?></ul>
        <?php endif; ?>        

    </div>
<?php endforeach; endif; unset($_from); ?>
</div>

