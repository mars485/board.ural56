<?php /* Smarty version 2.6.25, created on 2018-04-18 18:59:31
         compiled from list_full.html */ ?>
<?php require_once(SMARTY_CORE_DIR . 'core.load_plugins.php');
smarty_core_load_plugins(array('plugins' => array(array('modifier', 'count', 'list_full.html', 46, false),array('modifier', 'truncate_utf', 'list_full.html', 106, false),array('modifier', 'userdate', 'list_full.html', 128, false),array('modifier', 'mt_rand', 'list_full.html', 182, false),)), $this); ?>
<div class="category-list">
    <?php if ($this->_tpl_vars['modtype'] == 'ind' || $this->_tpl_vars['modtype'] == 'cat'): ?>
        <div class="tab-box ">
            <?php if ($this->_tpl_vars['settings']['shop'] == 1): ?>
                <!-- Nav tabs -->
                <ul class="nav nav-tabs add-tabs" role="tablist">
                    <li <?php if ($this->_tpl_vars['settings']['filter']['shop'] == 'all'): ?>class="active"<?php endif; ?>>
                        <a href="?filter[shop]=all"  rel="nofollow"><?php echo $this->_tpl_vars['locale']['1214']; ?>
 
                        <span class="badge"><?php echo $this->_tpl_vars['list_shop_count']['all']; ?>
</span>
                        </a>
                    </li>
                    
                    <li <?php if ($this->_tpl_vars['settings']['filter']['shop'] == 'only'): ?>class="active"<?php endif; ?>>
                        <a href="?filter[shop]=only"  rel="nofollow">
                                    <?php echo $this->_tpl_vars['locale']['1211']; ?>

                        <span class="badge"><?php echo $this->_tpl_vars['list_shop_count']['only']; ?>
</span>
                        </a>
                    </li>
                    <li <?php if ($this->_tpl_vars['settings']['filter']['shop'] == 'none'): ?>class="active"<?php endif; ?>>
                        <a href="?filter[shop]=none"  rel="nofollow">
                                    <?php echo $this->_tpl_vars['locale']['1212']; ?>

                        <span class="badge"><?php echo $this->_tpl_vars['list_shop_count']['none']; ?>
</span>
                        </a>
                    </li>
                </ul>
            <?php else: ?>
                <div style="height: 40px;"></div>
            <?php endif; ?>
    
            <div class="tab-filter" id="listsort_cont">
                <select id="listsort" class="selectpicker select_redirect form-control" data-style="btn-select" data-width="auto">
                    <option value=""><?php echo $this->_tpl_vars['locale']['1204']; ?>
</option>
                    <option <?php if ($this->_tpl_vars['settings']['filter']['sort'] == 'date_asc'): ?>selected<?php endif; ?> value="?filter[sort]=date_asc"><?php echo $this->_tpl_vars['locale']['1205']; ?>
</option>
                    <option <?php if ($this->_tpl_vars['settings']['filter']['sort'] == 'date_desc'): ?>selected<?php endif; ?> value="?filter[sort]=date_desc"><?php echo $this->_tpl_vars['locale']['1206']; ?>
</option>
                    <option <?php if ($this->_tpl_vars['settings']['filter']['sort'] == 'price_asc'): ?>selected<?php endif; ?> value="?filter[sort]=price_asc"><?php echo $this->_tpl_vars['locale']['1207']; ?>
</option>
                    <option <?php if ($this->_tpl_vars['settings']['filter']['sort'] == 'price_desc'): ?>selected<?php endif; ?> value="?filter[sort]=price_desc"><?php echo $this->_tpl_vars['locale']['1208']; ?>
</option>
                </select>
            </div>
        </div>
        <!--/.tab-box-->
    <?php endif; ?>

    <div class="listing-filter">
        <div class="pull-left col-xs-8">
            <div class="breadcrumb-list">
                <?php if (count($this->_tpl_vars['regions']) > 0): ?>
                    <a href="#selectRegion" class="current selectRegion" data-toggle="modal"><span><?php echo $this->_tpl_vars['locale']['1209']; ?>
</span></a>
                    <span class="cityName"> 
                	<?php $_from = $this->_tpl_vars['regions']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }$this->_foreach['i'] = array('total' => count($_from), 'iteration' => 0);
if ($this->_foreach['i']['total'] > 0):
    foreach ($_from as $this->_tpl_vars['region']):
        $this->_foreach['i']['iteration']++;
?>
                        <?php echo $this->_tpl_vars['region']['name']; ?>
