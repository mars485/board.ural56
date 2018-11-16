<?php /* Smarty version 2.6.25, created on 2018-04-20 12:57:18
         compiled from search_fields.html */ ?>

		<?php $_from = $this->_tpl_vars['fields']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['field']):
?>
            
    		<?php $this->assign('id', ($this->_tpl_vars['field']['id'])); ?>
    		<?php $this->assign('id', "f_".($this->_tpl_vars['id'])); ?>

			<?php if (! in_array ( $this->_tpl_vars['field']['type'] , array ( 'i' , 'f' , 'y' , 'j' ) )): ?>
				<div class='float_field'>
                    <label class="list-title" for="bs_<?php echo $this->_tpl_vars['field']['id']; ?>
"><?php echo $this->_tpl_vars['field']['name']; ?>
</label>
					<?php if ($this->_tpl_vars['field']['type'] == 'v' || $this->_tpl_vars['field']['type'] == 't'): ?>
							<?php if ($this->_tpl_vars['field']['type_string'] == 'n'): ?>
							    <?php $this->assign('sid', "cond_".($this->_tpl_vars['id'])); ?>
								<select size='1' name='cond_<?php echo $this->_tpl_vars['id']; ?>
' class="form-control num_field">
    								<option value='eq'><?php echo $this->_tpl_vars['locale']['206']; ?>
</option>
    								<option value='over'><?php echo $this->_tpl_vars['locale']['207']; ?>
</option>
    								<option value='less'><?php echo $this->_tpl_vars['locale']['208']; ?>
</option>
								</select>
                                <input name='<?php echo $this->_tpl_vars['id']; ?>
' type='number' value='' class="form-control num_field" id="bs_<?php echo $this->_tpl_vars['field']['id']; ?>
">
                            <?php else: ?>
                                <input name='<?php echo $this->_tpl_vars['id']; ?>
' type='text' value='' class="form-control" id="bs_<?php echo $this->_tpl_vars['field']['id']; ?>
">
							<?php endif; ?>
					<?php endif; ?>

					<?php if ($this->_tpl_vars['field']['type'] == 's'): ?>
						<select size='1' name='<?php echo $this->_tpl_vars['id']; ?>
' id="bs_<?php echo $this->_tpl_vars['field']['id']; ?>
" class="form-control" id="bs_<?php echo $this->_tpl_vars['field']['id']; ?>
">
							<option value='' ><?php echo $this->_tpl_vars['locale']['204']; ?>
</option>
							<?php $_from = $this->_tpl_vars['field']['values_array']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['k'] => $this->_tpl_vars['vl']):
?>
							     <option value='<?php echo $this->_tpl_vars['k']; ?>
'><?php echo $this->_tpl_vars['vl']; ?>
</option>
							<?php endforeach; endif; unset($_from); ?>
						</select>
					<?php endif; ?>

					<?php if ($this->_tpl_vars['field']['type'] == 'r'): ?>
						<label class="radio-inline"><input name='<?php echo $this->_tpl_vars['id']; ?>
' type='radio' value='' />&nbsp;<?php echo $this->_tpl_vars['locale']['204']; ?>
</label>
						<?php $_from = $this->_tpl_vars['field']['values_array']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['k'] => $this->_tpl_vars['vl']):
?>
						  <label class="radio-inline"><input name='<?php echo $this->_tpl_vars['id']; ?>
' type='radio' value='<?php echo $this->_tpl_vars['k']; ?>
' />&nbsp;<?php echo $this->_tpl_vars['vl']; ?>
</label>
						<?php endforeach; endif; unset($_from); ?>
					<?php endif; ?>

					<?php if ($this->_tpl_vars['field']['type'] == 'c'): ?>
						<?php $_from = $this->_tpl_vars['field']['values_array']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['k'] => $this->_tpl_vars['vl']):
?>
						  <label class="checkbox-inline"><input name="<?php echo $this->_tpl_vars['id']; ?>
