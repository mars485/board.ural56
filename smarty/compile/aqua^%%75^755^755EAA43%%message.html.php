<?php /* Smarty version 2.6.25, created on 2018-04-18 16:38:02
         compiled from message.html */ ?>
<?php require_once(SMARTY_CORE_DIR . 'core.load_plugins.php');
smarty_core_load_plugins(array('plugins' => array(array('modifier', 'userdate', 'message.html', 20, false),array('modifier', 'date_format', 'message.html', 20, false),array('modifier', 'count', 'message.html', 29, false),array('modifier', 'substr', 'message.html', 142, false),array('modifier', 'urlencode', 'message.html', 154, false),)), $this); ?>
<?php if ($this->_tpl_vars['MessageDisabled']): ?>

    <div class="alert alert-warning">
        <p><?php echo $this->_tpl_vars['locale']['1265']; ?>
</p>
    </div>

<?php else: ?>

    <?php $this->assign('after_registration', "<a href='".($this->_tpl_vars['settings']['path'])."users/register/' title='".($this->_tpl_vars['locale']['117'])."'>".($this->_tpl_vars['locale']['76'])."</a>"); ?>
    <?php $this->assign('contact_link', ($this->_tpl_vars['settings']['path'])."sendmail/?messageid=".($this->_tpl_vars['message']['id'])."&userid=".($this->_tpl_vars['message']['user_id'])); ?>
    <?php if ($this->_tpl_vars['message']['user_id'] != 0): ?>
        <?php $this->assign('username', $this->_tpl_vars['message']['user_id_name']); ?>
    <?php else: ?>
        <?php $this->assign('username', $this->_tpl_vars['message']['user']); ?>
    <?php endif; ?>
    
    <div class="inner ads-details-wrapper">
        <span class="info-row"> 
            <span class="date">
                <i class=" icon-clock"> </i> <?php echo ((is_array($_tmp=$this->_tpl_vars['message']['date_add'])) ? $this->_run_mod_handler('userdate', true, $_tmp) : dateFormat($_tmp)); ?>
 (<?php echo $this->_tpl_vars['locale']['1215']; ?>
 <?php echo ((is_array($_tmp=$this->_tpl_vars['message']['date_del'])) ? $this->_run_mod_handler('date_format', true, $_tmp, "%d.%m.%Y") : smarty_modifier_date_format($_tmp, "%d.%m.%Y")); ?>
)
            </span>
            <span class="date">
                <i class="fa fa-hashtag"></i> <?php echo $this->_tpl_vars['message']['id']; ?>

            </span>
            <span class="item-location">
                <i class="fa fa-map-marker"></i> <?php echo $this->_tpl_vars['allregions'][$this->_tpl_vars['message']['region']]['name']; ?>

            </span> 
        </span>
        <?php if (count($this->_tpl_vars['message']['fields']['i']) > 0): ?>
            <div class="ads-image">
                <?php if ($this->_tpl_vars['message']['fields']['p']['0']): ?>
                    <h1 class="pricetag">
                        <?php if ($this->_tpl_vars['rates_default']['charcode'] == 'rur'): ?>
                            <i class="fa fa-rub" aria-hidden="true"></i> <?php echo $this->_tpl_vars['message']['fields']['p']['0']['value']['num']; ?>

                        <?php elseif ($this->_tpl_vars['rates_default']['charcode'] == 'usd'): ?>
                            <i class="fa fa-usd" aria-hidden="true"></i> <?php echo $this->_tpl_vars['message']['fields']['p']['0']['value']['num']; ?>

                        <?php elseif ($this->_tpl_vars['rates_default']['charcode'] == 'eur'): ?>
                            <i class="fa fa-eur" aria-hidden="true"></i> <?php echo $this->_tpl_vars['message']['fields']['p']['0']['value']['num']; ?>

                        <?php else: ?>
                            <?php echo $this->_tpl_vars['message']['fields']['p']['0']['value']['txt']; ?>

                        <?php endif; ?>
                    </h1>
                <?php endif; ?>
                
                
                <ul class="bxslider">
    				<?php $_from = $this->_tpl_vars['message']['fields']['i']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['image']):
