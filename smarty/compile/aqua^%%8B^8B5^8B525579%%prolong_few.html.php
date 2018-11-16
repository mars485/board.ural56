<?php /* Smarty version 2.6.25, created on 2018-04-20 10:19:27
         compiled from prolong_few.html */ ?>
<?php require_once(SMARTY_CORE_DIR . 'core.load_plugins.php');
smarty_core_load_plugins(array('plugins' => array(array('modifier', 'count', 'prolong_few.html', 2, false),array('modifier', 'truncate_utf', 'prolong_few.html', 26, false),array('modifier', 'date_format', 'prolong_few.html', 29, false),)), $this); ?>

	<?php if (count($this->_tpl_vars['err']) > 0): ?>
        <div class="alert alert-danger" role="alert">
            <ul>
            <?php $_from = $this->_tpl_vars['err']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['er']):
?>
                <li><?php echo $this->_tpl_vars['er']; ?>
</li>
            <?php endforeach; endif; unset($_from); ?>
            </ul>
        </div>
    <?php elseif (isset ( $this->_supers['post']['msg'] )): ?>
        <div class="alert alert-success" role="alert">
                <?php echo $this->_tpl_vars['locale']['227']; ?>

        </div>
    <?php endif; ?>
    <?php if (count($this->_tpl_vars['messages']) > 0): ?>
    <form name="prolong_few" action="" method="POST">

        <ul>
            <?php $_from = $this->_tpl_vars['messages']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['message']):
?>
                <li>
                    <label>   
                        <p>             
                            <input <?php if ($this->_supers['get']['message'] == $this->_tpl_vars['message']['id']): ?>checked<?php endif; ?> name="msg[]" 
                                class="MessagesCheck" type="checkbox" value="<?php echo $this->_tpl_vars['message']['id']; ?>
" />
                            
                            <?php echo ((is_array($_tmp=$this->_tpl_vars['message']['title'])) ? $this->_run_mod_handler('truncate_utf', true, $_tmp, 100, '...') : truncate_utf($_tmp, 100, '...')); ?>

                            
                            <span class="badge" data-original-title="<?php echo $this->_tpl_vars['locale']['14']; ?>
"  data-placement="top" data-toggle="tooltip">
                            <i class="fa fa-times-circle"></i>&nbsp;<?php echo ((is_array($_tmp=$this->_tpl_vars['message']['date_del'])) ? $this->_run_mod_handler('date_format', true, $_tmp, "%d.%m.%Y") : smarty_modifier_date_format($_tmp, "%d.%m.%Y")); ?>

                            </span>
                            
                            
                            <a href="<?php echo $this->_tpl_vars['settings']['patch']; ?>
<?php echo @MESSAGES; ?>
/<?php echo $this->_tpl_vars['message']['link']; ?>
">
                                <i class="fa fa-external-link" aria-hidden="true"></i>
                            </a>
                            
                        </p>
                    </label>
                </li>
            <?php endforeach; endif; unset($_from); ?>
        </ul>

        <p>
            <select size='1' name='timing' class='form-control' style="width: auto;">
            	<?php $_from = $this->_tpl_vars['timing']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['time']):
?>
            	   <option value='<?php echo $this->_tpl_vars['time']['id']; ?>
' <?php if ($this->_tpl_vars['check']['timing'] == $this->_tpl_vars['time']['id']): ?>selected<?php endif; ?>><?php echo $this->_tpl_vars['time']['text']; ?>
</option>
            	<?php endforeach; endif; unset($_from); ?>
            </select>
        </p>
        <p>
            <button type="submit" class="btn btn-primary"><i class="fa fa-mail-forward"></i> <?php echo $this->_tpl_vars['locale']['145']; ?>
</button>
        </p>

        
        <p>&nbsp;</p>

        
        
    </form>
    <?php elseif (! isset ( $this->_supers['post']['msg'] )): ?>
        <div class="alert alert-warning error" role="alert">
                <p><?php echo $this->_tpl_vars['locale']['1092']; ?>
</p>
        </div>
    <?php endif; ?>