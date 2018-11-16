<?php /* Smarty version 2.6.25, created on 2018-04-18 16:16:54
         compiled from add.html */ ?>
<?php require_once(SMARTY_CORE_DIR . 'core.load_plugins.php');
smarty_core_load_plugins(array('plugins' => array(array('modifier', 'count', 'add.html', 1, false),array('modifier', 'cpu', 'add.html', 25, false),array('modifier', 'mt_rand', 'add.html', 265, false),array('modifier', 'nl2br', 'add.html', 287, false),)), $this); ?>
<?php if (count($this->_tpl_vars['err']) > 0): ?>
	<div class="alert alert-danger">
        <p><i class="fa fa-exclamation-triangle" aria-hidden="true"></i> <?php echo $this->_tpl_vars['locale']['1196']; ?>
!</p>
		<ul>
		<?php $_from = $this->_tpl_vars['err']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['error']):
?>
			<li><?php echo $this->_tpl_vars['error']; ?>
</li>
		<?php endforeach; endif; unset($_from); ?>
		</ul>
	</div>
<?php endif; ?>

<?php if ($this->_tpl_vars['redirect']): ?>
	<div class="alert alert-success" >
		<?php if ($this->_tpl_vars['editable']): ?>
            <p>
                <i class="fa fa-check-square-o" aria-hidden="true"></i> 
                <?php echo $this->_tpl_vars['locale']['134']; ?>

            </p>
	        <?php if ($this->_tpl_vars['settings']['default_message_status'] == 0): ?>
	           <p><i><?php echo $this->_tpl_vars['locale']['135']; ?>
</i></p>
	        <?php elseif ($this->_tpl_vars['settings']['default_message_status'] == 1 && $this->_tpl_vars['settings']['user']): ?>
    	        <p><i class="fa fa-arrow-right" aria-hidden="true"></i> <a href="<?php echo $this->_tpl_vars['settings']['patch']; ?>
users/"><?php echo $this->_tpl_vars['locale']['104']; ?>
</a></p>
    	        <p><i class="fa fa-arrow-right" aria-hidden="true"></i> <a href="<?php echo $this->_tpl_vars['settings']['patch']; ?>
edit/<?php echo $this->_tpl_vars['check']['id']; ?>
"><?php echo $this->_tpl_vars['locale']['136']; ?>
</a></p>
             <?php else: ?>
    	        <p><i class="fa fa-arrow-right" aria-hidden="true"></i> <a href="<?php echo $this->_tpl_vars['settings']['patch']; ?>
messages/<?php echo $this->_tpl_vars['check']['id']; ?>
-<?php echo ((is_array($_tmp=$this->_tpl_vars['check']['title'])) ? $this->_run_mod_handler('cpu', true, $_tmp) : cpu($_tmp)); ?>
.html"><?php echo $this->_tpl_vars['locale']['978']; ?>
</a></p>       
    	        <p><i class="fa fa-arrow-right" aria-hidden="true"></i> <a href="<?php echo $this->_tpl_vars['settings']['patch']; ?>
edit/<?php echo $this->_tpl_vars['check']['id']; ?>
"><?php echo $this->_tpl_vars['locale']['136']; ?>
</a></p>
	        <?php endif; ?>
	  	<?php else: ?>
	         <p>
                <i class="fa fa-check-square-o" aria-hidden="true"></i> 
                <?php echo $this->_tpl_vars['locale']['101']; ?>

                <?php if ($this->_tpl_vars['MessageDisabled']): ?>
                    <?php echo $this->_tpl_vars['locale']['1264']; ?>

                <?php endif; ?>
             </p>
	        <?php if ($this->_tpl_vars['settings']['default_message_status'] == 0): ?>
	           <p><i><?php echo $this->_tpl_vars['locale']['102']; ?>
</i></p>
            <?php elseif ($this->_tpl_vars['settings']['default_message_status'] == 1 && $this->_tpl_vars['settings']['user']): ?>
	           <p><i><?php echo $this->_tpl_vars['locale']['103']; ?>
</i></p>
    	       <p><i class="fa fa-arrow-right" aria-hidden="true"></i> <a href="<?php echo $this->_tpl_vars['settings']['patch']; ?>
users/"><?php echo $this->_tpl_vars['locale']['104']; ?>
</a></p>
    	       <p><i class="fa fa-arrow-right" aria-hidden="true"></i> <a href="<?php echo $this->_tpl_vars['settings']['patch']; ?>