?>
                        <li><img src="<?php echo $this->_tpl_vars['settings']['path']; ?>
uploads/images/tb/<?php echo $this->_tpl_vars['image']['value']; ?>
" alt="<?php echo $this->_tpl_vars['message']['title']; ?>
"/></li>
    				<?php endforeach; endif; unset($_from); ?>
                </ul>
                <?php if (count($this->_tpl_vars['message']['fields']['i']) > 1): ?>
                    <div id="bx-pager">
                        <?php $_from = $this->_tpl_vars['message']['fields']['i']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }$this->_foreach['thimages'] = array('total' => count($_from), 'iteration' => 0);
if ($this->_foreach['thimages']['total'] > 0):
    foreach ($_from as $this->_tpl_vars['image']):
        $this->_foreach['thimages']['iteration']++;
?>
                            <a class="thumb-item-link" data-slide-index="<?php echo ($this->_foreach['thimages']['iteration']-1); ?>
" href="">
                                <img src="<?php echo $this->_tpl_vars['settings']['path']; ?>
uploads/images/ts/<?php echo $this->_tpl_vars['image']['value']; ?>
" alt="img"/>
                            </a>
                        <?php endforeach; endif; unset($_from); ?>
                    </div>
                <?php endif; ?>
                
            </div>
        <?php endif; ?>
    
        <?php if ($this->_tpl_vars['message']['approved'] == 0): ?>
            <div class="notapproved_text alert alert-info alert-dismissable">
                <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                <small>
                    <noindex>
                        <!--googleoff: all-->
                            <?php echo $this->_tpl_vars['settings']['approve_text']; ?>

                        <!--googleon: all-->
                    </noindex>
                </small>
            </div>
        <?php endif; ?>
            
        <div class="Ads-Details">
            <h5 class="list-title"><strong><?php echo $this->_tpl_vars['locale']['1176']; ?>
</strong></h5>
    
            <ul class="Ads-options">
            	<?php $_from = $this->_tpl_vars['message']['fields_sorted']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['v']):
?>
                    <?php if ($this->_tpl_vars['v']['field_type'] != 'y' && $this->_tpl_vars['v']['field_type'] != 'j' && $this->_tpl_vars['v']['field_type'] != 'i' && $this->_tpl_vars['v']['field_type'] != 't'): ?>
                        
                		<?php if ($this->_tpl_vars['v']['field_type'] == 'v' && $this->_tpl_vars['v']['string_type'] != 't'): ?>
                			<?php if ($this->_tpl_vars['v']['string_type'] == 'u'): ?>
                				<li><span class="opt_name"><?php echo $this->_tpl_vars['v']['name']; ?>
</span>: <strong><?php if ($this->_tpl_vars['settings']['user'] || ( ! $this->_tpl_vars['settings']['user'] && $this->_tpl_vars['v']['hide'] == 0 )): ?><a href="<?php echo $this->_tpl_vars['settings']['patch']; ?>
redirect/?go=<?php echo $this->_tpl_vars['v']['value']; ?>
" target='_blank'><?php echo $this->_tpl_vars['v']['value']; ?>
</a><?php else: ?><?php echo $this->_tpl_vars['after_registration']; ?>
<?php endif; ?></strong></li>
                			<?php else: ?>
                				<li><span class="opt_name"><?php echo $this->_tpl_vars['v']['name']; ?>
</span>: <strong><?php if ($this->_tpl_vars['settings']['user'] || ( ! $this->_tpl_vars['settings']['user'] && $this->_tpl_vars['v']['hide'] == 0 )): ?><?php echo $this->_tpl_vars['v']['value']; ?>
<?php else: ?><?php echo $this->_tpl_vars['after_registration']; ?>
<?php endif; ?></strong></li>
                			<?php endif; ?>
                		<?php endif; ?>
                        
                		<?php if ($this->_tpl_vars['v']['field_type'] == 'p'): ?>
                				<li>
                                    <span class="opt_name"><?php echo $this->_tpl_vars['v']['name']; ?>
