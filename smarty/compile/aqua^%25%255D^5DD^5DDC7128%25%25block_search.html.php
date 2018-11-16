<?php /* Smarty version 2.6.25, created on 2018-11-16 16:23:56
         compiled from block_search.html */ ?>
<?php $this->assign('category', $this->_tpl_vars['second_cat']['id']); ?>
<?php if ($this->_supers['get']['add_cat']): ?>
    <?php $this->assign('category', $this->_supers['get']['add_cat']); ?>
<?php endif; ?>

<?php $this->assign('region', $this->_tpl_vars['second_region']['id']); ?>
<?php if ($this->_supers['get']['add_region']): ?>
    <?php $this->assign('region', $this->_supers['get']['add_region']); ?>
<?php endif; ?>

<div class="block_search">
    <form name="block_search" method="GET" action="<?php echo $this->_tpl_vars['settings']['path']; ?>
search/">
        <input type="hidden" name="add_cat" class="add_cat" value="<?php echo $this->_tpl_vars['category']; ?>
" />
        <input type="hidden" name="add_region" class="add_region" value="<?php echo $this->_tpl_vars['region']; ?>
" />
        <input type="hidden" name="map"  class="add_map"  value="<?php echo $this->_supers['get']['map']; ?>
" />
        
        <div class="search-col relative search_text">
              <i class="icon-docs icon-append"></i>
              <div class="input-group">
                  <input type="text" name="text" class="form-control has-icon" placeholder="<?php echo $this->_tpl_vars['locale']['873']; ?>
" value="<?php echo $this->_supers['get']['text']; ?>
" />
                  <span class="input-group-btn">
                      <button class="btn btn-primary" type="submit">
                         <i class="fa fa-search"></i>
                      </button>
                  </span>
              </div>
        </div>
        
        <div class="checkbox shop_search" style="display: none;" >
            <label>
                <input class="shop_id" type="checkbox" name="shop" value="" checked ><?php echo $this->_tpl_vars['locale']['1128']; ?>
 &laquo;<span class="shop_name"></span>&raquo;
            </label>
        </div>
        
        <?php if ($this->_supers['get']['cat']['0'] == 'search'): ?>


                        <div class="float_field">
                <h5 class="list-title">
                    <strong>
                        <?php if ($this->_tpl_vars['category']): ?>
                            <?php $this->assign('category_parent', $this->_tpl_vars['categories'][$this->_tpl_vars['category']]['parent']); ?>
                            <a href="#" class="a-submit" data-var="add_cat" data-value="<?php echo $this->_tpl_vars['category_parent']; ?>
">
                                <i class="fa fa-angle-left"></i>
                                <?php if ($this->_tpl_vars['category_parent'] == 0): ?>
                                    <?php echo $this->_tpl_vars['locale']['1198']; ?>

                                <?php else: ?>
                                    <?php echo $this->_tpl_vars['categories'][$this->_tpl_vars['category_parent']]['name']; ?>

                                <?php endif; ?>
                            </a>
                        <?php else: ?>
                            <?php echo $this->_tpl_vars['locale']['1198']; ?>

                            <?php $this->assign('category', 0); ?>
                        <?php endif; ?>
                    </strong>
                </h5>
                <?php if ($this->_tpl_vars['category'] != 0): ?>
                    <ul class="list-unstyled">
                        <li>
                            <a href="#" class="a-submit" data-var="add_cat" data-value="<?php echo $this->_tpl_vars['categories'][$this->_tpl_vars['category']]['id']; ?>
">
                                <span class="title"><strong><?php echo $this->_tpl_vars['categories'][$this->_tpl_vars['category']]['name']; ?>
</strong></span>
                            </a>
                <?php endif; ?>
            
                        <ul class="list-unstyled long-list">
                            <?php $_from = $this->_tpl_vars['categories']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['cat']):
?>
                                <?php if ($this->_tpl_vars['cat']['parent'] == $this->_tpl_vars['category']): ?>
                                    <li>
                                        <a href="#" class="a-submit" data-var="add_cat" data-value="<?php echo $this->_tpl_vars['cat']['id']; ?>
"> 
                                            <span class="title"><?php echo $this->_tpl_vars['cat']['name']; ?>
</span>
                                        </a>
                                    </li>
                                <?php endif; ?>
                            <?php endforeach; endif; unset($_from); ?>
                        </ul> 
                <?php if ($this->_tpl_vars['category'] != 0): ?>
                        </li>
                    </ul>
                <?php endif; ?>  
                
            </div>
                        <div class="float_field">
                <h5 class="list-title">
                    <strong>
                        <?php if ($this->_tpl_vars['region']): ?>
                            <?php $this->assign('region_parent', $this->_tpl_vars['allregions'][$this->_tpl_vars['region']]['parent']); ?>
                            <a href="#" class="a-submit" data-var="add_region" data-value="<?php echo $this->_tpl_vars['region_parent']; ?>
">
                                <i class="fa fa-angle-left"></i>
                                <?php if ($this->_tpl_vars['region_parent'] == 0): ?>
                                    <?php echo $this->_tpl_vars['locale']['9']; ?>

                                <?php else: ?>
                                    <?php echo $this->_tpl_vars['allregions'][$this->_tpl_vars['region_parent']]['name']; ?>

                                <?php endif; ?>
                            </a>
                        <?php else: ?>
                            <?php echo $this->_tpl_vars['locale']['9']; ?>

                            <?php $this->assign('region', 0); ?>
                        <?php endif; ?>
                    </strong>
                </h5>
                <?php if ($this->_tpl_vars['region'] != 0): ?>
                    <ul class="list-unstyled">
                        <li>
                            <a href="#" class="a-submit" data-var="add_region" data-value="<?php echo $this->_tpl_vars['allregions'][$this->_tpl_vars['region']]['id']; ?>
">
                                <span class="title"><strong><?php echo $this->_tpl_vars['allregions'][$this->_tpl_vars['region']]['name']; ?>
</strong></span>
                            </a>
                <?php endif; ?>
            
                        <ul class="list-unstyled long-list" data-max="3">
                            <?php $_from = $this->_tpl_vars['allregions']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['reg']):
?>
                                <?php if ($this->_tpl_vars['reg']['parent'] == $this->_tpl_vars['region']): ?>
                                    <li>
                                        <a href="#" class="a-submit" data-var="add_region" data-value="<?php echo $this->_tpl_vars['reg']['id']; ?>
"> 
                                            <span class="title"><?php echo $this->_tpl_vars['reg']['name']; ?>
</span>
                                        </a>
                                    </li>
                                <?php endif; ?>
                            <?php endforeach; endif; unset($_from); ?>
                        </ul> 
                <?php if ($this->_tpl_vars['region'] != 0): ?>
                        </li>
                    </ul>
                <?php endif; ?> 
            </div>             
        <?php endif; ?>
                <div class="block_search_ajax">
        
        </div>
        <div class="text-center">
            <button class="btn btn-primary" type="submit"><i class="fa fa-search" aria-hidden="true"></i> <?php echo $this->_tpl_vars['locale']['203']; ?>
</button>
        </div>
        
    </form>
</div>