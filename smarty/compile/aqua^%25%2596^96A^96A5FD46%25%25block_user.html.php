<?php /* Smarty version 2.6.25, created on 2018-04-19 13:48:12
         compiled from block_user.html */ ?>
<?php require_once(SMARTY_CORE_DIR . 'core.load_plugins.php');
smarty_core_load_plugins(array('plugins' => array(array('modifier', 'date_format', 'block_user.html', 49, false),)), $this); ?>
<?php if ($this->_tpl_vars['settings']['user']): ?>

    <div class="user-panel-sidebar">
        <div class="collapse-box">
            <h5 class="collapse-title no-border"> 
                <a href="#userpanel_ads" data-toggle="collapse">
                    <?php echo $this->_tpl_vars['locale']['1106']; ?>

                    <span class="pull-right"><i class="fa fa-angle-down "></i></span>
                </a>
            </h5>
    
            <div class="panel-collapse collapse in" id="userpanel_ads">
                <ul class="acc-list">
                    <li>
                        <a <?php if ($this->_supers['get']['cat']['0'] == 'users' && $this->_supers['get']['cat']['1'] == ""): ?>class="active"<?php endif; ?> href="<?php echo $this->_tpl_vars['settings']['path']; ?>
users/">
                            <i class="icon-docs"></i> <?php echo $this->_tpl_vars['locale']['61']; ?>
 <?php if ($this->_tpl_vars['counter']['user']['pub']): ?><span class="badge"><?php echo $this->_tpl_vars['counter']['user']['pub']; ?>
</span><?php endif; ?>
                        </a>
                    </li>
                    <li>
                        <a <?php if ($this->_supers['get']['cat']['0'] == 'users' && $this->_supers['get']['cat']['1'] == 'moderated'): ?>class="active"<?php endif; ?> href="<?php echo $this->_tpl_vars['settings']['path']; ?>
users/moderated/">
                            <i class="icon-hourglass"></i> <?php echo $this->_tpl_vars['locale']['979']; ?>
 <?php if ($this->_tpl_vars['counter']['user']['mod']): ?><span class="badge"><?php echo $this->_tpl_vars['counter']['user']['mod']; ?>
</span><?php endif; ?>
                        </a>
                    </li>
                    <li>
                        <a <?php if ($this->_supers['get']['cat']['0'] == 'users' && $this->_supers['get']['cat']['1'] == 'deleted'): ?>class="active"<?php endif; ?> href="<?php echo $this->_tpl_vars['settings']['path']; ?>
users/deleted/">
                            <i class=" icon-trash"></i> <?php echo $this->_tpl_vars['locale']['980']; ?>
 <?php if ($this->_tpl_vars['counter']['user']['del']): ?><span class="badge"><?php echo $this->_tpl_vars['counter']['user']['del']; ?>
</span><?php endif; ?>
                        </a>
                    </li>
                    <?php if ($this->_tpl_vars['settings']['update_allow'] == 1): ?>
                        <li>
                            <a <?php if ($this->_supers['get']['cat']['0'] == 'users' && $this->_supers['get']['cat']['1'] == 'update'): ?>class="active"<?php endif; ?> href="<?php echo $this->_tpl_vars['settings']['path']; ?>
users/update/">
                                <i class=" icon-arrows-cw-1"></i> <?php echo $this->_tpl_vars['locale']['1178']; ?>
 <?php if ($this->_tpl_vars['counter']['user']['upd']): ?><span class="badge"><?php echo $this->_tpl_vars['counter']['user']['upd']; ?>
</span><?php endif; ?>
                            </a>
                        </li>
                    <?php endif; ?>
    
                </ul>
            </div>
        </div>
    
        <?php if ($this->_tpl_vars['settings']['shop'] == 1): ?>
    
            <div class="collapse-box">
                <h5 class="collapse-title no-border"> 
                    <a href="#userpanel_shop" data-toggle="collapse">
                        <?php echo $this->_tpl_vars['locale']['1104']; ?>

                        <?php if ($this->_tpl_vars['settings']['shop_pay'] == 1): ?>
                            <?php if ($this->_tpl_vars['settings']['user']['shop']['next_pay_timestamp']): ?>
                            <span class="badge"><?php echo $this->_tpl_vars['locale']['1169']; ?>
 <?php echo ((is_array($_tmp=$this->_tpl_vars['settings']['user']['shop']['next_pay_timestamp'])) ? $this->_run_mod_handler('date_format', true, $_tmp, "%d.%m.%Y") : smarty_modifier_date_format($_tmp, "%d.%m.%Y")); ?>
