<?php /* Smarty version 2.6.25, created on 2018-04-19 01:08:52
         compiled from block_promo.html */ ?>
<?php require_once(SMARTY_CORE_DIR . 'core.load_plugins.php');
smarty_core_load_plugins(array('plugins' => array(array('modifier', 'count', 'block_promo.html', 6, false),array('modifier', 'truncate_utf', 'block_promo.html', 123, false),array('modifier', 'userdate', 'block_promo.html', 130, false),)), $this); ?>
<?php if ($this->_tpl_vars['settings']['rand_block'] == ""): ?>
	<?php $this->assign('rand_block', '1'); ?>
<?php else: ?>
	<?php $this->assign('rand_block', $this->_tpl_vars['settings']['rand_block']); ?>
<?php endif; ?>
<?php if (count($this->_tpl_vars['promo_messages']) < $this->_tpl_vars['settings']['rand_block']): ?>
	<?php $this->assign('rand_block', count($this->_tpl_vars['promo_messages'])); ?>
<?php endif; ?>

<?php if (! ( isset ( $this->_tpl_vars['block_index'] ) )): ?>
    <?php $this->assign('block_index', 0); ?>
<?php endif; ?>
    
<?php if ($this->_tpl_vars['place'] == 'l' || $this->_tpl_vars['place'] == 'r' || $this->_tpl_vars['place'] == 't' || $this->_tpl_vars['place'] == 'b' || $this->_tpl_vars['place'] == 'h' || $this->_tpl_vars['place'] == 'f'): ?>

    <?php if ($this->_tpl_vars['place'] == 'l'): ?>
            <h5 class="list-title"><strong><?php echo $this->_tpl_vars['name']; ?>
</strong>
                <a id="" class="link nextItem pull-right carousel-nav"> <i class="icon-right-open-big"></i></a>
                <a id="" class="link prevItem pull-right carousel-nav"> <i class="icon-left-open-big"></i></a>
            </h5>
    <?php endif; ?>
    <div class="inner-box relative block_promo_<?php echo $this->_tpl_vars['place']; ?>
">
        <?php if ($this->_tpl_vars['place'] != 'l'): ?>
            <h2 class="title-2"><?php echo $this->_tpl_vars['name']; ?>

                <a id="" class="link nextItem pull-right carousel-nav"> <i class="icon-right-open-big"></i></a>
                <a id="" class="link prevItem pull-right carousel-nav"> <i class="icon-left-open-big"></i></a>
            </h2>
        <?php endif; ?>

        <div class="row">
            <div class="col-lg-12">
                <div class="no-margin item-carousel owl-carousel owl-theme">        
                <?php unset($this->_sections['loop']);
$this->_sections['loop']['name'] = 'loop';
$this->_sections['loop']['loop'] = is_array($_loop=$this->_tpl_vars['rand_block']) ? count($_loop) : max(0, (int)$_loop); unset($_loop);
$this->_sections['loop']['show'] = true;
$this->_sections['loop']['max'] = $this->_sections['loop']['loop'];
$this->_sections['loop']['step'] = 1;
$this->_sections['loop']['start'] = $this->_sections['loop']['step'] > 0 ? 0 : $this->_sections['loop']['loop']-1;
if ($this->_sections['loop']['show']) {
    $this->_sections['loop']['total'] = $this->_sections['loop']['loop'];
    if ($this->_sections['loop']['total'] == 0)
        $this->_sections['loop']['show'] = false;
} else
    $this->_sections['loop']['total'] = 0;
if ($this->_sections['loop']['show']):

            for ($this->_sections['loop']['index'] = $this->_sections['loop']['start'], $this->_sections['loop']['iteration'] = 1;
                 $this->_sections['loop']['iteration'] <= $this->_sections['loop']['total'];
                 $this->_sections['loop']['index'] += $this->_sections['loop']['step'], $this->_sections['loop']['iteration']++):
$this->_sections['loop']['rownum'] = $this->_sections['loop']['iteration'];
$this->_sections['loop']['index_prev'] = $this->_sections['loop']['index'] - $this->_sections['loop']['step'];
$this->_sections['loop']['index_next'] = $this->_sections['loop']['index'] + $this->_sections['loop']['step'];
$this->_sections['loop']['first']      = ($this->_sections['loop']['iteration'] == 1);
$this->_sections['loop']['last']       = ($this->_sections['loop']['iteration'] == $this->_sections['loop']['total']);
?>
                    <?php $this->assign('message', ($this->_tpl_vars['promo_messages'][$this->_tpl_vars['block_index']])); ?>
                    <?php $this->assign('block_index', $this->_tpl_vars['block_index']+1); ?>
                    <?php if ($this->_tpl_vars['block_index'] >= count ( $this->_tpl_vars['promo_messages'] )): ?>
                        <?php $this->assign('block_index', 0); ?>
                    <?php endif; ?>
                    <div class="item">
                        <a href="<?php echo $this->_tpl_vars['settings']['path']; ?>
<?php echo @MESSAGES; ?>
/<?php echo $this->_tpl_vars['message']['link']; ?>
">
                             <span class="item-carousel-thumb"> 
                                 <?php if ($this->_tpl_vars['message']['fields']['i']['0']['value'] != ""): ?>
                                	<img class="img-responsive" src="<?php echo $this->_tpl_vars['settings']['path']; ?>