<?php if (($this->_foreach['i']['iteration'] == $this->_foreach['i']['total']) == false): ?>, <?php endif; ?>
                	<?php endforeach; endif; unset($_from); ?>
                    </span> 
                <?php else: ?>
                    <a href="#" class="current"><span><?php echo $this->_tpl_vars['locale']['9']; ?>
</span></a>

                <?php endif; ?>
                    <a href="#selectRegion" class="selectRegion" data-toggle="modal" title="<?php echo $this->_tpl_vars['locale']['1210']; ?>
"> 
                        <span class="caret"></span> 
                    </a>
            </div>
        </div>
        <div class="pull-right col-xs-4 text-right listing-view-action"><span
                class="list-view active"><i class="  icon-th"></i></span> <span
                class="compact-view"><i class=" icon-th-list  "></i></span> <span
                class="grid-view "><i class=" icon-th-large "></i></span></div>
        <div style="clear:both"></div>
    </div>
    <!--/.listing-filter-->

    
    <!-- Mobile Filter bar End-->

    <div class="adds-wrapper">
        <div class="tab-content">
            <div class="tab-pane active" id="allAds">
                                
            <?php $this->assign('after_registration', "<a href='".($this->_tpl_vars['settings']['patch'])."users/register/' title='".($this->_tpl_vars['locale']['117'])."'>".($this->_tpl_vars['locale']['76'])."</a>"); ?>
            <?php $this->assign('count', count($this->_tpl_vars['blocks']['m'])); ?>
            <?php $this->assign('count', ($this->_tpl_vars['count']-1)); ?>
            <?php if ($this->_tpl_vars['count'] < 0): ?><?php $this->assign('count', 0); ?><?php endif; ?>
            <?php $this->assign('counter', 0); ?>
            <?php $_from = $this->_tpl_vars['messages']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }$this->_foreach['i'] = array('total' => count($_from), 'iteration' => 0);
if ($this->_foreach['i']['total'] > 0):
    foreach ($_from as $this->_tpl_vars['message']):
        $this->_foreach['i']['iteration']++;
?>                            
        
                <div class="item-list<?php if ($this->_tpl_vars['message']['marked'] == 1): ?> marked<?php endif; ?><?php if ($this->_tpl_vars['message']['shop']): ?> shop<?php endif; ?>">
                    <?php if ($this->_tpl_vars['message']['block'] == 1): ?>
                        <div class="cornerRibbons AdsBlock">
                            <a href="#"> VIP</a>
                        </div>
                    <?php elseif ($this->_tpl_vars['message']['raised'] == 1): ?>
                        <div class="cornerRibbons AdsRaised">
                            <a href="#"> TOP</a>
                        </div>
                    <?php elseif ($this->_tpl_vars['message']['marked'] == 1): ?>
                        <div class="cornerRibbons AdsMarked">
                            <a href="#"> <?php echo $this->_tpl_vars['locale']['1197']; ?>
!</a>
                        </div>
                    <?php endif; ?>
        
                
                    
                    <div class="col-sm-2 no-padding photobox">
                        <?php if ($this->_tpl_vars['message']['fields']['i']['0']['value'] != ""): ?>
                            <div class="add-image">
                                    <span class="photo-count"><i class="fa fa-camera"></i> <?php echo count($this->_tpl_vars['message']['fields']['i']); ?>
 </span> 
                                    <a href="<?php echo $this->_tpl_vars['settings']['path']; ?>
<?php echo @MESSAGES; ?>
/<?php echo $this->_tpl_vars['message']['link']; ?>
">
                                        <img class="thumbnail no-margin" src="<?php echo $this->_tpl_vars['settings']['path']; ?>
uploads/images/ts/<?php echo $this->_tpl_vars['message']['fields']['i']['0']['value']; ?>
" alt="<?php echo ((is_array($_tmp=$this->_tpl_vars['message']['title'])) ? $this->_run_mod_handler('truncate_utf', true, $_tmp, 100, '...') : truncate_utf($_tmp, 100, '...')); ?>
">
                                    </a>
                            </div>
                        <?php else: ?>
                        <div class="add-image">
                        <a href="<?php echo $this->_tpl_vars['settings']['path']; ?>
<?php echo @MESSAGES; ?>
/<?php echo $this->_tpl_vars['message']['link']; ?>
">
                            <img class="thumbnail no-margin" src="<?php echo @THEME; ?>
