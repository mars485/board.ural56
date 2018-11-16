<?php /* Smarty version 2.6.25, created on 2018-04-19 18:25:44
         compiled from shops.html */ ?>
<?php require_once(SMARTY_CORE_DIR . 'core.load_plugins.php');
smarty_core_load_plugins(array('plugins' => array(array('modifier', 'urlencode', 'shops.html', 16, false),array('modifier', 'count', 'shops.html', 32, false),array('modifier', 'worktime', 'shops.html', 49, false),array('modifier', 'truncate_html', 'shops.html', 93, false),)), $this); ?>

<?php if ($this->_tpl_vars['second_region']): ?>


<div class="alert alert-warning alert-dismissable">
    <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
    <p>
    <?php echo $this->_tpl_vars['locale']['1219']; ?>
 
    &laquo;
    	<?php $_from = $this->_tpl_vars['regions']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }$this->_foreach['i'] = array('total' => count($_from), 'iteration' => 0);
if ($this->_foreach['i']['total'] > 0):
    foreach ($_from as $this->_tpl_vars['region']):
        $this->_foreach['i']['iteration']++;
?>
            <?php echo $this->_tpl_vars['region']['name']; ?>
<?php if (($this->_foreach['i']['iteration'] == $this->_foreach['i']['total']) == false): ?>, <?php endif; ?>
    	<?php endforeach; endif; unset($_from); ?>
    &raquo;
    </p>
    <p>
                <a href="<?php echo $this->_tpl_vars['settings']['path']; ?>
change_region/?act=change_region&clean_region&back=<?php echo ((is_array($_tmp=$this->_tpl_vars['settings']['path'])) ? $this->_run_mod_handler('urlencode', true, $_tmp) : urlencode($_tmp)); ?>
<?php echo $this->_supers['get']['cat']['0']; ?>
%2F">
            <i class="fa fa-link" aria-hidden="true"></i> <?php echo $this->_tpl_vars['locale']['1117']; ?>

        </a>
    </p>
</div>
                
<?php endif; ?>







<?php if (is_array ( $this->_tpl_vars['shops'] )): ?>
    
    <?php if (count($this->_tpl_vars['shops']) == 0): ?>
        <div class="alert alert-info">
            <?php echo $this->_tpl_vars['locale']['1189']; ?>

        </div>
    <?php endif; ?>

        <?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => 'tree1.html', 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>

    <?php if ($this->_tpl_vars['count_num'] > 0): ?>
   	    <p class="text-muted"><?php echo $this->_tpl_vars['count_text']; ?>
</p>
    <?php endif; ?>


    <!--/.listing-filter-->
    <div class="adds-wrapper jobs-list">
        <?php $_from = $this->_tpl_vars['shops']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['shop']):
?>
            <?php $this->assign('work', ((is_array($_tmp=$this->_tpl_vars['shop']['worktime'])) ? $this->_run_mod_handler('worktime', true, $_tmp) : worktime($_tmp))); ?>
            <div class="item-list job-item">
    
                <div class="col-sm-3  no-padding photobox">
                    <div class="add-image">
                        <a href="<?php echo $this->_tpl_vars['shop']['link']; ?>
">
                            <?php if ($this->_tpl_vars['shop']['img']): ?>
                                <?php $this->assign('imglink', $this->_tpl_vars['shop']['img']); ?>
                            <?php else: ?>
                                <?php $this->assign('imglink', (@THEME)."images/noimage.png"); ?>
                            <?php endif; ?>
                            <img class="thumbnail no-margin"
                                   src="<?php echo $this->_tpl_vars['imglink']; ?>
" alt="<?php echo $this->_tpl_vars['shop']['name']; ?>
">
                            
                        </a>
                    </div>
                </div>
                <!--/.photobox-->
                <div class="col-sm-9  add-desc-box">
                    <div class="add-details jobs-item">
                        <h4 class="job-title">
                        <a href="<?php echo $this->_tpl_vars['shop']['link']; ?>