</span>: 
                                    <strong>
                                        <?php if ($this->_tpl_vars['settings']['user'] || ( ! $this->_tpl_vars['settings']['user'] && $this->_tpl_vars['v']['hide'] == 0 )): ?>
                                            <?php if ($this->_tpl_vars['rates_default']['charcode'] == 'rur'): ?>
                                                <i class="fa fa-rub" aria-hidden="true"></i> <?php echo $this->_tpl_vars['v']['value']['num']; ?>

                                            <?php elseif ($this->_tpl_vars['rates_default']['charcode'] == 'usd'): ?>
                                                <i class="fa fa-usd" aria-hidden="true"></i> <?php echo $this->_tpl_vars['v']['value']['num']; ?>

                                            <?php elseif ($this->_tpl_vars['rates_default']['charcode'] == 'eur'): ?>
                                                <i class="fa fa-eur" aria-hidden="true"></i> <?php echo $this->_tpl_vars['v']['value']['num']; ?>

                                            <?php else: ?>
                                                <?php echo $this->_tpl_vars['v']['value']['txt']; ?>

                                            <?php endif; ?>
                                        <?php else: ?>
                                            <?php echo $this->_tpl_vars['after_registration']; ?>

                                        <?php endif; ?>
                                    </strong>
                                </li>
                		<?php endif; ?>
    
                		<?php if ($this->_tpl_vars['v']['field_type'] == 's'): ?>
                			<li><span class="opt_name"><?php echo $this->_tpl_vars['v']['name']; ?>
</span>: <strong><?php if ($this->_tpl_vars['settings']['user'] || ( ! $this->_tpl_vars['settings']['user'] && $this->_tpl_vars['v']['hide'] == 0 )): ?><a href='<?php echo $this->_tpl_vars['settings']['patch']; ?>
sort/?<?php echo $this->_tpl_vars['v']['field_name']; ?>
=<?php echo $this->_tpl_vars['v']['field_value']; ?>
'><?php echo $this->_tpl_vars['v']['value']; ?>
</a><?php else: ?><?php echo $this->_tpl_vars['after_registration']; ?>
<?php endif; ?></strong></li>
                		<?php endif; ?>
                		<?php if ($this->_tpl_vars['v']['field_type'] == 'r'): ?>
                			<li><span class="opt_name"><?php echo $this->_tpl_vars['v']['name']; ?>
</span>: <strong><?php if ($this->_tpl_vars['settings']['user'] || ( ! $this->_tpl_vars['settings']['user'] && $this->_tpl_vars['v']['hide'] == 0 )): ?><a href='<?php echo $this->_tpl_vars['settings']['patch']; ?>
sort/?<?php echo $this->_tpl_vars['v']['field_name']; ?>
=<?php echo $this->_tpl_vars['v']['field_value']; ?>
'><?php echo $this->_tpl_vars['v']['value']; ?>
</a><?php else: ?><?php echo $this->_tpl_vars['after_registration']; ?>
<?php endif; ?></strong></li>
                		<?php endif; ?>
                		<?php if ($this->_tpl_vars['v']['field_type'] == 'c'): ?>
                			<li>
                                
                                    <span class="opt_name"><?php echo $this->_tpl_vars['v']['name']; ?>
</span>:
                                    <strong>
                            			<?php if ($this->_tpl_vars['settings']['user'] || ( ! $this->_tpl_vars['settings']['user'] && $this->_tpl_vars['v']['hide'] == 0 )): ?>
                            				<?php $_from = $this->_tpl_vars['v']['value']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }$this->_foreach['key'] = array('total' => count($_from), 'iteration' => 0);
if ($this->_foreach['key']['total'] > 0):
    foreach ($_from as $this->_tpl_vars['val']):
        $this->_foreach['key']['iteration']++;
?>
                            				<a href='<?php echo $this->_tpl_vars['settings']['patch']; ?>
sort/?<?php echo $this->_tpl_vars['v']['field_name']; ?>
[]=<?php echo $this->_tpl_vars['val']['key']; ?>
'><?php echo $this->_tpl_vars['val']['name']; ?>
</a><?php if (($this->_foreach['key']['iteration'] == $this->_foreach['key']['total']) == false): ?>, <?php endif; ?>
                            				<?php endforeach; endif; unset($_from); ?>
                            			<?php else: ?>
                            				<?php echo $this->_tpl_vars['after_registration']; ?>

                            			<?php endif; ?>
                                    </strong>
                			</li>
                		<?php endif; ?>
                
                        <?php if ($this->_tpl_vars['v']['field_type'] == 'f'): ?>
                            <li>
                                <span class="opt_name"><?php echo $this->_tpl_vars['v']['name']; ?>
