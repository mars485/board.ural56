<?php /* Smarty version 2.6.25, created on 2018-04-22 07:51:30
         compiled from users_registr.html */ ?>
<?php require_once(SMARTY_CORE_DIR . 'core.load_plugins.php');
smarty_core_load_plugins(array('plugins' => array(array('modifier', 'nl2br', 'users_registr.html', 130, false),array('modifier', 'mt_rand', 'users_registr.html', 147, false),)), $this); ?>

<?php if ($this->_tpl_vars['check']['err']): ?>
    <div class='error'>
        <ul>
            <?php $_from = $this->_tpl_vars['check']['err']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['err']):
?>
                <li><?php echo $this->_tpl_vars['err']; ?>
</li>
            <?php endforeach; endif; unset($_from); ?>
        </ul>
    </div>
<?php endif; ?>

<div class="registr_block1" id="panel_reg">
    <form name='panel_reg' action='' method='post' class="form-horizontal">
    <?php if ($this->_tpl_vars['settings']['sms'] == 1): ?>
        <input type="hidden" name="stcode" value=""/>
        <?php if ($this->_tpl_vars['settings']['user']): ?>
            <?php if ($this->_tpl_vars['settings']['user']['phone'] == ""): ?>
                <div class="alert alert-warning">
                    <p class="lead">
                        <?php echo $this->_tpl_vars['locale']['824']; ?>

                    </p>
                </div>
            <?php else: ?>
                <div class="alert alert-success">
                    <p class="lead">
                        <?php echo $this->_tpl_vars['locale']['825']; ?>
: <b>+<?php echo $this->_tpl_vars['settings']['user']['phone']; ?>
</b>
                        <a class="btn btn-warning btn-xs" href='#' id='changephone'>
                            <?php echo $this->_tpl_vars['locale']['837']; ?>

                        </a>
                    </p>
                </div>
                <style>
                #phone_field{
                    display: none;
                }
                </style>
            <?php endif; ?>
        <?php endif; ?>
        <div id="phone_field">
            <div class="form-group">
                <label class="col-md-4 control-label"  for="rphone">
                    <?php echo $this->_tpl_vars['locale']['409']; ?>

                    <i class="icon-info-circled-alt" data-original-title="<?php echo $this->_tpl_vars['locale']['806']; ?>
"  data-placement="top" data-toggle="tooltip"></i>
                </label>
                <div class="col-md-7">
                    <input id="rphone" class="form-control" 
                        data-text1="<?php echo $this->_tpl_vars['locale']['808']; ?>
" 
                    name='phone' type='text' value='<?php echo $this->_tpl_vars['check']['stcode']; ?>
<?php echo $this->_tpl_vars['check']['phone']; ?>
'>
                </div>
            </div>
            <div id="phone_confirm" <?php if ($this->_supers['post']['submit_registr'] == ''): ?>style='display:none;'<?php endif; ?>>
                <div class="form-group">
                    <div class="col-md-11 text-center">
                        <input class="btn btn-success" type='button' id='sendsms' value='<?php echo $this->_tpl_vars['locale']['816']; ?>
' 
                            data-text1="<?php echo $this->_tpl_vars['locale']['812']; ?>
" 
                            name='<?php echo $this->_tpl_vars['check']['stcode']; ?>
<?php echo $this->_tpl_vars['check']['phone']; ?>
' >
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-md-4 control-label"  for="rphone">
                        <?php echo $this->_tpl_vars['locale']['807']; ?>

                    </label>
                    <div class="col-md-7">
                        <input id='phonecode' class='form-control' name='code' type='text' value='<?php echo $this->_tpl_vars['check']['code']; ?>
' autocomplete="off">
                    </div>
                </div>
            </div>
        </div>
    <?php endif; ?>

    <div class="form-group">
        <label class="col-md-4 control-label"  for="remail">
            <?php echo $this->_tpl_vars['locale']['26']; ?>

            <i class="icon-info-circled-alt" data-original-title="<?php echo $this->_tpl_vars['tip_email']; ?>
"  data-placement="top" data-toggle="tooltip"></i>
        </label>
        <div class="col-md-7">
            <input id="remail" class="form-control" placeholder="<?php echo $this->_tpl_vars['locale']['26']; ?>
