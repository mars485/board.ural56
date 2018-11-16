<?php /* Smarty version 2.6.25, created on 2018-11-16 16:26:50
         compiled from popup_sendmail.html */ ?>
<?php require_once(SMARTY_CORE_DIR . 'core.load_plugins.php');
smarty_core_load_plugins(array('plugins' => array(array('modifier', 'count', 'popup_sendmail.html', 22, false),array('modifier', 'mt_rand', 'popup_sendmail.html', 54, false),)), $this); ?>
<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="<?php echo $this->_tpl_vars['settings']['charset']; ?>
">
    <meta http-equiv="pragma" content="no-cache"/>
    <meta name="robots" content="noindex,nofollow"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><?php echo $this->_tpl_vars['locale']['157']; ?>
}</title>
    <!-- Bootstrap core CSS -->
    <link href="<?php echo @THEME; ?>
assets/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <!-- Custom styles for this template -->
    <link href="<?php echo @THEME; ?>
assets/css/style.css" rel="stylesheet">
</head>
<body>
    <div id="wrapper">

<!-- Modal contactAdvertiser -->
    <?php if ($this->_tpl_vars['send']): ?>
        <div class="alert alert-success" style="margin: 20px;"><?php echo $this->_tpl_vars['locale']['155']; ?>
</div>
    <?php else: ?>
    
    <?php if (count($this->_tpl_vars['err']) > 0): ?>
    	<div class="alert alert-danger" style="margin: 20px;">
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
    
        <form role="form" name="reply_form" action="" method="post">
            <div class="modal-body">
                
                    <div class="form-group">
                        <label for="recipient-name" class="control-label"><?php echo $this->_tpl_vars['locale']['28']; ?>
:</label>
                        <input name="name" required="" class="form-control required" id="recipient-name" placeholder="<?php echo $this->_tpl_vars['locale']['28']; ?>
" value="<?php echo $this->_supers['post']['name']; ?>
" type="text">
                    </div>
                    <div class="form-group">
                        <label for="sender-email" class="control-label">E-mail:</label>
                        <input name="email" required="" id="sender-email" type="email" class="form-control email" placeholder="email@example.com" value="<?php echo $this->_supers['post']['email']; ?>
">
                    </div>
                    <div class="form-group">
                        <label for="message-text" class="control-label"><?php echo $this->_tpl_vars['locale']['74']; ?>
:</label>
                        <textarea required="" name="message" class="form-control" id="message-text" placeholder="<?php echo $this->_tpl_vars['locale']['74']; ?>
"><?php echo $this->_supers['post']['message']; ?>
</textarea>
                    </div>
                    <div class="form-group">
                        <label for="captcha" class="control-label"><?php echo $this->_tpl_vars['locale']['44']; ?>
</label>
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
            <div class="modal-footer">
                <button type="submit" name="submit" class="btn btn-success pull-right"><?php echo $this->_tpl_vars['locale']['55']; ?>
!</button>
            </div>
        </form>
    <?php endif; ?>

<!-- /.modal -->



    </div>
</body>
</html>