"> <?php echo $this->_tpl_vars['shop']['name']; ?>
 </a>
                        <?php if ($this->_tpl_vars['work'] == 1): ?>
                            <span class="badge bg-info"><?php echo $this->_tpl_vars['locale']['1245']; ?>
</span>
                        <?php elseif ($this->_tpl_vars['work'] == 2): ?>
                            <span class="badge"><?php echo $this->_tpl_vars['locale']['1246']; ?>
</span>
                        <?php elseif ($this->_tpl_vars['work'] == 3): ?>
                            <span class="badge"><?php echo $this->_tpl_vars['locale']['1247']; ?>
</span>
                        <?php elseif ($this->_tpl_vars['work'] == 4): ?>
                            <span class="badge"><?php echo $this->_tpl_vars['locale']['1248']; ?>
</span>
                        <?php endif; ?>
                        </h4>
                        
                        <span class="info-row">
                            <?php if ($this->_tpl_vars['shop']['region'] != 0): ?>
                                <span class="item-location"><i class="fa fa-map-marker"></i> <?php echo $this->_tpl_vars['allregions'][$this->_tpl_vars['shop']['region']]['name']; ?>
 </span>
                            <?php endif; ?> 
                            <?php if ($this->_tpl_vars['shop']['cat'] != 0): ?>
                                <span class="date"><i class="icon-docs"> </i> <?php echo $this->_tpl_vars['categories'][$this->_tpl_vars['shop']['cat']]['name']; ?>
</span>
                            <?php endif; ?>
                            <span class="date"><i class="icon-folder-open"></i><?php echo $this->_tpl_vars['shop']['count_text']; ?>
</span>
                        </span>
    
                        <div class="jobs-desc">
                            <?php echo ((is_array($_tmp=$this->_tpl_vars['shop']['description'])) ? $this->_run_mod_handler('truncate_html', true, $_tmp, 200, '...') : truncate_html($_tmp, 200, '...')); ?>

                        </div>

                    </div>
                </div>
                <!--/.add-desc-box-->
    
                <!--/.add-desc-box-->
            </div>
            <!--/.job-item-->
        
        <?php endforeach; endif; unset($_from); ?>
    </div>






    <?php if ($this->_tpl_vars['pages'] != ""): ?>
    	<div align='left' class='pages'>
    	<?php echo $this->_tpl_vars['locale']['140']; ?>
:
    	<?php unset($this->_sections['page']);
$this->_sections['page']['name'] = 'page';
$this->_sections['page']['loop'] = is_array($_loop=$this->_tpl_vars['pages']) ? count($_loop) : max(0, (int)$_loop); unset($_loop);
$this->_sections['page']['show'] = true;
$this->_sections['page']['max'] = $this->_sections['page']['loop'];
$this->_sections['page']['step'] = 1;
$this->_sections['page']['start'] = $this->_sections['page']['step'] > 0 ? 0 : $this->_sections['page']['loop']-1;
if ($this->_sections['page']['show']) {
    $this->_sections['page']['total'] = $this->_sections['page']['loop'];
    if ($this->_sections['page']['total'] == 0)
        $this->_sections['page']['show'] = false;
} else
    $this->_sections['page']['total'] = 0;
if ($this->_sections['page']['show']):

            for ($this->_sections['page']['index'] = $this->_sections['page']['start'], $this->_sections['page']['iteration'] = 1;
                 $this->_sections['page']['iteration'] <= $this->_sections['page']['total'];
                 $this->_sections['page']['index'] += $this->_sections['page']['step'], $this->_sections['page']['iteration']++):