</span>:
                                <strong>  
                                    <a href="<?php echo $this->_tpl_vars['settings']['patch']; ?>
download/<?php echo $this->_tpl_vars['message']['id']; ?>
/<?php echo ((is_array($_tmp=$this->_tpl_vars['v']['field_name'])) ? $this->_run_mod_handler('substr', true, $_tmp, 2) : substr($_tmp, 2)); ?>
/<?php echo $this->_tpl_vars['v']['value']['filename']; ?>
"><i class="fa fa-download" aria-hidden="true"></i> <?php echo $this->_tpl_vars['locale']['617']; ?>
</a>
                                </strong>
                            </li>
                        <?php endif; ?>
        
                        
                    <?php endif; ?>
                <?php endforeach; endif; unset($_from); ?>
                
            	<?php if (count($this->_tpl_vars['message']['tags']) > 0): ?>
            		<li><span class="opt_name"><?php echo $this->_tpl_vars['locale']['139']; ?>
</span>:
            		<?php $_from = $this->_tpl_vars['message']['tags']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }$this->_foreach['tags'] = array('total' => count($_from), 'iteration' => 0);
if ($this->_foreach['tags']['total'] > 0):
    foreach ($_from as $this->_tpl_vars['tag']):
        $this->_foreach['tags']['iteration']++;
?>
            			<a href="<?php echo $this->_tpl_vars['settings']['path']; ?>
tags/<?php echo ((is_array($_tmp=$this->_tpl_vars['tag']['word'])) ? $this->_run_mod_handler('urlencode', true, $_tmp) : urlencode($_tmp)); ?>
/"><?php echo $this->_tpl_vars['tag']['word']; ?>
</a><?php if (($this->_foreach['tags']['iteration'] == $this->_foreach['tags']['total']) == false): ?>, <?php endif; ?>
            		<?php endforeach; endif; unset($_from); ?>
            		</li>
            	<?php endif; ?>
                
            </ul>     
    
            <p>
                <?php echo $this->_tpl_vars['message']['text']; ?>

            </p>
        
    
            <?php $_from = $this->_tpl_vars['message']['fields']['t']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['txt']):
?>
                    <h5 class="list-title"><strong><?php echo $this->_tpl_vars['txt']['name']; ?>
</strong></h5>    
                    <div class="Ads-txt">
                        <?php if ($this->_tpl_vars['settings']['user'] || ( ! $this->_tpl_vars['settings']['user'] && $this->_tpl_vars['v']['hide'] == 0 )): ?>
                            <?php echo $this->_tpl_vars['txt']['value']; ?>

                        <?php else: ?>
                            <noindex>
                                <div class="alert alert-warning"><?php echo $this->_tpl_vars['locale']['1216']; ?>
 <a href="<?php echo $this->_tpl_vars['settings']['path']; ?>
users/register/"><?php echo $this->_tpl_vars['locale']['1217']; ?>
</a></div>
                            </noindex>
                        <?php endif; ?>
                    </div>
            <?php endforeach; endif; unset($_from); ?>
            
            <?php if (count($this->_tpl_vars['message']['fields']['y']) > 0): ?>
            	<?php $_from = $this->_tpl_vars['message']['fields']['y']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['key'] => $this->_tpl_vars['video']):
?>
                    <h5 class="list-title"><strong><?php echo $this->_tpl_vars['video']['name']; ?>
</strong></h5>
                	<?php if ($this->_tpl_vars['settings']['user'] || ( ! $this->_tpl_vars['settings']['user'] && $this->_tpl_vars['video']['hide'] == 0 )): ?>
                        <iframe width="100%" height="315" src="//www.youtube.com/embed/<?php echo $this->_tpl_vars['video']['value']; ?>
