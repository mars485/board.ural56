<?php /* Smarty version 2.6.25, created on 2018-11-16 16:23:01
         compiled from footer.html */ ?>
<?php require_once(SMARTY_CORE_DIR . 'core.load_plugins.php');
smarty_core_load_plugins(array('plugins' => array(array('modifier', 'om_number', 'footer.html', 19, false),array('modifier', 'count', 'footer.html', 34, false),array('modifier', 'date', 'footer.html', 107, false),)), $this); ?>
    
    <?php echo $this->_tpl_vars['blocks']['f']; ?>


	
    <!--div class="page-info hasOverly">
        <div class="bg-overly ">
            <div class="container text-center section-promo">
                <div class="row">
                    <div class="col-sm-3 col-xs-6 col-xxs-12">
                        <div class="iconbox-wrap">
                            <div class="iconbox">
                                <div class="iconbox-wrap-icon">
                                    <i class="icon icon-docs"></i>
                                </div>
                                <div class="iconbox-wrap-content">

                                    <h5><span><?php echo $this->_tpl_vars['counter']['messages_on']; ?>
</span></h5>

                                    <div class="iconbox-wrap-text"><?php echo ((is_array($_tmp=$this->_tpl_vars['counter']['messages_on'])) ? $this->_run_mod_handler('om_number', true, $_tmp, $this->_tpl_vars['locale']['3'], $this->_tpl_vars['locale']['4'], $this->_tpl_vars['locale']['5']) : om_number_smarty($_tmp, $this->_tpl_vars['locale']['3'], $this->_tpl_vars['locale']['4'], $this->_tpl_vars['locale']['5'])); ?>
</div>
                                </div>
                            </div>
                            <!-- /..iconbox >
                        </div>
                        <!--/.iconbox-wrap>
                    </div>

                    <div class="col-sm-3 col-xs-6 col-xxs-12">
                        <div class="iconbox-wrap">
                            <div class="iconbox">
                                <div class="iconbox-wrap-icon">
                                    <i class="icon  icon-th-large-1"></i>
                                </div>
                                <div class="iconbox-wrap-content">
                                    <?php $this->assign('count_cat', count($this->_tpl_vars['categories'])); ?>
                                    <h5><span><?php echo $this->_tpl_vars['count_cat']; ?>
</span></h5>
                                    <div class="iconbox-wrap-text"><?php echo ((is_array($_tmp=$this->_tpl_vars['count_cat'])) ? $this->_run_mod_handler('om_number', true, $_tmp, $this->_tpl_vars['locale']['1222'], $this->_tpl_vars['locale']['1223'], $this->_tpl_vars['locale']['1224']) : om_number_smarty($_tmp, $this->_tpl_vars['locale']['1222'], $this->_tpl_vars['locale']['1223'], $this->_tpl_vars['locale']['1224'])); ?>
</div>
                                </div>
                            </div>
                            <!-- /..iconbox >
                        </div>
                        <!--/.iconbox-wrap>
                    </div>

                    <div class="col-sm-3 col-xs-6  col-xxs-12">
                        <div class="iconbox-wrap">
                            <div class="iconbox">
                                <div class="iconbox-wrap-icon">
                                    <i class="icon  icon-map"></i>
                                </div>
                                <div class="iconbox-wrap-content">
                                    <?php $this->assign('count_regions', count($this->_tpl_vars['allregions'])); ?>
                                    <h5><span><?php echo $this->_tpl_vars['count_regions']; ?>
</span></h5>

                                    <div class="iconbox-wrap-text"><?php echo ((is_array($_tmp=$this->_tpl_vars['count_regions'])) ? $this->_run_mod_handler('om_number', true, $_tmp, $this->_tpl_vars['locale']['1225'], $this->_tpl_vars['locale']['1226'], $this->_tpl_vars['locale']['1227']) : om_number_smarty($_tmp, $this->_tpl_vars['locale']['1225'], $this->_tpl_vars['locale']['1226'], $this->_tpl_vars['locale']['1227'])); ?>
</div>
                                </div>
                            </div>
                            <!-- /..iconbox >
                        </div>
                        <!--/.iconbox-wrap>
                    </div>
                    <?php if ($this->_tpl_vars['settings']['shop'] == 1): ?>
                        <div class="col-sm-3 col-xs-6 col-xxs-12">
                            <div class="iconbox-wrap">
                                <div class="iconbox">
                                    <div class="iconbox-wrap-icon">
                                        <i class="icon icon-shop"></i>
                                    </div>
                                    <div class="iconbox-wrap-content">
                                        <h5><span><?php echo $this->_tpl_vars['counter']['shops']; ?>
