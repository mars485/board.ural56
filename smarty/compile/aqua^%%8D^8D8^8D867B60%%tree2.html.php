<?php /* Smarty version 2.6.25, created on 2018-04-18 18:59:31
         compiled from tree2.html */ ?>
<?php require_once(SMARTY_CORE_DIR . 'core.load_plugins.php');
smarty_core_load_plugins(array('plugins' => array(array('modifier', 'count_msg', 'tree2.html', 4, false),array('modifier', 'cat', 'tree2.html', 21, false),)), $this); ?>
<div class="row tree2">
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

            <!--span class="count"><?php echo $this->_tpl_vars['count']; ?>
</span-->
            </a>
            <?php if ($this->_tpl_vars['el']['cat']): ?>
                <span data-target=".cat-id-<?php echo $this->_tpl_vars['el']['id']; ?>
" data-toggle="collapse"
                      class="btn-cat-collapsed collapsed">   <span
                        class=" icon-down-open-big"></span> </span>
            <?php endif; ?>
        </h3>
        <ul class="cat-collapse collapse in cat-id-<?php echo $this->_tpl_vars['el']['id']; ?>
" >
            <?php $this->assign('uri', ((is_array($_tmp=((is_array($_tmp=$this->_tpl_vars['uri'])) ? $this->_run_mod_handler('cat', true, $_tmp, $this->_tpl_vars['el']['uri']) : smarty_modifier_cat($_tmp, $this->_tpl_vars['el']['uri'])))) ? $this->_run_mod_handler('cat', true, $_tmp, "/") : smarty_modifier_cat($_tmp, "/"))); ?>
            <?php $_from = $this->_tpl_vars['el']['cat']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }$this->_foreach['ind'] = array('total' => count($_from), 'iteration' => 0);
if ($this->_foreach['ind']['total'] > 0):
    foreach ($_from as $this->_tpl_vars['el2']):
        $this->_foreach['ind']['iteration']++;
?>
                <li id="subcat"><a href="<?php echo $this->_tpl_vars['uri']; ?>
<?php echo $this->_tpl_vars['el2']['uri']; ?>
/"><?php echo $this->_tpl_vars['el2']['name']; ?>
</a><?php if (($this->_foreach['ind']['iteration'] == $this->_foreach['ind']['total']) == false): ?> <?php endif; ?></li>
            <?php endforeach; endif; unset($_from); ?>
        </p>

    </div>
<?php endforeach; endif; unset($_from); ?>

</div>