" frameborder="0" allowfullscreen></iframe>
                	<?php else: ?>
                        <noindex>
                            <div class="alert alert-warning"><?php echo $this->_tpl_vars['locale']['1216']; ?>
 <a href="<?php echo $this->_tpl_vars['settings']['path']; ?>
users/register/"><?php echo $this->_tpl_vars['locale']['1217']; ?>
</a></div>
                        </noindex>
                	<?php endif; ?>
            	<?php endforeach; endif; unset($_from); ?>
            <?php endif; ?>
            
            <?php if (count($this->_tpl_vars['message']['fields']['j']) > 0): ?>
            	<?php $_from = $this->_tpl_vars['message']['fields']['j']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['key'] => $this->_tpl_vars['yandex']):
?>
                    <h5 class="list-title"><strong><?php echo $this->_tpl_vars['yandex']['name']; ?>
</strong></h5>
                	<div class='block_yamap'>
                		<?php if ($this->_tpl_vars['settings']['user'] || ( ! $this->_tpl_vars['settings']['user'] && $this->_tpl_vars['yandex']['hide'] == 0 )): ?>
                			<iframe scrolling='no' src="<?php echo $this->_tpl_vars['settings']['patch']; ?>
yamaps/?field=<?php echo $this->_tpl_vars['yandex']['field_name']; ?>
&point=<?php echo $this->_tpl_vars['yandex']['value']; ?>
&message" style="width:100%; height:400px;" frameborder="0" class='add'></iframe>
                		<?php else: ?>
                            <noindex>
                                <div class="alert alert-warning"><?php echo $this->_tpl_vars['locale']['1216']; ?>
 <a href="<?php echo $this->_tpl_vars['settings']['path']; ?>
users/register/"><?php echo $this->_tpl_vars['locale']['1217']; ?>
</a></div>
                            </noindex>
                		<?php endif; ?>
                	</div>
            	<?php endforeach; endif; unset($_from); ?>
            <?php endif; ?>
            
            <?php if ($this->_tpl_vars['message']['shop']): ?>
                <h5 class="list-title">
                    <strong>
                        <?php echo $this->_tpl_vars['locale']['1104']; ?>
 &laquo;<a href="<?php echo $this->_tpl_vars['settings']['path']; ?>
shops/<?php echo $this->_tpl_vars['message']['shop']['link']; ?>
"><?php echo $this->_tpl_vars['message']['shop']['name']; ?>
</a>&raquo;
                    </strong>
                </h5>
                <?php if ($this->_tpl_vars['message']['shop']['delivery'] != ""): ?>
                    <p><strong><?php echo $this->_tpl_vars['locale']['1124']; ?>
</strong></p>
                    <?php echo $this->_tpl_vars['message']['shop']['delivery']; ?>

                <?php endif; ?>
                <?php if ($this->_tpl_vars['message']['shop']['payment'] != ""): ?>
                    <p><strong><?php echo $this->_tpl_vars['locale']['1125']; ?>
</strong></p>
                    <?php echo $this->_tpl_vars['message']['shop']['payment']; ?>

                <?php endif; ?>
                <?php if (count($this->_tpl_vars['message']['shopmessages']) != 0): ?>
                    <p>
                        <strong>
                            <?php echo $this->_tpl_vars['locale']['1158']; ?>
 &laquo;<?php echo $this->_tpl_vars['message']['shop']['name']; ?>
&raquo;
                        </strong>
                    </p>
                    <ul class="list-check">
                        <?php $_from = $this->_tpl_vars['message']['shopmessages']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['shopmessage']):
?>
                        	<li>
                                <a href="<?php echo $this->_tpl_vars['settings']['path']; ?>
