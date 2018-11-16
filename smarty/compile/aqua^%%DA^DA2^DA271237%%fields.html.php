<?php /* Smarty version 2.6.25, created on 2018-04-18 16:22:52
         compiled from fields.html */ ?>
<?php require_once(SMARTY_CORE_DIR . 'core.load_plugins.php');
smarty_core_load_plugins(array('plugins' => array(array('modifier', 'urlencode', 'fields.html', 75, false),)), $this); ?>
<?php $this->assign('yandex', 0); ?>

<?php $_from = $this->_tpl_vars['fields']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['field_key'] => $this->_tpl_vars['field']):
?>
    <?php $this->assign('value', $this->_tpl_vars['check'][$this->_tpl_vars['field_key']]); ?>
	<?php if ($this->_tpl_vars['field']['type'] == 'j'): ?> 
        <div class="yandex_field">
            <p>
                <label>
                    <?php echo $this->_tpl_vars['field']['name']; ?>

                    <?php if ($this->_tpl_vars['field']['comment'] != ""): ?>
                        <i class="icon-info-circled-alt" data-original-title="<?php echo $this->_tpl_vars['field']['comment']; ?>
"  data-placement="top" data-toggle="tooltip"></i>
                    <?php endif; ?>
                    <?php if ($this->_tpl_vars['field']['req'] == 1): ?>
                        <i class="fa fa-asterisk" aria-hidden="true" data-original-title="<?php echo $this->_tpl_vars['locale']['392']; ?>
"  data-placement="top" data-toggle="tooltip"></i>
                    <?php endif; ?>
                </label>
            </p>
    		<iframe id='frame-<?php echo $this->_tpl_vars['field_key']; ?>
' scrolling='no' src="<?php echo $this->_tpl_vars['settings']['path']; ?>
yamaps/?field=<?php echo $this->_tpl_vars['field_key']; ?>
"></iframe>
            <input id="<?php echo $this->_tpl_vars['field_key']; ?>
" name="<?php echo $this->_tpl_vars['field_key']; ?>
" type="hidden" value=""/>
        </div>
    <?php else: ?>
        <div class="form-group">
            <label class="col-md-3 control-label"  for="title" >
                <?php echo $this->_tpl_vars['field']['name']; ?>

                <?php if ($this->_tpl_vars['field']['comment'] != ""): ?>
                    <i class="icon-info-circled-alt" data-original-title="<?php echo $this->_tpl_vars['field']['comment']; ?>
"  data-placement="top" data-toggle="tooltip"></i>
                <?php endif; ?>
                <?php if ($this->_tpl_vars['field']['req'] == 1): ?>
                    <i class="fa fa-asterisk" aria-hidden="true" data-original-title="<?php echo $this->_tpl_vars['locale']['392']; ?>
"  data-placement="top" data-toggle="tooltip"></i>
                <?php endif; ?>
            </label>
            <div class="col-md-8">
    			<?php if ($this->_tpl_vars['field']['type'] == 'v'): ?>
    				<input 
                        <?php if ($this->_tpl_vars['field']['type_string'] != 't'): ?>maxlength='<?php echo $this->_tpl_vars['field']['max']; ?>
'<?php endif; ?> 
                        name='<?php echo $this->_tpl_vars['field_key']; ?>
' 
                        type='<?php if ($this->_tpl_vars['field']['type_string'] == 'n'): ?>number<?php else: ?>text<?php endif; ?>' 
                        class='form-control  <?php if ($this->_tpl_vars['field']['type_string'] == 't'): ?>phonemask<?php else: ?>calcletters<?php endif; ?>' 
                        value='<?php echo $this->_tpl_vars['value']; ?>
' 
                        <?php if ($this->_tpl_vars['field']['req'] == 1): ?>required=""<?php endif; ?> />
    			<?php endif; ?>
    
    			<?php if ($this->_tpl_vars['field']['type'] == 't'): ?>
    				<textarea maxlength='<?php echo $this->_tpl_vars['field']['max']; ?>
'  name='<?php echo $this->_tpl_vars['field_key']; ?>
' wrap='on' class='form-control calcletters' <?php if ($this->_tpl_vars['field']['req'] == 1): ?>required=""<?php endif; ?>><?php echo $this->_tpl_vars['value']; ?>
</textarea>
    			<?php endif; ?>
    
    			<?php if ($this->_tpl_vars['field']['type'] == 's'): ?>
    				<select size='1' name='<?php echo $this->_tpl_vars['field_key']; ?>
