<?php /* Smarty version 2.6.25, created on 2018-04-18 18:59:31
         compiled from pagination.html */ ?>

<?php if ($this->_tpl_vars['pages'] > 1): ?>
    <div class="pagination-bar text-center">
        <ul class="pagination">
            <?php $this->assign('page', $this->_supers['get']['page']); ?>
            <?php $this->assign('num_start', 1); ?>
            <?php if ($this->_tpl_vars['page'] > 3): ?>
                <?php $this->assign('num_start', $this->_tpl_vars['page']-2); ?>
            <?php endif; ?>
            <?php $this->assign('num_end', $this->_tpl_vars['num_start']+5); ?>
            <?php if ($this->_tpl_vars['num_end'] > $this->_tpl_vars['pages']): ?>
                <?php $this->assign('num_end', $this->_tpl_vars['pages']); ?>
                <?php $this->assign('num_start', $this->_tpl_vars['num_end']-5); ?>
            <?php endif; ?>
            <?php if ($this->_tpl_vars['num_start'] < 1): ?>
                <?php $this->assign('num_start', 1); ?>
            <?php endif; ?>
            
            <?php if ($this->_tpl_vars['page'] > 1): ?>
                <?php $this->assign('p', $this->_tpl_vars['page']-1); ?>
                <li><a class="pagination-btn" href="page<?php echo $this->_tpl_vars['p']; ?>
.html<?php echo $this->_tpl_vars['get_str']; ?>
"><i class="fa fa-arrow-left" aria-hidden="true"></i> <span class="hidden-xs"><?php echo $this->_tpl_vars['locale']['324']; ?>
</span></a></li>
            <?php endif; ?>
            <?php unset($this->_sections['page']);
$this->_sections['page']['name'] = 'page';
$this->_sections['page']['start'] = (int)$this->_tpl_vars['num_start'];
$this->_sections['page']['loop'] = is_array($_loop=$this->_tpl_vars['num_end']+1) ? count($_loop) : max(0, (int)$_loop); unset($_loop);
$this->_sections['page']['show'] = true;
$this->_sections['page']['max'] = $this->_sections['page']['loop'];
$this->_sections['page']['step'] = 1;
if ($this->_sections['page']['start'] < 0)
    $this->_sections['page']['start'] = max($this->_sections['page']['step'] > 0 ? 0 : -1, $this->_sections['page']['loop'] + $this->_sections['page']['start']);
else
    $this->_sections['page']['start'] = min($this->_sections['page']['start'], $this->_sections['page']['step'] > 0 ? $this->_sections['page']['loop'] : $this->_sections['page']['loop']-1);
if ($this->_sections['page']['show']) {
    $this->_sections['page']['total'] = min(ceil(($this->_sections['page']['step'] > 0 ? $this->_sections['page']['loop'] - $this->_sections['page']['start'] : $this->_sections['page']['start']+1)/abs($this->_sections['page']['step'])), $this->_sections['page']['max']);
    if ($this->_sections['page']['total'] == 0)
        $this->_sections['page']['show'] = false;
} else
    $this->_sections['page']['total'] = 0;
if ($this->_sections['page']['show']):

            for ($this->_sections['page']['index'] = $this->_sections['page']['start'], $this->_sections['page']['iteration'] = 1;
                 $this->_sections['page']['iteration'] <= $this->_sections['page']['total'];
                 $this->_sections['page']['index'] += $this->_sections['page']['step'], $this->_sections['page']['iteration']++):
$this->_sections['page']['rownum'] = $this->_sections['page']['iteration'];
$this->_sections['page']['index_prev'] = $this->_sections['page']['index'] - $this->_sections['page']['step'];
$this->_sections['page']['index_next'] = $this->_sections['page']['index'] + $this->_sections['page']['step'];
$this->_sections['page']['first']      = ($this->_sections['page']['iteration'] == 1);
$this->_sections['page']['last']       = ($this->_sections['page']['iteration'] == $this->_sections['page']['total']);
?>
                <?php $this->assign('p', $this->_sections['page']['index']); ?>
                 <li <?php if ($this->_supers['get']['page'] == $this->_tpl_vars['p']): ?>class='active'<?php endif; ?>><a href="page<?php echo $this->_tpl_vars['p']; ?>
.html<?php echo $this->_tpl_vars['get_str']; ?>
" ><?php echo $this->_tpl_vars['p']; ?>
</a></li>
            <?php endfor; endif; ?>
            <?php if ($this->_tpl_vars['page'] < $this->_tpl_vars['pages']): ?>
                <?php $this->assign('p', $this->_tpl_vars['page']+1); ?>
                <li><a class="pagination-btn" href="page<?php echo $this->_tpl_vars['p']; ?>
.html<?php echo $this->_tpl_vars['get_str']; ?>
"><span class="hidden-xs"><?php echo $this->_tpl_vars['locale']['1193']; ?>
</span> <i class="fa fa-arrow-right" aria-hidden="true"></i></a></li>
            <?php endif; ?>

        </ul>
    </div>
    <!--/.pagination-bar -->
<?php endif; ?>