</span>
                            <?php endif; ?>
                        <?php endif; ?>
                        <span class="pull-right">
                            <i class="fa fa-angle-down"></i>
                        </span>
                    </a>
                </h5>
    
                <div class="panel-collapse collapse in" id="userpanel_shop">
                    <ul class="acc-list">
                        <li>
                            <a <?php if ($this->_supers['get']['cat']['0'] == 'users' && $this->_supers['get']['cat']['1'] == 'shop' && $this->_supers['get']['act'] == ""): ?>class="active"<?php endif; ?> href="<?php echo $this->_tpl_vars['settings']['path']; ?>
users/shop/">
                                <i class="icon-info"></i> <?php echo $this->_tpl_vars['locale']['1121']; ?>

                            </a>
                        </li>
                        <li>
                            <a <?php if ($this->_supers['get']['cat']['0'] == 'users' && $this->_supers['get']['cat']['1'] == 'shop' && $this->_supers['get']['act'] == 'contacts'): ?>class="active"<?php endif; ?> href="<?php echo $this->_tpl_vars['settings']['path']; ?>
users/shop/?act=contacts">
                                <i class="icon-address"></i> <?php echo $this->_tpl_vars['locale']['1122']; ?>

                            </a>
                        </li>
                        <li>
                            <a <?php if ($this->_supers['get']['cat']['0'] == 'users' && $this->_supers['get']['cat']['1'] == 'shop' && $this->_supers['get']['act'] == 'delivery'): ?>class="active"<?php endif; ?> href="<?php echo $this->_tpl_vars['settings']['path']; ?>
users/shop/?act=delivery">
                                <i class="icon-truck-1"></i> <?php echo $this->_tpl_vars['locale']['1123']; ?>

                            </a>
                        </li>
                        <li>
                            <a <?php if ($this->_supers['get']['cat']['0'] == 'users' && $this->_supers['get']['cat']['1'] == 'worktime' && $this->_supers['get']['act'] == 'delivery'): ?>class="active"<?php endif; ?> href="<?php echo $this->_tpl_vars['settings']['path']; ?>
users/shop/?act=worktime">
                                <i class="icon-clock"></i> <?php echo $this->_tpl_vars['locale']['1231']; ?>

                            </a>
                        </li>
    
    
                    </ul>
                </div>
            </div>
        
        <?php endif; ?>                            
    
        <div class="collapse-box">
            <h5 class="collapse-title no-border"> 
                <a href="#userpanel_opt" data-toggle="collapse">
                    <?php echo $this->_tpl_vars['locale']['306']; ?>

                    <span class="pull-right"><i class="fa fa-angle-down"></i></span>
                </a>
            </h5>
    
            <div class="panel-collapse collapse in" id="userpanel_opt">
                <ul class="acc-list">
                    <li>
                        <a <?php if ($this->_supers['get']['cat']['0'] == 'users' && $this->_supers['get']['cat']['1'] == 'info'): ?>class="active"<?php endif; ?> href="<?php echo $this->_tpl_vars['settings']['path']; ?>
users/info/">
                            <i class="fa fa-lock" aria-hidden="true"></i> <?php echo $this->_tpl_vars['locale']['126']; ?>

                        </a>
                    </li>
                    <li>
                        <a <?php if ($this->_supers['get']['cat']['0'] == 'users' && $this->_supers['get']['cat']['1'] == 'subscribe'): ?>class="active"<?php endif; ?> href="<?php echo $this->_tpl_vars['settings']['path']; ?>
users/subscribe/">
                            <i class="fa fa-envelope-o" aria-hidden="true"></i> <?php echo $this->_tpl_vars['locale']['62']; ?>

                        </a>
                    </li>
                    <li>
                        <a <?php if ($this->_supers['get']['cat']['0'] == 'users' && $this->_supers['get']['cat']['1'] == 'orders'): ?>class="active"<?php endif; ?> href="<?php echo $this->_tpl_vars['settings']['path']; ?>
users/orders/">
                            <i class="fa fa-shopping-bag" aria-hidden="true"></i> <?php echo $this->_tpl_vars['locale']['209']; ?>

                        </a>
                    </li>
                    <li>
                        <a <?php if ($this->_supers['get']['cat']['0'] == 'users' && $this->_supers['get']['cat']['1'] == 'order'): ?>class="active"<?php endif; ?> href="<?php echo $this->_tpl_vars['settings']['path']; ?>
