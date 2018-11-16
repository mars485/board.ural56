<?php /* Smarty version 2.6.25, created on 2018-11-16 16:25:42
         compiled from comments.html */ ?>
<?php require_once(SMARTY_CORE_DIR . 'core.load_plugins.php');
smarty_core_load_plugins(array('plugins' => array(array('modifier', 'userdate', 'comments.html', 29, false),array('modifier', 'wordwrap', 'comments.html', 32, false),array('modifier', 'count', 'comments.html', 57, false),array('modifier', 'mt_rand', 'comments.html', 96, false),)), $this); ?>
<div class="blogs-comments-area">
	<h5 class="title-2">
    	<?php if ($this->_tpl_vars['message']['comments_count'] < 1): ?>
            <?php echo $this->_tpl_vars['locale']['1020']; ?>

        <?php else: ?>
            <?php echo $this->_tpl_vars['message']['comments_count_text']; ?>

        <?php endif; ?>
    </h5>

	<div class="blogs-comment-respond" id="respond">
        <?php if ($this->_tpl_vars['message']['comments_count'] < 1): ?>
            <div class="alert alert-warning"><?php echo $this->_tpl_vars['locale']['779']; ?>
</div>
        <?php else: ?>
    		<?php if ($this->_tpl_vars['message']['comments_count'] > 0): ?>      
                <ul class="blogs-comment-list">
        			<?php $_from = $this->_tpl_vars['message']['comments']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['comment']):
?>
                        <?php $this->assign('contact_link', ($this->_tpl_vars['settings']['path'])."sendmail/?comment_id=".($this->_tpl_vars['comment']['id'])."&userid=".($this->_tpl_vars['comment']['userinfo']['id'])); ?>
                        <?php if ($this->_tpl_vars['comment']['userinfo']): ?>
                            <?php $this->assign('username', $this->_tpl_vars['comment']['userinfo']['name']); ?>
                        <?php else: ?>
                            <?php $this->assign('username', $this->_tpl_vars['comment']['user_name']); ?>
                        <?php endif; ?>
                        
    					<li>
    						<div class="blogs-comment-wrapper">
    							<div class="blogs-comment-details">
    								<div class="blogs-comment-name">
    									<a href="<?php echo $this->_tpl_vars['contact_link']; ?>
" class="contact_modal"><?php echo $this->_tpl_vars['username']; ?>
 </a>
    									<span class="blogs-comment-date"><?php echo ((is_array($_tmp=$this->_tpl_vars['comment']['date'])) ? $this->_run_mod_handler('userdate', true, $_tmp) : dateFormat($_tmp)); ?>
</span>
    								</div>
    								<div class="blogs-comment-description">
    									<p><?php echo ((is_array($_tmp=$this->_tpl_vars['comment']['text'])) ? $this->_run_mod_handler('wordwrap', true, $_tmp, 100) : smarty_modifier_wordwrap($_tmp, 100)); ?>
</p>
    								</div>
                                    <?php if ($this->_tpl_vars['comment']['editable']): ?>
                                        <div class="blogs-comment-reply editblock">
                                            <a class="btn btn-primary btn-xs com_edit" data-id="<?php echo $this->_tpl_vars['comment']['id']; ?>
" href="#"> <i class="fa fa-edit"></i> <span><?php echo $this->_tpl_vars['locale']['200']; ?>
</span> </a>
                                            <a class="btn btn-danger btn-xs com_delete" data-id="<?php echo $this->_tpl_vars['comment']['id']; ?>
" href="#"> <i class=" fa fa-trash"></i> <span><?php echo $this->_tpl_vars['locale']['201']; ?>
</span> </a>
                                        </div>
                                    <?php endif; ?>
    							</div>
    						</div>
    					</li>

        			<?php endforeach; endif; unset($_from); ?>
                </ul>
    		<?php endif; ?>
        <?php endif; ?>
    
    
		<!--Comment list End-->



		<h3 class="blogs-comment-reply-title list-title"><?php echo $this->_tpl_vars['locale']['780']; ?>