$this->_sections['page']['rownum'] = $this->_sections['page']['iteration'];
$this->_sections['page']['index_prev'] = $this->_sections['page']['index'] - $this->_sections['page']['step'];
$this->_sections['page']['index_next'] = $this->_sections['page']['index'] + $this->_sections['page']['step'];
$this->_sections['page']['first']      = ($this->_sections['page']['iteration'] == 1);
$this->_sections['page']['last']       = ($this->_sections['page']['iteration'] == $this->_sections['page']['total']);
?>
    		<?php $this->assign('p', $this->_sections['page']['index']+1); ?>
    		<a href="page<?php echo $this->_tpl_vars['p']; ?>
.html<?php echo $this->_tpl_vars['get_str']; ?>
" <?php if ($this->_supers['get']['page'] == $this->_tpl_vars['p']): ?>class='selected_page'<?php endif; ?>><?php echo $this->_tpl_vars['p']; ?>
</a>&nbsp;
    	<?php endfor; endif; ?>
    	</div>
    <?php endif; ?>
    
<?php elseif (is_array ( $this->_tpl_vars['shop'] )): ?>
    
        
    <?php $this->assign('work', ((is_array($_tmp=$this->_tpl_vars['shop']['worktime'])) ? $this->_run_mod_handler('worktime', true, $_tmp) : worktime($_tmp))); ?>
    
    <div class="shop_once">
        <div class="row seller-info seller-profile">
            <div class="seller-profile-img">
            <?php if ($this->_tpl_vars['shop']['img']): ?>
                <?php $this->assign('imglink', $this->_tpl_vars['shop']['img']); ?>
            <?php else: ?>
                <?php $this->assign('imglink', (@THEME)."images/noimage.png"); ?>
            <?php endif; ?>
                <a><img src="<?php echo $this->_tpl_vars['imglink']; ?>
" class="img-responsive thumbnail" alt="img"> </a>
            </div>
            <h3 class="no-margin no-padding link-color uppercase "><?php echo $this->_tpl_vars['shop']['name']; ?>
</h3>

            <div class="text-muted">
                <i class="icon-folder-open"></i><?php echo $this->_tpl_vars['count_text']; ?>

                <?php if ($this->_tpl_vars['shop']['region'] != 0): ?>
                    <i class="fa fa-map-marker"></i><?php echo $this->_tpl_vars['allregions'][$this->_tpl_vars['shop']['region']]['name']; ?>

                <?php endif; ?> 
                <?php if ($this->_tpl_vars['shop']['cat'] != 0): ?>
                    <i class="icon-docs"></i><?php echo $this->_tpl_vars['categories'][$this->_tpl_vars['shop']['cat']]['name']; ?>

                <?php endif; ?>
            </div>
            <div class="worktime">
                <ul>
                    <?php $_from = $this->_tpl_vars['shop']['worktime_list']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['w']):
?>
                        <li><?php echo $this->_tpl_vars['w']; ?>
</li>
                    <?php endforeach; endif; unset($_from); ?>
                </ul>

            </div>
            <div class="user-ads-action">
                <a class="btn btn-default btn-sm contact_modal" href="<?php echo $this->_tpl_vars['settings']['path']; ?>
sendmail/?userid=<?php echo $this->_tpl_vars['shop']['user_id']; ?>
&tpl=message2user">
                    <i class=" icon-mail-2"></i> <?php echo $this->_tpl_vars['locale']['266']; ?>
 
                </a>
                <?php if ($this->_tpl_vars['shop']['phone1'] != ""): ?>
                    <?php $this->assign('phone', $this->_tpl_vars['shop']['phone1']); ?>
                <?php else: ?>
                    <?php $this->assign('phone', $this->_tpl_vars['shop']['phone2']); ?>
                <?php endif; ?>
                <?php if ($this->_tpl_vars['phone'] != ""): ?>
                    <a class="btn btn-primary btn-sm" href="tel:<?php echo $this->_tpl_vars['phone']; ?>
