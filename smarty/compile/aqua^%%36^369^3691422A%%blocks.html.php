<?php /* Smarty version 2.6.25, created on 2018-04-18 16:16:54
         compiled from blocks.html */ ?>
<?php if ($this->_tpl_vars['place'] == 'l'): ?>
    <div class="locations-list  list-filter">
        <h5 class="list-title">
            <strong><?php echo $this->_tpl_vars['name']; ?>
</strong>
            <?php if ($this->_tpl_vars['data']['block_type'] == 'search'): ?>
                <span class="pull-right">
                    <a href="#" class="gotomap" data-original-title="<?php echo $this->_tpl_vars['locale']['1257']; ?>
"  data-placement="top" data-toggle="tooltip">
                        <i class="icon-map"></i>
                    </a>
                </span>
            <?php endif; ?>
        </h5>
        <?php echo $this->_tpl_vars['html']; ?>

    </div>
<?php endif; ?>

<?php if ($this->_tpl_vars['place'] == 'r' || $this->_tpl_vars['place'] == 'h' || $this->_tpl_vars['place'] == 'f'): ?>
    <div class="inner-box block_<?php echo $this->_tpl_vars['place']; ?>
">
        <h5 class="title-2">
            <?php echo $this->_tpl_vars['name']; ?>

            <?php if ($this->_tpl_vars['data']['block_type'] == 'search'): ?>
                <span class="pull-right">
                    <a href="#" class="gotomap" data-original-title="<?php echo $this->_tpl_vars['locale']['1257']; ?>
"  data-placement="top" data-toggle="tooltip">
                        <i class="icon-map"></i>
                    </a>
                </span>
            <?php endif; ?>
        </h5>
        <div class="inner-box-content">
            <?php echo $this->_tpl_vars['html']; ?>

        </div>
    </div>
<?php endif; ?>

<?php if ($this->_tpl_vars['place'] == 'm'): ?>
    <div class="block_<?php echo $this->_tpl_vars['place']; ?>
">
        <?php echo $this->_tpl_vars['html']; ?>

    </div>
<?php endif; ?>

<?php if ($this->_tpl_vars['place'] == 't' || $this->_tpl_vars['place'] == 'b'): ?>
    <div class="inner-box relative block_<?php echo $this->_tpl_vars['place']; ?>
">
        <h2 class="title-2"><?php echo $this->_tpl_vars['name']; ?>
</h2>
        <div class="inner-box-content">
            <?php echo $this->_tpl_vars['html']; ?>

        </div>
    </div>
<?php endif; ?>