messages/<?php echo $this->_tpl_vars['save_id']; ?>
-<?php echo ((is_array($_tmp=$this->_tpl_vars['check']['title'])) ? $this->_run_mod_handler('cpu', true, $_tmp) : cpu($_tmp)); ?>
.html"><?php echo $this->_tpl_vars['locale']['978']; ?>
</a></p>
            <?php else: ?>
	           <p><i class="fa fa-arrow-right" aria-hidden="true"></i> <a href="<?php echo $this->_tpl_vars['settings']['patch']; ?>
messages/<?php echo $this->_tpl_vars['save_id']; ?>
-<?php echo ((is_array($_tmp=$this->_tpl_vars['check']['title'])) ? $this->_run_mod_handler('cpu', true, $_tmp) : cpu($_tmp)); ?>
.html"><?php echo $this->_tpl_vars['locale']['978']; ?>
</a></p>              
	        <?php endif; ?>

            <?php if ($this->_tpl_vars['RegisteredUser']): ?>
                <p><i><?php echo $this->_tpl_vars['locale']['48']; ?>
</i></p>
            <?php endif; ?>
	  	<?php endif; ?>
	</div>

<?php else: ?>


    <?php if ($this->_tpl_vars['check']['region'] == ''): ?>
        <?php $this->assign('region_default', $this->_tpl_vars['second_region']['id']); ?>
    <?php else: ?>
        <?php $this->assign('region_default', $this->_tpl_vars['check']['region']); ?>
    <?php endif; ?>
    
    
    <form name="add" action="?" method="post" class="form-horizontal" id="main_form">
        <input type="hidden" name="form_id" id="form_id" value="<?php echo $this->_tpl_vars['form_id']; ?>
"/>
        <input type="hidden" name="add_cat" id="add_cat" value="<?php echo $this->_tpl_vars['cat_default']; ?>
"/>
		<!--input type="hidden" name="add_cat" id="add_cat" value="769"/-->
        <input type="hidden" name="add_region" id="add_region" value="<?php echo $this->_tpl_vars['region_default']; ?>
"/>
        <input name="post_filter" type="hidden" value="false">
    	<?php if ($this->_tpl_vars['settings']['user']): ?>
            <div class="form-group">
                <label class="col-md-3 control-label"  for="name">
                    <?php echo $this->_tpl_vars['locale']['28']; ?>

                </label>
                <div class="col-md-8">
                    <input value="<?php echo $this->_tpl_vars['settings']['user']['name']; ?>
" disabled="" class="form-control" placeholder="<?php echo $this->_tpl_vars['locale']['28']; ?>
" required="" type="text">
                </div>
            </div>
            <div class="form-group">
                <label class="col-md-3 control-label"  for="name">
                    <?php echo $this->_tpl_vars['locale']['26']; ?>

                </label>
                <div class="col-md-8">
                    <input value="<?php echo $this->_tpl_vars['settings']['user']['email']; ?>
" disabled="" class="form-control" placeholder="<?php echo $this->_tpl_vars['locale']['26']; ?>
" required="" type="text">
                </div>
            </div>
    	<?php else: ?>
            <div class="form-group">
                <label class="col-md-3 control-label"  for="name" >
                    <?php echo $this->_tpl_vars['locale']['28']; ?>

                    <i class="icon-info-circled-alt" data-original-title="<?php echo $this->_tpl_vars['locale']['29']; ?>
"  data-placement="top" data-toggle="tooltip"></i>
                    <i class="fa fa-asterisk" aria-hidden="true" data-original-title="<?php echo $this->_tpl_vars['locale']['392']; ?>
"  data-placement="top" data-toggle="tooltip"></i>
                </label>
                <div class="col-md-8">
                    <input name="name" value="<?php echo $this->_tpl_vars['check']['user']; ?>
" class="form-control" 
                            placeholder="<?php echo $this->_tpl_vars['locale']['28']; ?>
" required="" type="text"
                            <?php if (@ADMINSTATUS && $this->_tpl_vars['check']['user_id'] != ""): ?>disabled<?php endif; ?>
                            >
                </div>
            </div>
            <div class="form-group">
                <label class="col-md-3 control-label"  for="email">
                    <?php echo $this->_tpl_vars['locale']['26']; ?>

                    <i class="icon-info-circled-alt" data-original-title="<?php echo $this->_tpl_vars['locale']['27']; ?>
 <?php echo $this->_tpl_vars['locale']['71']; ?>
"  data-placement="top" data-toggle="tooltip"></i>
                    <i class="fa fa-asterisk" aria-hidden="true" data-original-title="<?php echo $this->_tpl_vars['locale']['392']; ?>
"  data-placement="top" data-toggle="tooltip"></i>
                </label>
                <div class="col-md-8">
                    <input name="email"  
                            value="<?php echo $this->_tpl_vars['check']['email']; ?>