users/order/">
                            <i class="fa fa-cart-plus" aria-hidden="true"></i> <?php echo $this->_tpl_vars['locale']['65']; ?>

                        </a>
                    </li>
                    <li>
                        <a <?php if ($this->_supers['get']['cat']['0'] == 'users' && $this->_supers['get']['cat']['1'] == 'state'): ?>class="active"<?php endif; ?> href="<?php echo $this->_tpl_vars['settings']['path']; ?>
users/state/">
                            <i class="fa fa-list-alt" aria-hidden="true"></i> <?php echo $this->_tpl_vars['locale']['63']; ?>

                        </a>
                    </li>
                    <li>
                        <a <?php if ($this->_supers['get']['cat']['0'] == 'users' && $this->_supers['get']['cat']['1'] == 'pay'): ?>class="active"<?php endif; ?> href="<?php echo $this->_tpl_vars['settings']['path']; ?>
users/pay/">
                            <i class="fa fa-money" aria-hidden="true"></i> <?php echo $this->_tpl_vars['locale']['64']; ?>
 <span class="badge"><?php echo $this->_tpl_vars['settings']['user']['balance']; ?>
 <?php echo $this->_tpl_vars['currency_names'][$this->_tpl_vars['settings']['currency']]['name2']; ?>
</span>
                        </a>
                    </li>
    
                    <li>
                        <a href="#" onclick="if(confirm('<?php echo $this->_tpl_vars['locale']['43']; ?>
')){document.location.href='<?php echo $this->_tpl_vars['settings']['path']; ?>
users/exit/';}return false;">
                            <i class="fa fa-sign-out" aria-hidden="true"></i> <?php echo $this->_tpl_vars['locale']['42']; ?>

                        </a>
                    </li>
    
    
    
    
                </ul>
            </div>
        </div>
    
    </div>

<?php else: ?>
        <?php if ($this->_supers['post']['submit_login2'] && ! $this->_tpl_vars['settings']['user'] && $this->_supers['get']['cat']['0'] != 'users'): ?>
            <div class="alert alert-warning alert-dismissable">
                <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                <?php echo $this->_tpl_vars['locale']['1183']; ?>

            </div>
        <?php endif; ?>
        <form role="form" method="POST" action="" name="login_block">
            <div class="form-group">
                <label for="sender-email" class="control-label"><?php if ($this->_tpl_vars['settings']['sms'] == 1): ?><?php echo $this->_tpl_vars['locale']['1184']; ?>
<?php else: ?><?php echo $this->_tpl_vars['locale']['21']; ?>
<?php endif; ?>:</label>

                <div class="input-icon"><i class="icon-user fa"></i>
                    <input name="email_login2" id="sender-email" type="text" placeholder="<?php if ($this->_tpl_vars['settings']['sms'] == 1): ?><?php echo $this->_tpl_vars['locale']['1184']; ?>
<?php else: ?><?php echo $this->_tpl_vars['locale']['21']; ?>
<?php endif; ?>" class="form-control email">
                </div>
            </div>
            <div class="form-group">
                <label for="user-pass" class="control-label"><?php echo $this->_tpl_vars['locale']['22']; ?>
:</label>

                <div class="input-icon"><i class="icon-lock fa"></i>
                    <input name="password_login2" type="password" class="form-control" placeholder="<?php echo $this->_tpl_vars['locale']['22']; ?>
" id="user-pass">
                </div>
            </div>
            <div class="form-group">
                <button type="submit"  class="btn btn-primary  btn-block"><?php echo $this->_tpl_vars['locale']['23']; ?>
</button>
            </div>
            <input name="submit_login2" value="1" type="hidden" />
        </form>


        <?php if ($this->_tpl_vars['settings']['ulogin'] == 1): ?>
            <div class="text-center">
                <div id="uLogin" data-ulogin="display=small;fields=first_name,last_name,email;verify=1;providers=vkontakte,odnoklassniki,mailru,facebook,twitter,yandex,google,liveid,livejournal;hidden=other;redirect_uri=<?php echo $this->_tpl_vars['settings']['http']; ?>
%3A%2F%2F<?php echo $this->_supers['server']['HTTP_HOST']; ?>
<?php echo @PATH; ?>
users/?ulogin"></div>
            </div>
        <?php endif; ?>

        <hr />

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

        <div style=" clear:both"></div>
        
<?php endif; ?>