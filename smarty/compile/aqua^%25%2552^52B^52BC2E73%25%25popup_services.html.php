<?php /* Smarty version 2.6.25, created on 2018-11-16 16:26:17
         compiled from popup_services.html */ ?>
<?php require_once(SMARTY_CORE_DIR . 'core.load_plugins.php');
smarty_core_load_plugins(array('plugins' => array(array('modifier', 'rand', 'popup_services.html', 9, false),)), $this); ?>
<html>

<head>
    <meta charset="<?php echo $this->_tpl_vars['settings']['charset']; ?>
">
    <title><?php echo $this->_tpl_vars['title_popup']; ?>
</title>
    <!-- Bootstrap core CSS -->
    <link href="<?php echo @THEME; ?>
assets/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <!-- Custom styles for this template -->
    <link href="<?php echo @THEME; ?>
assets/css/style.css?r=<?php echo ((is_array($_tmp=10000)) ? $this->_run_mod_handler('rand', true, $_tmp, 9999999999) : rand($_tmp, 9999999999)); ?>
" rel="stylesheet">
    
    <script>
    function IsNumeric(sText){
        var ValidChars = "0123456789.";
        var IsNumber=true;
        var Char;
        for (i = 0; i < sText.length && IsNumber == true; i++){
          Char = sText.charAt(i);
          if (ValidChars.indexOf(Char) == -1){
             IsNumber = false;
          }
        }
        return IsNumber;
        }
    
    function calc(num)
    	{
    	var pr;
    	pr = parseInt(document.frm.days.value) * <?php echo $this->_tpl_vars['service']['price']; ?>
;
    	if(isNaN(pr))
    		{
    		document.getElementById('count').innerHTML = '<?php echo $this->_tpl_vars['locale']['636']; ?>
';
    		document.frm.submit.disabled = true;
    		document.frm.spAmount.value = '';
    		}
    	else if(parseInt(document.frm.days.value) > <?php echo $this->_tpl_vars['service']['max']; ?>
)
    		{
    		document.getElementById('count').innerHTML = '<?php echo $this->_tpl_vars['locale']['637']; ?>
';
    		document.frm.submit.disabled = true;
    		document.frm.spAmount.value = '';
    		}
    	else if(parseInt(document.frm.days.value) < <?php echo $this->_tpl_vars['service']['min']; ?>
)
    		{
    		document.getElementById('count').innerHTML = '<?php echo $this->_tpl_vars['locale']['638']; ?>
';
    		document.frm.submit.disabled = true;
    		document.frm.spAmount.value = '';
    		}
    	else
    		{
    		document.getElementById('count').innerHTML = pr + ' ' + '<?php echo $this->_tpl_vars['Currency']; ?>
';
    		document.frm.submit.disabled = false;
    		document.frm.spAmount.value = pr;
    		}
    
    	}
    </script>
</head>
<body class="premium">
    <h3><?php echo $this->_tpl_vars['message']['title']; ?>
</h3>      

        
        
        
            <?php if ($this->_tpl_vars['status'] == 'go'): ?>
            <div class="billing_html">
                <?php echo $this->_tpl_vars['html']; ?>

            </div>
            <?php elseif ($this->_tpl_vars['status'] == 'select'): ?>
            

            
            
            <p><?php echo $this->_tpl_vars['locale']['191']; ?>
: <b><?php echo $this->_tpl_vars['Count']; ?>
</b> <?php echo $this->_tpl_vars['Currency']; ?>
. <?php echo $this->_tpl_vars['locale']['182']; ?>
: <b><?php echo $this->_tpl_vars['service']['name']; ?>
</b></p>
            <p><?php echo $this->_tpl_vars['locale']['661']; ?>
:</p>
            <div class="bil">
            	<?php $_from = $this->_tpl_vars['billing']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['k'] => $this->_tpl_vars['bil']):
?>
            		<?php if ($this->_tpl_vars['bil']['status'] == 1): ?>
                        <?php $this->assign('icon', (@FULLPATH)."templates/".(@THEME_NAME)."/images/billing/".($this->_tpl_vars['k']).".png"); ?>
                        <?php $this->assign('link', "?service=".($this->_supers['get']['service'])."&message_id=".($this->_supers['get']['message_id'])."&p=".($this->_tpl_vars['bil']['uri'])."&id=".($this->_tpl_vars['payment_id'])); ?>
                        <div class="row">
                            <div class="col-xs-3">
                                <a href="<?php echo $this->_tpl_vars['link']; ?>
