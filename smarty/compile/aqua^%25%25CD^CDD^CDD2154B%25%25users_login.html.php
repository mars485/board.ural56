<?php /* Smarty version 2.6.25, created on 2018-04-19 13:48:12
         compiled from users_login.html */ ?>


<h3><?php echo $this->_tpl_vars['locale']['20']; ?>
</h3>

<?php if ($this->_supers['post']['submit_login2'] && ! $this->_tpl_vars['settings']['user']): ?>
    <div class="alert alert-warning">
        <?php echo $this->_tpl_vars['locale']['1183']; ?>

    </div>
<?php endif; ?>

<form role="form" method="POST" action="" name="login_page" class="form-horizontal">
    <div class="form-group ">
        <label for="sender-email" class="control-label col-md-4"><?php if ($this->_tpl_vars['settings']['sms'] == 1): ?><?php echo $this->_tpl_vars['locale']['1184']; ?>
<?php else: ?><?php echo $this->_tpl_vars['locale']['21']; ?>
<?php endif; ?>:</label>
        <div class="col-md-6">
            <div class="input-icon"><i class="icon-user fa"></i>
                <input name="email_login2" id="sender-email" type="text" placeholder="<?php if ($this->_tpl_vars['settings']['sms'] == 1): ?><?php echo $this->_tpl_vars['locale']['1184']; ?>
<?php else: ?><?php echo $this->_tpl_vars['locale']['21']; ?>
<?php endif; ?>" class="form-control email">
            </div>
        </div>
    </div>
    <div class="form-group">
        <label for="user-pass" class="control-label col-md-4"><?php echo $this->_tpl_vars['locale']['22']; ?>
:</label>
        <div class="col-md-6">
            <div class="input-icon"><i class="icon-lock fa"></i>
                <input name="password_login2" type="password" class="form-control" placeholder="<?php echo $this->_tpl_vars['locale']['22']; ?>
" id="user-pass">
            </div>
        </div>
    </div>
    <div class="form-group">
        <div class="col-md-6 col-md-offset-4">
            <button type="submit"  class="btn btn-primary  btn-block"><?php echo $this->_tpl_vars['locale']['23']; ?>
</button>
        </div>
    </div>
    <?php if ($this->_tpl_vars['settings']['ulogin'] == 1): ?>
        <div class="form-group">
            <div class="col-md-6 col-md-offset-4">
                <div id="uLogin2" data-ulogin="display=panel;fields=first_name,last_name,email;verify=1;providers=vkontakte,facebook,odnoklassniki,mailru,twitter;hidden=other;redirect_uri=<?php echo $this->_tpl_vars['settings']['http']; ?>
%3A%2F%2F<?php echo $this->_supers['server']['HTTP_HOST']; ?>
<?php echo @PATH; ?>
users/?ulogin"></div>
            </div>
        </div>
    <?php endif; ?>
    <div class="form-group">
        <div class="col-md-8 col-md-offset-2">
        <p class="pull-left">
            <a href="<?php echo $this->_tpl_vars['settings']['path']; ?>
users/register/"><i class="fa fa-user-plus" aria-hidden="true"></i> <?php echo $this->_tpl_vars['locale']['24']; ?>
 </a>
        </p>


        <p class="pull-right">
            <a href="<?php echo $this->_tpl_vars['settings']['path']; ?>
users/password_recovery/"><i class="fa fa-unlock-alt" aria-hidden="true"></i> <?php echo $this->_tpl_vars['locale']['519']; ?>
 </a>
        </p>
        </div>
    </div>

    <input name="submit_login2" value="1" type="hidden" />
</form>




