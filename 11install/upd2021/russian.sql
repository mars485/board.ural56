INSERT INTO `%DB_PREF%cron` (`id`, `name`, `period`) VALUES
(12, 'cron_cssjs', 1331464767);

CREATE TABLE IF NOT EXISTS `%DB_PREF%cron_files` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `file` varchar(20) NOT NULL,
  `mtime` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=10 ;


INSERT INTO `%DB_PREF%cron_files` (`id`, `file`, `mtime`) VALUES
(1, 'lightbox.js', 1260130298),
(2, 'dynamic.js', 1328602266);

CREATE TABLE IF NOT EXISTS `%DB_PREF%comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` int(11) NOT NULL,
  `message_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `user_name` varchar(30) NOT NULL,
  `user_email` varchar(30) NOT NULL,
  `text` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

ALTER TABLE `%DB_PREF%db` ADD `counter` INT NOT NULL AFTER `active` ;

ALTER TABLE `%DB_PREF%fields` ADD `cat` INT NOT NULL AFTER `id` ;

ALTER TABLE `%DB_PREF%fields` ADD `block` INT( 1 ) NOT NULL AFTER `hide` ;

UPDATE `%DB_PREF%fields` SET block =1 ;

INSERT INTO `%DB_PREF%msg` (`id`, `text`, `type`, `comments`) VALUES
(4, '<p align=\"left\">Здравствуйте, %user%!</p>\r\n<p align=\"left\">Кто-то, возможно Вы, сделал запрос на смену пароля Вашего аккаунта на сайте %title%.</p>\r\n<p align=\"left\"><em>Для смены пароля пройдите по ссылке:</em></p>\r\n<p align=\"left\">%link%</p>', 'password_recovery', '376'),
(2, '<p align=\"left\">Здравствуйте, %user%! <br />\r\nДобро пожаловать на сайт %title%!</p>\r\n<p align=\"left\">Чтобы активировать аккаунт и подтвердить свой адрес электронной почты, нажмите на эту ссылку:</p>\r\n<p align=\"left\">%link%</p>', 'reg_check', '377'),
(5, '<p align=\"left\">Здравствуйте, %user%!</p>\r\n<p align=\"left\">Истекает срок публикации Вашего объявления %message_title% на сайте %title%.</p>\r\n<p align=\"left\">Объявление будет удалено через %days% дней.</p>\r\n<p align=\"left\">Для смены продления срока публикации пройдите по ссылке:</p>\r\n<p align=\"left\">%link%</p>', 'del_mess', '378'),
(6, '<p align=\"left\">Здравствуйте,</p>\r\n<p align=\"left\">ставим Вас в известность, что на Ваше сообщение &laquo;<a href=\"%message_link%\">%message_title%</a>&raquo; на сайте %title% пришёл ответ.</p>\r\n<p>&nbsp;</p>\r\n<p align=\"left\">Отправитель: <b>%name%</b></p>\r\n<p align=\"left\">E-mail: <b>%email%</b></p>\r\n<p align=\"center\"><strong>Текст сообщения</strong></p>\r\n<hr />\r\n<p>%message%</p>', 'reply', '379'),
(7, '<p align=\"left\">Здравствуйте, %user%,</p>\r\n<p align=\"left\">ставим Вас в известность, что на Вам пришло сообщение с cайта %title%.</p>\r\n<p>&nbsp;</p>\r\n<p align=\"left\">Отправитель: <b>%name%</b></p>\r\n<p align=\"left\">E-mail: <b>%email%</b></p>\r\n<p align=\"center\"><strong>Текст сообщения</strong></p>\r\n<hr />\r\n<p>%message%</p>', 'message2user', '774'),
(8, '<p align=\"left\">Здравствуйте, %user%,</p>\r\n<p align=\"left\">ставим Вас в известность, что на Ваше объявление %message% на сайте %title% одобрено модератором и опубликовано</p>', 'message_allowed', '923'),
(9, '<p align=\"left\">Здравствуйте, %user%,</p>\r\n<p align=\"left\">ставим Вас в известность, что на Ваше объявление %message% на сайте %title% отклонено модератором</p>', 'message_denied', '924'),
(10, '<p style=\"text-align: center;\">Автоматическая система биллинга отключена.</p>\r\n<p style=\"text-align: center;\">Вы можете пополнить баланс личного счёта, уточнив реквизиты у администратора.</p>', 'pay_none', '630');

CREATE TABLE IF NOT EXISTS `%DB_PREF%news` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `md` varchar(20) DEFAULT NULL,
  `time` int(11) NOT NULL,
  `cat` int(11) NOT NULL,
  `name` varchar(200) DEFAULT NULL,
  `ann` text,
  `text` text,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

CREATE TABLE IF NOT EXISTS `%DB_PREF%news_cat` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `md` varchar(20) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `uri` varchar(50) DEFAULT NULL,
  `sort` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;



CREATE TABLE IF NOT EXISTS `%DB_PREF%rates` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `numcode` int(11) NOT NULL,
  `charcode` varchar(10) NOT NULL,
  `name` varchar(20) NOT NULL,
  `text` varchar(150) NOT NULL,
  `def` int(1) NOT NULL,
  `value` float NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

INSERT INTO `%DB_PREF%rates` (`id`, `numcode`, `charcode`, `name`, `text`, `def`, `value`) VALUES
(1, 0, 'rur', 'рубли', 'рубль,рубля,рублей', 1, 1),
(2, 0, 'usd', 'доллары США', 'доллар,доллара,долларов', 0, 30),
(3, 0, 'eur', 'евро', 'евро,евро,евро', 0, 40);

ALTER TABLE `%DB_PREF%regions` ADD `ipgeo_field` VARCHAR( 1 ) NOT NULL AFTER `parent` , ADD `ipgeo_value` VARCHAR( 100 ) NOT NULL AFTER `ipgeo_field` ;


INSERT INTO `%DB_PREF%settings` (`k`, `v`) VALUES
('comment_on', '1'),
('comment_unreg', '1'),
('smtp', '0'),
('smtp_from', 'info@illusionweb.ru'),
('smtp_host', 'smtp.illusionweb.ru'),
('smtp_port', '25'),
('smtp_crypt', ''),
('smtp_login', ''),
('smtp_password', ''),
('smtp_pop', ''),
('post_filter', ''),
('ipgeo', '0'),
('cron_cssjs', '0'),
('login', ''),
('password', '');

CREATE TABLE IF NOT EXISTS `%DB_PREF%users_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  `type` varchar(1) NOT NULL,
  `price` int(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;


CREATE TABLE IF NOT EXISTS `%DB_PREF%blacklist` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `k` varchar(1) NOT NULL,
  `v` varchar(150) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=10 ;


CREATE TABLE IF NOT EXISTS  `%DB_PREF%seo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `url` varchar(255) NOT NULL,
  `title` text NOT NULL,
  `keywords` text NOT NULL,
  `description` text NOT NULL,
  `type` varchar(1) NOT NULL DEFAULT 'n',
  `redirect_url` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `url` (`url`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

CREATE TABLE IF NOT EXISTS  `%DB_PREF%smscode` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `num` varchar(15) NOT NULL,
  `ip` varchar(15) NOT NULL,
  `code` int(4) NOT NULL,
  `status` varchar(10) NOT NULL,
  `time` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=10 ;

INSERT INTO `%DB_PREF%blocks_db` (`id`, `name`, `html`, `parent`) VALUES
(1000, 'Рекламные блоки', '%block_promo%', 'html');

INSERT INTO `%DB_PREF%blocks_places` (`place`, `status`, `from`, `to`, `link`, `reg`, `cat`, `region`, `sort`) VALUES
('r', 1, 0, 0, 1000, 1, '0', 0, 100001);

CREATE TABLE IF NOT EXISTS `%DB_PREF%version` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `module` varchar(30) NOT NULL,
  `version` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;


CREATE TABLE IF NOT EXISTS `%DB_PREF%mailing_db` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `time` int(11) NOT NULL,
  `title` varchar(200) NOT NULL,
  `text` text NOT NULL,
  `single` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;


INSERT INTO `%DB_PREF%mailing_db` (`id`, `time`, `title`, `text`, `single`) VALUES
(1, 3, 'Ваше объявление на сайте %title%', '<p>Здравствуйте, %user%,</p>\r\n<p>Вы добавили объявление %message_title% на сайт %title%,</p>\r\n<p>спасибо, что воспользовались нашими услугами. Ссылка на Ваше объявление:</p>\r\n<p>%link%</p>\r\n<p>Со временем, объявление уходит вниз в общем списке, поэтому Вы можете воспользоваться дополнительными услугами, чтобы увеличить количество просмотров объявления.</p>', 0),
(2, 7, 'Уже неделю у нас размещено объявление &quot;%message_title%&quot;', '<p>Здравствуйте, %user%,</p>\r\n<p>спасибо, что добавили объявление на сайт %title%.</p>\r\n<p>Если объявление ещё актуально&nbsp; Вы можете  воспользоваться дополнительными услугами, чтобы увеличить количество  просмотров объявления: поднять объявление в общем списке, выделить цветом или вынести в отдельный рекламны блок.</p>\r\n<p>Ссылка на Ваше объявление:</p>\r\n<p>%link%</p>', 0),
(3, 14, 'Прошло 2 недели с момента публикации', '<p>Здравствуйте, %user%,</p>\r\n<p>уже прошло две денели с момента публикации объявления %message_title% на сайт %title%.</p>\r\n<p>Если объявление ещё актуально&nbsp; Вы можете  воспользоваться дополнительными услугами, чтобы увеличить количество  просмотров объявления: поднять объявление в общем списке, выделить цветом или вынести в отдельный рекламны блок.</p>\r\n<p>Ссылка на Ваше объявление:</p>\r\n<p>%link%</p>', 0),
(4, 30, 'Прошёл месяц с момента публикации &quot;%message_title%&quot;', '<p>Здравствуйте, %user%,</p>\r\n<p>месяц тому назад Вы опубликовали объявление %message_title% на сайте %title%</p>\r\n<p>Если объявление ещё актуально&nbsp; Вы можете  воспользоваться дополнительными услугами, чтобы увеличить количество  просмотров объявления: поднять объявление в общем списке, выделить цветом или вынести в отдельный рекламны блок.</p>\r\n<p>Ссылка на Ваше объявление:</p>\r\n<p>%link%</p>', 0),
(5, 0, 'Вы зарегистрированы на сайте %title%', '<p>Здравствуйте, %user%,</p>\r\n<p>Вы зарегистрированы на сайте %title%. Позвольте напомнить, что Вы всё ещё можете воспользоваться услугами нашего сервиса.</p>', 1);

CREATE TABLE IF NOT EXISTS `%DB_PREF%mailing_queue` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `db` int(11) NOT NULL,
  `message` int(11) NOT NULL,
  `email` varchar(100) NOT NULL,
  `title` varchar(200) NOT NULL,
  `text` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

CREATE TABLE IF NOT EXISTS `%DB_PREF%mailing_sended` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `db` int(11) NOT NULL,
  `message` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `db` (`db`,`message`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;


ALTER TABLE `%DB_PREF%users` ADD `identity` VARCHAR( 250 ) NOT NULL ,
ADD `network` VARCHAR( 50 ) NOT NULL ;