<?php echo @MESSAGES; ?>
/<?php echo $this->_tpl_vars['shopmessage']['link']; ?>
"><?php echo $this->_tpl_vars['shopmessage']['title']; ?>
</a>
                                <?php if ($this->_tpl_vars['shopmessage']['fields']['p']['0']): ?>
                                    <span class="badge">
                                        <?php if ($this->_tpl_vars['rates_default']['charcode'] == 'rur'): ?>
                                            <i class="fa fa-rub" aria-hidden="true"></i> <?php echo $this->_tpl_vars['shopmessage']['fields']['p']['0']['value']['num']; ?>

                                        <?php elseif ($this->_tpl_vars['rates_default']['charcode'] == 'usd'): ?>
                                            <i class="fa fa-usd" aria-hidden="true"></i> <?php echo $this->_tpl_vars['shopmessage']['fields']['p']['0']['value']['num']; ?>

                                        <?php elseif ($this->_tpl_vars['rates_default']['charcode'] == 'eur'): ?>
                                            <i class="fa fa-eur" aria-hidden="true"></i> <?php echo $this->_tpl_vars['shopmessage']['fields']['p']['0']['value']['num']; ?>

                                        <?php else: ?>
                                            <?php echo $this->_tpl_vars['shopmessage']['fields']['p']['0']['value']['txt']; ?>

                                        <?php endif; ?>
                                    </span>
                                <?php endif; ?>
                            </li>
                        <?php endforeach; endif; unset($_from); ?>
                    </ul>
                <?php endif; ?>
            <?php endif; ?>  
        
            <?php if ($this->_tpl_vars['message']['simmessages']): ?>
                    <h5 class="list-title"><strong><?php echo $this->_tpl_vars['locale']['875']; ?>
</strong></h5>
                    <ul class="list-check">
                        <?php $_from = $this->_tpl_vars['message']['simmessages']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['simmessage']):
?>
                        	<li>
                                <a href="<?php echo $this->_tpl_vars['settings']['path']; ?>
<?php echo @MESSAGES; ?>
/<?php echo $this->_tpl_vars['simmessage']['link']; ?>
"><?php echo $this->_tpl_vars['simmessage']['title']; ?>
</a>
                                <?php if ($this->_tpl_vars['simmessage']['fields']['p']['0']): ?>
                                    <span class="badge">
                                        <?php if ($this->_tpl_vars['rates_default']['charcode'] == 'rur'): ?>
                                            <i class="fa fa-rub" aria-hidden="true"></i> <?php echo $this->_tpl_vars['simmessage']['fields']['p']['0']['value']['num']; ?>

                                        <?php elseif ($this->_tpl_vars['rates_default']['charcode'] == 'usd'): ?>
                                            <i class="fa fa-usd" aria-hidden="true"></i> <?php echo $this->_tpl_vars['simmessage']['fields']['p']['0']['value']['num']; ?>

                                        <?php elseif ($this->_tpl_vars['rates_default']['charcode'] == 'eur'): ?>
                                            <i class="fa fa-eur" aria-hidden="true"></i> <?php echo $this->_tpl_vars['simmessage']['fields']['p']['0']['value']['num']; ?>

                                        <?php else: ?>
                                            <?php echo $this->_tpl_vars['simmessage']['fields']['p']['0']['value']['txt']; ?>

                                        <?php endif; ?>
                                    </span>
                                <?php endif; ?>
                            </li>
                        <?php endforeach; endif; unset($_from); ?>
                    </ul>
            <?php endif; ?>   
            
            <?php if ($this->_tpl_vars['is_billing']): ?>
            	<div class='services'>
                    <h5 class="list-title"><i class="icon-certificate icon-color-1"></i> <strong><?php echo $this->_tpl_vars['locale']['1294']; ?>
</strong></h5>
            		<?php $_from = $this->_tpl_vars['services']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['serv']):
?>

        					<?php $this->assign('href', ($this->_tpl_vars['settings']['path'])."services.html?service=".($this->_tpl_vars['serv']['type'])."&message_id=".($this->_tpl_vars['message']['id'])); ?>
        					<?php $this->assign('iframeclass', 'premium_modal'); ?>

                            <a href="<?php echo $this->_tpl_vars['href']; ?>
