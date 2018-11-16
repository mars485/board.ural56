<?php /* Smarty version 2.6.25, created on 2018-04-21 00:37:34
         compiled from admin_login.html */ ?>
<html>

<head>
  <title></title>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
</head>

<body>

<form name='form' action='?' method='post'>
	<table border='0' width='100%' height='100%' align='center' valign='middle'>
		<tr>
			<td style='vertical-align: middle;' align='center'>
	        	<div style='width:300px; height:100px;'>
	        		<img align='right' src='tpl/img/lock.png'>
	        		<input name='login'    type='text' style='width:150px; margin:5px;' value="login / e-mail" onfocus="if (this.value == 'login / e-mail') this.value = '';">
	        		<input name='password' type='password' style='width:150px; margin:5px;' value="********" onfocus="if (this.value == '********') this.value = '';">
					<input type='submit' name='submit' value='<?php echo $this->_tpl_vars['locale']['301']; ?>
' style='width:150px; margin:5px;'>
	        	</div>
			</td>
		</tr>
	</table>
</form>

</body>

</html>