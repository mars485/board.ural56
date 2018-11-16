<?php // 266
if(!$exe)
	{
	$title_normal[] = array(
							'link' => $settings['path_region'].$cat.'/',
							'name' => $locale[266]
							);
	}
if($exe)
	{

	$form = true;

	if($_POST['submit'] != "")
		{
		$err = array();
        if(!isset($_POST['name'])) $_POST['name'] = "";
        if(!isset($_POST['email'])) $_POST['email'] = "";
        if(!isset($_POST['theme'])) $_POST['theme'] = "";
        if(!isset($_POST['text'])) $_POST['text'] = "";
        
        
		if($_POST['name'] == ""){$err[] = $locale[151];}
		if($_POST['theme'] == ""){$err[] = $locale[601];}
		if($_POST['email'] != "")
			{
			if(!email_check($_POST['email']))
				{
				$err[] = $locale[600];
				}
			}
		else
			{
		    $err[] = $locale[152];
			}
		if($_POST['text'] == ""){$err[] = $locale[153];}

        $text = "
        <b>".$locale[281]."</b>: ".$_POST['name']."<br />
        <b>".$locale[72]."</b>: ".$_POST['theme']."<br />
        <b>".$locale[21]."</b>: ".$_POST['email']."<br />
        <b>IP</b>: ".$settings['ip']."<br />
        <hr>
        ".save_text($_POST['text']);
        
        if($settings['captcha'] == 1) if(!captcha($settings, 'check')){$err[] = $locale[46];}

		if(count($err) > 0)
			{
			echo "
				<div class='alert alert-danger'>
					<ul>
					";
					foreach($err as $v)
						{
					    echo "
					    <li>".$v."</li>
					    ";
						}
					echo "
		            </ul>
	            </div>
			";
	        }
		else
			{
			$form = false;

			if(send_mail(EMAIL, $_POST['theme'], $text, array(), $_POST['email']))
				{
				echo "
					<div class='alert alert-success'>
						".$locale[155]."
					</div>
				";
				}
			else
				{
			    echo "
					<div class='alert alert-danger'>
						".$locale[602]." ".EMAIL."
					</div>
			    ";
				}

			}
		}
    if($form)
	    {
	       
        echo '
            <div class="contact_form">
                <form action="" method="POST" class="form-horizontal">
                    <div class="form-group">
                        <label class="col-md-3 control-label"  for="cname">
                            '.$locale[29].'
                        </label>
                        <div class="col-md-8">
                            <input name="name" id="cname" value="'.$_POST['name'].'" class="form-control" placeholder="'.$locale[28].'" required="" type="text">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-md-3 control-label"  for="cemail">
                            '.$locale[26].'
                        </label>
                        <div class="col-md-8">
                            <input name="email" id="cemail" value="'.$_POST['email'].'" class="form-control" placeholder="'.$locale[26].'" required="" type="email">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-md-3 control-label"  for="ctheme">
                            '.$locale[72].'
                        </label>
                        <div class="col-md-8">
                            <input name="theme" id="ctheme" value="'.$_POST['theme'].'" class="form-control" placeholder="'.$locale[72].'" required="" type="text">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-md-3 control-label"  for="ctext">
                            '.$locale[74].'
                        </label>
                        <div class="col-md-8">
                            <textarea id="ctext" class="form-control" name="text" required=""
                                    placeholder="'.$locale[74].'" rows="5">'.$_POST['text'].'</textarea>                        
                        </div>
                    </div>
                    ';
                    if($settings['captcha'] == 1){
                        echo '
                        <div class="form-group">
                        ';
                        if($settings['captcha_type'] == 3){
                            echo '
                                <div class="col-md-8 col-md-offset-3">
                                    <script src="https://www.google.com/recaptcha/api.js"></script>
                                    <div class="g-recaptcha" data-sitekey="'.$settings['recaptcha1'].'"></div>
                                </div>
                            ';
                        }else{
                            echo '
                                <label class="col-md-3 control-label">
                                        '.$locale[44].'
                                </label>
                                <div class="col-md-8">
                                    <div class="captcha_cont">
                                        <img src="'.$settings['path'].'captcha/'.rand(10000, 99999).'">
                                        <input name="captcha" required="" class="form-control required" type="number" placeholder="'.$locale[1182].'" autocomplete="off">
                                    </div>
                                </div>
                            ';
                        }
                        echo '
                        </div>
                        ';

                    }
                    echo '
                    <div class="form-group">
                        <div class="col-md-8 col-md-offset-3">
                            <button type="submit" name="submit" class="btn btn-primary" value=1>
                                <i class="fa fa-paper-plane" aria-hidden="true"></i>
                                '.$locale[55].'
                            </button>
                        </div>
                    </div>
                </form>
            </div>
        ';
           /*
		echo "

        <div class=\"container_form\">
		<form action='?' method='POST'>

		<table border='0' width='500'>
		<tr><td width='50%'>".$locale[29]."</td><td><input name='name' type='text' value='".$_POST['name']."' style='width:100%;'></td></tr>
		<tr><td>".$locale[26]."</td><td><input name='email' type='text' value='".$_POST['email']."' style='width:100%;'></td></tr>
		<tr><td>".$locale[72]."</td><td><input name='theme' type='text' value='".$_POST['theme']."' style='width:100%;'></td></tr>
		<tr><td>".$locale[74]."</td><td><textarea name='text' rows='5' wrap='on' style='width:100%;'>".$_POST['text']."</textarea></td></tr>
		<tr><td>".$locale[45]."
			<br /><img src='".$settings['patch']."captcha/".rand(0, 10000)."'  width='80' height='40'>
			</td><td><input name='captcha' type='text' value='' style='width:100%;'></td></tr>
		</table>

		<input name='submit' type='submit' value='".$locale[55]."' style='margin:5px; font-size:11px;'>

		</form>
        </div>

		";*/
	    }
	}

?>