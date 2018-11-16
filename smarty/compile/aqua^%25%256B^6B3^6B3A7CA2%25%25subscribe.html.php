<?php /* Smarty version 2.6.25, created on 2018-11-16 16:25:36
         compiled from subscribe.html */ ?>
<?php require_once(SMARTY_CORE_DIR . 'core.load_plugins.php');
smarty_core_load_plugins(array('plugins' => array(array('modifier', 'date_format', 'subscribe.html', 238, false),)), $this); ?>

<meta name="viewport" content="width=device-width" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />

	
<style>
/* ------------------------------------- 
		GLOBAL 
------------------------------------- */
* { 
	margin:0;
	padding:0;
}
* { font-family: "Helvetica Neue", "Helvetica", Helvetica, Arial, sans-serif; }

img { 
	max-width: 100%; 
}
.collapse {
	margin:0;
	padding:0;
}
body {
	-webkit-font-smoothing:antialiased; 
	-webkit-text-size-adjust:none; 
	width: 100%!important; 
	height: 100%;
}


/* ------------------------------------- 
		ELEMENTS 
------------------------------------- */
a { color: #2BA6CB;}

.btn {
	text-decoration:none;
	color: #FFF;
	background-color: #666;
	padding:10px 16px;
	font-weight:bold;
	margin-right:10px;
	text-align:center;
	cursor:pointer;
	display: inline-block;
}

p.callout {
	padding:15px;
	background-color:#ECF8FF;
	margin-bottom: 15px;
}
.callout a {
	font-weight:bold;
	color: #2BA6CB;
}



/* ------------------------------------- 
		HEADER 
------------------------------------- */
table.head-wrap { width: 100%;}

.header.container table td.logo { padding: 15px; }
.header.container table td.label { padding: 15px; padding-left:0px;}


/* ------------------------------------- 
		BODY 
------------------------------------- */
table.body-wrap { width: 100%;}


/* ------------------------------------- 
		FOOTER 
------------------------------------- */
table.footer-wrap { width: 100%;	clear:both!important;
}
.footer-wrap .container td.content  p { border-top: 1px solid rgb(215,215,215); padding-top:15px;}
.footer-wrap .container td.content p {
	font-size:10px;
	font-weight: bold;
	
}


/* ------------------------------------- 
		TYPOGRAPHY 
------------------------------------- */
h1,h2,h3,h4,h5,h6 {
font-family: "HelveticaNeue-Light", "Helvetica Neue Light", "Helvetica Neue", Helvetica, Arial, "Lucida Grande", sans-serif; line-height: 1.1; margin-bottom:15px; color:#000;
}
h1 small, h2 small, h3 small, h4 small, h5 small, h6 small { font-size: 60%; color: #6f6f6f; line-height: 0; text-transform: none; }

h1 { font-weight:200; font-size: 44px;}
h2 { font-weight:200; font-size: 37px;}
h3 { font-weight:500; font-size: 27px;}
h4 { font-weight:500; font-size: 23px;}
h5 { font-weight:900; font-size: 17px;}
h6 { font-weight:900; font-size: 14px; text-transform: uppercase; color:#444;}

.collapse { margin:0!important;}

p, ul { 
	margin-bottom: 10px; 
	font-weight: normal; 
	font-size:14px; 
	line-height:1.6;
}
p.lead { font-size:17px; }
p.last { margin-bottom:0px;}

ul li {
	margin-left:5px;
	list-style-position: inside;
}



/* --------------------------------------------------- 
		RESPONSIVENESS
		Nuke it from orbit. It's the only way to be sure. 
------------------------------------------------------ */

/* Set a max-width, and make it display as block so it will automatically stretch to that width, but will also shrink down on a phone or something */
.container {
	display:block!important;
	max-width:600px!important;
	margin:0 auto!important; /* makes it centered */
	clear:both!important;
}

/* This should also be a block element, so that it will fill 100% of the .container */
.content {
	padding:15px;
	max-width:600px;
	margin:0 auto;
	display:block; 
}

/* Let's make sure tables in the content area are 100% wide */
.content table { width: 100%; }




/* Be sure to place a .clear element after each set of columns, just to be safe */
.clear { display: block; clear: both; }


/* ------------------------------------------- 
		PHONE
		For clients that support media queries.
		Nothing fancy. 
-------------------------------------------- */
@media only screen and (max-width: 600px) {
	
	a[class="btn"] { display:block!important; margin-bottom:10px!important; background-image:none!important; margin-right:0!important;}

	div[class="column"] { width: auto!important; float:none!important;}
	
	table.social div[class="column"] {
		width:auto!important;
	}

}
</style>



<!-- BODY -->
<table class="body-wrap" bgcolor="">
	<tr>
		<td></td>
		<td class="container" align="" bgcolor="#FFFFFF">
			
			<!-- content -->
			<div class="content">
				<table>
					<tr>
						<td>
							

							<p class="lead">
                                <?php echo $this->_tpl_vars['locale']['148']; ?>
 <a href="<?php echo $this->_tpl_vars['settings']['http']; ?>
://<?php echo $this->_tpl_vars['settings']['site_address']; ?>
"><b><?php echo @TITLE; ?>
</b></a>
                            </p>

							
						</td>
					</tr>
				</table>
			</div><!-- /content -->



			<div class="content"><table bgcolor="">
				<tr>
					<td>
						<p class="callout">
                            <?php echo $this->_tpl_vars['locale']['149']; ?>
: <a href="http://<?php echo $this->_tpl_vars['settings']['site_address']; ?>
<?php echo $this->_tpl_vars['settings']['path']; ?>
users/"><?php echo $this->_tpl_vars['settings']['http']; ?>
://<?php echo $this->_tpl_vars['settings']['site_address']; ?>
<?php echo $this->_tpl_vars['settings']['path']; ?>
users/</a>
                        </p>
					</td>
				</tr>
			</table></div>

			
			<!-- content -->
			<div class="content">
				
				<table bgcolor="">
					<tr>
						<td>
							<h4>
                                <a href='<?php echo $this->_tpl_vars['settings']['http']; ?>
://<?php echo $this->_tpl_vars['settings']['site_address']; ?>
<?php echo $this->_tpl_vars['settings']['path']; ?>
<?php echo @MESSAGES; ?>
/<?php echo $this->_tpl_vars['message']['link']; ?>
'><?php echo $this->_tpl_vars['message']['title']; ?>
</a>
                                <small>
                                	<?php if ($this->_tpl_vars['message']['user_id'] != 0): ?>
                                		<?php echo $this->_tpl_vars['message']['user_id_name']; ?>

                                	<?php else: ?>
                                		<?php echo $this->_tpl_vars['message']['user']; ?>

                                	<?php endif; ?>
                                </small>
                            </h4>
							<p><?php echo $this->_tpl_vars['message']['text']; ?>
</p>
                            <ul>
                            	<li><?php echo $this->_tpl_vars['locale']['17']; ?>
:
                            	<?php $_from = $this->_tpl_vars['message']['array_linenav']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }$this->_foreach['i'] = array('total' => count($_from), 'iteration' => 0);
if ($this->_foreach['i']['total'] > 0):
    foreach ($_from as $this->_tpl_vars['linenav']):
        $this->_foreach['i']['iteration']++;
?>
                            	<?php echo $this->_tpl_vars['linenav']['name']; ?>

                            	<?php if (($this->_foreach['i']['iteration'] == $this->_foreach['i']['total']) == false): ?> / <?php endif; ?>
                            	<?php endforeach; endif; unset($_from); ?>
                            	</li>
                            	<li><?php echo $this->_tpl_vars['locale']['16']; ?>
:
                            	<?php $_from = $this->_tpl_vars['message']['array_regions']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }$this->_foreach['i'] = array('total' => count($_from), 'iteration' => 0);
if ($this->_foreach['i']['total'] > 0):
    foreach ($_from as $this->_tpl_vars['region']):
        $this->_foreach['i']['iteration']++;
?>
                            	<?php echo $this->_tpl_vars['region']['name']; ?>

                            	<?php if (($this->_foreach['i']['iteration'] == $this->_foreach['i']['total']) == false): ?> / <?php endif; ?>
                            	<?php endforeach; endif; unset($_from); ?>
                            	</li>
                            	<li><?php echo $this->_tpl_vars['locale']['13']; ?>
: <?php echo ((is_array($_tmp=$this->_tpl_vars['message']['date_add'])) ? $this->_run_mod_handler('date_format', true, $_tmp, "%d.%m.%Y %H:%M") : smarty_modifier_date_format($_tmp, "%d.%m.%Y %H:%M")); ?>
</li>
                            	<li><?php echo $this->_tpl_vars['locale']['14']; ?>
: <?php echo ((is_array($_tmp=$this->_tpl_vars['message']['date_del'])) ? $this->_run_mod_handler('date_format', true, $_tmp, "%d.%m.%Y %H:%M") : smarty_modifier_date_format($_tmp, "%d.%m.%Y %H:%M")); ?>
</li>
                            </ul>
						</td>
					</tr>
				</table>
			
			</div><!-- /content -->
			

			
			<div class="content"><table bgcolor="">
				<tr>
					<td>
						<p class="callout">
                            <?php echo $this->_tpl_vars['locale']['150']; ?>
 <a href='http://<?php echo $this->_tpl_vars['settings']['site_address']; ?>
<?php echo $this->_tpl_vars['settings']['patch_region']; ?>
<?php echo @MESSAGES; ?>
/<?php echo $this->_tpl_vars['message']['link']; ?>
'><?php echo @TITLE; ?>
</a>                        
                         </p>
					</td>
				</tr>
			</table></div>
			


			

		</td>
		<td></td>
	</tr>
</table><!-- /BODY -->


