<?php /* Smarty version 2.6.25, created on 2018-04-18 16:16:54
         compiled from body1.html */ ?>
<?php require_once(SMARTY_CORE_DIR . 'core.load_plugins.php');
smarty_core_load_plugins(array('plugins' => array(array('modifier', 'count', 'body1.html', 57, false),array('modifier', 'breadcrumb', 'body1.html', 73, false),)), $this); ?>
<?php if ($this->_tpl_vars['modtype'] != 'cat'): ?>
    <?php $this->assign('category_count', $this->_tpl_vars['counter']['messages_all']); ?>
<?php else: ?>
    <?php $this->assign('category_count', $this->_tpl_vars['count_cat_messages']); ?>
<?php endif; ?>

<?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => 'header.html', 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>

    <div class="main-container">
        <div class="container">

            <?php echo $this->_tpl_vars['blocks']['h']; ?>


            <div class="row">
                <?php if ($this->_tpl_vars['blocks']['l'] != ""): ?>
                    <!-- this (.mobile-filter-sidebar) part will be position fixed in mobile version -->
                    <div class="col-sm-3 page-sidebar mobile-filter-sidebar">
                        <aside>
                            <div class="inner-box">
                                <?php echo $this->_tpl_vars['blocks']['l']; ?>

                                <div style="clear:both"></div>
                            </div>
                        </aside>
                    </div>
                    <!--/.page-side-bar-->
                <?php endif; ?>
          

                <div class="col-sm-<?php if ($this->_tpl_vars['blocks']['r'] == "" || $this->_tpl_vars['blocks']['l'] == ""): ?>9<?php else: ?>6<?php endif; ?> page-content">
                
                    <?php echo $this->_tpl_vars['blocks']['t']; ?>
      
                               
                    <div class="inner-box category-content">
                    <h1 class="title-2">
                        <?php if ($this->_supers['get']['cat']['0'] == 'users'): ?>
                            <?php $this->assign('c', $this->_supers['get']['cat']['1']); ?>
                                <?php if ($this->_tpl_vars['c'] == ""): ?><?php echo $this->_tpl_vars['locale']['61']; ?>

                                    <?php elseif ($this->_tpl_vars['c'] == 'moderated'): ?><?php echo $this->_tpl_vars['locale']['979']; ?>

                                    <?php elseif ($this->_tpl_vars['c'] == 'deleted'): ?><?php echo $this->_tpl_vars['locale']['980']; ?>

                                    <?php elseif ($this->_tpl_vars['c'] == 'update'): ?><?php echo $this->_tpl_vars['locale']['1094']; ?>

                                    <?php elseif ($this->_tpl_vars['c'] == 'info'): ?><?php echo $this->_tpl_vars['locale']['126']; ?>

                                    <?php elseif ($this->_tpl_vars['c'] == 'subscribe'): ?><?php echo $this->_tpl_vars['locale']['62']; ?>

                                    <?php elseif ($this->_tpl_vars['c'] == 'orders'): ?><?php echo $this->_tpl_vars['locale']['209']; ?>

                                    <?php elseif ($this->_tpl_vars['c'] == 'state'): ?><?php echo $this->_tpl_vars['locale']['63']; ?>

                                    <?php elseif ($this->_tpl_vars['c'] == 'pay'): ?><?php echo $this->_tpl_vars['locale']['64']; ?>

                                    <?php elseif ($this->_tpl_vars['c'] == 'order'): ?><?php echo $this->_tpl_vars['locale']['65']; ?>

                                    <?php elseif ($this->_tpl_vars['c'] == 'shop'): ?><?php echo $this->_tpl_vars['locale']['1104']; ?>
<?php if ($this->_tpl_vars['settings']['user']['shop']['name'] != ""): ?> &laquo;<?php echo $this->_tpl_vars['settings']['user']['shop']['name']; ?>
&raquo;<?php endif; ?>
                                <?php endif; ?>
                        <?php else: ?>
                            <?php echo $this->_tpl_vars['title_second']['name']; ?>

                        <?php endif; ?>

                    </h1>

                        
                        <?php if ($this->_tpl_vars['modtype'] != 'ind'): ?>
                            <?php if (count($this->_tpl_vars['title_normal']) > 2 || $this->_supers['get']['cat']['0'] == @MESSAGES): ?>
                                <ol class="breadcrumb">
                    				<?php $_from = $this->_tpl_vars['title_normal']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }$this->_foreach['t'] = array('total' => count($_from), 'iteration' => 0);
if ($this->_foreach['t']['total'] > 0):
    foreach ($_from as $this->_tpl_vars['t']):
        $this->_foreach['t']['iteration']++;
?>
                                        <?php if (! ($this->_foreach['t']['iteration'] == $this->_foreach['t']['total'])): ?>
                                        <li>
                                            <?php if (($this->_foreach['t']['iteration'] <= 1)): ?>
                                                <a href="<?php echo $this->_tpl_vars['t']['link']; ?>
"><i class="icon-home fa"></i></a>
                                            <?php else: ?>
                            					<a href='<?php echo $this->_tpl_vars['t']['link']; ?>
'>
                                                    <?php echo $this->_tpl_vars['t']['name']; ?>
 
                                                </a>
                                            <?php endif; ?>
                                        </li>
                                        <?php endif; ?>
                                        <?php if (($this->_foreach['t']['iteration'] <= 1)): ?>
                                            <?php if ($this->_supers['get']['cat']['0'] == @MESSAGES): ?>
                                                <?php $this->assign('breadcrumb', ((is_array($_tmp=$this->_tpl_vars['message']['cat'])) ? $this->_run_mod_handler('breadcrumb', true, $_tmp, $this->_tpl_vars['categories']) : breadcrumb($_tmp, $this->_tpl_vars['categories']))); ?>
                                                <?php $_from = $this->_tpl_vars['breadcrumb']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['t2']):
?>
                                                    <li>
                                                        <a href="<?php echo $this->_tpl_vars['t2']['href']; ?>
"><?php echo $this->_tpl_vars['t2']['name']; ?>
</a>
                                                    </li>
                                                <?php endforeach; endif; unset($_from); ?>
                                            <?php endif; ?>
                                        <?php endif; ?>
                    				<?php endforeach; endif; unset($_from); ?>
                                </ol>
                            <?php endif; ?>
                        <?php endif; ?>
 