[<?php echo $this->_tpl_vars['k']; ?>
]"  type='checkbox' value='<?php echo $this->_tpl_vars['k']; ?>
' />&nbsp;<?php echo $this->_tpl_vars['vl']; ?>
</label>
						<?php endforeach; endif; unset($_from); ?>
					<?php endif; ?>

					<?php if ($this->_tpl_vars['field']['type'] == 'p'): ?>
						<input class="form-control price_field" name='<?php echo $this->_tpl_vars['id']; ?>
[over]' type='number' step='0.01' placeholder="<?php echo $this->_tpl_vars['locale']['888']; ?>
" value=''/>
						<input class="form-control price_field" name='<?php echo $this->_tpl_vars['id']; ?>
[less]' type='number' step='0.01' placeholder="<?php echo $this->_tpl_vars['locale']['889']; ?>
" value='' id="bs_<?php echo $this->_tpl_vars['field']['id']; ?>
"/>  
                        <select size='1' name="<?php echo $this->_tpl_vars['id']; ?>
[rate]" class="form-control price_field">
            				<?php $_from = $this->_tpl_vars['field']['rates']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['rates']):
?>
            				    <option <?php if ($this->_tpl_vars['rates_default']['id'] == $this->_tpl_vars['rates']['id']): ?>selected<?php endif; ?> value='<?php echo $this->_tpl_vars['rates']['id']; ?>
'><?php echo $this->_tpl_vars['rates']['name']; ?>
</option>
            				<?php endforeach; endif; unset($_from); ?>
                        </select>     
					<?php endif; ?>
				</div>
			<?php endif; ?>
		<?php endforeach; endif; unset($_from); ?>

        <div class='float_field'>
            <label class="list-title" for="bs_must"><?php echo $this->_tpl_vars['locale']['202']; ?>
</label>
            <div class="checkbox">
                <label><input name='must[images]' type='checkbox' value='ON' /> <?php echo $this->_tpl_vars['locale']['874']; ?>
</label>
            </div>

			<?php $_from = $this->_tpl_vars['fields']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['k'] => $this->_tpl_vars['field']):
?>
				<?php if ($this->_tpl_vars['field']['type'] == 'f' || $this->_tpl_vars['field']['type'] == 'y' || $this->_tpl_vars['field']['type'] == 'j'): ?>
                    <div class="checkbox">
					    <label><input name='must[<?php echo $this->_tpl_vars['k']; ?>
]' type='checkbox' value='ON' /> <?php echo $this->_tpl_vars['field']['name']; ?>
</label>
                    </div>
				<?php endif; ?>
			<?php endforeach; endif; unset($_from); ?>
        </div>
        
        <?php if ($this->_supers['get']['map'] != 1): ?>
            <div class='float_field'>
                <label class="list-title" for="bs_sort"><?php echo $this->_tpl_vars['locale']['199']; ?>
</label>
                <div class="radio">
                    <label><input name='sort_by' type='radio' value='date_add' /> <?php echo $this->_tpl_vars['locale']['13']; ?>
</label>
                </div>
    			<?php $_from = $this->_tpl_vars['fields']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['field']):
?>
    				<?php if (( $this->_tpl_vars['field']['type'] == 'v' && $this->_tpl_vars['field']['type_string'] == 'n' ) || $this->_tpl_vars['field']['type'] == 'p'): ?>
                        <div class="radio">
    					    <label><input name='sort_by' type='radio' value='f_<?php echo $this->_tpl_vars['field']['id']; ?>
' /> <?php echo $this->_tpl_vars['field']['name']; ?>
</label>
                        </div>
    				<?php endif; ?>
    			<?php endforeach; endif; unset($_from); ?>
                <div class="checkbox">
    			    <label><input name='desc' type='checkbox' value='yes' /> <?php echo $this->_tpl_vars['locale']['205']; ?>
</label>
                </div>
            </div>        
        <?php endif; ?>