" class="form-control" 
                            placeholder="<?php echo $this->_tpl_vars['locale']['26']; ?>
" required="" 
                            <?php if (@ADMINSTATUS && $this->_tpl_vars['check']['user_id'] != ""): ?>disabled<?php endif; ?> 
                            type="email">
                </div>
            </div>
            <?php if (! $this->_tpl_vars['editable']): ?>
                <div class="form-group">
                    <label class="col-md-3 control-label"  for="password1">
                        <?php echo $this->_tpl_vars['locale']['22']; ?>

                        <i class="icon-info-circled-alt" data-original-title="<?php echo $this->_tpl_vars['locale']['988']; ?>
"  data-placement="top" data-toggle="tooltip"></i>
                        <?php if ($this->_tpl_vars['settings']['unreg'] != 1): ?>
                            <i class="fa fa-asterisk" aria-hidden="true" data-original-title="<?php echo $this->_tpl_vars['locale']['392']; ?>
"  data-placement="top" data-toggle="tooltip"></i>
                        <?php endif; ?>
                    </label>
                    <div class="col-md-8">
                        <input name="password1" id="password1"
                                value="" class="form-control" 
                                placeholder="<?php echo $this->_tpl_vars['locale']['22']; ?>
" <?php if ($this->_tpl_vars['settings']['unreg'] != 1): ?>required=""<?php endif; ?> 
                                type="password">
                        <input name="password2" id="password2" 
                                value="" class="form-control" 
                                placeholder="<?php echo $this->_tpl_vars['locale']['33']; ?>
" <?php if ($this->_tpl_vars['settings']['unreg'] != 1): ?>required=""<?php endif; ?> 
                                type="password"
                                style="display:none;">
                        <div class="alert alert-success" style="display: none;" id="password_success">
                            <i class="fa fa-check" aria-hidden="true"></i> <?php echo $this->_tpl_vars['locale']['1179']; ?>

                        </div>
                        <div class="alert alert-warning" style="display: none;" id="password_warning">
                            <i class="fa fa-exclamation" aria-hidden="true"></i> <?php echo $this->_tpl_vars['locale']['1180']; ?>

                        </div>
                        <div class="alert alert-info" style="display: none;" id="password_info">
                            <i class="fa fa-exclamation" aria-hidden="true"></i> <?php echo $this->_tpl_vars['locale']['1181']; ?>

                        </div>
                        
                    </div>
                </div>
            <?php endif; ?>
        <?php endif; ?>
        <div class="form-group">
            <label class="col-md-3 control-label"  for="title">
                <?php echo $this->_tpl_vars['locale']['72']; ?>

                <i class="icon-info-circled-alt" data-original-title="<?php echo $this->_tpl_vars['locale']['73']; ?>
"  data-placement="top" data-toggle="tooltip"></i>
                <i class="fa fa-asterisk" aria-hidden="true" data-original-title="<?php echo $this->_tpl_vars['locale']['392']; ?>
"  data-placement="top" data-toggle="tooltip"></i>                
            </label>
            <div class="col-md-8">
                <input value="<?php echo $this->_tpl_vars['check']['title']; ?>
" maxlength="<?php echo $this->_tpl_vars['settings']['max_title']; ?>
" data-default="Загаловок" name="title" data-original-title="<?php echo $this->_tpl_vars['locale']['73']; ?>
" class="form-control calcletters" placeholder="<?php echo $this->_tpl_vars['locale']['72']; ?>
" required="" type="text">
            </div>
        </div>  
        <?php if (! $this->_tpl_vars['editable']): ?>
		
		<div class="form-group text_field">
            <div class="col-md-12">
                <p>
                    <label>
                            <?php echo $this->_tpl_vars['locale']['74']; ?>

                            <i class="icon-info-circled-alt" data-original-title="<?php echo $this->_tpl_vars['locale']['75']; ?>
 <?php echo $this->_tpl_vars['settings']['max_text']; ?>
"  data-placement="top" data-toggle="tooltip"></i>
                            <i class="fa fa-asterisk" aria-hidden="true" data-original-title="<?php echo $this->_tpl_vars['locale']['392']; ?>
"  data-placement="top" data-toggle="tooltip"></i>
                    </label>
                </p>
        		<?php if ($this->_tpl_vars['settings']['fckeditor'] == 1): ?>
        		  <textarea required="" maxlength="<?php echo $this->_tpl_vars['settings']['max_text']; ?>