" required="" class='form-control' name='email' type='email' value='<?php echo $this->_tpl_vars['check']['email']; ?>
'>
        </div>
    </div>
    <div class="form-group">
        <label class="col-md-4 control-label"  for="rname">
            <?php echo $this->_tpl_vars['locale']['28']; ?>

            <i class="icon-info-circled-alt" data-original-title="<?php echo $this->_tpl_vars['locale']['29']; ?>
"  data-placement="top" data-toggle="tooltip"></i>
        </label>
        <div class="col-md-7">
            <input id="rname" class="form-control" placeholder="<?php echo $this->_tpl_vars['locale']['28']; ?>
" required="" class='form-control' name='name' type='text' value='<?php echo $this->_tpl_vars['check']['name']; ?>
'>
        </div>
    </div>
    <div class="form-group">
        <label class="col-md-4 control-label"  for="password1">
            <?php echo $this->_tpl_vars['locale']['22']; ?>

            <i class="icon-info-circled-alt" data-original-title="<?php echo $this->_tpl_vars['ps1']; ?>
"  data-placement="top" data-toggle="tooltip"></i>
        </label>
        <div class="col-md-7">
            <input name="password" id="password1"
                    value="<?php echo $this->_tpl_vars['check']['password']; ?>
" class="form-control" 
                    placeholder="<?php echo $this->_tpl_vars['ps2']; ?>
"
                    type="password">
            <input name="password1" id="password2" 
                    value="<?php echo $this->_tpl_vars['check']['password1']; ?>
" class="form-control" 
                    placeholder="<?php echo $this->_tpl_vars['locale']['33']; ?>
"
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
    <div class="form-group">
        <div class="col-md-7  col-md-offset-4">
            <div class="checkbox"><label><input type="checkbox" required=""> <a class=license href=#><?php echo $this->_tpl_vars['locale']['1310']; ?>
</a></label></div>
        </div>
    </div>
    <div class="modal fade" id="license_text" tabindex="-1" role="dialog" aria-labelledby="license_title" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span
                            class="sr-only">Close</span></button>
                    <h4 class="modal-title" id="license_title"><?php echo $this->_tpl_vars['locale']['1310']; ?>
</h4>
                </div>
                <div class="modal-body">
                    <?php echo ((is_array($_tmp=$this->_tpl_vars['settings']['license_reg_text'])) ? $this->_run_mod_handler('nl2br', true, $_tmp) : smarty_modifier_nl2br($_tmp)); ?>

                </div>
            </div>
        </div>
    </div>
	<?php if ($this->_tpl_vars['settings']['captcha'] == 1): ?>
        <div class="form-group">
            <label class="col-md-4 control-label">
                    <?php echo $this->_tpl_vars['locale']['44']; ?>

                    <i class="icon-info-circled-alt" data-original-title="<?php echo $this->_tpl_vars['locale']['45']; ?>
"  data-placement="top" data-toggle="tooltip"></i>
            </label>
            <div class="col-md-7">
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
	<?php endif; ?>
    <div class="form-group">
        <div class="col-md-7 col-md-offset-4">
            <input type='submit' name='submit_registr' value='<?php echo $this->_tpl_vars['locale']['34']; ?>
' class="btn btn-success">
        </div>
    </div>
    
    </form>
</div>

<?php if ($this->_tpl_vars['settings']['ulogin'] == 1): ?>
    <hr />
    <div class="row">
        <label class="col-md-4 text-right">
            <?php echo $this->_tpl_vars['locale']['1185']; ?>

        </label>
        <div class="col-md-7">
            <div id="uLogin2" data-ulogin="display=panel;fields=first_name,last_name,email;verify=1;providers=vkontakte,facebook,odnoklassniki,twitter;verify=1;hidden=other;redirect_uri=<?php echo $this->_tpl_vars['settings']['http']; ?>
%3A%2F%2F<?php echo $this->_supers['server']['HTTP_HOST']; ?>
<?php echo @PATH; ?>
users/?ulogin"></div>
        </div>
    </div>
    <p>&nbsp;</p>
<?php endif; ?>

