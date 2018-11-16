<?php /* Smarty version 2.6.25, created on 2018-04-18 16:41:45
         compiled from popup_services.html */ ?>
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
assets/css/style.css" rel="stylesheet">
    
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
    <?php if ($this->_tpl_vars['message']): ?>
    function calc(num)
    	{
    	var pr;
    	pr = parseInt(document.frm.days.value) * <?php echo $this->_tpl_vars['service']['price']; ?>
;
        document.getElementById('count').style.marginTop  = '0px';
        
    	if(isNaN(pr))
    		{
    		document.getElementById('count').innerHTML = '<?php echo $this->_tpl_vars['locale']['636']; ?>
';
    		document.frm.submit.disabled = true;
    		}
    	else if(parseInt(document.frm.days.value) > <?php echo $this->_tpl_vars['service']['max']; ?>
)
    		{
    		document.getElementById('count').innerHTML = '<?php echo $this->_tpl_vars['locale']['637']; ?>
';
    		document.frm.submit.disabled = true;
    		}
    	else if(parseInt(document.frm.days.value) < <?php echo $this->_tpl_vars['service']['min']; ?>
)
    		{
    		document.getElementById('count').innerHTML = '<?php echo $this->_tpl_vars['locale']['638']; ?>
';
    		document.frm.submit.disabled = true;
    		}
    	else
    		{
    		document.getElementById('count').innerHTML = pr + ' ' + '<?php echo $this->_tpl_vars['Currency']; ?>
';
            document.getElementById('count').style.marginTop  = '10px';
    		document.frm.submit.disabled = false;
    		}
            
            console.log(document.getElementById('count'));
    
    	}
     <?php endif; ?>
    </script>
</head>
<body class="premium">
 
            <?php if (! $this->_tpl_vars['message']): ?>
            <div class="alert alert-warning">
                Выберите объявление!
            </div>
                
            <?php elseif ($this->_tpl_vars['status'] == 'done'): ?>
            <div class="alert alert-success">
                <?php echo $this->_tpl_vars['locale']['186']; ?>
 <?php echo $this->_tpl_vars['locale']['188']; ?>
 
            </div>
            <?php elseif ($this->_tpl_vars['status'] == 'go'): ?>
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
            <style>
            .checkboxtable td{
                cursor: pointer;
                font-size: 13px;
            }
            .main_service{
                font-size: 15px;
            }
            #count{
                margin-top:10px;
            }
            </style>
            <?php if ($this->_supers['get']['service']): ?>
                <div class="row main_service">
                    <?php $this->assign('serv', $this->_tpl_vars['services'][$this->_supers['get']['service']]); ?>
                    <strong><?php echo $this->_tpl_vars['serv']['name']; ?>
</strong> 
                    <p><small><em><?php echo $this->_tpl_vars['serv']['tip']; ?>
</em></small></p>
                </div>
                <div class="row">
 
                        <?php if ($this->_tpl_vars['service_packages']): ?>
                            <table class="table table-hover checkboxtable">
                        		<?php $_from = $this->_tpl_vars['service_packages']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['p']):
?>
                                    <tr onclick="document.location.href='?act=buy&service=<?php echo $this->_supers['get']['service']; ?>
&message_id=<?php echo $this->_supers['get']['message_id']; ?>
&package_id=<?php echo $this->_tpl_vars['p']['id']; ?>
';">
                                        <td>
                                            <strong><?php echo $this->_tpl_vars['p']['text']; ?>
</strong> 
                                        </td>
                                        <td>
                                            <?php echo $this->_tpl_vars['p']['price']; ?>
 <?php echo $this->_tpl_vars['Currency']; ?>

                                        </td>
                                        <td>
                                            <a href="#" class="btn btn-xs btn-primary"><i class="fa fa-shopping-cart" aria-hidden="true"></i> Заказать</a>
                                        </td>
                                    </tr>
                                <?php endforeach; endif; unset($_from); ?>
                            </table>
                        <?php else: ?>
                            <form name="frm" method="GET" >
                                <input type="hidden" name="service" value="<?php echo $this->_supers['get']['service']; ?>
" />
                                <input type="hidden" name="message_id" value="<?php echo $this->_supers['get']['message_id']; ?>
" />
                                <input type="hidden" name="act" value="buy" />
                                <div class="row">
                                    <div class="col-xs-4">
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
                                    </div>
                                    <div class="col-xs-4">
                                        <p class="lead" id='count'><?php echo $this->_tpl_vars['count']; ?>
</p>
                                    </div>
                                    <div class="col-xs-4">
                                        <input type="submit" value="<?php echo $this->_tpl_vars['locale']['65']; ?>
" class="btn btn-primary" name="submit" />
                                    </div>
                                </div>      
                            </form>
                        <?php endif; ?>
            
                </div>
                
                <h3><i class=" icon-certificate icon-color-1"></i>  <?php echo $this->_tpl_vars['locale']['1340']; ?>
</h3>
            <?php endif; ?>
            <div class="row">
                <table class="table table-hover checkboxtable">
            		<?php $_from = $this->_tpl_vars['services']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['serv']):
?>
                        <?php if ($this->_supers['get']['service'] != $this->_tpl_vars['serv']['type']): ?>
                            <?php $this->assign('c', $this->_tpl_vars['service']['price']*$this->_tpl_vars['p']['days']); ?>
                            <tr>
                                <td <?php if ($this->_supers['get']['service'] != $this->_tpl_vars['serv']['type']): ?>class="noactive"<?php endif; ?> onclick="document.location.href='?service=<?php echo $this->_tpl_vars['serv']['type']; ?>
&message_id=<?php echo $this->_supers['get']['message_id']; ?>
';">
                                    <strong><?php echo $this->_tpl_vars['serv']['name']; ?>
</strong> 
                                    <p><small><em style="font-weight: normal;"><?php echo $this->_tpl_vars['serv']['tip']; ?>
</em></small></p>
                                </td>
                            </tr>
                        <?php endif; ?>
                    <?php endforeach; endif; unset($_from); ?>
                
                </table>
            </div>

            <?php endif; ?>
        
        
        
        


    

</body>
</html>