" class="form-control ckeditor" name="content"><?php echo $this->_tpl_vars['check']['content']; ?>
</textarea>
        		<?php else: ?>
        		  <textarea required="" maxlength="<?php echo $this->_tpl_vars['settings']['max_text']; ?>
" class="form-control calcletters" name="content" rows="5"><?php echo $this->_tpl_vars['check']['content']; ?>
</textarea>
        		<?php endif; ?>
            </div>
        </div>
		
            <div class="form-group">
                <label class="col-md-3 control-label"  for="timing">
                    <?php echo $this->_tpl_vars['locale']['78']; ?>

                    <i class="icon-info-circled-alt" data-original-title="<?php echo $this->_tpl_vars['locale']['77']; ?>
"  data-placement="top" data-toggle="tooltip"></i>
                    <i class="fa fa-asterisk" aria-hidden="true" data-original-title="<?php echo $this->_tpl_vars['locale']['392']; ?>
"  data-placement="top" data-toggle="tooltip"></i>
                </label>
                <div class="col-md-8">
        			<?php if ($this->_tpl_vars['settings']['active_service'] == 1): ?>
        				<?php if (! $this->_tpl_vars['editable']): ?>
        					<iframe src="<?php echo $this->_tpl_vars['settings']['patch']; ?>
timing/?days=<?php echo $this->_tpl_vars['check']['active_days']; ?>
" id="frame_days"></iframe>
        				    <input name="active_service" id="active_service" type="hidden" value="<?php echo $this->_tpl_vars['check']['active_service']; ?>
"/>
        				    <input name="active_days" id="active_days" type="hidden" value="<?php echo $this->_tpl_vars['check']['active_days']; ?>
"/>
        			    <?php endif; ?>
        			<?php else: ?>
        				<select size="1" name="timing" class="form-control" required="">
        					<option><?php echo $this->_tpl_vars['locale']['81']; ?>
</option>
        					<?php $_from = $this->_tpl_vars['timing']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['time']):
?>
        					   <option value="<?php echo $this->_tpl_vars['time']['id']; ?>
" <?php if ($this->_tpl_vars['check']['timing'] == $this->_tpl_vars['time']['id']): ?>selected<?php endif; ?>><?php echo $this->_tpl_vars['time']['text']; ?>
</option>
        					<?php endforeach; endif; unset($_from); ?>
        				</select>
        			<?php endif; ?>
                </div>
            </div> 
        <?php endif; ?>
        <div class="form-group multiselect_cont">
            <label class="col-md-3 control-label">
                <?php echo $this->_tpl_vars['locale']['83']; ?>

                <i class="icon-info-circled-alt" data-original-title="<?php echo $this->_tpl_vars['locale']['84']; ?>
"  data-placement="top" data-toggle="tooltip"></i>
                <i class="fa fa-asterisk" aria-hidden="true" data-original-title="<?php echo $this->_tpl_vars['locale']['392']; ?>
"  data-placement="top" data-toggle="tooltip"></i>
            </label>
            <div class="col-md-8">
                <div class="multiselect" data-action="" data-name="region" data-default="<?php echo $this->_tpl_vars['region_default']; ?>
">
                    <p class="text-info"><?php echo $this->_tpl_vars['allregions'][$this->_tpl_vars['region_default']]['name']; ?>
 <a class="btn btn-warning btn-xs" href="#"><?php echo $this->_tpl_vars['locale']['837']; ?>
</a></p>
                </div>
                <div class="alert alert-success" id="alert_region_success" style="display: none;"><?php echo $this->_tpl_vars['locale']['82']; ?>
</div>
                <div class="alert alert-warning" id="alert_region_warning" style="display: none;"><?php echo $this->_tpl_vars['locale']['1177']; ?>
</div>
            </div>
        </div> 
        <div class="form-group multiselect_cont">
            <label class="col-md-3 control-label" >
                <?php echo $this->_tpl_vars['locale']['79']; ?>

                <i class="icon-info-circled-alt" data-original-title="<?php echo $this->_tpl_vars['locale']['80']; ?>
"  data-placement="top" data-toggle="tooltip"></i>
                <i class="fa fa-asterisk" aria-hidden="true" data-original-title="<?php echo $this->_tpl_vars['locale']['392']; ?>
"  data-placement="top" data-toggle="tooltip"></i>
            </label>
            <div class="col-md-8">
                <!--div class="multiselect" data-action="load" data-name="cat" data-default="{769}"-->
				<div class="multiselect" data-action="load" data-name="cat" data-default="<?php echo $this->_tpl_vars['cat_default']; ?>
">
                    <p class="text-info"><?php echo $this->_tpl_vars['allcategories'][$this->_tpl_vars['cat_default']]['name']; ?>
 <a class="btn btn-warning btn-xs" href="#"><?php echo $this->_tpl_vars['locale']['837']; ?>