">
                                    <?php if (file_exists ( $this->_tpl_vars['icon'] )): ?>
                                        <?php $this->assign('icon', (@THEME)."images/billing/".($this->_tpl_vars['k']).".png"); ?>
                                    <?php else: ?>
                                        <?php $this->assign('icon', (@THEME)."images/billing/default.png"); ?>
                                    <?php endif; ?>
                                    <img src="<?php echo $this->_tpl_vars['icon']; ?>
" alt="<?php echo $this->_tpl_vars['bil']['name']; ?>
"  class="img-thumbnail"/>
                                </a>
                            </div>
                            <div class="col-xs-9">
                                <p><b><?php echo $this->_tpl_vars['bil']['name']; ?>
</b> &mdash; <?php echo $this->_tpl_vars['bil']['descr']; ?>
</p>
                                <p><a href="<?php echo $this->_tpl_vars['link']; ?>
" class="btn btn-primary btn-sm"><?php echo $this->_tpl_vars['locale']['339']; ?>
</a></p>
                            </div>
                        </div>
            		<?php endif; ?>
            	<?php endforeach; endif; unset($_from); ?>
            </div>
            
            <?php elseif ($this->_tpl_vars['status'] == 'calc'): ?>
            
                <div class="row">
                    <div class="col-xs-5">
                        <ul class="nav nav-pills nav-stacked">
                            <?php $_from = $this->_tpl_vars['services']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['serv']):
?>
                                <li <?php if ($this->_supers['get']['service'] == $this->_tpl_vars['serv']['type']): ?>class="active"<?php endif; ?>><a href="?service=<?php echo $this->_tpl_vars['serv']['type']; ?>
&message_id=<?php echo $this->_supers['get']['message_id']; ?>
"><?php echo $this->_tpl_vars['serv']['name']; ?>
</a></li>
                            <?php endforeach; endif; unset($_from); ?>
                        </ul>
                    </div>
                    <div class="col-xs-7">
                    	<form name="frm" action='?service=<?php echo $this->_supers['get']['service']; ?>
&message_id=<?php echo $this->_supers['get']['message_id']; ?>
' method='post'>
                                     
                            <?php if ($this->_tpl_vars['service_packages']): ?>
                                <label><?php echo $this->_tpl_vars['locale']['160']; ?>
</label>
                                <table class="table table-hover checkboxtable">
                            		<?php $_from = $this->_tpl_vars['service_packages']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['p']):
?>
                                        <?php $this->assign('c', $this->_tpl_vars['service']['price']*$this->_tpl_vars['p']['days']); ?>
                                        <tr>
                                            <td>
                                                <div class="radio">
                                                    <label>
                                                        <input id="days_<?php echo $this->_tpl_vars['p']['id']; ?>
" type="radio" name="days" value="<?php echo $this->_tpl_vars['p']['days']; ?>
">
                                                        <strong><?php echo $this->_tpl_vars['p']['text']; ?>
</strong> 
                                                    </label>
                                                </div>
                                            </td>
                                            <td>
                                            <div class="radio">
                                                <label for="days_<?php echo $this->_tpl_vars['p']['id']; ?>
"><?php echo $this->_tpl_vars['c']; ?>
 <?php echo $this->_tpl_vars['Currency']; ?>
</label>
                                            </div>
                                            </td>
                                        </tr>
                                    <?php endforeach; endif; unset($_from); ?>
                                
                                </table>
                            <?php else: ?>
                                <p>
                                    <label for="days"><?php echo $this->_tpl_vars['locale']['160']; ?>
</label>
                                    <div class="input-group">
                                        <input onchange="calc();" onkeyup="var n=this.value.replace(/([^0-9])/g,''); if(n!=this.value) this.value=n; calc();"
                                            id="days" name="days" value="<?php echo $this->_tpl_vars['days']; ?>
" class="form-control"                
                                            placeholder="<?php echo $this->_tpl_vars['service']['min']; ?>
 &mdash; <?php echo $this->_tpl_vars['service']['max']; ?>
" type="number" />
                                        <span class="input-group-addon"><?php echo $this->_tpl_vars['locale']['175']; ?>
</span>
                                    </div>
                                </p>
                                <p class="lead"><?php echo $this->_tpl_vars['locale']['191']; ?>
 <span id='count'><?php echo $this->_tpl_vars['count']; ?>
</span></p>
                                           
                            <?php endif; ?>
                
                			<input type="submit" value="<?php echo $this->_tpl_vars['locale']['65']; ?>
" class="btn btn-primary" name="submit" />
        
                
                
                        </form>
                    </div>
                </div>
            <?php endif; ?>
        
        
        
        


    

</body>
</html>