</span></h5>
    
                                        <div class="iconbox-wrap-text"> <?php echo ((is_array($_tmp=$this->_tpl_vars['counter']['shops'])) ? $this->_run_mod_handler('om_number', true, $_tmp, $this->_tpl_vars['locale']['1114'], $this->_tpl_vars['locale']['1115'], $this->_tpl_vars['locale']['1116']) : om_number_smarty($_tmp, $this->_tpl_vars['locale']['1114'], $this->_tpl_vars['locale']['1115'], $this->_tpl_vars['locale']['1116'])); ?>
</div>
                                    </div>
                                </div>
                                <!-- /..iconbox ->
                            </div>
                            <!--/.iconbox-wrap->
                        </div>
                    <?php endif; ?>

                </div>

            </div>
        </div>
    </div-->
    <!-- /.page-info -->

    <div class="footer" id="footer">
        <div class="container">
            <ul class=" pull-left navbar-link footer-nav">
                <li>
                <a href="<?php echo $this->_tpl_vars['settings']['path']; ?>
"> <?php echo $this->_tpl_vars['locale']['261']; ?>
 </a>
        		<a href="<?php echo $this->_tpl_vars['settings']['path']; ?>
mail/"><?php echo $this->_tpl_vars['locale']['266']; ?>
</a>
        		<a href="https://www.ural56.ru/news/"><?php echo $this->_tpl_vars['locale']['976']; ?>
</a>
                <?php if ($this->_tpl_vars['settings']['shop'] == 1): ?>
                    <a href="<?php echo $this->_tpl_vars['settings']['path']; ?>
shops/"><?php echo $this->_tpl_vars['locale']['1103']; ?>
</a>
                <?php endif; ?>
                <a href="<?php echo $this->_tpl_vars['settings']['path']; ?>
add/"><?php echo $this->_tpl_vars['locale']['69']; ?>
</a>
                <a href="<?php echo $this->_tpl_vars['settings']['path']; ?>
rules/">Политика конфиденциальности</a>
                </li>

				<!--Блок информеров начало-->
				<div class="statistic"></div>
				<!--Блок информеров конец-->
            </ul>
			
            <ul class=" pull-right navbar-link footer-nav">
                <li> &copy;2017-<?php echo ((is_array($_tmp='Y')) ? $this->_run_mod_handler('date', true, $_tmp) : date($_tmp)); ?>
 <a href="//ural56.ru">Урал56.Ру</a></li>
                <!--li> Сайт разработан и поддерживаеться компанией <a href="https://itgsystem.ru" target="_blank">IT Group</a></li-->
            </ul>
        </div>
    </div>
    <!-- /.footer -->
</div>

<div class="menu-overly-mask"></div>

<!-- Modal Change Region -->

<?php $this->assign('region_name', count($this->_tpl_vars['regions'])); ?>
<?php $this->assign('region_name', $this->_tpl_vars['region_name']-1); ?>
<?php $this->assign('region_name', $this->_tpl_vars['second_region']['name'][$this->_tpl_vars['region_name']]); ?>
<?php if (isset ( $this->_tpl_vars['allregions'][$this->_tpl_vars['second_region']['id']]['parent'] )): ?>
    <?php $this->assign('parent_region_id', $this->_tpl_vars['allregions'][$this->_tpl_vars['second_region']['id']]['parent']); ?>
<?php else: ?>
    <?php $this->assign('parent_region_id', 0); ?>
<?php endif; ?>
<?php if (isset ( $this->_tpl_vars['allregions'][$this->_tpl_vars['parent_region_id']]['parent'] )): ?>
    <?php $this->assign('back_region_id', $this->_tpl_vars['allregions'][$this->_tpl_vars['parent_region_id']]['parent']); ?>
<?php else: ?>
    <?php $this->assign('back_region_id', 0); ?>
<?php endif; ?>

