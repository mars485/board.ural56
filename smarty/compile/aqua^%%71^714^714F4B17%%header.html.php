<?php /* Smarty version 2.6.25, created on 2018-04-18 16:16:54
         compiled from header.html */ ?>
<?php require_once(SMARTY_CORE_DIR . 'core.load_plugins.php');
smarty_core_load_plugins(array('plugins' => array(array('modifier', 'strip_tags', 'header.html', 22, false),array('modifier', 'count', 'header.html', 25, false),)), $this); ?>
<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="<?php echo $this->_tpl_vars['settings']['charset']; ?>
">
    <meta http-equiv="pragma" content="no-cache"/>
    <meta name="author" content="<?php echo $this->_tpl_vars['settings']['autor']; ?>
"/>
    <meta name="description" content="<?php echo $this->_tpl_vars['description']; ?>
"/>
    <meta name="keywords" content="<?php echo $this->_tpl_vars['keywords']; ?>
"/>
    <meta name="copyright" content="<?php echo $this->_tpl_vars['settings']['copyright']; ?>
"/>
    <?php if ($this->_tpl_vars['noindex']): ?>
    <meta name="robots" content="noindex,nofollow"/>
    <?php endif; ?>
    
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- Fav and touch icons -->
    <!-- Fav and touch icons -->
	<link rel="shortcut icon" href="/favicon.ico" type="image/x-icon">
    <link rel="apple-touch-icon" sizes="192x192" href="<?php echo @THEME; ?>
assets/ico/fav192.png">
    <link rel="icon" type="image/png" sizes="192x192" href="<?php echo @THEME; ?>
assets/ico/fav192.png">
    <title>
    <?php $_from = $this->_tpl_vars['title_reverse']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }$this->_foreach['i'] = array('total' => count($_from), 'iteration' => 0);
if ($this->_foreach['i']['total'] > 0):
    foreach ($_from as $this->_tpl_vars['tit']):
        $this->_foreach['i']['iteration']++;
?>
        <?php echo ((is_array($_tmp=$this->_tpl_vars['tit']['name'])) ? $this->_run_mod_handler('strip_tags', true, $_tmp) : smarty_modifier_strip_tags($_tmp)); ?>

        <?php if (($this->_foreach['i']['iteration'] == $this->_foreach['i']['total']) == false): ?> / <?php endif; ?>
    <?php endforeach; endif; unset($_from); ?>
    <?php if (count($this->_tpl_vars['regions']) > 0): ?>
        <?php echo $this->_tpl_vars['locale']['1019']; ?>

    	<?php $_from = $this->_tpl_vars['regions']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }$this->_foreach['i'] = array('total' => count($_from), 'iteration' => 0);
if ($this->_foreach['i']['total'] > 0):
    foreach ($_from as $this->_tpl_vars['region']):
        $this->_foreach['i']['iteration']++;
?>
            <?php echo $this->_tpl_vars['region']['name']; ?>
<?php if (($this->_foreach['i']['iteration'] == $this->_foreach['i']['total']) == false): ?>, <?php endif; ?>
    	<?php endforeach; endif; unset($_from); ?>
    <?php endif; ?>
    </title>
    <!-- Bootstrap core CSS -->
    <link href="<?php echo @THEME; ?>
assets/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <!-- styles needed for carousel slider -->
    <link href="<?php echo @THEME; ?>
assets/css/owl.carousel.css" rel="stylesheet">
    <link href="<?php echo @THEME; ?>
assets/css/owl.theme.css" rel="stylesheet">
    <!-- Custom styles for this template -->
    <link href="<?php echo @THEME; ?>
assets/css/style.css" rel="stylesheet">
    
    <?php if ($this->_tpl_vars['modtype'] == 'ind'): ?>
		<!-- SLIDER REVOLUTION 4.x CSS SETTINGS -->
		<link rel="stylesheet" href="<?php echo @THEME; ?>
assets/css/settings.css" media="screen" />
    <?php endif; ?>
    
    <script>
        var TPL_PATH = "<?php echo @PATH; ?>
";
        var TPL_PATH_THEME = '<?php echo @THEME; ?>
';
        var TPL_REGION_ID = <?php if ($this->_tpl_vars['second_region']['id']): ?><?php echo $this->_tpl_vars['second_region']['id']; ?>
<?php else: ?>0<?php endif; ?>;
        var TPL_AUTOROTATE = <?php if ($this->_tpl_vars['settings']['message_block_type'] == 2): ?>2000<?php else: ?>false<?php endif; ?>;
        var TPL_L_00 = '<?php echo $this->_tpl_vars['locale']['76']; ?>
';
        var TPL_L_01 = '<?php echo $this->_tpl_vars['locale']['184']; ?>
';
        var TPL_L_02 = '<?php echo $this->_tpl_vars['locale']['335']; ?>
';
        var TPL_L_03 = '<?php echo $this->_tpl_vars['locale']['43']; ?>
';
        var TPL_L_04 = '<?php echo $this->_tpl_vars['locale']['81']; ?>
';
        var TPL_L_05 = '<?php echo $this->_tpl_vars['locale']['82']; ?>
';
        var TPL_L_06 = '<?php echo $this->_tpl_vars['locale']['986']; ?>
';
        var TPL_L_07 = '<?php echo $this->_tpl_vars['locale']['1194']; ?>
';
        var TPL_L_08 = '<?php echo $this->_tpl_vars['locale']['1195']; ?>
';
        paceOptions = {
            elements: true
        };        
        var fields = new Array();
        var yamaps = new Array();
    </script>
    <?php if ($this->_tpl_vars['modtype'] != 'ind'): ?>
    <script src="<?php echo @THEME; ?>