">
                        <i class="icon-phone-1"></i> <?php echo $this->_tpl_vars['phone']; ?>

                    </a>
                <?php endif; ?>

            </div>
            
        </div>
                
        <div class="row seller-contact-info">
            <h3 class="no-margin uppercase color-danger"> <?php echo $this->_tpl_vars['locale']['263']; ?>
 </h3>
            <?php if ($this->_tpl_vars['shop']['map'] != ""): ?>     
                <div id="YMapsID"></div>
                <?php if ($this->_tpl_vars['settings']['maptype'] == 1): ?>
                    <script>
                
                      function initMap() {
                        
                        var pl = false;
                        var myLatLng = {lat: <?php echo $this->_tpl_vars['shop']['point']['0']; ?>
, lng: <?php echo $this->_tpl_vars['shop']['point']['1']; ?>
};
                        
                        


        
                        var map = new google.maps.Map(document.getElementById("YMapsID"), {
                          zoom: <?php echo $this->_tpl_vars['shop']['point']['2']; ?>
,
                          center: myLatLng
                        });
                        
                        pl = placeMarker(myLatLng);
                        
                        var infowindow = new google.maps.InfoWindow({
                            content: "<?php echo $this->_tpl_vars['shop']['name']; ?>
<div style=\'font-size:10px;\'><?php echo $this->_tpl_vars['shop']['addr']; ?>
<?php if ($this->_tpl_vars['shop']['phone1'] != ""): ?>, <?php echo $this->_tpl_vars['shop']['phone1']; ?>
<?php endif; ?></div>"
                        });
                        infowindow.open(map, pl);
                        pl.addListener('click', function() {
                            infowindow.open(map, pl);
                            map.setCenter(pl.getPosition());
                        });


                        function placeMarker(location) {
                            var marker = new google.maps.Marker({
                                position: location, 
                                map: map
                            });
                            return marker;
                        } 
                        
                     }
                    </script>
                    <script async defer
                    src="https://maps.googleapis.com/maps/api/js?key=<?php echo $this->_tpl_vars['settings']['mapkey']; ?>
&callback=initMap">
                    </script>
                <?php else: ?>
                    <script src="http://api-maps.yandex.ru/2.0/?load=package.full&lang=ru-RU" type="text/javascript"></script>
                    <script type="text/javascript">
                        ymaps.ready(init);
                        function init () {
                            var myMap = new ymaps.Map('YMapsID', {
                                    center: [<?php echo $this->_tpl_vars['shop']['point']['0']; ?>
, <?php echo $this->_tpl_vars['shop']['point']['1']; ?>
],
                                    zoom: <?php echo $this->_tpl_vars['shop']['point']['2']; ?>

                                });
                        		var myPlacemark = new ymaps.Placemark(
                        		[<?php echo $this->_tpl_vars['shop']['point']['0']; ?>
, <?php echo $this->_tpl_vars['shop']['point']['1']; ?>
] , {
                                    balloonContent: "<?php echo $this->_tpl_vars['shop']['name']; ?>
<div style=\'font-size:10px;\'><?php echo $this->_tpl_vars['shop']['addr']; ?>
<?php if ($this->_tpl_vars['shop']['phone1'] != ""): ?>, <?php echo $this->_tpl_vars['shop']['phone1']; ?>
<?php endif; ?></div>"
                                }, {
                                    draggable: false
                                });
                                myMap.controls.add('smallZoomControl', { top: 5, left: 5 });
                        		myMap.geoObjects.add(myPlacemark);
                                myPlacemark.balloon.open(); 
                        }       
                    </script>
                <?php endif; ?>
            <?php endif; ?>
            <dl class="dl-horizontal">
                    <?php if ($this->_tpl_vars['shop']['addr'] != ""): ?>
                        <dt><?php echo $this->_tpl_vars['locale']['458']; ?>
:</dt>
                        <dd class="contact-sensitive">
                            <?php echo $this->_tpl_vars['shop']['addr']; ?>

                        </dd>
                    <?php endif; ?>
                    <?php if ($this->_tpl_vars['shop']['phone1'] != ""): ?>
                        <dt><?php echo $this->_tpl_vars['locale']['1109']; ?>