" class="<?php echo $this->_tpl_vars['iframeclass']; ?>
 btn btn-primary btn-xs">
                                <?php if ($this->_tpl_vars['serv']['type'] == 'm'): ?>
                                    <i class="fa fa-paint-brush" aria-hidden="true"></i>
                                <?php elseif ($this->_tpl_vars['serv']['type'] == 'r'): ?>
                                    <i class="fa fa-arrow-circle-o-up" aria-hidden="true"></i>
                                <?php elseif ($this->_tpl_vars['serv']['type'] == 'b'): ?>
                                    <i class="fa fa-th-large" aria-hidden="true"></i>
                                <?php else: ?>
                                    <i class="icon-certificate"></i>
                                <?php endif; ?>
                                <?php echo $this->_tpl_vars['serv']['name']; ?>

                            </a>
            		<?php endforeach; endif; unset($_from); ?>
            	</div>
            <?php endif; ?> 
            <?php if ($this->_tpl_vars['settings']['sharing'] != 0): ?>
                <div class="sharing">
                    <h5 class="list-title"><strong><?php echo $this->_tpl_vars['locale']['1267']; ?>
</strong></h5>
                    <?php if ($this->_tpl_vars['settings']['sharing'] == 1): ?>
                        <div class="ya-share2" data-services="vkontakte,facebook,odnoklassniki,twitter,whatsapp" data-counter=""></div>
                    <?php elseif ($this->_tpl_vars['settings']['sharing'] == 2): ?>
                        <div class="social-likes">
                        	<div class="facebook" title="<?php echo $this->_tpl_vars['locale']['1302']; ?>
">Facebook</div>
                        	<div class="twitter" title="<?php echo $this->_tpl_vars['locale']['1303']; ?>
">Twitter</div>
                        	<div class="mailru" title="<?php echo $this->_tpl_vars['locale']['1304']; ?>
"><?php echo $this->_tpl_vars['locale']['1299']; ?>
</div>
                        	<div class="vkontakte" title="<?php echo $this->_tpl_vars['locale']['1305']; ?>
"><?php echo $this->_tpl_vars['locale']['1300']; ?>
</div>
                        	<div class="odnoklassniki" title="<?php echo $this->_tpl_vars['locale']['1306']; ?>
"><?php echo $this->_tpl_vars['locale']['1301']; ?>
</div>
                        </div>
                    <?php endif; ?>
                </div>
            <?php endif; ?>
            
            <div class="content-footer text-left">
                <a class="btn btn-default contact_modal" href="<?php echo $this->_tpl_vars['contact_link']; ?>
">
                    <i class=" icon-mail-2"></i> <?php echo $this->_tpl_vars['locale']['919']; ?>
 
                </a> 
                
                <?php if ($this->_tpl_vars['message']['user_array']['phone'] != ""): ?>
                    <a class="btn btn-info btn-phone" href="#" id="user_<?php echo $this->_tpl_vars['message']['user_array']['id']; ?>
">
                        <i class="icon-phone-1"></i> <span><?php echo $this->_tpl_vars['locale']['1218']; ?>
</span>
                    </a>
                <?php endif; ?>
                
                <?php $_from = $this->_tpl_vars['message']['fields']['v']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['phone']):
?>
                    <?php if ($this->_tpl_vars['phone']['string_type'] == 't'): ?>
                        <a class="btn btn-info btn-phone" href="#" id="<?php echo $this->_tpl_vars['phone']['field_name']; ?>
_<?php echo $this->_tpl_vars['message']['id']; ?>
">
                            <i class="icon-phone-1"></i> <span><?php echo $this->_tpl_vars['phone']['name']; ?>
</span>
                        </a>
                    <?php endif; ?>
                <?php endforeach; endif; unset($_from); ?>
                
                <a class="btn <?php if ($this->_tpl_vars['message']['fav'] == 1): ?>btn-default<?php else: ?>btn-success<?php endif; ?> make-favorite notepad" data-id="<?php echo $this->_tpl_vars['message']['id']; ?>
"> 
                    <i class="fa fa-bookmark-o"></i> <span><?php echo $this->_tpl_vars['locale']['228']; ?>
</span> 
                </a>
    
                
            </div>
            
            
            
            
            
        </div>
    </div>
    
    <!--/.ads-details-wrapper-->
    
    <?php if ($this->_tpl_vars['settings']['comment_on']): ?>
      
    </div>
    <div class="inner-box category-content comment-block">
        <?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => 'comments.html', 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>
      
    <?php endif; ?>
      
    <?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => 'form_contact.html', 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>
    <?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => 'form_premium.html', 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>

<?php endif; ?>