assets/js/pace.min.js"></script>
    <?php endif; ?>
</head>
<body>
<div id="wrapper">
    <?php $this->assign('second_region_name', ""); ?>
    <?php if ($this->_tpl_vars['second_region']): ?>
        <?php $this->assign('second_region_name', count($this->_tpl_vars['second_region']['name'])); ?>
        <?php $this->assign('second_region_name', $this->_tpl_vars['second_region_name']-1); ?>
        <?php $this->assign('second_region_name', $this->_tpl_vars['second_region']['name'][$this->_tpl_vars['second_region_name']]); ?>
    <?php endif; ?>
    <div class="header">
        <p style="text-align: center;"><img alt="" src="/uploads/images/562-f97c38637b17f6f7ef6d0ec957e5e80f.png" style="width: 100%;height: 100px;max-width: 1000px;" /></p>
        <nav class="navbar   navbar-site navbar-default" role="navigation">
            <div class="container">
                    <div class="navbar-header left-head">
                        <a href="<?php echo $this->_tpl_vars['settings']['path']; ?>
" class="navbar-brand logo logo-title">
                            <span class="logo-icon">
                                <img alt='<?php echo $this->_tpl_vars['settings']['copyright']; ?>
' src='<?php echo $this->_tpl_vars['settings']['logo']; ?>
' />
                            </span>
                            <span class="logo-text">
                                <?php echo @TITLE; ?>

                            </span>
                        </a>
                    </div>
                    <div class="right-head">
                        <!--button class="filter-toggle2 navbar-toggle" type="button">
                            <span class="sr-only">Left menu bar</span> 
                            <i class="fa fa-angle-double-right"></i>
                        </button-->
                        <button data-target=".navbar-collapse" data-toggle="collapse" class="navbar-toggle" type="button">
                            <span class="sr-only">Main menu</span> 
                            <i class="icon-menu-1"></i>
                        </button>
                        <!--button class="filter-toggle navbar-toggle" type="button">
                            <span class="sr-only">Right menu bar</span> 
                            <i class="fa fa-angle-double-left"></i>
                        </button-->
                        <div class="navbar-collapse collapse">
                            <ul class="nav navbar-nav navbar-right">
								<!--li>
									<a href="<?php echo $this->_tpl_vars['settings']['path']; ?>
">Главная</a>
								</li>
                        		<li><a href="<?php echo $this->_tpl_vars['settings']['path']; ?>
mail/"><?php echo $this->_tpl_vars['locale']['266']; ?>
</a></li-->
                        		<li>
                                    <a href="<?php echo $this->_tpl_vars['settings']['path']; ?>
users/" id="menu-user"><i class="fa fa-user" aria-hidden="true"></i> <?php echo $this->_tpl_vars['locale']['41']; ?>
</a>
                                    <div id="menu-user-content" style="display: none;"> 
                                        <ul>
                                            <?php if (! $this->_tpl_vars['settings']['user']): ?>
                                                <li><a class="btn btn-primary" href="<?php echo $this->_tpl_vars['settings']['path']; ?>
users/register/"><?php echo $this->_tpl_vars['locale']['24']; ?>
</a></li>
                                            <?php endif; ?>
											<li>
                                    <a href="<?php echo $this->_tpl_vars['settings']['path']; ?>
notepad/">
                                        <?php echo $this->_tpl_vars['locale']['244']; ?>

                                        <span <?php if ($this->_tpl_vars['counter']['notepad'] == 0): ?>style="display: none;"<?php endif; ?> class="badge n_count"><?php echo $this->_tpl_vars['counter']['notepad']; ?>
</span>
                                    </a>
                                </li>
                                            <li><a href="<?php echo $this->_tpl_vars['settings']['path']; ?>
users/"><?php echo $this->_tpl_vars['locale']['265']; ?>
</a></li>
                                            <li><a href="<?php echo $this->_tpl_vars['settings']['path']; ?>
users/moderated/"><?php echo $this->_tpl_vars['locale']['979']; ?>
</a></li>
                                            <li><a href="<?php echo $this->_tpl_vars['settings']['path']; ?>
users/update/"><?php echo $this->_tpl_vars['locale']['1098']; ?>
</a></li>
                                            <li><a href="<?php echo $this->_tpl_vars['settings']['path']; ?>
users/order/"><?php echo $this->_tpl_vars['locale']['65']; ?>
</a></li>
                                            <li><a href="<?php echo $this->_tpl_vars['settings']['path']; ?>
users/pay/"><?php echo $this->_tpl_vars['locale']['64']; ?>
</a></li>
                                        </ul>
                                    </div>
                                </li>
                                <?php if ($this->_tpl_vars['settings']['shop'] == 1): ?>
                                    <li><a href="<?php echo $this->_tpl_vars['settings']['path']; ?>
shops/"><?php echo $this->_tpl_vars['locale']['1103']; ?>
</a></li>
                                <?php endif; ?>
                                <li class="postadd">
        <a class="btn btn-block btn-border btn-post btn-danger" href="<?php echo $this->_tpl_vars['settings']['path']; ?>
add/"><?php echo $this->_tpl_vars['locale']['69']; ?>
</a>
    </li>
                            </ul>
                        </div>
                    </div>
                    <!--/.nav-collapse -->
            </div>
            <!-- /.container-fluid -->
        </nav>
    </div>
    <!-- /.header -->
    <?php if ($this->_tpl_vars['modtype'] == 'ind'): ?>
				

        <!-- /.intro -->
    <?php endif; ?>