:</dt>
                        <dd class="contact-sensitive">
                            <?php echo $this->_tpl_vars['shop']['phone1']; ?>

                        </dd>
                    <?php endif; ?>
                    <?php if ($this->_tpl_vars['shop']['phone2'] != ""): ?>
                        <dt><?php echo $this->_tpl_vars['locale']['1110']; ?>
:</dt>
                        <dd class="contact-sensitive">
                            <?php echo $this->_tpl_vars['shop']['phone2']; ?>

                        </dd>
                    <?php endif; ?>
                    <?php if ($this->_tpl_vars['shop']['site'] != ""): ?>
                        <dt><?php echo $this->_tpl_vars['locale']['410']; ?>
:</dt>
                        <dd class="contact-sensitive">
                            <a href="<?php echo $this->_tpl_vars['settings']['path']; ?>
redirect/?go=<?php echo ((is_array($_tmp=$this->_tpl_vars['shop']['site'])) ? $this->_run_mod_handler('urlencode', true, $_tmp) : urlencode($_tmp)); ?>
"><?php echo $this->_tpl_vars['shop']['site']; ?>
</a>
                        </dd>
                    <?php endif; ?>

            </dl>
        </div>
        <div class="seller-search">
            <form class="form-horizontal" name="shop_search" action="<?php echo $this->_tpl_vars['settings']['path']; ?>
search/" method="GET">
                <input type="hidden" name="shop" value="<?php echo $this->_tpl_vars['shop']['id']; ?>
"/>
                <div class="form-group">
                    <div class="col-md-10">
                        <input  type="text" name="text" placeholder="<?php echo $this->_tpl_vars['locale']['1220']; ?>
 &laquo;<?php echo $this->_tpl_vars['shop']['name']; ?>
&raquo;" class="form-control">
                    </div>
                    <div class="col-md-2">
                        <button type="submit" class="btn btn-primary"><?php echo $this->_tpl_vars['locale']['203']; ?>
</button>
                    </div>
                </div>
            </form>
        </div>
        
        <ul class="nav nav-tabs">
        	<li class="active">
        		<a href="#shop_description" data-toggle="tab"><?php echo $this->_tpl_vars['locale']['1121']; ?>
</a>
        	</li>
        	<li>
        		<a href="#shop_delivery" data-toggle="tab"><?php echo $this->_tpl_vars['locale']['1123']; ?>
</a>
        	</li>
        </ul>
        
        <!-- Tab panes -->
        <div class="tab-content">
        	<div class="tab-pane active" id="shop_description">
        		<p><?php echo $this->_tpl_vars['shop']['description']; ?>
</p>
        	</div>
        	<div class="tab-pane" id="shop_delivery">
                    <?php if ($this->_tpl_vars['shop']['delivery'] != ""): ?>
                        <h3><?php echo $this->_tpl_vars['locale']['1124']; ?>
</h3>
                        <?php echo $this->_tpl_vars['shop']['delivery']; ?>

                    <?php endif; ?>
                    <?php if ($this->_tpl_vars['shop']['payment'] != ""): ?>
                        <h3><?php echo $this->_tpl_vars['locale']['1125']; ?>
</h3>
                        <?php echo $this->_tpl_vars['shop']['payment']; ?>

                    <?php endif; ?>
        	</div>
        </div> 
        <!-- /.tab content -->
        
    </div>

    <hr />
        
    <h3><?php echo $this->_tpl_vars['locale']['1188']; ?>
</h3>
    <?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => 'tree1.html', 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>
            

    <?php if (count($this->_tpl_vars['shop']['messages']) > 0): ?>
        <?php $this->assign('messages', $this->_tpl_vars['shop']['messages']); ?>
        <?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => 'list.html', 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>
    <?php else: ?>
        <div class="alert alert-info">
            <?php echo $this->_tpl_vars['locale']['1113']; ?>

        </div>
    <?php endif; ?>
    
    <?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => 'form_contact.html', 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>
    
<?php endif; ?>