</a></p>
                </div>
                <div class="alert alert-success" id="alert_cat_success" style="display: none;"><?php echo $this->_tpl_vars['locale']['82']; ?>
</div>
                <div class="alert alert-warning" id="alert_cat_warning" style="display: none;"><?php echo $this->_tpl_vars['locale']['1177']; ?>
</div>
            </div>
        </div> 
        <div id="fields">
            <div id="fields_loading" style="display: none;"><i class="fa fa-spinner fa-pulse fa-3x" aria-hidden="true"></i></div>
        </div>
        
         
               
        <!--div class="form-group">
            <label class="col-md-3 control-label">
                    <?php echo $this->_tpl_vars['locale']['107']; ?>

                    <i class="icon-info-circled-alt" data-original-title="<?php echo $this->_tpl_vars['locale']['106']; ?>
"  data-placement="top" data-toggle="tooltip"></i>
            </label>
            <div class="col-md-8">
                <input name="tagsinput" type="text" value="<?php echo $this->_tpl_vars['check']['tags']; ?>
" id="tagsinput" class="form-control">
        		<div id="tag_block">
        			<?php $_from = $this->_tpl_vars['settings']['tags']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['tag']):
?>
                        <?php if (trim ( $this->_tpl_vars['tag']['tag_name'] ) != ""): ?>
        				    <a href="#"><?php echo $this->_tpl_vars['tag']['tag_name']; ?>
</a>&nbsp;
                        <?php endif; ?>
                    <?php endforeach; endif; unset($_from); ?>
        		</div>
            </div>
        </div-->
    	<?php if ($this->_tpl_vars['settings']['captcha'] == 1): ?>
            <div class="form-group">
                <?php if ($this->_tpl_vars['settings']['captcha_type'] == 3): ?>
                    <div class="col-md-8 col-md-offset-3">
                        <script src="https://www.google.com/recaptcha/api.js"></script>
                        <div class="g-recaptcha" data-sitekey="<?php echo $this->_tpl_vars['settings']['recaptcha1']; ?>
"></div>
                    </div>
                <?php else: ?>
                    <label class="col-md-3 control-label">
                            <?php echo $this->_tpl_vars['locale']['44']; ?>

                            <i class="icon-info-circled-alt" data-original-title="<?php echo $this->_tpl_vars['locale']['45']; ?>
"  data-placement="top" data-toggle="tooltip"></i>
                            <i class="fa fa-asterisk" aria-hidden="true" data-original-title="<?php echo $this->_tpl_vars['locale']['392']; ?>
"  data-placement="top" data-toggle="tooltip"></i>
                    </label>
                    <div class="col-md-8">
                        <div class="captcha_cont">
                            <img src='<?php echo $this->_tpl_vars['settings']['path']; ?>
captcha/<?php echo ((is_array($_tmp='100000')) ? $this->_run_mod_handler('mt_rand', true, $_tmp, 900000) : mt_rand($_tmp, 900000)); ?>
'>
                            <input name="captcha" required="" class="form-control required" type="number" placeholder="<?php echo $this->_tpl_vars['locale']['1182']; ?>
" autocomplete="off">
                        </div>
                    </div>
                <?php endif; ?>
            </div>
    	<?php endif; ?>
    	<?php if ($this->_tpl_vars['settings']['license_text'] != ""): ?>
            <div class="form-group">
                <div class="col-md-8 col-md-offset-3">
                    <div class="checkbox"><label><!--input type="checkbox" required=""--> <?php echo $this->_tpl_vars['locale']['1263']; ?>
</label></div>
                </div>
            </div>
            <div class="modal fade" id="license_text" tabindex="-1" role="dialog" aria-labelledby="license_title" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span
                                    class="sr-only">Close</span></button>
                            <h4 class="modal-title" id="license_title"><?php echo $this->_tpl_vars['locale']['1262']; ?>
</h4>
                        </div>
                        <div class="modal-body">
                            <?php echo ((is_array($_tmp=$this->_tpl_vars['settings']['license_text'])) ? $this->_run_mod_handler('nl2br', true, $_tmp) : smarty_modifier_nl2br($_tmp)); ?>

                        </div>
                    </div>
                </div>
            </div>
    	<?php endif; ?>
        <div class="form-group form_submit">
            <div class="col-md-12">
                <input class="btn btn-success btn-lg" type="submit" name="submit" value="<?php echo $this->_tpl_vars['locale']['55']; ?>
">
            </div>
        </div>
    </form>
<?php endif; ?>