' class='form-control' <?php if ($this->_tpl_vars['field']['req'] == 1): ?>required=""<?php endif; ?>>
    					<?php if ($this->_tpl_vars['field']['req'] == 2): ?>
    						<option value='' ><?php echo $this->_tpl_vars['locale']['217']; ?>
</option>
    					<?php endif; ?>
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
    				<?php if ($this->_tpl_vars['field']['req'] == 2): ?>
    					<label class="field_label"><input name='<?php echo $this->_tpl_vars['field_key']; ?>
' type='radio' value='' <?php if ($this->_tpl_vars['field']['req'] == 1): ?>required=""<?php endif; ?> />&nbsp;<?php echo $this->_tpl_vars['locale']['217']; ?>
</label><br />
    				<?php endif; ?>
    				<?php $_from = $this->_tpl_vars['field']['values_array']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['k'] => $this->_tpl_vars['vl']):
?>
    				<label class="field_label"><input name='<?php echo $this->_tpl_vars['field_key']; ?>
' type='radio' value='<?php echo $this->_tpl_vars['k']; ?>
' <?php if ($this->_tpl_vars['field']['req'] == 1): ?>required=""<?php endif; ?> />&nbsp;<?php echo $this->_tpl_vars['vl']; ?>
</label><br />
    				<?php endforeach; endif; unset($_from); ?>
    			<?php endif; ?>
    
    			<?php if ($this->_tpl_vars['field']['type'] == 'c'): ?>
    				<?php $_from = $this->_tpl_vars['field']['values_array']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['k'] => $this->_tpl_vars['vl']):
?>
    				<label class="field_label"><input name='<?php echo $this->_tpl_vars['field_key']; ?>
[<?php echo $this->_tpl_vars['k']; ?>
]' type='checkbox' value='ON' />&nbsp;<?php echo $this->_tpl_vars['vl']; ?>
</label><br />
    				<?php endforeach; endif; unset($_from); ?>
    			<?php endif; ?>
    
    			<?php if ($this->_tpl_vars['field']['type'] == 'f' || $this->_tpl_vars['field']['type'] == 'i'): ?>
                    <?php if ($this->_tpl_vars['settings']['uploadtype'] == 1): ?>
                        <iframe class="fileupload" src="<?php echo $this->_tpl_vars['settings']['path']; ?>