uploads/images/ts/<?php echo $this->_tpl_vars['message']['fields']['i']['0']['value']; ?>
" alt="img">
                                 <?php else: ?>
                                    <img class="thumbnail no-margin" src="<?php echo @THEME; ?>
images/noimage.png" alt="img">
                                 <?php endif; ?>
                             </span>
                            <span class="item-name"> <?php echo $this->_tpl_vars['message']['title']; ?>
  </span>
                            <?php if ($this->_tpl_vars['message']['fields']['p']['0']): ?>
                                <span class="price">  
                                    <?php if ($this->_tpl_vars['rates_default']['charcode'] == 'rur'): ?>
                                        <i class="fa fa-rub" aria-hidden="true"></i> <?php echo $this->_tpl_vars['message']['fields']['p']['0']['value']['num']; ?>

                                    <?php elseif ($this->_tpl_vars['rates_default']['charcode'] == 'usd'): ?>
                                        <i class="fa fa-usd" aria-hidden="true"></i> <?php echo $this->_tpl_vars['message']['fields']['p']['0']['value']['num']; ?>

                                    <?php elseif ($this->_tpl_vars['rates_default']['charcode'] == 'eur'): ?>
                                        <i class="fa fa-eur" aria-hidden="true"></i> <?php echo $this->_tpl_vars['message']['fields']['p']['0']['value']['num']; ?>

                                    <?php else: ?>
                                        <?php echo $this->_tpl_vars['message']['fields']['p']['0']['value']['txt']; ?>

                                    <?php endif; ?>
                                </span>
                            <?php endif; ?>
                        </a>
                    </div>
                <?php endfor; endif; ?>
                </div>
            </div>
        </div>
    </div>
<?php endif; ?>








<?php if ($this->_tpl_vars['place'] == 'm'): ?>

    <?php $this->assign('message', ($this->_tpl_vars['promo_messages'][$this->_tpl_vars['block_index']])); ?>
    <?php $this->assign('block_index', $this->_tpl_vars['block_index']+1); ?>
    <?php if ($this->_tpl_vars['block_index'] >= count ( $this->_tpl_vars['promo_messages'] )): ?>
        <?php $this->assign('block_index', 0); ?>
    <?php endif; ?>
    
    
    
    <div class="item-list<?php if ($this->_tpl_vars['message']['marked'] == 1): ?> marked<?php endif; ?><?php if ($this->_tpl_vars['message']['shop']): ?> shop<?php endif; ?>">
        <?php if ($this->_tpl_vars['message']['marked'] == 1): ?>
            <div class="cornerRibbons AdsMarked">
                <a href="#"> <?php echo $this->_tpl_vars['locale']['1197']; ?>
!</a>
            </div>
        <?php elseif ($this->_tpl_vars['message']['raised'] == 1): ?>
            <div class="cornerRibbons AdsRaised">
                <a href="#"> TOP</a>
            </div>
        <?php elseif ($this->_tpl_vars['message']['block'] == 1): ?>
            <div class="cornerRibbons AdsBlock">
                <a href="#"> VIP</a>
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
" alt="img">
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
        <div class="col-sm-7 add-desc-box">
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
                        <i class=" icon-clock"></i>&nbsp;<?php echo ((is_array($_tmp=$this->_tpl_vars['message']['date_add'])) ? $this->_run_mod_handler('userdate', true, $_tmp) : dateFormat($_tmp)); ?>
 
                    </span>
                    -
                    <span class="item-location">
                        <i class="fa fa-map-marker"></i>&nbsp;<?php echo $this->_tpl_vars['allregions'][$this->_tpl_vars['message']['region']]['name']; ?>

                    </span> 
                    
                    <span class="category">- <?php echo $this->_tpl_vars['categories'][$this->_tpl_vars['message']['cat']]['name']; ?>
</span>     
                </span>
            </div>
        </div>
        <!--/.add-desc-box-->
        <div class="col-sm-3 text-right  price-box">
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
            
            <?php if ($this->_tpl_vars['message']['marked'] == 1): ?>
                <a class="btn btn-danger  btn-sm make-favorite"> <i class="fa fa-certificate"></i> 
                    <span><?php echo $this->_tpl_vars['locale']['1197']; ?>
</span>
                </a>
            <?php elseif ($this->_tpl_vars['message']['raised'] == 1): ?>
                <a class="btn btn-danger  btn-sm make-favorite"> <i class="fa fa-certificate"></i> 
                    <span>TOP</span> 
                </a> 
            <?php elseif ($this->_tpl_vars['message']['block'] == 1): ?>
                <a class="btn btn-danger  btn-sm make-favorite"> <i class="fa fa-certificate"></i> 
                    <span>VIP</span>
                </a>
            <?php endif; ?>

            

            
            
            
            <a class="btn btn-default  btn-sm make-favorite"> 
                <i class="fa fa-heart"></i> <span>Save</span> </a>
            </div>
        <!--/.add-desc-box-->
    </div>
    <!--/.item-list-->

<?php endif; ?>

        