images/noimage.png" alt="img">
                        </a>
                        </div>
                        <?php endif; ?>
                    </div>
                    
                    <!--/.photobox-->
                    <div class="col-sm-8 add-desc-box">
                        <div class="add-details">
                            <h5 class="add-title"><a href='<?php echo $this->_tpl_vars['settings']['path']; ?>
<?php echo @MESSAGES; ?>
/<?php echo $this->_tpl_vars['message']['link']; ?>
'><?php echo ((is_array($_tmp=$this->_tpl_vars['message']['title'])) ? $this->_run_mod_handler('truncate_utf', true, $_tmp, 300, '...') : truncate_utf($_tmp, 300, '...')); ?>
</a></h5>
                            <span class="info-row">
                                <?php if ($this->_tpl_vars['message']['shop']): ?>
                                <span class="add-type business-ads tooltipHere" data-toggle="tooltip"
                                                              data-placement="right" title="<?php echo $this->_tpl_vars['locale']['1104']; ?>
: <?php echo $this->_tpl_vars['message']['shop']['name']; ?>
">M </span> 
                                <?php endif; ?>
                                <span class="date">
                                    <i class=" icon-clock"></i> <?php echo ((is_array($_tmp=$this->_tpl_vars['message']['date_add'])) ? $this->_run_mod_handler('userdate', true, $_tmp) : dateFormat($_tmp)); ?>
 
                                    -
                                </span>
                                
                                <span class="item-location">
                                    <i class="fa fa-map-marker"></i> <?php echo $this->_tpl_vars['allregions'][$this->_tpl_vars['message']['region']]['name']; ?>

                                </span> 
                                
                                <span class="category">- <i class="icon-docs"></i><?php echo $this->_tpl_vars['categories'][$this->_tpl_vars['message']['cat']]['name']; ?>
</span>     
                            </span>
                        </div>
                    </div>
                    <!--/.add-desc-box-->
                    <div class="col-sm-2 text-right  price-box">
                        <?php if ($this->_tpl_vars['message']['fields']['p']['0']): ?>
                        <h2 class="item-price">
                            <?php if ($this->_tpl_vars['rates_default']['charcode'] == 'rur'): ?>
                                <i class="fa fa-rub" aria-hidden="true"></i> <?php echo $this->_tpl_vars['message']['fields']['p']['0']['value']['num']; ?>

                            <?php elseif ($this->_tpl_vars['rates_default']['charcode'] == 'usd'): ?>
                                <i class="fa fa-usd" aria-hidden="true"></i> <?php echo $this->_tpl_vars['message']['fields']['p']['0']['value']['num']; ?>

                            <?php elseif ($this->_tpl_vars['rates_default']['charcode'] == 'eur'): ?>
                                <i class="fa fa-eur" aria-hidden="true"></i> <?php echo $this->_tpl_vars['message']['fields']['p']['0']['value']['num']; ?>

                            <?php else: ?>
                                <?php echo $this->_tpl_vars['message']['fields']['p']['0']['value']['txt']; ?>

                            <?php endif; ?>
                        </h2>
                        <?php endif; ?>
                        <div class="text-nowrap">
                                                        
                            <a class="btn <?php if ($this->_tpl_vars['message']['fav'] == 1): ?>btn-default<?php else: ?>btn-success<?php endif; ?> btn-sm make-favorite notepad" data-id="<?php echo $this->_tpl_vars['message']['id']; ?>
"> 
                                <i class="fa fa-bookmark-o"></i> <span><?php echo $this->_tpl_vars['locale']['244']; ?>
</span> </a>
                            </div>
                        </div>
                    <!--/.add-desc-box-->
                </div>
                <!--/.item-list-->
        
                <?php $this->assign('counter', ($this->_tpl_vars['counter']+1)); ?>
                
                <?php if ($this->_tpl_vars['counter'] == $this->_tpl_vars['settings']['middle_block']): ?>
                	<?php $this->assign('counter', 0); ?>
                	<?php $this->assign('rand', ((is_array($_tmp='0')) ? $this->_run_mod_handler('mt_rand', true, $_tmp, $this->_tpl_vars['count']) : mt_rand($_tmp, $this->_tpl_vars['count']))); ?>
                	<?php echo $this->_tpl_vars['blocks']['m'][$this->_tpl_vars['rand']]; ?>

                <?php endif; ?>
            
            <?php endforeach; endif; unset($_from); ?>




            </div>
        </div>
    </div>
    <!--/.adds-wrapper-->

</div>
<?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => "pagination.html", 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>