<script>
var parent_region = <?php echo $this->_tpl_vars['parent_region_id']; ?>
;
var back_region = <?php echo $this->_tpl_vars['back_region_id']; ?>
;
var current_region = TPL_REGION_ID;
</script>
<div class="modal fade" id="selectRegion" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
     aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span
                        class="sr-only">Close</span></button>
                <h4 class="modal-title" id="exampleModalLabel"><i class=" icon-map"></i> <?php echo $this->_tpl_vars['locale']['83']; ?>
 </h4>
            </div>
            <div class="modal-body">
                <div class="row">
                    <div class="col-sm-12">

                        <div class="row region_control">
                            <div class="col-xs-4">
                               <a href="#" id="region_select_back">
                                <i class=" icon-level-up  ln-shadow-box  shape-4"></i> 
                                <?php echo $this->_tpl_vars['locale']['1199']; ?>

                               </a>
                            </div>
                            <div class="col-xs-4">
                               <a href="#" id="region_select_all">
                               <i class="icon-globe-1 ln-shadow-box  shape-4"></i> 
                                <?php echo $this->_tpl_vars['locale']['1200']; ?>

                               </a>
                            </div>
                            <div class="col-xs-4">
                               <a href="#" id="region_select_current" <?php if (count($this->_tpl_vars['regions']) == 0): ?>style="display:none"<?php endif; ?>>
                                   <i class="icon-location-circled  ln-shadow-box  shape-4"></i> 
                                    <?php echo $this->_tpl_vars['locale']['1201']; ?>

                                        <span id="region_select_current_name">
                                        <?php echo $this->_tpl_vars['allregions'][$this->_tpl_vars['parent_region_id']]['name']; ?>

                                        </span>
                                </a>
                            </div>



                        </div>

                        <div style="clear:both"></div>

                        <hr class="hr-thin">
                    </div>
                    <div>
                        
                        <ul id="regionlist">
                            
                        </ul>
                        <div id="region_loader_img" style="visibility: hidden;">
                            <i class="fa fa-spinner fa-pulse fa-3x fa-fw"></i>
                            <div><?php echo $this->_tpl_vars['locale']['1099']; ?>
...</div>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </div>
</div>

<!-- /.modal -->

<script src="//ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script> 