</h3>
        <?php $this->assign('comtext', ""); ?>
    	<?php if ($this->_supers['post']['commentsubmit']): ?>
    			<?php if (count($this->_tpl_vars['message']['comment_err']) > 0): ?>
    				<div class="alert alert-danger">
    					<ul>
    						<?php $_from = $this->_tpl_vars['message']['comment_err']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['err']):
?>
    							<li><?php echo $this->_tpl_vars['err']; ?>
</li>
    						<?php endforeach; endif; unset($_from); ?>
    					</ul>
    				</div>
                    <?php $this->assign('comtext', $this->_supers['post']['comtext']); ?>
    			<?php else: ?>
    				<div class='alert alert-success'><?php echo $this->_tpl_vars['locale']['834']; ?>
</div>
    			<?php endif; ?>
    	<?php endif; ?>
        
        <?php if ($this->_tpl_vars['settings']['user'] || ( ! $this->_tpl_vars['settings']['user'] && $this->_tpl_vars['settings']['comment_unreg'] == 1 )): ?>
			<form class="blogs-comment-form" id="blogs-commentform" method="post" action="">
                <?php if (! $this->_tpl_vars['settings']['user']): ?>
					<div class="row form-group">
                        <div class="col-md-4 text-left"><span><?php echo $this->_tpl_vars['locale']['28']; ?>
</span></div>
						<div class="col-md-8">
                            <input required="" class="form-control" type="text" placeholder="<?php echo $this->_tpl_vars['locale']['28']; ?>
" value="<?php echo $this->_supers['post']['comusername']; ?>
" name="comusername">
                        </div>
						
					</div>
					<div class="row form-group">
                        <div class="col-md-4 text-left"><span><?php echo $this->_tpl_vars['locale']['26']; ?>
</span></div>
						<div class="col-md-8">
                            <input required="" class="form-control" type="email" placeholder="<?php echo $this->_tpl_vars['locale']['26']; ?>
" value="<?php echo $this->_supers['post']['comuseremail']; ?>
" name="comuseremail">
                        </div>	
					</div>
                <?php endif; ?>
				<div class="row form-group">
                    <div class="col-md-4 text-left"><span><?php echo $this->_tpl_vars['locale']['44']; ?>
</span></div>
					<div class="col-md-8">
                        <div class="captcha_cont">
                            <?php if ($this->_tpl_vars['settings']['captcha_type'] == 3): ?>
                                <script src="https://www.google.com/recaptcha/api.js"></script>
                                <div class="g-recaptcha" data-sitekey="<?php echo $this->_tpl_vars['settings']['recaptcha1']; ?>
"></div>
                            <?php else: ?>
                                <img src='<?php echo $this->_tpl_vars['settings']['path']; ?>
captcha/<?php echo ((is_array($_tmp='100000')) ? $this->_run_mod_handler('mt_rand', true, $_tmp, 900000) : mt_rand($_tmp, 900000)); ?>
'>
                                <input name="captcha" required="" class="form-control required" type="number" placeholder="<?php echo $this->_tpl_vars['locale']['1182']; ?>
" autocomplete="off">
                            <?php endif; ?>
                        </div>
                    </div>	
				</div>

				<div class="form-group">
					<textarea class="form-control" required="" placeholder="<?php echo $this->_tpl_vars['locale']['192']; ?>
" name="comtext"><?php echo $this->_tpl_vars['comtext']; ?>
</textarea>
                </div>
                <input type="hidden" name="commentsubmit" value="1" />
				<button type="submit" class="btn-success btn btn-lg"> <?php echo $this->_tpl_vars['locale']['55']; ?>
 </button>
                
            </form>
        <?php else: ?>
            <div class="alert alert-warning"><?php echo $this->_tpl_vars['locale']['788']; ?>
</div>
        <?php endif; ?>

	</div>
	<!-- #respond -->


</div>