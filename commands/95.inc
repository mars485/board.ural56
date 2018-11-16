<?php

$freetail = 0;

if($settings['num_limit_on'] == 1 )
	{
	if($settings['user']['counter'] >= $settings['num_limit'] && $_GET['cat'][0] == 'add')
		{
		$settings['active_service'] = 1;
		}
	if($settings['user']['counter'] < $settings['num_limit'])
		{
		$freetail = $settings['num_limit'] - $settings['user']['counter'];
		}
	}

define('MESSAGES', 'messages');
?>