<script>window.jQuery || document.write('<script src="<?php echo @THEME; ?>
assets/js/jquery/3.2.1/jquery.min.js"><\/script>')</script>

<!-- Modal Confirm Region -->
<?php if (count ( $this->_supers['cookies'] ) == 0 && $this->_tpl_vars['region_name'] != ""): ?>
    <div class="modal fade" id="welcome_region" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel2"
         aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span
                            class="sr-only">Close</span></button>
                    <h4 class="modal-title" id="exampleModalLabel2"><i class=" icon-map"></i> <?php echo $this->_tpl_vars['locale']['6']; ?>
 <?php echo $this->_tpl_vars['region_name']; ?>
?</h4>
                </div>
                <div class="modal-body">
                    <a href="#" id="welcome_region_cansel" class="btn btn-success"><?php echo $this->_tpl_vars['locale']['1202']; ?>
</a>
                    <a href="#" id="welcome_region_change" class="btn btn-warning"><?php echo $this->_tpl_vars['locale']['10']; ?>
</a>
                </div>
            </div>
        </div>
    </div>
<?php endif; ?>
<!-- /.modal -->

<!-- include main libs  -->
<script src="<?php echo @THEME; ?>
assets/js/main_libs.js"></script>

<?php if ($this->_supers['get']['cat']['0'] == @MESSAGES): ?>
    <!-- bxSlider CSS file -->
    <link href="<?php echo @THEME; ?>
assets/plugins/bxslider/jquery.bxslider.css" rel="stylesheet"/>
    <!-- bxSlider Javascript file -->
    <script src="<?php echo @THEME; ?>
assets/plugins/bxslider/jquery.bxslider.min.js"></script>
    <script>
        $('.bxslider').bxSlider({
            pagerCustom: '#bx-pager',
            adaptiveHeight: true
        });
    </script>
<?php endif; ?>

<?php if (in_array ( $this->_supers['get']['cat']['0'] , array ( 'edit' , 'add' , 'users' ) )): ?>
    <script>
        var CKToolbal = 'Basic';
    </script>
    <script src="<?php echo $this->_tpl_vars['settings']['path']; ?>
ckeditor/ckeditor.js"></script>
    <script type="text/javascript" src="<?php echo @THEME; ?>
assets/plugins/inputmask/inputmask_all.js"></script>
<?php endif; ?>

<?php if ($this->_tpl_vars['settings']['ulogin'] == 1 && ! $this->_tpl_vars['settings']['user']): ?>
    <script src="//ulogin.ru/js/ulogin.js"></script>
<?php endif; ?>

<?php if ($this->_supers['get']['cat']['0'] == 'users'): ?>
    <!-- include footable   -->
    <script src="<?php echo @THEME; ?>
assets/js/footable.js?v=2-0-1" type="text/javascript"></script>
    <script src="<?php echo @THEME; ?>
assets/js/footable.filter.js?v=2-0-1" type="text/javascript"></script>
    <script type="text/javascript">
        $(function () {
            $('#panel_ads').footable().on('footable_filtering', function (e) {
                var selected = $('.filter-status').find(':selected').text();
                if (selected && selected.length > 0) {
                    e.filter += (e.filter && e.filter.length > 0) ? ' ' + selected : selected;
                    e.clear = !e.filter;
                }
            });
        });
    </script>
    <?php if ($this->_supers['get']['cat']['1'] == 'shop'): ?>
        <link href="<?php echo @THEME; ?>
assets/css/jquery.timepicker.min.css" rel="stylesheet"/>
        <script src="<?php echo @THEME; ?>
assets/js/jquery.timepicker.min.js" type="text/javascript"></script>
        <script type="text/javascript">
        $('.wt_from').timepicker({
            timeFormat: 'HH:mm',
            interval: 30,
            minTime: '00',
            maxTime: '23:30',
            startTime: '06:00',
            dynamic: false,
            dropdown: true,
            scrollbar: true
        });
        $('.wt_to').timepicker({
            timeFormat: 'HH:mm',
            interval: 30,
            minTime: '00',
            maxTime: '23:30',
            startTime: '16:00',
            dynamic: false,
            dropdown: true,
            scrollbar: true
        });
        
        $('.wt_pause').timepicker({
            timeFormat: 'HH:mm',
            interval: 30,
            minTime: '00',
            maxTime: '23:30',
            startTime: '12:00',
            dynamic: false,
            dropdown: true,
            scrollbar: true
        });
        
        $('.clone').click(function(event) {
            var classname = $(this).attr('data-class');
            $('.'+classname).each(
              function(){
                if($(this).val() != ""){
                    $('.'+classname).val($(this).val());
                    return false;
                }
              }
            );
            event.preventDefault();
        });
        
        </script>

    <?php endif; ?>
<?php endif; ?>

<?php if ($this->_supers['get']['cat']['0'] == @MESSAGES): ?>
    <?php if ($this->_tpl_vars['settings']['sharing'] == 1): ?>
        <script src="//yastatic.net/es5-shims/0.0.2/es5-shims.min.js"></script>
        <script src="//yastatic.net/share2/share.js"></script>
    <?php elseif ($this->_tpl_vars['settings']['sharing'] == 2): ?>
        <link rel="stylesheet" href="<?php echo $this->_tpl_vars['settings']['path']; ?>
js/social/social-likes_classic.css">
        <script src="<?php echo $this->_tpl_vars['settings']['path']; ?>
js/social/social-likes.min.js"></script>
    <?php endif; ?>
<?php endif; ?>

<?php if ($this->_tpl_vars['modtype'] == 'ind'): ?>
		<!-- SLIDER REVOLUTION 4.x SCRIPTS  -->
		<script src="<?php echo @THEME; ?>
assets/js/jquery.themepunch.tools.min.js"></script>
		<script src="<?php echo @THEME; ?>
assets/js/jquery.themepunch.revolution.min.js"></script>
		<script>
			// Revolution Slider
			var revapi;
			jQuery(document).ready(function() {
				   revapi = jQuery('.tp-banner').revolution(
					{
						delay: 5000,
						startwidth: 1200,
						startheight: 300,
                        gridwidth:1200,
                        gridheight:300,
						hideThumbs: 200,
						shadow: 0,
						navigationType: "none",
						hideThumbsOnMobile: "on",
						hideArrowsOnMobile: "on",
						hideThumbsUnderResoluition: 0,
						touchenabled: "on",
						fullWidth: "on"
					});
			});	
		</script>
<?php endif; ?>

<!-- include custom script for site  -->
<script src="<?php echo @THEME; ?>
assets/js/script.js"></script>

<!--[if lte IE 8]>
    <div id="browser_reject">
        <a href="#" onclick="document.getElementById('browser_reject').style.display = 'none'; return false;">[x]</a>
        <?php echo $this->_tpl_vars['locale']['1228']; ?>

        <a href="//www.google.ru/chrome/browser/desktop/">Google Crome</a>,
        <a href="//www.mozilla.org/ru/firefox/new/">Mozilla Firefox</a>,
        <a href="//www.microsoft.com/windows/microsoft-edge">Microsoft Edge</a>
    </div>
<![endif]-->

</body>
</html>