ajaxfileupload/?field_key=<?php echo $this->_tpl_vars['field_key']; ?>
&file=<?php echo ((is_array($_tmp=$this->_tpl_vars['field']['file'])) ? $this->_run_mod_handler('urlencode', true, $_tmp) : urlencode($_tmp)); ?>
" ></iframe>
                    <?php else: ?>
                        <script>
                            $(document).ready(function() {        
                              $('#<?php echo $this->_tpl_vars['field_key']; ?>
').uploadify({
                                'uploader'  : '<?php echo $this->_tpl_vars['settings']['path']; ?>
js/uploadify/uploadify.swf',
                                'buttonImg' : '<?php echo $this->_tpl_vars['settings']['path']; ?>
imgtext.png',
                                'height'      : 18,
                                'weight'      : 200,
                                'wmode'       : 'transparent',
                                'script'    : '<?php echo $this->_tpl_vars['settings']['path']; ?>
uploadify/',
                                'cancelImg' : '<?php echo $this->_tpl_vars['settings']['path']; ?>
js/uploadify/cancel.png',
                                'fileExt'   : '<?php $_from = $this->_tpl_vars['field']['values_array']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }$this->_foreach['ii'] = array('total' => count($_from), 'iteration' => 0);
if ($this->_foreach['ii']['total'] > 0):
    foreach ($_from as $this->_tpl_vars['vl']):
        $this->_foreach['ii']['iteration']++;
?>*.<?php echo $this->_tpl_vars['vl']; ?>
<?php if (($this->_foreach['ii']['iteration'] == $this->_foreach['ii']['total']) == false): ?>;<?php endif; ?><?php endforeach; endif; unset($_from); ?>',
                                'fileDesc'    : '<?php $_from = $this->_tpl_vars['field']['values_array']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }$this->_foreach['ii'] = array('total' => count($_from), 'iteration' => 0);
if ($this->_foreach['ii']['total'] > 0):
    foreach ($_from as $this->_tpl_vars['vl']):
        $this->_foreach['ii']['iteration']++;
?><?php echo $this->_tpl_vars['vl']; ?>
<?php if (($this->_foreach['ii']['iteration'] == $this->_foreach['ii']['total']) == false): ?>, <?php endif; ?><?php endforeach; endif; unset($_from); ?>',
                                'multi'     : true,
                                'auto'      : true,
                                'sizeLimit'   : 104857600,  //in bytes
                                'scriptData'  : {'field_id':<?php echo $this->_tpl_vars['field']['id']; ?>
, 'form_id':form_id},
                                'onComplete': function (event, queueID, fileObj, response, data) 
                                    {
                                        if(response != 'error')
                                            {
                                            $('#h1-<?php echo $this->_tpl_vars['field_key']; ?>
').show('fast');
                                            $('#i-<?php echo $this->_tpl_vars['field_key']; ?>
').attr('src', response);                                       
                                            $('#h2-<?php echo $this->_tpl_vars['field_key']; ?>
').show('fast');                                       
                                            }                            
                                    } 
                              });  
                             });   
                        </script>
    					<table width='100%' border="0">
        					<tr>
        					    <td>
                					<input id='<?php echo $this->_tpl_vars['field_key']; ?>
' name='<?php echo $this->_tpl_vars['field_key']; ?>
' type='file' value='' class='form-control' <?php if ($this->_tpl_vars['field']['req'] == 1): ?>required=""<?php endif; ?>>
                					<span class="filetypes"><?php echo $this->_tpl_vars['locale']['85']; ?>
: <?php $_from = $this->_tpl_vars['field']['values_array']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }$this->_foreach['ii'] = array('total' => count($_from), 'iteration' => 0);
if ($this->_foreach['ii']['total'] > 0):
    foreach ($_from as $this->_tpl_vars['vl']):
        $this->_foreach['ii']['iteration']++;
?><?php echo $this->_tpl_vars['vl']; ?>
<?php if (($this->_foreach['ii']['iteration'] == $this->_foreach['ii']['total']) == false): ?>, <?php endif; ?><?php endforeach; endif; unset($_from); ?></span>
                					<div id="r-<?php echo $this->_tpl_vars['field_key']; ?>
"></div>
                                </td>
                                <td width='50'>
            						<div <?php if (! $this->_tpl_vars['field']['file']): ?>style='display:none;'<?php endif; ?> id='h1-<?php echo $this->_tpl_vars['field_key']; ?>
'>
            							     <img id="i-<?php echo $this->_tpl_vars['field_key']; ?>
" width="60" height="40" border="0" class='help' src="<?php echo $this->_tpl_vars['field']['file']; ?>
" />
            						</div>
            					</td>
                            </tr>
        					<tr>
                                <td colspan='2' align='right' style='font-size:10px; color:red;'>
                                    <a <?php if (! $this->_tpl_vars['field']['file']): ?>style='display:none;'<?php endif; ?> href="#" onclick="deletetmpfile('<?php echo $this->_tpl_vars['field']['id']; ?>
', '<?php echo $this->_supers['get']['form_id']; ?>
'); return false;" id='h2-<?php echo $this->_tpl_vars['field_key']; ?>
'><img src="<?php echo @THEME; ?>
images/del.png" /></a>
            					</td>
                            </tr>
    					</table>
                    <?php endif; ?>
    			<?php endif; ?>
    
    			<?php if ($this->_tpl_vars['field']['type'] == 'y'): ?>
    				<input name='<?php echo $this->_tpl_vars['field_key']; ?>
' type='text' class='form-control' value='<?php echo $this->_tpl_vars['value']; ?>
' <?php if ($this->_tpl_vars['field']['req'] == 1): ?>required=""<?php endif; ?>/>
    			<?php endif; ?>
    
    			<?php if ($this->_tpl_vars['field']['type'] == 'p'): ?>
                    <div class="price_select">
                        <input name='<?php echo $this->_tpl_vars['field_key']; ?>
' type='text' class='form-control' value='<?php echo $this->_tpl_vars['value']; ?>
' <?php if ($this->_tpl_vars['field']['req'] == 1): ?>required=""<?php endif; ?> />
                        <select size='1' name="<?php echo $this->_tpl_vars['field_key']; ?>
_rates" class='form-control' <?php if ($this->_tpl_vars['field']['req'] == 1): ?>required=""<?php endif; ?>>
            				<?php $_from = $this->_tpl_vars['field']['rates']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['rates']):
?>
            				    <option <?php if ($this->_tpl_vars['rates_default']['id'] == $this->_tpl_vars['rates']['id']): ?>selected<?php endif; ?> value='<?php echo $this->_tpl_vars['rates']['id']; ?>
'><?php echo $this->_tpl_vars['rates']['name']; ?>
</option>
            				<?php endforeach; endif; unset($_from); ?>
                        </select>
                    </div>
    			<?php endif; ?>
            </div>
        </div>
	<?php endif; ?>
  
<?php endforeach; endif; unset($_from); ?>
