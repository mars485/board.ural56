# Dumped by EliteBoard v2
# Home page: http://illusionweb.ru
#
# MySQL version: (5.5.56-MariaDB) running on 188.120.231.77 (board.ural56.ru)
# Date: 01.03.2018 00:58:25
# DB: "ural56"
# Prefix: "eboard_"
#---------------------------------------------------------

SET NAMES utf8;



DROP TABLE IF EXISTS `eboard_articles`;
CREATE TABLE `eboard_articles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cat` int(11) NOT NULL,
  `uri` varchar(200) NOT NULL,
  `name` varchar(200) NOT NULL,
  `content` text NOT NULL,
  `keywords` text NOT NULL,
  `index` int(11) NOT NULL DEFAULT '0',
  `pubdate` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS `eboard_articles_cat`;
CREATE TABLE `eboard_articles_cat` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `uri` varchar(100) NOT NULL,
  `description` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS `eboard_billing`;
CREATE TABLE `eboard_billing` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uri` varchar(20) NOT NULL,
  `status` varchar(1) NOT NULL DEFAULT '0',
  `key1` varchar(50) NOT NULL,
  `key2` varchar(50) NOT NULL,
  `key3` varchar(50) NOT NULL,
  `key4` varchar(50) NOT NULL,
  `key5` varchar(50) NOT NULL,
  `text1` text NOT NULL,
  `text2` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

INSERT INTO `eboard_billing`(`id`, `uri`, `status`, `key1`, `key2`, `key3`, `key4`, `key5`, `text1`, `text2`) VALUES ('8', 'onpay', '0', '', '', '', '', '', '', '');
INSERT INTO `eboard_billing`(`id`, `uri`, `status`, `key1`, `key2`, `key3`, `key4`, `key5`, `text1`, `text2`) VALUES ('7', 'sprypay', '0', '', '', '', '', '', '', '');
INSERT INTO `eboard_billing`(`id`, `uri`, `status`, `key1`, `key2`, `key3`, `key4`, `key5`, `text1`, `text2`) VALUES ('10', 'robokassa', '1', 'doural56', 'NauvQ4vAgG5avTa7h1k5', 'goscS44z2PbJvt01DzuA', 'https://auth.robokassa.ru/Merchant/Index.aspx', '', '', '');
INSERT INTO `eboard_billing`(`id`, `uri`, `status`, `key1`, `key2`, `key3`, `key4`, `key5`, `text1`, `text2`) VALUES ('11', 'smscoin', '0', '', '', '', '', '', '', '');
INSERT INTO `eboard_billing`(`id`, `uri`, `status`, `key1`, `key2`, `key3`, `key4`, `key5`, `text1`, `text2`) VALUES ('12', 'wm', '0', '', '', '', '', '', '', '');
INSERT INTO `eboard_billing`(`id`, `uri`, `status`, `key1`, `key2`, `key3`, `key4`, `key5`, `text1`, `text2`) VALUES ('13', 'yandex', '0', '', '', '', '', '', '', '');
INSERT INTO `eboard_billing`(`id`, `uri`, `status`, `key1`, `key2`, `key3`, `key4`, `key5`, `text1`, `text2`) VALUES ('14', 'unitpay', '0', '', '', '', '', '', '', '');
INSERT INTO `eboard_billing`(`id`, `uri`, `status`, `key1`, `key2`, `key3`, `key4`, `key5`, `text1`, `text2`) VALUES ('15', 'paypal', '0', '', '', '', '', '', '', '');
INSERT INTO `eboard_billing`(`id`, `uri`, `status`, `key1`, `key2`, `key3`, `key4`, `key5`, `text1`, `text2`) VALUES ('16', 'debug', '0', '', '', '', '', '', '', '');
INSERT INTO `eboard_billing`(`id`, `uri`, `status`, `key1`, `key2`, `key3`, `key4`, `key5`, `text1`, `text2`) VALUES ('17', 'interkassa20', '1', '5a7e8c643c1eaf3c548b4568', 'qJwGm6X0zZhwB0aH', '', '', '', '', '');


DROP TABLE IF EXISTS `eboard_blacklist`;
CREATE TABLE `eboard_blacklist` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `k` varchar(1) NOT NULL,
  `v` varchar(150) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS `eboard_blocks_db`;
CREATE TABLE `eboard_blocks_db` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` text,
  `html` text,
  `parent` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=41 DEFAULT CHARSET=utf8;

INSERT INTO `eboard_blocks_db`(`id`, `name`, `html`, `parent`) VALUES ('30', 'XML feeds', 'echo \"
<center>
<a href=\'\".PATH.\"rss.xml\'><img src=\'\".PATH.\"images/rss20.gif\' width=\'88\' height=\'15\' alt=\'Лента RSS\' border=\'0\'></a>
<br /><br />
<a href=\'\".PATH.\"sitemap.xml\'><img src=\'\".PATH.\"images/sitemap.gif\' width=\'88\' height=\'15\' alt=\'Лента RSS\' border=\'0\'></a>
</center>
\";', 'php');
INSERT INTO `eboard_blocks_db`(`id`, `name`, `html`, `parent`) VALUES ('4', 'Личный кабинет', '%block_user%', 'html');
INSERT INTO `eboard_blocks_db`(`id`, `name`, `html`, `parent`) VALUES ('7', 'Навигация', '%block_nav%', '');
INSERT INTO `eboard_blocks_db`(`id`, `name`, `html`, `parent`) VALUES ('9', 'Облако тегов', '%block_tags%', '');
INSERT INTO `eboard_blocks_db`(`id`, `name`, `html`, `parent`) VALUES ('10', 'Статистика', '%block_counter%', '');
INSERT INTO `eboard_blocks_db`(`id`, `name`, `html`, `parent`) VALUES ('38', '', '<p style=\"text-align: center;\"><img alt=\"\" src=\"/uploads/images/562-f97c38637b17f6f7ef6d0ec957e5e80f.png\" style=\"width: 100%;height: 100px;max-width: 1000px;\" /></p>
', 'html');
INSERT INTO `eboard_blocks_db`(`id`, `name`, `html`, `parent`) VALUES ('36', 'VIP объявления', '<p>%block_promo%</p>
', 'html');
INSERT INTO `eboard_blocks_db`(`id`, `name`, `html`, `parent`) VALUES ('37', 'Поиск объявлений', '%block_search%', 'html');
INSERT INTO `eboard_blocks_db`(`id`, `name`, `html`, `parent`) VALUES ('39', '', '<p style=\"text-align: center;\"><img alt=\"\" src=\"/uploads/images/977-e640ad5229715852fe5370487c1d8b0c.jpg\" /></p>

<p style=\"text-align: center;\"><img alt=\"\" src=\"/uploads/images/951-2002ad8a9f4761100dfe6434fbbd4e76.gif\" style=\"width: 250px; height: 100px;\" /></p>

<p style=\"text-align: center;\"><img alt=\"\" src=\"/uploads/images/951-2002ad8a9f4761100dfe6434fbbd4e76.gif\" style=\"width: 250px; height: 100px;\" /></p>

<p style=\"text-align: center;\"><img alt=\"\" src=\"/uploads/images/951-2002ad8a9f4761100dfe6434fbbd4e76.gif\" style=\"width: 250px; height: 100px;\" /></p>

<p style=\"text-align: center;\"><img alt=\"\" src=\"/uploads/images/951-2002ad8a9f4761100dfe6434fbbd4e76.gif\" style=\"width: 250px; height: 100px;\" /></p>

<p style=\"text-align: center;\"><img alt=\"\" src=\"/uploads/images/951-2002ad8a9f4761100dfe6434fbbd4e76.gif\" style=\"width: 250px; height: 100px;\" /></p>

<p style=\"text-align: center;\"><img alt=\"\" src=\"/uploads/images/951-2002ad8a9f4761100dfe6434fbbd4e76.gif\" style=\"width: 250px; height: 100px;\" /></p>

<p style=\"text-align: center;\"><img alt=\"\" src=\"/uploads/images/951-2002ad8a9f4761100dfe6434fbbd4e76.gif\" style=\"width: 250px; height: 100px;\" /></p>

<p style=\"text-align: center;\"><img alt=\"\" src=\"/uploads/images/951-2002ad8a9f4761100dfe6434fbbd4e76.gif\" style=\"width: 250px; height: 100px;\" /></p>

<p style=\"text-align: center;\"><img alt=\"\" src=\"/uploads/images/951-2002ad8a9f4761100dfe6434fbbd4e76.gif\" style=\"width: 250px; height: 100px;\" /></p>

<p style=\"text-align: center;\"><img alt=\"\" src=\"/uploads/images/951-2002ad8a9f4761100dfe6434fbbd4e76.gif\" style=\"width: 250px; height: 100px;\" /></p>

<p style=\"text-align: center;\"><img alt=\"\" src=\"/uploads/images/951-2002ad8a9f4761100dfe6434fbbd4e76.gif\" style=\"width: 250px; height: 100px;\" /></p>

<p style=\"text-align: center;\"><img alt=\"\" src=\"/uploads/images/951-2002ad8a9f4761100dfe6434fbbd4e76.gif\" style=\"width: 250px; height: 100px;\" /></p>

<p style=\"text-align: center;\"><img alt=\"\" src=\"/uploads/images/951-2002ad8a9f4761100dfe6434fbbd4e76.gif\" style=\"width: 250px; height: 100px;\" /></p>

<p style=\"text-align: center;\"><img alt=\"\" src=\"/uploads/images/951-2002ad8a9f4761100dfe6434fbbd4e76.gif\" style=\"width: 250px; height: 100px;\" /></p>

<p style=\"text-align: center;\"><img alt=\"\" src=\"/uploads/images/951-2002ad8a9f4761100dfe6434fbbd4e76.gif\" style=\"width: 250px; height: 100px;\" /></p>

<p style=\"text-align: center;\"><img alt=\"\" src=\"/uploads/images/951-2002ad8a9f4761100dfe6434fbbd4e76.gif\" style=\"width: 250px; height: 100px;\" /></p>

<p style=\"text-align: center;\"><img alt=\"\" src=\"/uploads/images/951-2002ad8a9f4761100dfe6434fbbd4e76.gif\" style=\"width: 250px; height: 100px;\" /></p>

<p style=\"text-align: center;\"><img alt=\"\" src=\"/uploads/images/951-2002ad8a9f4761100dfe6434fbbd4e76.gif\" style=\"width: 250px; height: 100px;\" /></p>

<p style=\"text-align: center;\"><img alt=\"\" src=\"/uploads/images/951-2002ad8a9f4761100dfe6434fbbd4e76.gif\" style=\"width: 250px; height: 100px;\" /></p>

<p style=\"text-align: center;\"><img alt=\"\" src=\"/uploads/images/951-2002ad8a9f4761100dfe6434fbbd4e76.gif\" style=\"width: 250px; height: 100px;\" /></p>

<p style=\"text-align: center;\"><img alt=\"\" src=\"/uploads/images/951-2002ad8a9f4761100dfe6434fbbd4e76.gif\" style=\"width: 250px; height: 100px;\" /></p>

<p style=\"text-align: center;\"><img alt=\"\" src=\"/uploads/images/951-2002ad8a9f4761100dfe6434fbbd4e76.gif\" style=\"width: 250px; height: 100px;\" /></p>

<p style=\"text-align: center;\"><img alt=\"\" src=\"/uploads/images/951-2002ad8a9f4761100dfe6434fbbd4e76.gif\" style=\"width: 250px; height: 100px;\" /></p>

<p style=\"text-align: center;\"><img alt=\"\" src=\"/uploads/images/951-2002ad8a9f4761100dfe6434fbbd4e76.gif\" style=\"width: 250px; height: 100px;\" /></p>

<p style=\"text-align: center;\"><img alt=\"\" src=\"/uploads/images/951-2002ad8a9f4761100dfe6434fbbd4e76.gif\" style=\"width: 250px; height: 100px;\" /></p>

<p style=\"text-align: center;\"><img alt=\"\" src=\"/uploads/images/951-2002ad8a9f4761100dfe6434fbbd4e76.gif\" style=\"width: 250px; height: 100px;\" /></p>

<p style=\"text-align: center;\"><img alt=\"\" src=\"/uploads/images/951-2002ad8a9f4761100dfe6434fbbd4e76.gif\" style=\"width: 250px; height: 100px;\" /></p>

<p style=\"text-align: center;\"><img alt=\"\" src=\"/uploads/images/951-2002ad8a9f4761100dfe6434fbbd4e76.gif\" style=\"width: 250px; height: 100px;\" /></p>

<p style=\"text-align: center;\"><img alt=\"\" src=\"/uploads/images/951-2002ad8a9f4761100dfe6434fbbd4e76.gif\" style=\"width: 250px; height: 100px;\" /></p>

<p style=\"text-align: center;\"><img alt=\"\" src=\"/uploads/images/951-2002ad8a9f4761100dfe6434fbbd4e76.gif\" style=\"width: 250px; height: 100px;\" /></p>

<p style=\"text-align: center;\"><img alt=\"\" src=\"/uploads/images/951-2002ad8a9f4761100dfe6434fbbd4e76.gif\" style=\"width: 250px; height: 100px;\" /></p>

<p style=\"text-align: center;\"><img alt=\"\" src=\"/uploads/images/951-2002ad8a9f4761100dfe6434fbbd4e76.gif\" style=\"width: 250px; height: 100px;\" /></p>

<p style=\"text-align: center;\"><img alt=\"\" src=\"/uploads/images/951-2002ad8a9f4761100dfe6434fbbd4e76.gif\" style=\"width: 250px; height: 100px;\" /></p>

<p style=\"text-align: center;\"><img alt=\"\" src=\"/uploads/images/951-2002ad8a9f4761100dfe6434fbbd4e76.gif\" style=\"width: 250px; height: 100px;\" /></p>

<p style=\"text-align: center;\"><img alt=\"\" src=\"/uploads/images/951-2002ad8a9f4761100dfe6434fbbd4e76.gif\" style=\"width: 250px; height: 100px;\" /></p>

<p style=\"text-align: center;\"><img alt=\"\" src=\"/uploads/images/951-2002ad8a9f4761100dfe6434fbbd4e76.gif\" style=\"width: 250px; height: 100px;\" /></p>

<p style=\"text-align: center;\"><img alt=\"\" src=\"/uploads/images/951-2002ad8a9f4761100dfe6434fbbd4e76.gif\" style=\"width: 250px; height: 100px;\" /></p>

<p style=\"text-align: center;\"><img alt=\"\" src=\"/uploads/images/951-2002ad8a9f4761100dfe6434fbbd4e76.gif\" style=\"text-align: center; width: 250px; height: 100px;\" /></p>

<p style=\"text-align: center;\"><img alt=\"\" src=\"/uploads/images/951-2002ad8a9f4761100dfe6434fbbd4e76.gif\" style=\"width: 250px; height: 100px;\" /></p>

<p style=\"text-align: center;\"><img alt=\"\" src=\"/uploads/images/951-2002ad8a9f4761100dfe6434fbbd4e76.gif\" style=\"width: 250px; height: 100px;\" /></p>

<p style=\"text-align: center;\"><img alt=\"\" src=\"/uploads/images/951-2002ad8a9f4761100dfe6434fbbd4e76.gif\" style=\"width: 250px; height: 100px;\" /></p>

<p style=\"text-align: center;\"><img alt=\"\" src=\"/uploads/images/951-2002ad8a9f4761100dfe6434fbbd4e76.gif\" style=\"width: 250px; height: 100px;\" /></p>

<p style=\"text-align: center;\"><img alt=\"\" src=\"/uploads/images/951-2002ad8a9f4761100dfe6434fbbd4e76.gif\" style=\"width: 250px; height: 100px;\" /></p>

<p style=\"text-align: center;\"><img alt=\"\" src=\"/uploads/images/951-2002ad8a9f4761100dfe6434fbbd4e76.gif\" style=\"width: 250px; height: 100px;\" /></p>

<p style=\"text-align: center;\"><img alt=\"\" src=\"/uploads/images/951-2002ad8a9f4761100dfe6434fbbd4e76.gif\" style=\"width: 250px; height: 100px;\" /></p>

<p style=\"text-align: center;\"><img alt=\"\" src=\"/uploads/images/951-2002ad8a9f4761100dfe6434fbbd4e76.gif\" style=\"width: 250px; height: 100px;\" /></p>
', 'html');


DROP TABLE IF EXISTS `eboard_blocks_places`;
CREATE TABLE `eboard_blocks_places` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `place` varchar(1) DEFAULT NULL,
  `status` int(1) DEFAULT '1',
  `from` int(11) DEFAULT '0',
  `to` int(11) DEFAULT '0',
  `link` int(11) DEFAULT NULL,
  `reg` int(1) DEFAULT '1',
  `cat` varchar(200) DEFAULT '0',
  `region` int(11) NOT NULL DEFAULT '0',
  `sort` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;

INSERT INTO `eboard_blocks_places`(`id`, `place`, `status`, `from`, `to`, `link`, `reg`, `cat`, `region`, `sort`) VALUES ('1', 'r', '0', '0', '0', '7', '1', '0', '0', '1');
INSERT INTO `eboard_blocks_places`(`id`, `place`, `status`, `from`, `to`, `link`, `reg`, `cat`, `region`, `sort`) VALUES ('2', 'r', '0', '0', '0', '9', '1', '0', '0', '3');
INSERT INTO `eboard_blocks_places`(`id`, `place`, `status`, `from`, `to`, `link`, `reg`, `cat`, `region`, `sort`) VALUES ('3', 'r', '0', '0', '0', '10', '1', '0', '0', '4');
INSERT INTO `eboard_blocks_places`(`id`, `place`, `status`, `from`, `to`, `link`, `reg`, `cat`, `region`, `sort`) VALUES ('5', 'r', '1', '0', '0', '4', '1', 'users', '0', '1');
INSERT INTO `eboard_blocks_places`(`id`, `place`, `status`, `from`, `to`, `link`, `reg`, `cat`, `region`, `sort`) VALUES ('20', 'r', '0', '0', '0', '30', '1', '0', '0', '2');
INSERT INTO `eboard_blocks_places`(`id`, `place`, `status`, `from`, `to`, `link`, `reg`, `cat`, `region`, `sort`) VALUES ('24', 'l', '0', '0', '0', '33', '1', '0', '0', '3');
INSERT INTO `eboard_blocks_places`(`id`, `place`, `status`, `from`, `to`, `link`, `reg`, `cat`, `region`, `sort`) VALUES ('25', 'l', '0', '0', '0', '34', '1', '0', '0', '4');
INSERT INTO `eboard_blocks_places`(`id`, `place`, `status`, `from`, `to`, `link`, `reg`, `cat`, `region`, `sort`) VALUES ('27', 'r', '1', '0', '0', '36', '1', '769', '0', '20');
INSERT INTO `eboard_blocks_places`(`id`, `place`, `status`, `from`, `to`, `link`, `reg`, `cat`, `region`, `sort`) VALUES ('28', 'l', '0', '0', '0', '37', '1', '0', '0', '2');
INSERT INTO `eboard_blocks_places`(`id`, `place`, `status`, `from`, `to`, `link`, `reg`, `cat`, `region`, `sort`) VALUES ('29', 'b', '1', '0', '0', '37', '1', '%cat', '0', '100000');
INSERT INTO `eboard_blocks_places`(`id`, `place`, `status`, `from`, `to`, `link`, `reg`, `cat`, `region`, `sort`) VALUES ('30', 't', '1', '0', '0', '36', '1', '%ind', '0', '100000');
INSERT INTO `eboard_blocks_places`(`id`, `place`, `status`, `from`, `to`, `link`, `reg`, `cat`, `region`, `sort`) VALUES ('31', 'h', '0', '0', '0', '38', '1', '0', '0', '100000');
INSERT INTO `eboard_blocks_places`(`id`, `place`, `status`, `from`, `to`, `link`, `reg`, `cat`, `region`, `sort`) VALUES ('32', 'f', '1', '0', '0', '38', '1', '0', '0', '100000');
INSERT INTO `eboard_blocks_places`(`id`, `place`, `status`, `from`, `to`, `link`, `reg`, `cat`, `region`, `sort`) VALUES ('33', 'r', '1', '0', '0', '39', '1', '0', '0', '100000');
INSERT INTO `eboard_blocks_places`(`id`, `place`, `status`, `from`, `to`, `link`, `reg`, `cat`, `region`, `sort`) VALUES ('34', 'r', '1', '0', '0', '40', '1', '0', '0', '100000');


DROP TABLE IF EXISTS `eboard_cat`;
CREATE TABLE `eboard_cat` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uri` varchar(50) NOT NULL,
  `name` varchar(200) NOT NULL,
  `img` varchar(500) NOT NULL,
  `parent` int(10) NOT NULL,
  `sort` int(10) DEFAULT '10000000',
  `description` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=770 DEFAULT CHARSET=utf8;

INSERT INTO `eboard_cat`(`id`, `uri`, `name`, `img`, `parent`, `sort`, `description`) VALUES ('765', 'Saray', 'Сарай', '', '769', '11', '');
INSERT INTO `eboard_cat`(`id`, `uri`, `name`, `img`, `parent`, `sort`, `description`) VALUES ('764', '5-kv', '5+ к кв', '', '769', '6', '');
INSERT INTO `eboard_cat`(`id`, `uri`, `name`, `img`, `parent`, `sort`, `description`) VALUES ('763', '4-kv', '4-к кв', '', '769', '5', '');
INSERT INTO `eboard_cat`(`id`, `uri`, `name`, `img`, `parent`, `sort`, `description`) VALUES ('767', 'jilaya-arenda', 'Жилая аренда', '', '769', '13', '');
INSERT INTO `eboard_cat`(`id`, `uri`, `name`, `img`, `parent`, `sort`, `description`) VALUES ('766', 'Sad', 'Сад', '', '769', '8', '');
INSERT INTO `eboard_cat`(`id`, `uri`, `name`, `img`, `parent`, `sort`, `description`) VALUES ('769', 'Vsya-nedvizhimost', 'Вся недвижимость', '', '0', '0', '');
INSERT INTO `eboard_cat`(`id`, `uri`, `name`, `img`, `parent`, `sort`, `description`) VALUES ('768', 'Prodaja', 'Продажа помещений', '', '769', '12', '');
INSERT INTO `eboard_cat`(`id`, `uri`, `name`, `img`, `parent`, `sort`, `description`) VALUES ('761', '2-kv', '2-к кв', '', '769', '3', '');
INSERT INTO `eboard_cat`(`id`, `uri`, `name`, `img`, `parent`, `sort`, `description`) VALUES ('760', '1-kv', '1-к кв', '', '769', '2', '');
INSERT INTO `eboard_cat`(`id`, `uri`, `name`, `img`, `parent`, `sort`, `description`) VALUES ('179', 'Garazhi-i-mashinomesta', 'Гараж', '', '769', '10', '');
INSERT INTO `eboard_cat`(`id`, `uri`, `name`, `img`, `parent`, `sort`, `description`) VALUES ('762', '3-kv', '3-к кв', '', '769', '4', '');
INSERT INTO `eboard_cat`(`id`, `uri`, `name`, `img`, `parent`, `sort`, `description`) VALUES ('178', 'Doma', 'Дом', '', '769', '7', '');
INSERT INTO `eboard_cat`(`id`, `uri`, `name`, `img`, `parent`, `sort`, `description`) VALUES ('177', 'Zemelnye-uchastki', 'Земельный участок', '', '769', '9', '');
INSERT INTO `eboard_cat`(`id`, `uri`, `name`, `img`, `parent`, `sort`, `description`) VALUES ('176', 'Kommercheskaya-nedvizhimost', 'Коммерческая аренда', '', '769', '14', '');
INSERT INTO `eboard_cat`(`id`, `uri`, `name`, `img`, `parent`, `sort`, `description`) VALUES ('175', 'Komnaty', 'Комната', '', '769', '1', '');


DROP TABLE IF EXISTS `eboard_comments`;
CREATE TABLE `eboard_comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` int(11) NOT NULL,
  `message_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `user_name` varchar(30) NOT NULL,
  `user_email` varchar(30) NOT NULL,
  `text` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS `eboard_counter_cat`;
CREATE TABLE `eboard_counter_cat` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cat` int(11) NOT NULL,
  `val` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS `eboard_counter_cr`;
CREATE TABLE `eboard_counter_cr` (
  `region` int(11) DEFAULT '0',
  `cat` int(11) DEFAULT '0',
  `counter` int(11) DEFAULT '0',
  KEY `region_cat` (`region`,`cat`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS `eboard_counter_ip`;
CREATE TABLE `eboard_counter_ip` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ip` varchar(20) DEFAULT NULL,
  `forvard` varchar(20) NOT NULL,
  `referer` varchar(500) NOT NULL,
  `time` int(11) DEFAULT NULL,
  `page_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

INSERT INTO `eboard_counter_ip`(`id`, `ip`, `forvard`, `referer`, `time`, `page_id`) VALUES ('1', '46.191.246.130', '', '', '', '');


DROP TABLE IF EXISTS `eboard_counter_pages`;
CREATE TABLE `eboard_counter_pages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `page` varchar(300) DEFAULT NULL,
  `counter` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS `eboard_counter_vars`;
CREATE TABLE `eboard_counter_vars` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `var` varchar(10) DEFAULT NULL,
  `value` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

INSERT INTO `eboard_counter_vars`(`id`, `var`, `value`) VALUES ('1', 'hits_all', '1972');
INSERT INTO `eboard_counter_vars`(`id`, `var`, `value`) VALUES ('2', 'hosts_all', '256');
INSERT INTO `eboard_counter_vars`(`id`, `var`, `value`) VALUES ('3', 'day', '01032018');
INSERT INTO `eboard_counter_vars`(`id`, `var`, `value`) VALUES ('4', 'hits_today', '4');


DROP TABLE IF EXISTS `eboard_cron`;
CREATE TABLE `eboard_cron` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(10) NOT NULL,
  `period` int(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

INSERT INTO `eboard_cron`(`id`, `name`, `period`) VALUES ('1', 'cron_del', '1519846445');
INSERT INTO `eboard_cron`(`id`, `name`, `period`) VALUES ('2', 'cron_mail', '1519847715');
INSERT INTO `eboard_cron`(`id`, `name`, `period`) VALUES ('3', 'cron_order', '1519847715');
INSERT INTO `eboard_cron`(`id`, `name`, `period`) VALUES ('12', 'cron_cssjs', '1519847715');
INSERT INTO `eboard_cron`(`id`, `name`, `period`) VALUES ('13', 'cron_upd', '1519823584');


DROP TABLE IF EXISTS `eboard_cron_files`;
CREATE TABLE `eboard_cron_files` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `file` varchar(20) NOT NULL,
  `mtime` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

INSERT INTO `eboard_cron_files`(`id`, `file`, `mtime`) VALUES ('1', 'lightbox.js', '1260130298');
INSERT INTO `eboard_cron_files`(`id`, `file`, `mtime`) VALUES ('2', 'dynamic.js', '1328602266');
INSERT INTO `eboard_cron_files`(`id`, `file`, `mtime`) VALUES ('10', 'dynamic_eco.js', '1490366882');
INSERT INTO `eboard_cron_files`(`id`, `file`, `mtime`) VALUES ('11', 'dynamic_expresso.js', '1493378200');
INSERT INTO `eboard_cron_files`(`id`, `file`, `mtime`) VALUES ('12', 'dynamic_geo.js', '1514493712');
INSERT INTO `eboard_cron_files`(`id`, `file`, `mtime`) VALUES ('13', 'dynamic_flame.js', '1492532826');
INSERT INTO `eboard_cron_files`(`id`, `file`, `mtime`) VALUES ('14', 'dynamic_aqua.js', '1492525320');
INSERT INTO `eboard_cron_files`(`id`, `file`, `mtime`) VALUES ('15', 'dynamic_stika.js', '1514493711');
INSERT INTO `eboard_cron_files`(`id`, `file`, `mtime`) VALUES ('16', 'dynamic_stika_karta.', '1514493711');
INSERT INTO `eboard_cron_files`(`id`, `file`, `mtime`) VALUES ('17', 'dynamic_stika_karta.', '1514493711');


DROP TABLE IF EXISTS `eboard_db`;
CREATE TABLE `eboard_db` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ip` varchar(15) NOT NULL,
  `uid` varchar(100) NOT NULL,
  `cat` int(5) DEFAULT NULL,
  `region` int(5) DEFAULT NULL,
  `date_add` int(11) DEFAULT NULL,
  `date_del` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `status` int(1) DEFAULT '1',
  `sendmail` int(1) NOT NULL,
  `approved` int(1) NOT NULL DEFAULT '0',
  `sort` int(10) DEFAULT '10000000',
  `email` varchar(100) DEFAULT NULL,
  `user` varchar(200) NOT NULL,
  `title` varchar(300) DEFAULT NULL,
  `text` text,
  `marked` int(1) NOT NULL DEFAULT '0',
  `raised` int(1) NOT NULL DEFAULT '0',
  `date_raised` timestamp NULL DEFAULT NULL,
  `block` int(1) NOT NULL DEFAULT '0',
  `active` int(1) NOT NULL DEFAULT '0',
  `counter` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `date_raised` (`date_raised`),
  KEY `date_add` (`date_add`),
  KEY `date_del` (`date_del`),
  KEY `status` (`status`),
  KEY `date_raised_raised` (`date_raised`,`raised`),
  KEY `cat` (`cat`),
  KEY `region` (`region`),
  FULLTEXT KEY `title_text` (`title`,`text`)
) ENGINE=MyISAM AUTO_INCREMENT=151 DEFAULT CHARSET=utf8;

INSERT INTO `eboard_db`(`id`, `ip`, `uid`, `cat`, `region`, `date_add`, `date_del`, `user_id`, `status`, `sendmail`, `approved`, `sort`, `email`, `user`, `title`, `text`, `marked`, `raised`, `date_raised`, `block`, `active`, `counter`) VALUES ('1', '95.215.45.75', '699e0e48e9ba4a103c83c57d8db00c32', '760', '120', '1516954500', '1519546500', '', '2', '1', '1', '10000000', 'i@board.ural56.ru', 'Димона, агентство недвижимости', 'Продам квартиру     
1-к квартира  33.4 м²  на 5 этаже  9-этажного панельного дома', '<p>Квартиры </p>
  <p>Прекрасный вариант 1-комнатной квартиры улучшенной планировки для для небольшой семьи. </p> <p>Квартира находится в благоустроенном микрорайоне, по адресу ул. Огородная, 31 на 5 этаже 9 этажного панельного дома.</p> <p>Общая площадь квартиры -33,4 кв.м., жилая 17,4 кв.м., кухня 8 кв.м. </p> <p> </p> <p>• Квартира с хорошим ремонтом (пластиковые окна, надежная металлическая дверь, дорогой линолеум). Очень теплая и светлая; </p> <p>• Просторная комната с застекленной лоджией; </p> <p>• Кухня, где вся семья может сесть и обедать вместе;</p> <p>• Пластиковые окна защищают покой хозяев от постороннего шума, и сохраняют постоянное тепло в помещении.</p> <p>• Аккуратная лоджия, качественно отделанная деревом ; </p> <p>• Раздельный санузел, выложенный кафелем; </p> <p>• В санузле установлены приборы учета, новые трубы что сократит ваши расходы</p> <p>• Большой коридор </p> <p>• Чистый подъезд и доброжелательные соседи; </p> <p>• Имеются места для парковки автомобиля; </p> <p>• Семье с детьми будет интересно наличие детских садов, стадиона, профилактория, ж/д больницы, школ и гимназии. Все это находится рядом домом; </p> <p>• Магазины, рынок в шаговой доступности. </p>       

<p>   900 000&nbsp;руб.   </p>', '0', '0', '', '0', '0', '2');
INSERT INTO `eboard_db`(`id`, `ip`, `uid`, `cat`, `region`, `date_add`, `date_del`, `user_id`, `status`, `sendmail`, `approved`, `sort`, `email`, `user`, `title`, `text`, `marked`, `raised`, `date_raised`, `block`, `active`, `counter`) VALUES ('2', '95.215.45.75', 'b48fa9684a4fb452a3b50e6a6e6b7d49', '760', '120', '1516870860', '1519462860', '', '2', '1', '1', '10000000', 'i@board.ural56.ru', 'Анна', 'Продам квартиру     
1-к квартира  34.6 м²  на 2 этаже  3-этажного кирпичного дома', '<p>Квартиры </p>
  <p>г. Орск, Советский район, улица Экологическая, д.1, кв 18, однокомнатная квартира с застекленным балконом, с двумя окнами, светлая и солнечная. Расположена на втором этаже кирпичного дома. Торцевая, но теплая. Достаточно большой коридор. Дом отделен от дороги. Очень хорошее расположение, остановки городского транспорта, супермаркет, рынок, в шаговой доступности. Квартира в отличном состоянии.  С/у совмещенный. Окна - пластиковые, батареи - алюминевые. Частично мебелированная. Полностью готовая для проживания, без вложений. Срочная продажа, один взрослый собственник. ТОРГ.</p>       

<p>   820 000&nbsp;руб.   </p>', '0', '0', '', '0', '0', '1');
INSERT INTO `eboard_db`(`id`, `ip`, `uid`, `cat`, `region`, `date_add`, `date_del`, `user_id`, `status`, `sendmail`, `approved`, `sort`, `email`, `user`, `title`, `text`, `marked`, `raised`, `date_raised`, `block`, `active`, `counter`) VALUES ('3', '95.215.45.75', '264a72df19f457753f427226d7d9f849', '760', '120', '1516780020', '1519372020', '', '2', '1', '1', '10000000', 'i@board.ural56.ru', 'Димона, агентство недвижимости', 'Продам квартиру     
1-к квартира  33.6 м²  на 1 этаже  9-этажного панельного дома', '<p>Квартиры </p>
  <p> </p> <p>1-комнатная квартира улучшенной планировки в пяти шагах от важнейших транспортных развязок! Очень интересная цена! </p> <p>Однокомнатная квартира общей площадью 33,2 кв.м (жилая площадь 17,5 кв.м.), находящаяся на 1 этаже 9 этажного панельного дома по адресу: ул. Олимпийская, 30.</p> <p>Преимущества квартиры:</p> <p>• 1 этаж - не надо высоко подниматься, при этом высокий цоколь;</p> <p>• Светлая просторная комната, говорящая «Добро пожаловать домой!» обеспечит спокойный и приятный отдых после рабочего дня или подарит романтическое настроение;</p> <p>• Просторная кухня – 7 кв.м. позволит наслаждаться трапезой всей семье. Да и готовить на ней - одно удовольствие.</p> <p>• Удобная широкая лоджия – дополнительное место для отдыха;</p> <p>• Наличие раздельного санузла привносит дополнительные удобства по утрам без очередей, стрессов и суматохи. </p> <p>• Герметично поставленные окна защищают покой хозяев от постороннего шума, и сохраняют постоянное тепло в помещении.</p> <p>• Квартира теплая и светлая, готова к ремонту по вашему вкусу; </p> <p>• Спальный район с развитой инфраструктурой, магазины, школы, детские сады, больницы в шаговой доступности;</p> <p>• Подходит под ипотеку, материнский капитал, жилищные сертификаты;</p> <p>• Идеальное решение для приобретения при соотношении цены и качества;</p> <p>Не упускайте выгодную возможность, звоните прямо сейчас. </p> <p> </p>       

<p>   660 000&nbsp;руб.   </p>', '0', '0', '', '0', '0', '1');
INSERT INTO `eboard_db`(`id`, `ip`, `uid`, `cat`, `region`, `date_add`, `date_del`, `user_id`, `status`, `sendmail`, `approved`, `sort`, `email`, `user`, `title`, `text`, `marked`, `raised`, `date_raised`, `block`, `active`, `counter`) VALUES ('4', '95.215.45.75', '66238ceb1b98f129a6536b80be896efb', '760', '120', '1516682880', '1519274880', '', '2', '1', '1', '10000000', 'i@board.ural56.ru', 'Лена', 'Продам квартиру     
1-к квартира  33 м²  на 7 этаже  10-этажного панельного дома', '<p>Квартиры </p>
  <p>Продаю без посредников, документы готовы. Евроремонт.счетчики.пластиковые трубы пластиковые окна..натяжные потолки...новые :железная входная дверь, межкомн.двери... кафель , ванна,люстры..новая кухня с встроеной техникой..прихожая..модульная мебель в зале.. , машинка стиральная.новая сантехника..</p>       

<p>   1 300 000&nbsp;руб.   </p>', '0', '0', '', '0', '0', '2');
INSERT INTO `eboard_db`(`id`, `ip`, `uid`, `cat`, `region`, `date_add`, `date_del`, `user_id`, `status`, `sendmail`, `approved`, `sort`, `email`, `user`, `title`, `text`, `marked`, `raised`, `date_raised`, `block`, `active`, `counter`) VALUES ('5', '95.215.45.75', 'd171cc50baf7bbbff28b6f1789d66806', '760', '120', '1516463760', '1519055760', '', '2', '1', '1', '10000000', 'i@board.ural56.ru', 'Наталья', 'Продам квартиру     
1-к квартира  31 м²  на 3 этаже  5-этажного панельного дома', '<p>Квартиры </p>
  <p>Я-СОБСТВЕННИК! ЕДИНСТВЕННЫЙ И РЕАЛЬНЫЙ. <br />ОСТАЛЬНЫЕ ОБЪЯВЛЕНИЯ НА ЭТОМ САЙТЕ С ТАКИМИ ЖЕ ФОТОГРАФИЯМИ-РАЗМЕЩЕНЫ АГЕНТСТВАМИ.</p>       

<p>   655 000&nbsp;руб.   </p>', '0', '0', '', '0', '0', '1');
INSERT INTO `eboard_db`(`id`, `ip`, `uid`, `cat`, `region`, `date_add`, `date_del`, `user_id`, `status`, `sendmail`, `approved`, `sort`, `email`, `user`, `title`, `text`, `marked`, `raised`, `date_raised`, `block`, `active`, `counter`) VALUES ('6', '95.215.45.75', '802f0426adf47ceb4461f8a773558eae', '760', '120', '1518078360', '1520670360', '', '1', '1', '1', '10000000', 'i@board.ural56.ru', 'Жанна', 'Продам квартиру     
1-к квартира  29 м²  на 6 этаже  9-этажного кирпичного дома', '<p>Квартиры </p>
  <p>Продам 1к.кв. в хорошем состоянии, 6/9эт., мжк. Ул.Ялтинская, р-н 240кв., в хорошем состоянии заезжай и живи, пластиковые окна, стояки трубы поменяны, счетчики на воду стоят  ванной и в кухне, квартира теплая, в шаговой доступности дет. Сады, школы, гимназия , во дворе игровая площадка,  парковка, транспорт. маршрут. 37, 55, 36,21,16, трамвай1, мебель вывезена, документы готовы к продажи.</p>       

<p>   650 000&nbsp;руб.   </p>', '0', '0', '', '0', '0', '13');
INSERT INTO `eboard_db`(`id`, `ip`, `uid`, `cat`, `region`, `date_add`, `date_del`, `user_id`, `status`, `sendmail`, `approved`, `sort`, `email`, `user`, `title`, `text`, `marked`, `raised`, `date_raised`, `block`, `active`, `counter`) VALUES ('7', '95.215.45.75', '60c8f74da5b0a563db601449375210fb', '760', '120', '1518075900', '1520667900', '', '1', '1', '1', '10000000', 'i@board.ural56.ru', 'Димона, агентство недвижимости', 'Продам квартиру     
1-к квартира  30.9 м²  на 5 этаже  5-этажного блочного дома', '<p>Квартиры </p>
  <p>Продается 1 комнатная квартира в самом востребованном районе города!</p> <p>Квартира находится по адресу ул. Макаренко, 10 на 5 этаже 5 этажного панельного дома.</p> <p>Общая площадь квартиры - 30,9 кв.м. Жилая площадь – 18,4 кв.м. Кухня – 6 кв.м.</p> <p>• Уютная, теплая и светлая квартира</p> <p>• Совмещенный санузел, в котором поместится все.</p> <p>• В квартире выполнен частичный ремонт - приборы учёта на газ и воду, пластиковый водопровод, входная металлическая дверь; </p> <p>• Пластиковые окна защитят Ваш покой от шума улиц.</p> <p>• Имеется застекленный балкон (это всегда имеет значение для практичных хозяев)</p> <p>• Тихий зеленый двор, доброжелательные соседи;</p> <p>• Расположение дома вас тоже порадует. В шаговой доступности и магазины, и аптеки и парикмахерские. Также близко детский сад и школа, находящиеся прямо во дворе, что убережет ваших детей от перехода проезжей части. Внутри дворовая территория озеленена, оборудована парковками и детскими площадками. </p> <p>• Удобная транспортная развязка, в любой район города можно легко и быстро доехать как на общественном, так и на личном транспорте.</p> <p>Обременений и долгов нет.</p> <p> </p>       

<p>   680 000&nbsp;руб.   </p>', '0', '0', '', '0', '0', '5');
INSERT INTO `eboard_db`(`id`, `ip`, `uid`, `cat`, `region`, `date_add`, `date_del`, `user_id`, `status`, `sendmail`, `approved`, `sort`, `email`, `user`, `title`, `text`, `marked`, `raised`, `date_raised`, `block`, `active`, `counter`) VALUES ('8', '95.215.45.75', '4e2e8003811b7fdd31d1abe4908e0cd3', '760', '120', '1518027660', '1520619660', '', '1', '1', '1', '10000000', 'i@board.ural56.ru', 'лариса', 'Продам квартиру     
1-к квартира  31 м²  на 7 этаже  9-этажного панельного дома', '<p>Квартиры </p>
  <p>Теплая квартира с хорошим видом из окон, частично меблированная, кухонный гарнитур, остается новый холодильник и стиральная машинка, натяжные потолки по всей квартире, застекленная лоджия.</p>       

<p>   900 000&nbsp;руб.   </p>', '0', '0', '', '0', '0', '4');
INSERT INTO `eboard_db`(`id`, `ip`, `uid`, `cat`, `region`, `date_add`, `date_del`, `user_id`, `status`, `sendmail`, `approved`, `sort`, `email`, `user`, `title`, `text`, `marked`, `raised`, `date_raised`, `block`, `active`, `counter`) VALUES ('9', '95.215.45.75', '52bf045fcf23348205585beec08cc745', '760', '120', '1517945700', '1520537700', '', '1', '1', '1', '10000000', 'i@board.ural56.ru', 'Настя', 'Продам квартиру     
1-к квартира  30.1 м²  на 1 этаже  5-этажного панельного дома', '<p>Квартиры </p>
  <p>Продам уютную однокомнатную квартиру. Находится на 1 этаже 5-и этажного панельного дома ( есть большой цоколь и квартира находится на уровне 2-го этажа) Квартира не угловая, очень тёплая. Сделан косметический ремонт, установлены пластиковые окна, новая входная дверь. Все что нужно есть рядом: магазины, школы, почта, остановка общественного транспорта, детские сады. Квартира в собственности более 3-х лет. Можем оставить всю мебель и технику.  Собственник. Торг</p>       

<p>   770 000&nbsp;руб.   </p>', '0', '0', '', '0', '0', '5');
INSERT INTO `eboard_db`(`id`, `ip`, `uid`, `cat`, `region`, `date_add`, `date_del`, `user_id`, `status`, `sendmail`, `approved`, `sort`, `email`, `user`, `title`, `text`, `marked`, `raised`, `date_raised`, `block`, `active`, `counter`) VALUES ('10', '95.215.45.75', 'b3296f66b2b35f7521efc39b3a949003', '760', '120', '1517934900', '1520526900', '', '1', '1', '1', '10000000', 'i@board.ural56.ru', 'Мирамгуль Сатубалдина', 'Продам квартиру     
1-к квартира  31 м²  на 4 этаже  5-этажного панельного дома', '<p>Квартиры </p>
  <p>Продам 1-ую кв, в районе рынка \"Авангард\", в шаговой доступности вся инфроструктура, квартира очень теплая, солнечная сторона, уютная,  при продаже оставляем встроенную гардеробную и кухонный гарнитур, ремонт. Пластиковые окна, пластиковый водопровод, счетчики на воду.</p>       

<p>   780 000&nbsp;руб.   </p>', '0', '0', '', '0', '0', '2');
INSERT INTO `eboard_db`(`id`, `ip`, `uid`, `cat`, `region`, `date_add`, `date_del`, `user_id`, `status`, `sendmail`, `approved`, `sort`, `email`, `user`, `title`, `text`, `marked`, `raised`, `date_raised`, `block`, `active`, `counter`) VALUES ('11', '95.215.45.75', '28fedc9a1a7a7773003492865fd7abe2', '760', '120', '1517840400', '1520432400', '', '1', '1', '1', '10000000', 'i@board.ural56.ru', 'Зоя', 'Продам квартиру     
1-к квартира  36 м²  на 2 этаже  9-этажного кирпичного дома', '<p>Квартиры </p>
  <p>Срочно !!!  в Орске ул. Комарова 1, ост. Ялтинская;  240 квар.; 2/9 эт.;  Хозяин  ПРОДАЕТ - 1ком.кв. ул/пл - 35,4/18/8,4 из кухни выход на лоджию;  газ, гор. хол. вода ; вся инфраструктура рядом; Документы в порядке.Состояние жилое. Реальному покупателю торг уместен.</p>       

<p>   800 000&nbsp;руб.   </p>', '0', '0', '', '0', '0', '4');
INSERT INTO `eboard_db`(`id`, `ip`, `uid`, `cat`, `region`, `date_add`, `date_del`, `user_id`, `status`, `sendmail`, `approved`, `sort`, `email`, `user`, `title`, `text`, `marked`, `raised`, `date_raised`, `block`, `active`, `counter`) VALUES ('12', '95.215.45.75', 'ca5653d3afdfd2530dc95d55dbdf893f', '760', '120', '1517835120', '1520427120', '', '1', '1', '1', '10000000', 'i@board.ural56.ru', 'Силкин Виктор', 'Продам квартиру  в новостройке     
1-к квартира  34 м²  на 8 этаже  9-этажного кирпичного дома', '<p>Квартиры </p>
  <p>Продам 1 квартиру в новом доме на остановке Сорокина общей площадью 34 кв.м., пластиковые окна, балкон, ремонт от застройщика.</p>       

<p>   800 000&nbsp;руб.   </p>', '0', '0', '', '0', '0', '5');
INSERT INTO `eboard_db`(`id`, `ip`, `uid`, `cat`, `region`, `date_add`, `date_del`, `user_id`, `status`, `sendmail`, `approved`, `sort`, `email`, `user`, `title`, `text`, `marked`, `raised`, `date_raised`, `block`, `active`, `counter`) VALUES ('13', '95.215.45.75', '46797c38a78f5eb130b94d5ccc841fe1', '760', '120', '1517834040', '1520426040', '', '1', '1', '1', '10000000', 'i@board.ural56.ru', 'Горбачева Наталья', 'Продам квартиру     
1-к квартира  34 м²  на 4 этаже  5-этажного кирпичного дома', '<p>Квартиры </p>
  <p>Продам 1 комн. квартиру в кирпичном доме. Квартира очень теплая, светлая, просторная- 34м2! <br />В квартире установлены пластиковые трубы, счетчики на воду. Собственники квартир освобождены от уплаты взносов за капитальный ремонт! В пяти минутах ходьбы магазины, остановки общественного транспорта, детский сад, школа, аптеки, поликлиника.</p>       

<p>   680 000&nbsp;руб.   </p>', '0', '0', '', '0', '0', '2');
INSERT INTO `eboard_db`(`id`, `ip`, `uid`, `cat`, `region`, `date_add`, `date_del`, `user_id`, `status`, `sendmail`, `approved`, `sort`, `email`, `user`, `title`, `text`, `marked`, `raised`, `date_raised`, `block`, `active`, `counter`) VALUES ('14', '95.215.45.75', '1ba75f1179a4bea04542aca4d8df5b72', '760', '120', '1517832900', '1520424900', '', '1', '1', '1', '10000000', 'i@board.ural56.ru', 'Искаренко Ольга', 'Продам квартиру     
1-к квартира  31.7 м²  на 2 этаже  5-этажного кирпичного дома', '<p>Квартиры </p>
  <p>Продам 1 к.кв. в кирпичном доме в Центре! Квартира теплая, уютная, очень светлая. Заменены пластиковые окна, трубы, установлены счетчики ХВС, ГВС, санузел раздельный, балкон застеклен. Отличный район, удобная транспортная развязка.</p>       

<p>   780 000&nbsp;руб.   </p>', '0', '0', '', '0', '0', '2');
INSERT INTO `eboard_db`(`id`, `ip`, `uid`, `cat`, `region`, `date_add`, `date_del`, `user_id`, `status`, `sendmail`, `approved`, `sort`, `email`, `user`, `title`, `text`, `marked`, `raised`, `date_raised`, `block`, `active`, `counter`) VALUES ('15', '95.215.45.75', '9c8bec27b68c354acc138aaddd8afbdc', '760', '120', '1517821260', '1520413260', '', '1', '1', '1', '10000000', 'i@board.ural56.ru', 'Дмитрий', 'Продам квартиру     
1-к квартира  33.4 м²  на 6 этаже  9-этажного панельного дома', '<p>Квартиры </p>
  <p>Продам 1 комнатную квартиру ,квартира в которой возможно сделать ремонт по вашему вкусу !стены все ровные !теплая.<br />Школа ,детский сад ,остановка ,магазины ,все в шаговой доступности !</p>       

<p>   800 000&nbsp;руб.   </p>', '0', '0', '', '0', '0', '2');
INSERT INTO `eboard_db`(`id`, `ip`, `uid`, `cat`, `region`, `date_add`, `date_del`, `user_id`, `status`, `sendmail`, `approved`, `sort`, `email`, `user`, `title`, `text`, `marked`, `raised`, `date_raised`, `block`, `active`, `counter`) VALUES ('16', '95.215.45.75', 'e4e5859600619de1cd7112b9a0bbdd1a', '760', '120', '1517727660', '1520319660', '', '1', '1', '1', '10000000', 'i@board.ural56.ru', 'Ольга', 'Продам квартиру     
1-к квартира  32 м²  на 4 этаже  5-этажного панельного дома', '<p>Квартиры </p>
  <p>1 комнатная квартира в центре города, Васнецова. 4/5. Школа, садик, магазины-всё рядом. Окна-пластик, балкон застеклен,  остаётся всё, что есть на фото-кухонный гарнитур, шкафы в прихожей и на балконе, диван,  стиральная машина, кондиционер, холодильник.</p>       

<p>   800 000&nbsp;руб.   </p>', '0', '0', '', '0', '0', '2');
INSERT INTO `eboard_db`(`id`, `ip`, `uid`, `cat`, `region`, `date_add`, `date_del`, `user_id`, `status`, `sendmail`, `approved`, `sort`, `email`, `user`, `title`, `text`, `marked`, `raised`, `date_raised`, `block`, `active`, `counter`) VALUES ('17', '95.215.45.75', 'eb393ae22a074f07cd27a99ca68144e6', '760', '120', '1517649420', '1520241420', '', '1', '1', '1', '10000000', 'i@board.ural56.ru', 'виталий', 'Продам квартиру     
1-к квартира  32 м²  на 4 этаже  5-этажного панельного дома', '<p>Квартиры </p>
  <p>Продам 1ую квартиру. Хороший район, рядом школа, д. Сады ,магазины. Возможен хороший торг реальным покупателям при осмотре!</p>       

<p>   670 000&nbsp;руб.   </p>', '0', '0', '', '0', '0', '2');
INSERT INTO `eboard_db`(`id`, `ip`, `uid`, `cat`, `region`, `date_add`, `date_del`, `user_id`, `status`, `sendmail`, `approved`, `sort`, `email`, `user`, `title`, `text`, `marked`, `raised`, `date_raised`, `block`, `active`, `counter`) VALUES ('18', '95.215.45.75', '86089df15827228431c1a7cc2efaf204', '760', '120', '1517587680', '1520179680', '', '1', '1', '1', '10000000', 'i@board.ural56.ru', 'Серёжка Таратынов', 'Продам квартиру     
1-к квартира  29 м²  на 1 этаже  9-этажного кирпичного дома', '<p>Квартиры </p>
  <p>Собственник.<br />Срочно продам 1 комнатную квартиру по ул. Станиславского д.1б на 1 этаже 9 этажного дома ( дом кирпичный)В подъезде и квартире установлены металические двери.На окнах пластиковые стеклопакеты,межкомнатные двери заменены,размер кухни Вас тоже порадует.Балкон застеклен. В квартире сделан ремонт ( перепланировка узаконена)Вся инфраструктура развита и в шаговой доступности. На воду установлены счётчики. Есть все для комфортного проживания( заходи и живи). Фото соответствует действительности.Мебель и бытовая техника все остаётся в виду переезда в другой город.<br />Реальному покупателю небольшой торг . <br />Приходите на просмотр</p>       

<p>   870 000&nbsp;руб.   </p>', '0', '0', '', '0', '0', '2');
INSERT INTO `eboard_db`(`id`, `ip`, `uid`, `cat`, `region`, `date_add`, `date_del`, `user_id`, `status`, `sendmail`, `approved`, `sort`, `email`, `user`, `title`, `text`, `marked`, `raised`, `date_raised`, `block`, `active`, `counter`) VALUES ('19', '95.215.45.75', '05f61c8cec19f57d77cc616461f7385f', '760', '120', '1517520660', '1520112660', '', '1', '1', '1', '10000000', 'i@board.ural56.ru', 'Алексей', 'Продам квартиру     
1-к квартира  27 м²  на 3 этаже  5-этажного кирпичного дома', '<p>Квартиры </p>
  <p>Продам однокомнатную квартиру в п.Первомайский в ДОСах.Квартира 27кв.м, переделанная в студию, перепланировка узаконена.Квартира с капитальным евро-ремонтом,делали всё для себя начиная с замены полностью электропроводки,водопровода,системы отопления, стяжки пола и штукатурки стен,двери из натурального дерева,полностью остеклён балкон из алюминиевого профиля,стеклопакеты 3 камерные,электро полы.После ремонта никто не жил квартира новая.Только ремонт обошёлся в 500000.Продаём с большим сожалением,но живём давно уже в другом городе.<br />Возможна продажа гаража.</p>       

<p>   680 000&nbsp;руб.   </p>', '0', '0', '', '0', '0', '2');
INSERT INTO `eboard_db`(`id`, `ip`, `uid`, `cat`, `region`, `date_add`, `date_del`, `user_id`, `status`, `sendmail`, `approved`, `sort`, `email`, `user`, `title`, `text`, `marked`, `raised`, `date_raised`, `block`, `active`, `counter`) VALUES ('20', '95.215.45.75', '754965c75ff32176439a9d96fde94527', '760', '120', '1517477040', '1520069040', '', '1', '1', '1', '10000000', 'i@board.ural56.ru', 'кристина', 'Продам квартиру     
1-к квартира  33 м²  на 1 этаже  3-этажного кирпичного дома', '<p>Квартиры </p>
  <p>Продается одникомнатная  квартира.В районе мясокоибината.  В нормальном состоянии. Пластиковые окна и водопровод. Красивые кованные решетки. С/у раздельный. Остается вся мебель и бытовая техника. Большой двухкамерный холодильник, хорошая газовая плита, стиральная машинка автомат. Два дивана, большая стенка в зале, деревянный кухонный гарнитур.Без торга т.к. остается вся мебель и бытовая техника.  Остальные вопросы по телефону.</p>       

<p>   600 000&nbsp;руб.   </p>', '0', '0', '', '0', '0', '2');
INSERT INTO `eboard_db`(`id`, `ip`, `uid`, `cat`, `region`, `date_add`, `date_del`, `user_id`, `status`, `sendmail`, `approved`, `sort`, `email`, `user`, `title`, `text`, `marked`, `raised`, `date_raised`, `block`, `active`, `counter`) VALUES ('21', '95.215.45.75', 'd65c9e43a46adc2d6d638cf529d17a5b', '760', '120', '1517400960', '1519992960', '', '1', '1', '1', '10000000', 'i@board.ural56.ru', 'Яна', 'Продам квартиру     
1-к квартира  31 м²  на 2 этаже  5-этажного кирпичного дома', '<p>Квартиры </p>
  <p>Теплая, светлая квартира в экологически-чистом районе, ОЗТП. Кирпичный дом, 2 этаж, дружелюбные соседи. Застекленный балкон, пластиковые окна, пластиковые трубы, счетчики на воду. Хороший ремонт, заходи и живи. Рядом остановки 55, 23а, 18, 36 маршруток, детский сад, школа, спортивный клуб, магазины, аптека. Никто не прописан, один собственник, документы готовы к сделке.</p>       

<p>   800 000&nbsp;руб.   </p>', '0', '0', '', '0', '0', '2');
INSERT INTO `eboard_db`(`id`, `ip`, `uid`, `cat`, `region`, `date_add`, `date_del`, `user_id`, `status`, `sendmail`, `approved`, `sort`, `email`, `user`, `title`, `text`, `marked`, `raised`, `date_raised`, `block`, `active`, `counter`) VALUES ('22', '95.215.45.75', '1554b2e8a28d9438541020a7eb98d604', '760', '120', '1517378940', '1519970940', '', '1', '1', '1', '10000000', 'i@board.ural56.ru', 'Равиль', 'Продам квартиру     
1-к квартира  33 м²  на 5 этаже  5-этажного панельного дома', '<p>Квартиры </p>
  <p>Срочно!!! Продам 1-комнатную квартиру. Тихий район. Чистый подъезд, отзывчивые и тихие соседи. 100% не течёт и никогда не текла крыша. Пластиковые трубы водоснабжения и канализации. Квартира пустая, документы готовы к сделке. Рассмотрим все варианты оплаты. Торг.</p>       

<p>   630 000&nbsp;руб.   </p>', '0', '0', '', '0', '0', '2');
INSERT INTO `eboard_db`(`id`, `ip`, `uid`, `cat`, `region`, `date_add`, `date_del`, `user_id`, `status`, `sendmail`, `approved`, `sort`, `email`, `user`, `title`, `text`, `marked`, `raised`, `date_raised`, `block`, `active`, `counter`) VALUES ('23', '95.215.45.75', 'b02637b22f9eb567c7b907f256412601', '760', '120', '1517297700', '1519889700', '', '1', '1', '1', '10000000', 'i@board.ural56.ru', 'Ирина', 'Продам квартиру     
1-к квартира  35 м²  на 8 этаже  9-этажного панельного дома', '<p>Квартиры </p>
  <p>Собственник. Продам уютную, теплую однокомнатную квартиру, 8/9, 35 кв.м, жилая 18 кв.м., улучш. планировка, балкон застеклен,счетчики на воду и э/э,  трубы п/пропилен, в т.ч. стояковые, окна пластиковые, двойная входная дверь-железная и утепленная деревянная, общая с соседями дверь-железная. Лифт работает круглосуточно. Продажа в связи с переездом в другой город.Все выписаны. Один взрослый собственник более 3 лет. Вайбер, Вотсап, Телеграмм.</p>       

<p>   820 000&nbsp;руб.   </p>', '0', '0', '', '0', '0', '2');
INSERT INTO `eboard_db`(`id`, `ip`, `uid`, `cat`, `region`, `date_add`, `date_del`, `user_id`, `status`, `sendmail`, `approved`, `sort`, `email`, `user`, `title`, `text`, `marked`, `raised`, `date_raised`, `block`, `active`, `counter`) VALUES ('24', '95.215.45.75', '6e8a39f58d14dc7393fcc652cadd6b19', '760', '120', '1517240520', '1519832520', '', '2', '1', '1', '10000000', 'i@board.ural56.ru', 'Виктория', 'Продам квартиру     
1-к квартира  32 м²  на 5 этаже  5-этажного панельного дома', '<p>Квартиры </p>
  <p>СРОЧНО ПРОДАМ ОДНОКОМНАТНУЮ КВАРТИРУ В СВЯЗИ С ПЕРЕЕЗДОМ , В РАЙОНЕ ШЕВЧЕНКО 15 МИН.ПЕШКОМ ОТ ЦЕНТРА ГОРОДА . СВЕТЛУЮ , ТЕПЛУЮ , УЮТНУЮ . ВСЕ В ШАГОВОЙ ДОСТУПНОСТИ МАГАЗИНЫ - 5, МАГНИТ И Т.Д В 3 МИН ХОДЬБЫ. ДЕТ. САДИК НАПРОТИВ ДОМА . ШКОЛА В 5-10 МИН ХОДЬБЫ. СОСЕДИ ТИХИЕ . ДОКУМЕНТЫ ГОТОВЫ . РАССМОТРЮ ВАРИАНТЫ ОПЛАТЫ . МОЖНО МАТКАП . ЛЮБЫЕ ПОДРОБНОСТИ ПО ТЕЛ . СОБСТВЕННИК</p>       

<p>   610 000&nbsp;руб.   </p>', '0', '0', '', '0', '0', '2');
INSERT INTO `eboard_db`(`id`, `ip`, `uid`, `cat`, `region`, `date_add`, `date_del`, `user_id`, `status`, `sendmail`, `approved`, `sort`, `email`, `user`, `title`, `text`, `marked`, `raised`, `date_raised`, `block`, `active`, `counter`) VALUES ('25', '95.215.45.75', '288e98bd58530b341f945e15ed334bae', '760', '120', '1517233920', '1519825920', '', '2', '1', '1', '10000000', 'i@board.ural56.ru', 'Ирина', 'Продам квартиру     
1-к квартира  30 м²  на 2 этаже  5-этажного панельного дома', '<p>Квартиры </p>
  <p>Продам квартиру!</p>       

<p>   800 000&nbsp;руб.   </p>', '0', '0', '', '0', '0', '2');
INSERT INTO `eboard_db`(`id`, `ip`, `uid`, `cat`, `region`, `date_add`, `date_del`, `user_id`, `status`, `sendmail`, `approved`, `sort`, `email`, `user`, `title`, `text`, `marked`, `raised`, `date_raised`, `block`, `active`, `counter`) VALUES ('26', '95.215.45.75', '73cb8dda53ac1ee0717b8dc0dd98b6dc', '760', '120', '1517221620', '1519813620', '', '2', '1', '1', '10000000', 'i@board.ural56.ru', 'Димона, агентство недвижимости', 'Продам квартиру     
1-к квартира  30.1 м²  на 4 этаже  5-этажного панельного дома', '<p>Квартиры </p>
  <p>Вы устали от шумных соседей? Тогда эта квартира для вас, она находится по адресу: ул. Комарова, 24.<br /><br />Однокомнатная квартира: общая площадь 30,1 кв.м., жилая 17,1 кв.м., кухня 6 кв.м., расположена на 3 этаже 5 этажного панельного дома.<br /><br />Квартира в которой возможно сделать ремонт по вашему личному вкусу, обеспечит спокойный и приятный отдых после рабочего дня и подарит хорошее настроение.<br />• На кухне газовая плита, <br />• Имеется балкон (это всегда имеет значение для практичных хозяев), <br />• Совмещенный санузел в кафеле, установлены приборы учета, новые трубы что сократит ваши расходы;<br />• Чистый подъезд и доброжелательные соседи;<br />• Развитая инфраструктура, рядом хорошая транспортная развязка, магазины, школа, детский сад, все в шаговой доступности.<br />Подходит под материнский капитал, ипотеку и все виды жилищных сертификатов.</p>       

<p>   730 000&nbsp;руб.   </p>', '0', '0', '', '0', '0', '2');
INSERT INTO `eboard_db`(`id`, `ip`, `uid`, `cat`, `region`, `date_add`, `date_del`, `user_id`, `status`, `sendmail`, `approved`, `sort`, `email`, `user`, `title`, `text`, `marked`, `raised`, `date_raised`, `block`, `active`, `counter`) VALUES ('27', '95.215.45.75', '89b84e6d7376afcc1f043df9614f3967', '760', '120', '1517173020', '1519765020', '', '2', '1', '1', '10000000', 'i@board.ural56.ru', 'Марина', 'Продам квартиру     
1-к квартира  34 м²  на 3 этаже  5-этажного кирпичного дома', '<p>Квартиры </p>
  <p>Продам однокомнатную квартиру возле медицинского колледжа, по адресу: г. Орск, ул. Медногорская, д. 15Б. Уютная, теплая, балкон в кухне.</p>       

<p>   750 000&nbsp;руб.   </p>', '0', '0', '', '0', '0', '3');
INSERT INTO `eboard_db`(`id`, `ip`, `uid`, `cat`, `region`, `date_add`, `date_del`, `user_id`, `status`, `sendmail`, `approved`, `sort`, `email`, `user`, `title`, `text`, `marked`, `raised`, `date_raised`, `block`, `active`, `counter`) VALUES ('28', '95.215.45.75', '5df450eacfaf5a6a6e3e56a48c8835b1', '760', '120', '1517167560', '1519759560', '', '2', '1', '1', '10000000', 'i@board.ural56.ru', 'Светлана', 'Продам квартиру     
1-к квартира  30 м²  на 2 этаже  5-этажного кирпичного дома', '<p>Квартиры </p>
  <p>Продам 1 комнатную квартиру ост. Тагильская (маг. Строительный БУМ), 2 этаж в 5 этажном кирпичном доме, не угловая. Пластиковые окна, пластиковые трубы, счётчики. Санузел совмещённый. Балкона нет. Квартира светлая, теплая, хорошая шумоизоляция. Возможность оставить мебель. Все в шаговой доступности. Собственник один.</p>       

<p>   720 000&nbsp;руб.   </p>', '0', '0', '', '0', '0', '2');
INSERT INTO `eboard_db`(`id`, `ip`, `uid`, `cat`, `region`, `date_add`, `date_del`, `user_id`, `status`, `sendmail`, `approved`, `sort`, `email`, `user`, `title`, `text`, `marked`, `raised`, `date_raised`, `block`, `active`, `counter`) VALUES ('29', '95.215.45.75', 'e9e52b903e8eec0dba1151e9255e5a38', '760', '120', '1517065080', '1519657080', '', '2', '1', '1', '10000000', 'i@board.ural56.ru', 'Елена Суворова', 'Продам квартиру     
1-к квартира  33 м²  на 5 этаже  9-этажного панельного дома', '<p>Квартиры </p>
  <p>1-я квартира улучшенной планировки, евроремонт, без мебели, во дворе благоустроенная детская площадка, отличная парковка, в шаговой доступности магазины, аптеки, поликлиника, остановки общественного транспорта</p>       

<p>   965 000&nbsp;руб.   </p>', '0', '0', '', '0', '0', '2');
INSERT INTO `eboard_db`(`id`, `ip`, `uid`, `cat`, `region`, `date_add`, `date_del`, `user_id`, `status`, `sendmail`, `approved`, `sort`, `email`, `user`, `title`, `text`, `marked`, `raised`, `date_raised`, `block`, `active`, `counter`) VALUES ('30', '95.215.45.75', 'f294a2505292e86040b7be71eb2f8d90', '760', '120', '1516982640', '1519574640', '', '2', '1', '1', '10000000', 'i@board.ural56.ru', 'Анютка Ермакова', 'Продам квартиру     
1-к квартира  30 м²  на 5 этаже  5-этажного кирпичного дома', '<p>Квартиры </p>
  <p>Продам 1 комн квартиру на 2 ом участке Васнецова на 5 этаже в теплом кирпичном доме.состояние хорошее. остается кондиционер. окна и трубы пластик. торг при осмотре . цена 690000 р</p>       

<p>   690 000&nbsp;руб.   </p>', '0', '0', '', '0', '0', '1');
INSERT INTO `eboard_db`(`id`, `ip`, `uid`, `cat`, `region`, `date_add`, `date_del`, `user_id`, `status`, `sendmail`, `approved`, `sort`, `email`, `user`, `title`, `text`, `marked`, `raised`, `date_raised`, `block`, `active`, `counter`) VALUES ('31', '95.215.45.75', 'f1c4cc046d6e0104ab7d9e8df360865c', '761', '120', '1517910840', '1520502840', '', '1', '1', '1', '10000000', 'i@board.ural56.ru', 'Елизавета', 'Продам квартиру     
2-к квартира  46 м²  на 5 этаже  5-этажного панельного дома', '<p>Квартиры </p>
  <p>2х- комнатная квартира по ул.Короленко 142А. Состояние отличное,евроремонт,кондиционнер,частично мебелированная.Планировка \"трамвай\".Рядом остановка,школа,садики,гиперМагнит,СтС,спортклуб и многое другое</p>       

<p>   1 190 000&nbsp;руб.   </p>', '0', '0', '', '0', '0', '4');
INSERT INTO `eboard_db`(`id`, `ip`, `uid`, `cat`, `region`, `date_add`, `date_del`, `user_id`, `status`, `sendmail`, `approved`, `sort`, `email`, `user`, `title`, `text`, `marked`, `raised`, `date_raised`, `block`, `active`, `counter`) VALUES ('32', '95.215.45.75', '59bb788e6fe80532e44970f5f8d01367', '761', '120', '1517909520', '1520501520', '', '1', '1', '1', '10000000', 'i@board.ural56.ru', 'Борисова Евгения', 'Продам квартиру     
2-к квартира  44 м²  на 2 этаже  5-этажного кирпичного дома', '<p>Квартиры </p>
  <p>Срочно продам 2 комнатную квартиру в центре города, теплый кирпичный дом, окна пластиковые, поменяны двери, трубы, установлены водяные счетчики, в ванной  поменяна сантехника, выложен пол кафельной плиткой. Во дворе дома детский сад, рядом 1 школа, школа №27, остановка, магазины.</p>       

<p>   870 000&nbsp;руб.   </p>', '0', '0', '', '0', '0', '2');
INSERT INTO `eboard_db`(`id`, `ip`, `uid`, `cat`, `region`, `date_add`, `date_del`, `user_id`, `status`, `sendmail`, `approved`, `sort`, `email`, `user`, `title`, `text`, `marked`, `raised`, `date_raised`, `block`, `active`, `counter`) VALUES ('33', '95.215.45.75', 'da7e27c72a5634e8d36750476a0cd1cc', '761', '120', '1517901720', '1520493720', '', '1', '1', '1', '10000000', 'i@board.ural56.ru', 'Димона, агентство недвижимости', 'Продам квартиру     
2-к квартира  59 м²  на 4 этаже  5-этажного кирпичного дома', '<p>Квартиры </p>
  <p>Для деловых энергичных и современных людей продается отличная двухкомнатная квартира в центре города! </p> <p>Квартира находится по адресу: пр. Ленина, 42 на 4 этаже 5-этажного кирпичного дома. </p> <p>• Огромная площадь квартиры – 59 кв.м., жилая - 32 кв.м., кухня – 11 кв.м.</p> <p>• Квартира теплая и светлая, готова к ремонту по вашему вкусу</p> <p>• Комнаты квартиры наполнены солнечным светом из окон, застекленных пластиковыми стеклопакетами. </p> <p>• Просторные комнаты выходят на 2 стороны дома. </p> <p>• Просторная кухня – 11 кв.м. позволит наслаждаться трапезой всей семье. Да и готовить на ней - одно удовольствие.</p> <p>• Раздельный санузел - огромный плюс для большой семьи.</p> <p>• Установлены приборы учета, новые трубы что сократит ваши расходы.</p> <p>• Прочные кирпичные стены дома и герметично поставленные окна защищают покой хозяев от постороннего шума, и сохраняют постоянное тепло в помещении. Надежная металлическая дверь.</p> <p>• Очень чистый подъезд. </p> <p>• В этом районе очень развита социальная и культурная инфраструктура. Школа №2 и детский сад №65 в шаговой доступности! </p> <p>Центральная площадь Орска, а так же культурно-развлекательные мероприятия – в 3 минутах прогулочной ходьбы от дома. Вы сможете быть в центре самых красочных праздничных мероприятий.</p>       

<p>   1 600 000&nbsp;руб.   </p>', '0', '0', '', '0', '0', '3');
INSERT INTO `eboard_db`(`id`, `ip`, `uid`, `cat`, `region`, `date_add`, `date_del`, `user_id`, `status`, `sendmail`, `approved`, `sort`, `email`, `user`, `title`, `text`, `marked`, `raised`, `date_raised`, `block`, `active`, `counter`) VALUES ('34', '95.215.45.75', 'd29dff497583fc63a7b98ec8f4f4c6bc', '761', '120', '1517901720', '1520493720', '', '1', '1', '1', '10000000', 'i@board.ural56.ru', 'Димона, агентство недвижимости', 'Продам квартиру     
2-к квартира  43.7 м²  на 5 этаже  5-этажного панельного дома', '<p>Квартиры </p>
  <p> Вы всегда выбираете лучшее для себя и своей семьи? </p> <p>Тогда наше предложение для Вас! </p> <p>Продается замечательная 2 комн. квартира по адресу: ул. Васнецова, 14 на 5 этаже 5-этажного дома.</p> <p>Общая площадь квартиры 43,7 кв. метра, жилая 30,3 кв. метров, кухня 6 кв. метров. </p> <p>- Все устройство этой квартиры обеспечивает абсолютный комфорт её владельцам.</p> <p>- Просторная кухня, в которой есть рабочая и обеденная зона. Готовить семейный ужин на такой кухне одно удовольствие.</p> <p>- Раздельный санузел выложен кафелем. </p> <p>- Окна квартиры выходят на обе стороны дома, а с просторного застекленного балкона открывается красивый вид на город. </p> <p>- Вам не придётся заниматься ремонтом, всё уже готово, просто купите и наслаждайтесь! Отличный кухонный гарнитур остается для вашего удобства! </p> <p>- Во дворе дома находится большая детская площадка.</p> <p>- Удобно и то, что рядом с домом находятся магазины, парикмахерские, аптеки, гаражные кооперативы, а также остановки общественного транспорта. </p> <p>Район с развитой инфраструктурой. Вам будет, где отдохнуть семьей или с друзьями, или устроить шопинг.</p> <p> </p>       

<p>   1 030 000&nbsp;руб.   </p>', '0', '0', '', '0', '0', '2');
INSERT INTO `eboard_db`(`id`, `ip`, `uid`, `cat`, `region`, `date_add`, `date_del`, `user_id`, `status`, `sendmail`, `approved`, `sort`, `email`, `user`, `title`, `text`, `marked`, `raised`, `date_raised`, `block`, `active`, `counter`) VALUES ('35', '95.215.45.75', '17c252cf6285d3987a7f0cfd0f49def5', '761', '120', '1517841360', '1520433360', '', '1', '1', '1', '10000000', 'i@board.ural56.ru', 'Алексей', 'Продам квартиру     
2-к квартира  48.8 м²  на 4 этаже  5-этажного кирпичного дома', '<p>Квартиры </p>
  <p>Продается уютная и светлая 2 комн. квартира по адресу: г. Орск, ул. Станционная, 12 (район ЖД вокзала) на 4 этаже 5-этажного кирпичного дома. Кадастровый номер квартиры № 56:43:0309039:265. <br />Показывает квартиру родственник Алексей (номер в объявлении). <br />Продает собственник без посредников. Собственник с 2006 г. по приватизации. Агентов без покупателя просьба не беспокоить. </p><p>В октябре 2015 года проведен капитальный ремонт кровли дома на сумму 1,7 млн.руб. (информация на сайте Администрации города Орска). <br />В рамках реализации федерального приоритетного проекта «Комфортная городская среда» осенью 2017 года выполнено благоустройство двора и детской площадки около дома (информация на сайте Администрации города Орска в разделе «современная городская среда»).</p><p>Рядом с квартирой: детский сад – 300 м.; школа-гимназия № 1 – 350 м.; поликлиника – 700 м.; управление ржд – 600 м.; привокзальный рынок (магазин Магнит) – 550 м.; почта – 200 м.; ЖД-вокзал - 700 м.; Парк – 500 м., магазин «Купец» - 100 м., Пятерочка - 440 м.; Сбербанк – 150 м.   </p><p>• Общая полезная площадь квартиры 48,8 кв.м., жилая площадь 29,6 кв.м. </p><p>• В октябре 2015 года проведен капитальный ремонт кровли дома на сумму 1,7 млн.руб. (информация о капитальном ремонте на сайте Администрации города Орска)</p><p>• Вся мебель, которую видно на фото, остается покупателю бесплатно. </p><p>• Полы исправные (красили в 2014 г.), демонтажа не требуют и могут быть закрыты покупателем линолеумом или ламинатом на подложке.   </p><p>• Санузел раздельный.</p><p>• В квартире установлены приборы учёта горячей, холодной воды.</p><p>• Имеется застекленный балкон, выходящий во двор с новой детской площадкой (2017 г.)</p><p>• Рядом с домом находятся детский сад № 115, детский сад № 147 «Теремок», дом культуры «Железнодорожников»,  Сбербанк, школа-гимназия № 1, почта. </p><p>• Удобное расположение для железнодорожников. В шаговой доступности Вагонное депо, Локомотивное депо, Управление РЖД, ЖД-вокзал.</p>       

<p>   1 050 000&nbsp;руб.   </p>', '0', '0', '', '0', '0', '2');
INSERT INTO `eboard_db`(`id`, `ip`, `uid`, `cat`, `region`, `date_add`, `date_del`, `user_id`, `status`, `sendmail`, `approved`, `sort`, `email`, `user`, `title`, `text`, `marked`, `raised`, `date_raised`, `block`, `active`, `counter`) VALUES ('36', '95.215.45.75', '1f32996e16ad0162e5edf42a0e2fe082', '761', '120', '1517840640', '1520432640', '', '1', '1', '1', '10000000', 'i@board.ural56.ru', 'Ольга', 'Продам квартиру     
2-к квартира  60 м²  на 1 этаже  3-этажного кирпичного дома', '<p>Квартиры </p>
  <p>Продам двухкомнатную квартиру 59,9 кв.м. первый этаж. Квартира в хорошем состоянии, высокие потолки,комнаты большие, раздельные, в сухом чистом подвале имеется кладовая, закрывается на замок. Дом \"Сталинский\", капитальный, в подъезде 8 квартир, очень хорошие соседи. Рядом первая школа. Один собственник. Цена 1 950 000  руб. Торг в пределах разумного.</p>       

<p>   1 950 000&nbsp;руб.   </p>', '0', '0', '', '0', '0', '2');
INSERT INTO `eboard_db`(`id`, `ip`, `uid`, `cat`, `region`, `date_add`, `date_del`, `user_id`, `status`, `sendmail`, `approved`, `sort`, `email`, `user`, `title`, `text`, `marked`, `raised`, `date_raised`, `block`, `active`, `counter`) VALUES ('37', '95.215.45.75', '01c3543ea304fafaa3edc5f1883d8950', '761', '120', '1517834340', '1520426340', '', '1', '1', '1', '10000000', 'i@board.ural56.ru', 'Горбачева Наталья', 'Продам квартиру     
2-к квартира  43 м²  на 2 этаже  3-этажного кирпичного дома', '<p>Квартиры </p>
  <p>Продам 2х комн квартиру старого типа с раздельными комнатами . Высота потолков 2,75см! Квартира готова для продажи!</p>       

<p>   945 000&nbsp;руб.   </p>', '0', '0', '', '0', '0', '3');
INSERT INTO `eboard_db`(`id`, `ip`, `uid`, `cat`, `region`, `date_add`, `date_del`, `user_id`, `status`, `sendmail`, `approved`, `sort`, `email`, `user`, `title`, `text`, `marked`, `raised`, `date_raised`, `block`, `active`, `counter`) VALUES ('38', '95.215.45.75', 'c24e86855e0bc05d449247e0f22363f1', '761', '120', '1517833980', '1520425980', '', '1', '1', '1', '10000000', 'i@board.ural56.ru', 'Падалко Мария', 'Продам квартиру     
2-к квартира  43 м²  на 2 этаже  5-этажного панельного дома', '<p>Квартиры </p>
  <p>Продам 2 ком.кв.с раздельными комнатами.Хороший ремонт,застекленный балкон.Во дворе хорошая детская площадка,школа,дет.сад,магазины и остановка в шаговой доступности.</p>       

<p>   1 200 000&nbsp;руб.   </p>', '0', '0', '', '0', '0', '2');
INSERT INTO `eboard_db`(`id`, `ip`, `uid`, `cat`, `region`, `date_add`, `date_del`, `user_id`, `status`, `sendmail`, `approved`, `sort`, `email`, `user`, `title`, `text`, `marked`, `raised`, `date_raised`, `block`, `active`, `counter`) VALUES ('39', '95.215.45.75', '251edb7e1f4248b18a21ce08f27086dd', '761', '120', '1517833680', '1520425680', '', '1', '1', '1', '10000000', 'i@board.ural56.ru', 'Дмитрий Самсонов', 'Продам квартиру     
2-к квартира  50.8 м²  на 7 этаже  9-этажного панельного дома', '<p>Квартиры </p>
  <p>Продам двух комнатную квартиру, в экологически чистом районе города .<br />Всё в шаговой доступности , магазин во дворе , до остановки три минуты ходьбы . До школы 5 минут ходьбы . Садик во дворе . Торг .</p>       

<p>   1 050 000&nbsp;руб.   </p>', '0', '0', '', '0', '0', '4');
INSERT INTO `eboard_db`(`id`, `ip`, `uid`, `cat`, `region`, `date_add`, `date_del`, `user_id`, `status`, `sendmail`, `approved`, `sort`, `email`, `user`, `title`, `text`, `marked`, `raised`, `date_raised`, `block`, `active`, `counter`) VALUES ('40', '95.215.45.75', 'f2fb2c18fac459bd47875a4b594061bd', '761', '120', '1517833380', '1520425380', '', '1', '1', '1', '10000000', 'i@board.ural56.ru', 'Маркина Ирина', 'Продам квартиру     
2-к квартира  43 м²  на 2 этаже  9-этажного панельного дома', '<p>Квартиры </p>
  <p>Продается отличная двухкомнатная квартира, с ремонтом! </p><p>• Квартира расположена на 2-м этаже 9-ти этажного панельного дома, по улице Пацаева 15. </p><p>• Общая площадь квартиры 43 кв.м. </p><p>• Очень светлая солнечная квартира, а в зимнее время очень теплая. </p><p>• Раздельные комнаты обеспечат спокойный и приятный отдых после рабочего дня. </p><p>• Шикарная кухня с качественным, современным кухонным гарнитуром оценит любая хозяйка. <br />Красивая и просторная ванная комната. в которой приятно принимать водные процедуры. <br />Огромную лоджия с качественными стеклопакетами можно оборудовать под полноценную <br />комнату. <br />• Дом находится в районе с развитой инфраструктурой! </p><p>• Отличная транспортная развязка. </p><p>• В шаговой доступности детский сад, школа, супермаркет, остановка. </p><p>В подарок новым жильцам : кондиционер, Мягкая мебель,  кресло кровать,. кухонный гарнитур и зеркальный шкаф в прихожей.</p>       

<p>   1 400 000&nbsp;руб.   </p>', '0', '0', '', '0', '0', '3');
INSERT INTO `eboard_db`(`id`, `ip`, `uid`, `cat`, `region`, `date_add`, `date_del`, `user_id`, `status`, `sendmail`, `approved`, `sort`, `email`, `user`, `title`, `text`, `marked`, `raised`, `date_raised`, `block`, `active`, `counter`) VALUES ('41', '95.215.45.75', '7b479994352b66ac66144624e237f0be', '761', '120', '1517833320', '1520425320', '', '1', '1', '1', '10000000', 'i@board.ural56.ru', 'Ирина', 'Продам квартиру     
2-к квартира  50.6 м²  на 6 этаже  9-этажного панельного дома', '<p>Квартиры </p>
  <p>Продам 2-к кв. полностью с мебелью для комфортного проживания. Качественный дорогой ремонт освободит нового хозяина от дополнительных вложений после переезда . Все комнаты изолированные Уютная спальня. раздельный санузел и дорогая сантехника. Большой коридор . Чистый подъезд и хорошие соседи.</p>       

<p>   1 650 000&nbsp;руб.   </p>', '0', '0', '', '0', '0', '1');
INSERT INTO `eboard_db`(`id`, `ip`, `uid`, `cat`, `region`, `date_add`, `date_del`, `user_id`, `status`, `sendmail`, `approved`, `sort`, `email`, `user`, `title`, `text`, `marked`, `raised`, `date_raised`, `block`, `active`, `counter`) VALUES ('42', '95.215.45.75', 'c2e03ac14d12ca5b886a430c826d692a', '762', '120', '1518092400', '1520684400', '', '1', '1', '1', '10000000', 'i@board.ural56.ru', 'Димона, агентство недвижимости', 'Продам квартиру     
3-к квартира  60.7 м²  на 4 этаже  5-этажного панельного дома', '<p>Квартиры </p>
  <p>Продается отличная трехкомнатная квартира, с ремонтом! <br /><br /> • Квартира расположена на 4-м этаже 5-ти этажного панельного дома, по улице Шалина, 7а. 4 этаж позволит насладиться всей красотой нашего города, без лишней пыли и шума!!!<br /><br /> • Общая площадь квартиры 60,7 кв.м.<br /><br /> • Множество полезного пространства квартиры – есть где разгуляться вашей фантазии.<br /><br /> • Очень светлая солнечная квартира, позволит начинать день с хорошего настроения!!! <br /><br /> • Раздельные комнаты квартиры обеспечат спокойный и приятный отдых после рабочего дня.<br /><br /> • Шикарная кухня с качественным, современным кухонным гарнитуром и столовой зоной, который оценит любая хозяйка!<br /><br /> • Раздельный санузел – удобства без очередей. Новая сантехника, наличие счетчиков существенно сэкономят ваши средства и нервы при покупке данной квартиры. <br /><br /> • Дом находится в районе с развитой инфраструктурой!<br /><br /> • Отличная транспортная развязка.<br /><br /> • В шаговой доступности детский сад, школа, супермаркет, остановка.<br /><br /> • Если вы обожаете индивидуальность и цените качество своей жизни - усильте ее покупкой этой квартиры!</p>       

<p>   1 400 000&nbsp;руб.   </p>', '0', '0', '', '1', '0', '15');
INSERT INTO `eboard_db`(`id`, `ip`, `uid`, `cat`, `region`, `date_add`, `date_del`, `user_id`, `status`, `sendmail`, `approved`, `sort`, `email`, `user`, `title`, `text`, `marked`, `raised`, `date_raised`, `block`, `active`, `counter`) VALUES ('43', '95.215.45.75', 'f7cc9e938376c6db38f89b0febcb48cc', '762', '120', '1518092340', '1520684340', '', '1', '1', '1', '10000000', 'i@board.ural56.ru', 'Димона, агентство недвижимости', 'Продам квартиру     
3-к квартира  60.3 м²  на 5 этаже  5-этажного кирпичного дома', '<p>Квартиры </p>
  <p>Отличный вариант 4-комнатной квартиры по привлекательной цене! <br />Квартира находится по адресу: переулок Нежинский, 13 на 5 этаже 5 этажного кирпичного дома. <br />Общая площадь квартиры – 60 кв.м., жилая площадь – 46 кв.м., кухня – 5 кв.м. <br />• Квартира готова к ремонту по вашему вкусу; <br />• Имеется балкон (это всегда имеет значение для практичных хозяев) <br />• Раздельный санузел - огромный плюс для большой семьи <br />• Просторный зал; <br />• Хорошая транспортная доступность на все виды общественного городского транспорта; <br />• Все необходимые магазины в шаговой доступности; <br />Семье с детьми будет интересно наличие детских садов и школ. Все это находится рядом с домом.</p>       

<p>   750 000&nbsp;руб.   </p>', '0', '0', '', '0', '0', '8');
INSERT INTO `eboard_db`(`id`, `ip`, `uid`, `cat`, `region`, `date_add`, `date_del`, `user_id`, `status`, `sendmail`, `approved`, `sort`, `email`, `user`, `title`, `text`, `marked`, `raised`, `date_raised`, `block`, `active`, `counter`) VALUES ('44', '95.215.45.75', 'ccaa72b76692e411f805993b560c38f3', '762', '120', '1518092220', '1520684220', '', '1', '1', '1', '10000000', 'i@board.ural56.ru', 'Димона, агентство недвижимости', 'Продам квартиру     
3-к квартира  70.6 м²  на 1 этаже  3-этажного блочного дома', '<p>Квартиры </p>
  <p>3 комнатная квартира за Материнский капитал!</p> <p>Квартира находится по адресу: ул. Достоевского, 14 на 1 этаже 3 этажного блочного дома.</p> <p>Общая площадь квартиры - 70,6 кв.м., жилая площадь – 47 кв.м., кухня – 8,2 кв.м.</p> <p>• Квартира без ремонта</p> <p>• 3 отдельные комнаты;</p> <p>• Раздельный санузел;</p> <p>• Тихий зеленый двор, доброжелательные соседи;</p> <p>• Дом уютно расположен, нет шума и газов от дорог;</p> <p>• Хорошая транспортная доступность; </p> <p>• В шаговой доступности Поликлиника, магазины, остановка общественного транспорта</p> <p>Семье с детьми будет интересно наличие детских садов,школы. Все это находится рядом с домом.</p> <p>Подходит под материнский капитал, ипотеку и все виды жилищных сертификатов.</p>       

<p>   480 000&nbsp;руб.   </p>', '0', '0', '', '0', '0', '9');
INSERT INTO `eboard_db`(`id`, `ip`, `uid`, `cat`, `region`, `date_add`, `date_del`, `user_id`, `status`, `sendmail`, `approved`, `sort`, `email`, `user`, `title`, `text`, `marked`, `raised`, `date_raised`, `block`, `active`, `counter`) VALUES ('45', '95.215.45.75', '46a018f8949023eec101439cef781ea3', '762', '120', '1518028800', '1520620800', '', '1', '1', '1', '10000000', 'i@board.ural56.ru', 'Юлия', 'Продам квартиру     
3-к квартира  63 м²  на 6 этаже  9-этажного панельного дома', '<p>Квартиры </p>
  <p>Продам трёхкомнатную квартиру в 6 микрорайоне, рядом школа ,садик , остановка, ЖД больница. Остаётся кухонный гарнитур.<br />Торг уместен.</p>       

<p>   1 600 000&nbsp;руб.   </p>', '0', '0', '', '0', '0', '3');
INSERT INTO `eboard_db`(`id`, `ip`, `uid`, `cat`, `region`, `date_add`, `date_del`, `user_id`, `status`, `sendmail`, `approved`, `sort`, `email`, `user`, `title`, `text`, `marked`, `raised`, `date_raised`, `block`, `active`, `counter`) VALUES ('46', '95.215.45.75', '974e8334843fd542aa3b1d6c83adeadb', '762', '120', '1518028740', '1520620740', '', '1', '1', '1', '10000000', 'i@board.ural56.ru', 'Юлия', 'Продам квартиру     
3-к квартира  57.7 м²  на 1 этаже  5-этажного панельного дома', '<p>Квартиры </p>
  <p>Продаётся трёхкомнатная квартира по улице Домбаровская 30 в районе ЖД. Вокзала.<br />Район с развитой инфраструктурой, д/сад находится рядом с домом, школа, рынок, магазины, в пяти минутах ходьбы.<br />В квартире  хороший качественный ремонт, пристроенная лоджия 4,5 кв.м. с приведенным отоплением, перепланировка  официально узаконена.<br />В квартире при продаже останется: <br />_ кухонный гарнитур <br />_ шкаф на лоджии.<br />От собственника.<br />Торг уместен.</p>       

<p>   1 850 000&nbsp;руб.   </p>', '0', '0', '', '0', '0', '5');
INSERT INTO `eboard_db`(`id`, `ip`, `uid`, `cat`, `region`, `date_add`, `date_del`, `user_id`, `status`, `sendmail`, `approved`, `sort`, `email`, `user`, `title`, `text`, `marked`, `raised`, `date_raised`, `block`, `active`, `counter`) VALUES ('47', '95.215.45.75', '19bbe76e0be5a56d71997f5fd282bddf', '762', '120', '1518010620', '1520602620', '', '1', '1', '1', '10000000', 'i@board.ural56.ru', 'Деменьтева Марина', 'Продам квартиру     
3-к квартира  104 м²  на 1 этаже  3-этажного кирпичного дома', '<p>Квартиры </p>
  <p>Продам 3к.кв. \"старого типа\" в центре города, в р-не 1 школы для большой дружной семьи. В квартире выполнен капитальный ремонт- замена пола, установлены кирпичные перегородки,проведена медная проводка, деревянные стеклопакеты,мраморные подоконники.Комнаты раздельные, большая кухня. Остается кухонный гарнитур. Уютный зеленый двор с детской площадкой. Стоимость снижена на 100 000!!!!</p>       

<p>   3 050 000&nbsp;руб.   </p>', '0', '0', '', '0', '0', '4');
INSERT INTO `eboard_db`(`id`, `ip`, `uid`, `cat`, `region`, `date_add`, `date_del`, `user_id`, `status`, `sendmail`, `approved`, `sort`, `email`, `user`, `title`, `text`, `marked`, `raised`, `date_raised`, `block`, `active`, `counter`) VALUES ('48', '95.215.45.75', 'e04c2a86097ff4d621e70bfda691a45b', '762', '120', '1518010620', '1520602620', '', '1', '1', '1', '10000000', 'i@board.ural56.ru', 'Деменьтева Марина', 'Продам квартиру     
3-к квартира  65 м²  на 3 этаже  4-этажного блочного дома', '<p>Квартиры </p>
  <p>Продам 3к.кв.в самом центре города, пр.Ленина 46 (краеведческий музей) ост.ДК \"НЕФТЕХИМИКОВ\". Окна в квартире выходят во двор, что позволит комфортно проживать в тишине от городской суеты. В квартире произведен современный капитальный ремонт. Квартира продается с мебелью и техникой!</p>       

<p>   2 800 000&nbsp;руб.   </p>', '0', '0', '', '0', '0', '8');
INSERT INTO `eboard_db`(`id`, `ip`, `uid`, `cat`, `region`, `date_add`, `date_del`, `user_id`, `status`, `sendmail`, `approved`, `sort`, `email`, `user`, `title`, `text`, `marked`, `raised`, `date_raised`, `block`, `active`, `counter`) VALUES ('49', '95.215.45.75', 'c92d4e10b0d79b975e6e4535843551c5', '762', '120', '1517996280', '1520588280', '', '1', '1', '1', '10000000', 'i@board.ural56.ru', 'Димона, агентство недвижимости', 'Продам квартиру     
3-к квартира  62 м²  на 7 этаже  9-этажного панельного дома', '<p>Квартиры </p>
  <p>Продается 3-комнатная квартира в самом тихом районе города!</p> <p>Квартира находится по адресу: ул. Беляева 2а на 7 этаже 9-ти этажного панельного дома. </p> <p>Общая площадь квартиры - 62 м2, жилая площадь – 38 м2, кухня – 8 м2 </p> <p>- Уютная, теплая и светлая квартира с отличным ремонтом (пластиковые окна, стены, потолки, полы выровнены, на полу - кафель в коридоре и кухне, ламинат в комнатах, установлены счетчики на воду); </p> <p>- Не требуется дополнительных вложений в квартиру, заходи и живи;</p> <p>- Квартира удобной планировки; </p> <p>- Просторный коридор; </p> <p>- Лоджия застеклена;</p> <p>- Санузел раздельный, в современном кафеле и хорошей сантехникой; </p> <p>- Просторная кухня, в которой приятно готовить. </p> <p>Всё делалось для себя с любовью и заботой. Вам и Вашей семье будет комфортно жить в этой квартире!</p> <p>- Чистый подъезд;</p> <p>- Тихий двор с детской площадкой, доброжелательные соседи;</p> <p>- Хорошая транспортная доступность.</p> <p>Семье с детьми будет интересно наличие детскиго сада № 121, школы № 38. Магазины в шаговой доступности. Чистая продажа.</p>       

<p>   1 850 000&nbsp;руб.   </p>', '0', '0', '', '0', '0', '4');
INSERT INTO `eboard_db`(`id`, `ip`, `uid`, `cat`, `region`, `date_add`, `date_del`, `user_id`, `status`, `sendmail`, `approved`, `sort`, `email`, `user`, `title`, `text`, `marked`, `raised`, `date_raised`, `block`, `active`, `counter`) VALUES ('50', '95.215.45.75', '5d7a7592683ae2abe815e767de270039', '762', '120', '1517918280', '1520510280', '', '1', '1', '1', '10000000', 'i@board.ural56.ru', 'Валентина', 'Продам квартиру     
3-к квартира  60 м²  на 2 этаже  5-этажного кирпичного дома', '<p>Квартиры </p>
  <p>Продаётся 3-х комн. Квартира. Огородная 29. <br />Дом из кирпича, улучшенная планировка, 2 этаж. Общая площадь 60м2. Комнаты большие и раздельные. С/у раздельной.  Большая лоджия.<br />С реальным покупателем торг.</p>       

<p>   1 250 000&nbsp;руб.   </p>', '0', '0', '', '0', '0', '6');
INSERT INTO `eboard_db`(`id`, `ip`, `uid`, `cat`, `region`, `date_add`, `date_del`, `user_id`, `status`, `sendmail`, `approved`, `sort`, `email`, `user`, `title`, `text`, `marked`, `raised`, `date_raised`, `block`, `active`, `counter`) VALUES ('51', '95.215.45.75', '92258b5eadb5554b1ca11990551052c0', '762', '120', '1517911500', '1520503500', '', '1', '1', '1', '10000000', 'i@board.ural56.ru', 'Борисова Евгения', 'Продам квартиру     
3-к квартира  61 м²  на 1 этаже  5-этажного панельного дома', '<p>Квартиры </p>
  <p>Продам 3 комнатную квартиру , на уровне 2 этажа( по документам 1 этаж), без балкона, все комнаты раздельные, окна пластиковые, новые двери. На 1 этаже детский клуб. Рассмотрю ипотеку и материнский капитал. Документы готовы, собственник 1.</p>       

<p>   1 330 000&nbsp;руб.   </p>', '0', '0', '', '0', '0', '2');
INSERT INTO `eboard_db`(`id`, `ip`, `uid`, `cat`, `region`, `date_add`, `date_del`, `user_id`, `status`, `sendmail`, `approved`, `sort`, `email`, `user`, `title`, `text`, `marked`, `raised`, `date_raised`, `block`, `active`, `counter`) VALUES ('52', '95.215.45.75', '3fd68aa9e2c4e1a9867fa92548bc7c6d', '762', '120', '1517911080', '1520503080', '', '1', '1', '1', '10000000', 'i@board.ural56.ru', 'Холомова Анастасия', 'Продам квартиру     
3-к квартира  63 м²  на 7 этаже  9-этажного панельного дома', '<p>Квартиры </p>
  <p>Продам шикарную трехкомнатную квартиру. В квартире сделан евроремонт (пластиковые окна, дорогие обои, ламинат,). Санузел раздельный выложен кафелем. Все комнаты раздельные, светлые и солнечные. Трубы пластик , счетчики на воду. Большая прихожая. Удобная большая кухня, остается кухонный гарнитур. Тихий двор с новой детской площадкой. Две минуты ходьбы до детского сада, почты, магазинов , сбербанка и остановки.</p>       

<p>   1 750 000&nbsp;руб.   </p>', '0', '0', '', '0', '0', '2');
INSERT INTO `eboard_db`(`id`, `ip`, `uid`, `cat`, `region`, `date_add`, `date_del`, `user_id`, `status`, `sendmail`, `approved`, `sort`, `email`, `user`, `title`, `text`, `marked`, `raised`, `date_raised`, `block`, `active`, `counter`) VALUES ('53', '95.215.45.75', '38f54abe5a62b44c48784c32c573468c', '762', '120', '1517901720', '1520493720', '', '1', '1', '1', '10000000', 'i@board.ural56.ru', 'Димона, агентство недвижимости', 'Продам квартиру     
3-к квартира  57.8 м²  на 8 этаже  9-этажного кирпичного дома', '<p>Квартиры </p>
  <p>Вам нужна квартира, в которую не надо вкладывать деньги на ремонт, заходи и живи?! Заканчивайте свои поиски, для Вас есть отличный вариант 3 комн. квартиры! <br /> Прекрасное местоположение, удобная транспортная развязка, магазины, детский сад во дворе, торговые центры - в шаговой доступности! <br /> Квартира находится по адресу: пр. Ленина, 105 на 8 этаже 9 этажного кирпичного дома. <br /> Квартира обладает рядом преимуществ: <br /> · У вас всегда будет солнечно! Окна комнат выходят на 2 стороны. <br /> · В квартире общей площадью 58 кв.м. будет достаточно места каждому члену вашей семьи. <br /> · Просторная кухня – 7,2 кв.м. позволит наслаждаться трапезой всей семье. Да и готовить на ней - одно удовольствие. <br /> · В квартире сделан качественный ремонт: ровные стены, линолеум, пластиковые окна, плитка на кухне и кафель в ванной комнате сэкономят ваши финансовые средства при покупке данной квартиры.<br /> · Наличие раздельного и очень просторного санузла привносит дополнительные удобства по утрам без очередей, стрессов и суматохи. <br /> · Неоспоримым преимуществом является 8 этаж, на который вас поднимет чистый лифт. <br /> · Имеется застекленный балкон, выходящий во двор, где вы можете наблюдать за прогулкой Ваших детей. Так же во дворе имеется достаточное количество парковочных мест, где Вы можете парковать свой автомобиль прямо под окнами Вашей квартиры. <br /> · Кухонный гарнитур и бытовая техника остается в подарок новым жильцам.<br /> · Во дворе современная детская площадка. <br /> · В непосредственной близости от дома (1 минута ходьбы) – остановка, продуктовые мини-маркеты, аптека. Вам не придется тратить много времени на решение семейных вопросов, вопросов о здоровье и о развитии детей. <br /> Все документы готовы – можно оформить сделку в кратчайшие сроки!<br /> Фотографии вряд ли могут передать все преимущества и уют этой замечательной квартиры. Приходите и убедитесь в этом сами!</p>       

<p>   1 800 000&nbsp;руб.   </p>', '0', '0', '', '0', '0', '2');
INSERT INTO `eboard_db`(`id`, `ip`, `uid`, `cat`, `region`, `date_add`, `date_del`, `user_id`, `status`, `sendmail`, `approved`, `sort`, `email`, `user`, `title`, `text`, `marked`, `raised`, `date_raised`, `block`, `active`, `counter`) VALUES ('54', '95.215.45.75', '186ab137d6cfc34d311eed318056c765', '762', '120', '1517849340', '1520441340', '', '1', '1', '1', '10000000', 'i@board.ural56.ru', 'Артур', 'Продам квартиру     
3-к квартира  78 м²  на 4 этаже  4-этажного кирпичного дома', '<p>Квартиры </p>
  <p>Продам квартиру. Дом старого типа.</p>       

<p>   2 850 000&nbsp;руб.   </p>', '0', '0', '', '0', '0', '3');
INSERT INTO `eboard_db`(`id`, `ip`, `uid`, `cat`, `region`, `date_add`, `date_del`, `user_id`, `status`, `sendmail`, `approved`, `sort`, `email`, `user`, `title`, `text`, `marked`, `raised`, `date_raised`, `block`, `active`, `counter`) VALUES ('55', '95.215.45.75', '8bbbf4de75fd02a36d399e2f4174b19c', '762', '120', '1517834820', '1520426820', '', '1', '1', '1', '10000000', 'i@board.ural56.ru', 'Горбачева Наталья', 'Продам квартиру     
3-к квартира  90 м²  на 2 этаже  3-этажного блочного дома', '<p>Квартиры </p>
  <p>Продам 3х комн квартиру \"сталинка\" на втором этаже трехэтажного дома (с железобетонными перекрытиями). В квартире сделан капитальный ремонт, все комнаты очень просторные. Квартира готова для продажи!</p>       

<p>   2 850 000&nbsp;руб.   </p>', '0', '0', '', '0', '0', '3');
INSERT INTO `eboard_db`(`id`, `ip`, `uid`, `cat`, `region`, `date_add`, `date_del`, `user_id`, `status`, `sendmail`, `approved`, `sort`, `email`, `user`, `title`, `text`, `marked`, `raised`, `date_raised`, `block`, `active`, `counter`) VALUES ('56', '95.215.45.75', '116972fe4d9fe6e13c4770c5e9f3c979', '762', '120', '1517788020', '1520380020', '', '1', '1', '1', '10000000', 'i@board.ural56.ru', 'Анастасия', 'Продам квартиру     
3-к квартира  66 м²  на 1 этаже  9-этажного кирпичного дома', '<p>Квартиры </p>
  <p>Продам уютную 3-х комнатную квартиру в новом кирпичном доме по проспекту Ленина 126.Раздельный сан узел,раздельные комнаты.Установлены счетчики на воду и газ.Пластиковые окна,большая лоджия.В шаговой доступности дет.сад,школа,магазины,транспортная остановка.в собственности более 5 лет,подойдёт под ипотеку!</p>       

<p>   1 900 000&nbsp;руб.   </p>', '0', '0', '', '0', '0', '2');
INSERT INTO `eboard_db`(`id`, `ip`, `uid`, `cat`, `region`, `date_add`, `date_del`, `user_id`, `status`, `sendmail`, `approved`, `sort`, `email`, `user`, `title`, `text`, `marked`, `raised`, `date_raised`, `block`, `active`, `counter`) VALUES ('57', '95.215.45.75', '7a0622e33a283a4c536b5b9a1a99c388', '762', '120', '1517770260', '1520362260', '', '1', '1', '1', '10000000', 'i@board.ural56.ru', 'Александр', 'Продам квартиру     
3-к квартира  69 м²  на 2 этаже  2-этажного кирпичного дома', '<p>Квартиры </p>
  <p>Продается отличная 3 комн кв старого типа в р-не ст Орск,большие комнаты, высокий потолок ,в кв сделан ремонт, во дворе сарай с погребом ,  в стоимость кв.  Дом с бетонными перекрытиями, квартира теплая, вода постоянно. Закрытый двор, спокойные соседи, рядом рынок, магазины, поликлиника, школа, детский сад. Документы готовы. Торг уместен.</p>       

<p>   1 400 000&nbsp;руб.   </p>', '0', '0', '', '0', '0', '2');
INSERT INTO `eboard_db`(`id`, `ip`, `uid`, `cat`, `region`, `date_add`, `date_del`, `user_id`, `status`, `sendmail`, `approved`, `sort`, `email`, `user`, `title`, `text`, `marked`, `raised`, `date_raised`, `block`, `active`, `counter`) VALUES ('58', '95.215.45.75', 'b46f4b93332626fa30a660c9a58a18dc', '762', '120', '1517659380', '1520251380', '', '1', '1', '1', '10000000', 'i@board.ural56.ru', 'Эльвира', 'Продам квартиру     
3-к квартира  48 м²  на 5 этаже  5-этажного панельного дома', '<p>Квартиры </p>
  <p>ОЗТП. 7-ой микр., 3-х комнатная, 48 кв.м. Срочная Продажа!<br />Все новое: ламинат, натяжной потолок, кафель, входная дверь итд. Раздельный санузел. Все чистое. Балкон застеклен. Пластиковые окна.<br />Совершенно все документы готовы, рассмотрим любой вид оплаты, мебель вывезли. Поможем с оформлением.</p>       

<p>   1 000 000&nbsp;руб.   </p>', '0', '0', '', '0', '0', '5');
INSERT INTO `eboard_db`(`id`, `ip`, `uid`, `cat`, `region`, `date_add`, `date_del`, `user_id`, `status`, `sendmail`, `approved`, `sort`, `email`, `user`, `title`, `text`, `marked`, `raised`, `date_raised`, `block`, `active`, `counter`) VALUES ('59', '95.215.45.75', 'e35abf3d92318ba07ca4aa429eef65c6', '762', '120', '1517657880', '1520249880', '', '1', '1', '1', '10000000', 'i@board.ural56.ru', 'Юлия', 'Продам квартиру     
3-к квартира  62 м²  на 1 этаже  5-этажного панельного дома', '<p>Квартиры </p>
  <p>Продам просторную 3-х комнатную квартиру с развитой инфраструктурой (школа, детский сад, магазины в шаговой доступности) в пос.Степной. Пластиковый водопровод, пластиковые окна, решетки. Реальному покупателю- хороший торг.</p>       

<p>   1 200 000&nbsp;руб.   </p>', '0', '0', '', '0', '0', '2');
INSERT INTO `eboard_db`(`id`, `ip`, `uid`, `cat`, `region`, `date_add`, `date_del`, `user_id`, `status`, `sendmail`, `approved`, `sort`, `email`, `user`, `title`, `text`, `marked`, `raised`, `date_raised`, `block`, `active`, `counter`) VALUES ('60', '95.215.45.75', 'd1e00d071dbc15ba905ff79654790f4f', '762', '120', '1517602500', '1520194500', '', '1', '1', '1', '10000000', 'i@board.ural56.ru', 'Алексей Блиферниц', 'Продам квартиру     
3-к квартира  78 м²  на 2 этаже  4-этажного кирпичного дома', '<p>Квартиры </p>
  <p>Продам квартиру в хорошем состоянии</p>       

<p>   2 500 000&nbsp;руб.   </p>', '0', '0', '', '0', '0', '4');
INSERT INTO `eboard_db`(`id`, `ip`, `uid`, `cat`, `region`, `date_add`, `date_del`, `user_id`, `status`, `sendmail`, `approved`, `sort`, `email`, `user`, `title`, `text`, `marked`, `raised`, `date_raised`, `block`, `active`, `counter`) VALUES ('61', '95.215.45.75', '6bf3b929c1c3861248f57d7b41356b12', '762', '120', '1517515500', '1520107500', '', '1', '1', '1', '10000000', 'i@board.ural56.ru', 'мария', 'Продам квартиру     
3-к квартира  42 м²  на 1 этаже  5-этажного кирпичного дома', '<p>Квартиры </p>
  <p>Продается 3-х комнатная квартира в г. Орске, 42 кв. метра на первом этаже пятиэтажного дома. Окна выходят на две улицы пр. Ленина и ул. Макаренко. Торг уместен</p>       

<p>   1 200 000&nbsp;руб.   </p>', '0', '0', '', '0', '0', '2');
INSERT INTO `eboard_db`(`id`, `ip`, `uid`, `cat`, `region`, `date_add`, `date_del`, `user_id`, `status`, `sendmail`, `approved`, `sort`, `email`, `user`, `title`, `text`, `marked`, `raised`, `date_raised`, `block`, `active`, `counter`) VALUES ('62', '95.215.45.75', '66d735a6070cdf3011d1ed75e3621105', '762', '120', '1517478600', '1520070600', '', '1', '1', '1', '10000000', 'i@board.ural56.ru', 'Димона, агентство недвижимости', 'Продам квартиру     
3-к квартира  74.6 м²  на 3 этаже  3-этажного кирпичного дома', '<p>Квартиры </p>
  <p>Вы мечтаете переехать в 3-комнатную квартиру. Тогда это горячее предложение для Вас! </p> <p>В экологически чистом районе г.Орска по адресу: пер. Бажова, 24 расположена отличная 3-х комнатная квартира на 3 этаже 3 этажного кирпичного дома.</p> <p>• В квартире общей площадью 74,6 кв.м. будет достаточно места каждому члену вашей семьи.</p> <p>• Окна квартиры выходят на две стороны дома. Вы всегда будете видеть во дворе своего играющего ребенка. </p> <p>• Просторная кухня – 10,2 кв.м. позволит наслаждаться трапезой всей семье. Да и готовить на ней - одно удовольствие.</p> <p>• 3 отдельные комнаты дают возможность каждому члену семьи заниматься любимым делом не мешая при этом остальным. Плюсом данной квартиры является утеплённый балкон.</p> <p>• Пластиковые окна оградят Вас от шума и пыли с улицы. </p> <p>• Санузел раздельный, новая сантехника, пластиковые трубы.</p> <p>• Вас будут окружать дружелюбные и приветливые соседи с множеством новых друзей для ваших детей.</p> <p>• близко к дому находятся детский сад №31, а если ваши дети учатся в школе, то рядом есть общеобразовательная школа №26. </p> <p>Подходит под материнский капитал, ипотеку и все виды жилищных сертификатов. Приезжайте на осмотр первыми. Добро пожаловать! </p>       

<p>   1 200 000&nbsp;руб.   </p>', '0', '0', '', '0', '0', '2');
INSERT INTO `eboard_db`(`id`, `ip`, `uid`, `cat`, `region`, `date_add`, `date_del`, `user_id`, `status`, `sendmail`, `approved`, `sort`, `email`, `user`, `title`, `text`, `marked`, `raised`, `date_raised`, `block`, `active`, `counter`) VALUES ('63', '95.215.45.75', '9f5395e82765591220ff438c6dd270f3', '762', '120', '1517406120', '1519998120', '', '1', '1', '1', '10000000', 'i@board.ural56.ru', 'Татьяна', 'Продам квартиру     
3-к квартира  91 м²  на 3 этаже  4-этажного кирпичного дома', '<p>Квартиры </p>
  <p>Продам 3-х комнатную квартиру ст. типа в центре города.<br />Ост. ДК Нефтянников. <br />3/4 этаж.(91 кв.м.)Евроремонт(использовались дорогие качественные ст. материалы),трехкамер. стеклопакет.Пол-ламинат.Телефон,каб. тел.,интернет.<br />Продажа в связи с переездом в другой город.<br />Покупателю кухонный гарнитур в подарок!<br />Цена:2 750 000 рублей.Без торга.<br />Собственник.</p>       

<p>   2 750 000&nbsp;руб.   </p>', '0', '0', '', '0', '0', '2');
INSERT INTO `eboard_db`(`id`, `ip`, `uid`, `cat`, `region`, `date_add`, `date_del`, `user_id`, `status`, `sendmail`, `approved`, `sort`, `email`, `user`, `title`, `text`, `marked`, `raised`, `date_raised`, `block`, `active`, `counter`) VALUES ('64', '95.215.45.75', 'ef86c4f6bbecfc19285725e7d536df87', '762', '120', '1517311440', '1519903440', '', '1', '1', '1', '10000000', 'i@board.ural56.ru', 'Диана', 'Продам квартиру     
3-к квартира  56 м²  на 3 этаже  5-этажного панельного дома', '<p>Квартиры </p>
  <p>Квартира на 3 этаже,не угловая.теплая.стоят пластиковые стеклопакеты,горячее водоснабжение центральное,колонки нет.домофон.кабельное телевидение,интернет.развитая инфраструктура(поликлиника,Аптека,магазины,детсад,школа).квартира не требует вложений.</p>       

<p>   990 000&nbsp;руб.   </p>', '0', '0', '', '0', '0', '2');
INSERT INTO `eboard_db`(`id`, `ip`, `uid`, `cat`, `region`, `date_add`, `date_del`, `user_id`, `status`, `sendmail`, `approved`, `sort`, `email`, `user`, `title`, `text`, `marked`, `raised`, `date_raised`, `block`, `active`, `counter`) VALUES ('65', '95.215.45.75', '719a2585853e1691bcd2233db727212c', '762', '120', '1517307960', '1519899960', '', '1', '1', '1', '10000000', 'i@board.ural56.ru', 'Димона, агентство недвижимости', 'Продам квартиру     
3-к квартира  57.8 м²  на 3 этаже  5-этажного панельного дома', '<p>Квартиры </p>
  <p>Продается замечательная 3-комнатная квартира, которая придется по вкусу каждому. </p> <p>По улице Вяземская, 36а расположена отличная 3-х комнатная квартира на 3 этаже 5-ти этажного панельного дома. </p> <p>• Отличный средний этаж; </p> <p>• В квартире 1 общая комната и 2 отдельные дают возможность каждому члену семьи заниматься любимым делом, не мешая при этом остальным. </p> <p>• Окна выходят в тихий дворик, а следовательно шум дорог не доставит Вам дискомфорта. </p> <p>• В квартире общей площадью 58 кв.м. будет достаточно места каждому члену вашей семьи. </p> <p>• Просторная кухня позволит наслаждаться трапезой всей семье. Да и готовить на ней - одно удовольствие. </p> <p>• Кухонный гарнитур и встроенная в него бытовая техника с вытяжкой остается в подарок новым жильцам.</p> <p>• Имеется балкон (это всегда имеет значение для практичных хозяев).</p> <p>• Совмещенный санузел, в котором поместится все.</p> <p>• Наличие счетчиков на воду, новые трубы и новые электросчетчики сократят ваши расходы.</p> <p>• Пластиковые окна защитят вашу квартиру от осенних непогод. </p> <p>• В шаговой доступности находятся продуктовые супермаркеты, школы и детские сады. </p> <p>• Очень удобная транспортная развязка. </p> <p>Семье с детьми будет интересно наличие детского сада и школы. Все это находится рядом с домом. </p> <p>Спешите принять решение и не упустите свой шанс! </p>       

<p>   1 450 000&nbsp;руб.   </p>', '0', '0', '', '0', '0', '2');
INSERT INTO `eboard_db`(`id`, `ip`, `uid`, `cat`, `region`, `date_add`, `date_del`, `user_id`, `status`, `sendmail`, `approved`, `sort`, `email`, `user`, `title`, `text`, `marked`, `raised`, `date_raised`, `block`, `active`, `counter`) VALUES ('66', '95.215.45.75', 'b4414e05b9082f234ec33bfbdeec3b18', '762', '120', '1517307900', '1519899900', '', '1', '1', '1', '10000000', 'i@board.ural56.ru', 'Димона, агентство недвижимости', 'Продам квартиру     
3-к квартира  59.8 м²  на 3 этаже  6-этажного кирпичного дома', '<p>Квартиры </p>
  <p>Вы мечтаете переехать в трехкомнатную квартиру? </p> <p>Продается отличная 3 комн. квартира по адресу: ул. Радостева 13, на 3 этаже 6-этажного кирпичного дома. </p> <p>В квартире общей площадью 59,8 кв.м. будет достаточно места каждому члену вашей семьи.</p> <p>Квартира обладает массой преимуществ: </p> <p>• Кирпичные стены помогают регулировать уровень влажности в доме, что способствует созданию внутри помещений комфортных условий для жизни.</p> <p>• 3 этаж - отличный средний этаж;</p> <p>• все комнаты изолированные, что позволяет членам вашей семьи иметь личное пространство; </p> <p>• квартира в хорошем состоянии: частичное пластиковое остекление и новые межкомнатные двери, установлена надежная металлическая дверь; </p> <p>• уютная кухня – 6,3 кв.м. позволит наслаждаться трапезой всей семье. Да и готовить на ней - одно удовольствие.</p> <p>• раздельный санузел, отделан современным кафелем - что создает дополнительные удобства; </p> <p>• подъезд чистый; </p> <p>• вас будут окружать приветливые соседи; </p> <p>• во дворе есть прекрасная детская площадка и много места для прогулок; </p> <p>• близко к дому находятся: детские сады, а если ваши дети учатся в школе, то рядом есть общеобразовательные школы; </p> <p>• прекрасное расположение дома позволяет быстро решить любые бытовые и хозяйственные вопросы, т.к. в шаговой доступности, супермаркеты, аптеки, банки.</p> <p>Эта замечательная квартира – Ваш шанс обеспечить своей семье удобство и комфорт! Не упустите этот шанс… Звоните немедленно!</p>       

<p>   1 100 000&nbsp;руб.   </p>', '0', '0', '', '0', '0', '2');
INSERT INTO `eboard_db`(`id`, `ip`, `uid`, `cat`, `region`, `date_add`, `date_del`, `user_id`, `status`, `sendmail`, `approved`, `sort`, `email`, `user`, `title`, `text`, `marked`, `raised`, `date_raised`, `block`, `active`, `counter`) VALUES ('67', '95.215.45.75', 'c30224da6a4bf9569765e010ac3bdcf9', '762', '120', '1517253240', '1519845240', '', '2', '1', '1', '10000000', 'i@board.ural56.ru', 'Нина Алексеевна', 'Продам квартиру  в новостройке     
3-к квартира  110 м²  на 3 этаже  5-этажного кирпичного дома', '<p>Квартиры </p>
  <p>Продам квартиру 110 м.кв. в новом доме по ул.Кутузова 17А. 4800000 руб.</p>       

<p>   4 800 000&nbsp;руб.   </p>', '0', '0', '', '0', '0', '2');
INSERT INTO `eboard_db`(`id`, `ip`, `uid`, `cat`, `region`, `date_add`, `date_del`, `user_id`, `status`, `sendmail`, `approved`, `sort`, `email`, `user`, `title`, `text`, `marked`, `raised`, `date_raised`, `block`, `active`, `counter`) VALUES ('68', '95.215.45.75', 'f24a10a39e1cb504a54d7ffc29ee0978', '762', '120', '1517252820', '1519844820', '', '2', '1', '1', '10000000', 'i@board.ural56.ru', 'Нина Алексеевна', 'Продам квартиру  в новостройке     
3-к квартира  120 м²  на 5 этаже  5-этажного кирпичного дома', '<p>Квартиры </p>
  <p>Продам квартиру 120 м.кв. в новом доме по ул.Кутузова 17А. 3500000 руб.</p>       

<p>   3 500 000&nbsp;руб.   </p>', '0', '0', '', '0', '0', '3');
INSERT INTO `eboard_db`(`id`, `ip`, `uid`, `cat`, `region`, `date_add`, `date_del`, `user_id`, `status`, `sendmail`, `approved`, `sort`, `email`, `user`, `title`, `text`, `marked`, `raised`, `date_raised`, `block`, `active`, `counter`) VALUES ('69', '95.215.45.75', '5d04dadd8336e84b14974469ac832e76', '762', '120', '1517220780', '1519812780', '', '2', '1', '1', '10000000', 'i@board.ural56.ru', 'Димона, агентство недвижимости', 'Продам квартиру     
3-к квартира  62 м²  на 5 этаже  5-этажного панельного дома', '<p>Квартиры </p>
  <p>Срочно продается 3-комнатная квартира в тихом и зеленом районе города!<br />Квартира в отличном состоянии находится по адресу: ул. Стасова 4 на 5-м этаже 5-ти этажного панельного дома.<br />Общая площадь квартиры - 62 кв.м. Жилая площадь – 45 кв.м.Кухня – 6 кв.м.<br />Качественный ремонт в квартире оградит нового хозяина от дополнительных вложений, потраченных сил и времени в предстоящий ремонт после переезда, т.к. вся черновая работа уже выполнена (пластиковые окна, новые трубы, металлическая входная дверь);<br />- Надежная металлическая дверь;<br />- Изолированные комнаты, просторные кухня и коридор;<br />- Раздельный санузел с новой сантехникой;<br />- Окна выходят во двор на детскую площадку;<br />- 2 балкона, выходящие на обе сторона дома;<br />- Замечательные соседи, чистый подъезд;<br />- Хорошая транспортная доступность на все виды общественного городского транспорта.<br />Прекрасное расположение дома позволяет быстро решить любые бытовые и хозяйственные вопросы.<br />Семье с детьми будет интересно наличие детских садов, школ, стадиона. Все это находится рядом с домом. Магазины в шаговой доступности.<br />Без обременений. Чистая продажа.</p>       

<p>   1 250 000&nbsp;руб.   </p>', '0', '0', '', '0', '0', '2');
INSERT INTO `eboard_db`(`id`, `ip`, `uid`, `cat`, `region`, `date_add`, `date_del`, `user_id`, `status`, `sendmail`, `approved`, `sort`, `email`, `user`, `title`, `text`, `marked`, `raised`, `date_raised`, `block`, `active`, `counter`) VALUES ('70', '95.215.45.75', 'c00620a78809d0ff1de6c51df41aceaa', '762', '120', '1517130060', '1519722060', '', '2', '1', '1', '10000000', 'i@board.ural56.ru', 'Александр', 'Продам квартиру     
3-к квартира  45 м²  на 3 этаже  5-этажного кирпичного дома', '<p>Квартиры </p>
  <p>Продаётся хорошая , уютная трёх комнатная квартира. В центре города всё в шаговой доступности!! Школы, дет. сады , магазины и остановка! Квартира без долгов и обременений один взрослый собственник!! Торг реальному покупателю!!!</p>       

<p>   1 250 000&nbsp;руб.   </p>', '0', '0', '', '0', '0', '2');
INSERT INTO `eboard_db`(`id`, `ip`, `uid`, `cat`, `region`, `date_add`, `date_del`, `user_id`, `status`, `sendmail`, `approved`, `sort`, `email`, `user`, `title`, `text`, `marked`, `raised`, `date_raised`, `block`, `active`, `counter`) VALUES ('71', '95.215.45.75', 'eafb4d46267a26501d08b0bece206426', '761', '120', '1518164880', '1520756880', '', '1', '1', '1', '10000000', 'i@board.ural56.ru', 'Димона, агентство недвижимости', 'Продам квартиру     
2-к квартира  44 м²  на 1 этаже  5-этажного панельного дома', '<p>Квартиры </p>
  <p>Вас не покидает мысль о небольшой, уютной и главное, СВОЕЙ двухкомнатной квартире? Заканчивайте свои поиски, для Вас есть отличный вариант! </p> <p>• Квартира находится по адресу: ул. Короленко 144а на 1-м этаже 5 – этажного панельного дома </p> <p>• Дом имеет высокий цоколь, поэтому даже на 1-ый этаж не является недостатком. </p> <p>• Квартира в которой возможно сделать ремонт по вашему личному вкусу, обеспечит спокойный и приятный отдых после рабочего дня и подарит хорошее настроение. </p> <p>• Общая площадь квартиры 44 кв.м., жилая 30,7 кв.м., кухня 6 кв.м. </p> <p>• Квартира имеет очень удобную планировку. Окна выходят на две стороны, благодаря чему квартира наполнена светом и очень быстро проветривается</p> <p>• Наличие раздельного санузла привносит дополнительные удобства, установлены приборы учета, новые трубы что сократит ваши расходы.</p> <p>• в непосредственной близости от дома ( 5 минуты ходьбы) – остановка, продуктовые магазины, аптека, детский сад, школа. Вам не придется тратить много времени на решение семейных вопросов, вопросов о здоровье и о развитии детей. </p> <p>• Все документы готовы – можно оформить сделку в краткие сроки.</p>       

<p>   850 000&nbsp;руб.   </p>', '0', '0', '', '0', '0', '16');
INSERT INTO `eboard_db`(`id`, `ip`, `uid`, `cat`, `region`, `date_add`, `date_del`, `user_id`, `status`, `sendmail`, `approved`, `sort`, `email`, `user`, `title`, `text`, `marked`, `raised`, `date_raised`, `block`, `active`, `counter`) VALUES ('72', '95.215.45.75', 'b891b8aabd066e884c4d8e7bd8591e48', '761', '120', '1518092280', '1520684280', '', '1', '1', '1', '10000000', 'i@board.ural56.ru', 'Димона, агентство недвижимости', 'Продам квартиру     
2-к квартира  43 м²  на 2 этаже  2-этажного кирпичного дома', '<p>Квартиры </p>
  <p>Продается уютная 2 комнатная квартира. Хорошая цена!</p> <p>Квартира находится по адресу: ул. Клубная, 8 (п. Крыловка) на 2 этаже 2 этажного кирпичного дома. </p> <p>Общая площадь квартиры – 43 кв.м., жилая – 27 кв.м., кухня – 6 кв.м. </p> <p>• Квартира теплая и светлая, готова к ремонту по вашему вкусу</p> <p>• Имеется балкон (это всегда имеет значение для практичных хозяев)</p> <p>• В санузле установлены приборы учета, новые трубы что сократит ваши расходы.</p> <p>• Индивидуальное отопление, что значительно помогает экономить на коммунальных платежах. </p> <p>• Прочные кирпичные стены дома сохраняют постоянное тепло в помещении. Надежная металлическая дверь</p> <p>• Развитая инфраструктура – школа, спортивная школа, детский сад, мед.пункт, продуктовые магазины и магазины бытовых нужд находятся в шаговой доступности</p> <p>• Всего 15 минут езды до города</p> <p>Подходит под материнский капитал, ипотеку и все виды жилищных сертификатов.</p> <p>Спешите принять решение в ближайшее время. Звоните сейчас! </p>       

<p>   400 000&nbsp;руб.   </p>', '1', '0', '', '1', '0', '15');
INSERT INTO `eboard_db`(`id`, `ip`, `uid`, `cat`, `region`, `date_add`, `date_del`, `user_id`, `status`, `sendmail`, `approved`, `sort`, `email`, `user`, `title`, `text`, `marked`, `raised`, `date_raised`, `block`, `active`, `counter`) VALUES ('73', '95.215.45.75', '4c15bb40ebac7574f057016c92541ca4', '761', '120', '1518092160', '1520684160', '', '1', '1', '1', '10000000', 'i@board.ural56.ru', 'Димона, агентство недвижимости', 'Продам квартиру     
2-к квартира  47 м²  на 4 этаже  5-этажного кирпичного дома', '<p>Квартиры </p>
  <p>Отличный вариант 2-комнатной квартиры в 5 минутах от Центра города по привлекательной цене! </p> <p>Квартира находится по адресу: ул. Короленко, 140а на 4-м этаже 5-ти этажного кирпичного дома. Дом с чердачным помещением, что позволит забыть о топающих соседях.</p> <p>Общая площадь квартиры - 47 кв.м., жилая площадь – 33,5 кв.м., кухня – 6 кв.м. </p> <p>• Квартира теплая и светлая, готова к ремонту по вашему вкусу; </p> <p>• Окна квартиры на две стороны (восток-запад); </p> <p>• Раздельный санузел; </p> <p>• Просторный зал с выходом на балкон; </p> <p>• Чистый подъезд и доброжелательные соседи; </p> <p>• Удобное расположение дома позволяет быстро решить хозяйственные и бытовые вопросы, т.к. все необходимые магазины находятся в шаговой доступности; </p> <p>• Хорошая транспортная доступность на все виды общественного городского транспорта. </p> <p>Семье с детьми будет интересно наличие детского сада и школы. Все это находится рядом с домом.</p>       

<p>   800 000&nbsp;руб.   </p>', '0', '0', '', '0', '0', '7');
INSERT INTO `eboard_db`(`id`, `ip`, `uid`, `cat`, `region`, `date_add`, `date_del`, `user_id`, `status`, `sendmail`, `approved`, `sort`, `email`, `user`, `title`, `text`, `marked`, `raised`, `date_raised`, `block`, `active`, `counter`) VALUES ('74', '95.215.45.75', '2d5e6183c3aa86a1ab7233c20a9f1591', '761', '120', '1518089280', '1520681280', '', '1', '1', '1', '10000000', 'i@board.ural56.ru', 'Андрей', 'Продам квартиру     
2-к квартира  44 м²  на 4 этаже  5-этажного панельного дома', '<p>Квартиры </p>
  <p>Продается 2-хкомнатная квартира современным ремонтом и мебелью!<br />Квартира находится по адресу: ул. Гомельская, 78 \"А\", на 4-м этаже 5-тиэтажного панельного дома.<br />- Не требует дополнительных вложений в квартиру - \"заходи и живи\"!!!;<br />- Во всей квартире современный ремонт с приятной цветовой гаммой;<br />- Санузел совмещен в современном кафеле и хорошей сантехникой;<br />- Установлена сплитсистема;<br />- Школа и дет. сад располагаются в радиусе 100 метров от дома;<br />- Отличная транспортная доступность;</p>       

<p>   1 300 000&nbsp;руб.   </p>', '1', '0', '', '0', '0', '9');
INSERT INTO `eboard_db`(`id`, `ip`, `uid`, `cat`, `region`, `date_add`, `date_del`, `user_id`, `status`, `sendmail`, `approved`, `sort`, `email`, `user`, `title`, `text`, `marked`, `raised`, `date_raised`, `block`, `active`, `counter`) VALUES ('75', '95.215.45.75', 'ccb2dc38416dc93207bf4f51fae3778a', '761', '120', '1518086400', '1520678400', '', '1', '1', '1', '10000000', 'i@board.ural56.ru', 'Максим', 'Продам квартиру     
2-к квартира  56 м²  на 2 этаже  4-этажного блочного дома', '<p>Квартиры </p>
  <p>Продается 2 комн. кв. старого типа, р-н рынка Авангард. В квартире сделан ремонт, электропроводка вся новая, трубы водоснабжения и водоотведения новые. Во всех комнатах сделаны натяжные потолки с точечными светильниками на пульте управления. <br />Квартира на втором этаже, очень теплая и светлая. Две большие комнаты (18 м2) по два окна в каждой.<br />По документам квартира чистая, не в ипотеке, дети не прописаны!</p>       

<p>   1 800 000&nbsp;руб.   </p>', '0', '0', '', '0', '0', '8');
INSERT INTO `eboard_db`(`id`, `ip`, `uid`, `cat`, `region`, `date_add`, `date_del`, `user_id`, `status`, `sendmail`, `approved`, `sort`, `email`, `user`, `title`, `text`, `marked`, `raised`, `date_raised`, `block`, `active`, `counter`) VALUES ('76', '95.215.45.75', '7195fb4a0f53c88e05a52bb12f72d23f', '761', '120', '1518027420', '1520619420', '', '1', '1', '1', '10000000', 'i@board.ural56.ru', 'лариса', 'Продам квартиру     
2-к квартира  51 м²  на 3 этаже  9-этажного панельного дома', '<p>Квартиры </p>
  <p>Хорошая квартира с новым ремонтом, все новое. В квартире все остается в связи с переездом. (СОБСТВЕННИК)</p>       

<p>   1 700 000&nbsp;руб.   </p>', '0', '0', '', '0', '0', '8');
INSERT INTO `eboard_db`(`id`, `ip`, `uid`, `cat`, `region`, `date_add`, `date_del`, `user_id`, `status`, `sendmail`, `approved`, `sort`, `email`, `user`, `title`, `text`, `marked`, `raised`, `date_raised`, `block`, `active`, `counter`) VALUES ('77', '95.215.45.75', '8e5a9101225660616d6b738107b51cec', '761', '120', '1518013860', '1520605860', '', '1', '1', '1', '10000000', 'i@board.ural56.ru', 'Димона, агентство недвижимости', 'Продам квартиру     
2-к квартира  44.6 м²  на 4 этаже  5-этажного панельного дома', '<p>Квартиры </p>
  <p>Продается просторная 2 комнатная квартира с современном ремонтом и мебелью! <br />Квартира находится по адресу: ул. Станиславского 91а на 4 этаже 5 этажного панельного дома. Общая площадь квартиры - 44,6 кв.м. Жилая площадь – 30,5 кв.м. Кухня – 6 кв.м. <br />- Не требуется дополнительных вложений в квартиру, заходи и живи; <br />- Во всей квартире современный ремонт с приятной цветовой гаммой, хорошая планировка;<br />- Окна квартиры выходят во двор, из зала выход на балкон; <br />- Санузел совмещен в современном в кафеле и хорошей сантехникой; <br />- Просторная кухня, в которой остаются функциональный современный кухонный гарнитур с варочной панелью и вытяжкой; <br />- Просторная гостиная совмещена с кухонной зоной, в гостинной остается кондиционер; <br />- Новые межкомнатные двери; <br />- Балкон застеклен пластиком, имеются встроенные шкафы; <br />- Большой двор с детской площадкой, достойные соседи; <br />- Хорошая транспортная доступность. <br />Семье с детьми будет интересно наличие детских садов, школ все это находится рядом с домом. Магазины, банки в шаговой доступности. <br />Спешите принять решение и не упустите свой шанс!</p>       

<p>   1 300 000&nbsp;руб.   </p>', '0', '0', '', '0', '0', '7');
INSERT INTO `eboard_db`(`id`, `ip`, `uid`, `cat`, `region`, `date_add`, `date_del`, `user_id`, `status`, `sendmail`, `approved`, `sort`, `email`, `user`, `title`, `text`, `marked`, `raised`, `date_raised`, `block`, `active`, `counter`) VALUES ('78', '95.215.45.75', 'dc83c44baab5769c6a6a7ed8ab5aa326', '761', '120', '1518011940', '1520603940', '', '1', '1', '1', '10000000', 'i@board.ural56.ru', 'Агентство недвижимости &quot;ТИТАН&quot;', 'Продам квартиру     
2-к квартира  44 м²  на 4 этаже  5-этажного панельного дома', '<p>Квартиры </p>
  <p>Продам 2 ком . квартиру от собственника в г.Орске по ул.Кутузова .В квартире установлены счетчики на газ и воду.Развитая инфраструктура. Рядом школа,детский сад,остановка, магазины.Торг уместен.</p>       

<p>   1 050 000&nbsp;руб.   </p>', '0', '0', '', '0', '0', '7');
INSERT INTO `eboard_db`(`id`, `ip`, `uid`, `cat`, `region`, `date_add`, `date_del`, `user_id`, `status`, `sendmail`, `approved`, `sort`, `email`, `user`, `title`, `text`, `marked`, `raised`, `date_raised`, `block`, `active`, `counter`) VALUES ('79', '95.215.45.75', '7e26a6989bc5603dd4bed2996724106f', '761', '120', '1518010140', '1520602140', '', '1', '1', '1', '10000000', 'i@board.ural56.ru', 'Вероника', 'Продам квартиру     
2-к квартира  43.7 м²  на 3 этаже  5-этажного панельного дома', '<p>Квартиры </p>
  <p>В связи с переездом в другой город, продам квартиру. Косметический ремонт есть. Рядом трамвайная остановка, школа, садик. магазины. Район тихий, очень хороший.</p>       

<p>   1 200 000&nbsp;руб.   </p>', '0', '0', '', '0', '0', '12');
INSERT INTO `eboard_db`(`id`, `ip`, `uid`, `cat`, `region`, `date_add`, `date_del`, `user_id`, `status`, `sendmail`, `approved`, `sort`, `email`, `user`, `title`, `text`, `marked`, `raised`, `date_raised`, `block`, `active`, `counter`) VALUES ('80', '95.215.45.75', '35e98987eb499fd9f76c911c50ca31d9', '761', '120', '1518005580', '1520597580', '', '1', '1', '1', '10000000', 'i@board.ural56.ru', 'Димона, агентство недвижимости', 'Продам квартиру     
2-к квартира  42 м²  на 2 этаже  3-этажного блочного дома', '<p>Квартиры </p>
  <p>Отличный вариант 2-комнатной квартиры в 5 минутах от Центра города по привлекательной цене! <br />Квартира находится по адресу: ул. Медногорская, 26 на 2 этаже 3 этажного блочного дома. <br />Общая площадь квартиры - 44 кв. м, жилая площадь – 28 кв. м, кухня – 6 кв.м. <br />• Квартира теплая и светлая, готова к ремонту по вашему вкусу; <br />• У вас всегда будет солнечно! <br />• В санузле установлены приборы учета, новые трубы что сократит ваши расходы. <br />• Балкон застеклен, это важно для практичных хозяев. <br />• Чистый подъезд и доброжелательные соседи. <br />• Удобное расположение дома позволяет быстро решить хозяйственные и бытовые вопросы, т.к. все необходимые магазины находятся в шаговой доступности. <br />• Хорошая транспортная доступность на все виды общественного городского транспорта. <br />Семье с детьми будет интересно наличие детского сада и школы. Все это находится рядом с домом. <br />Все документы в сборе, что позволит совершить сделку в самые кратчайшие сроки.</p>       

<p>   980 000&nbsp;руб.   </p>', '0', '0', '', '0', '0', '7');
INSERT INTO `eboard_db`(`id`, `ip`, `uid`, `cat`, `region`, `date_add`, `date_del`, `user_id`, `status`, `sendmail`, `approved`, `sort`, `email`, `user`, `title`, `text`, `marked`, `raised`, `date_raised`, `block`, `active`, `counter`) VALUES ('81', '95.215.45.75', 'bf0e3305cc5ab84a6c179c505fd1ce19', '761', '120', '1517991720', '1520583720', '', '1', '1', '1', '10000000', 'i@board.ural56.ru', 'Плотникова Мария', 'Продам квартиру     
2-к квартира  45 м²  на 3 этаже  5-этажного блочного дома', '<p>Квартиры </p>
  <p>Продам  двухкомнатную квартиру   распашонку. На  третьем этаже  пластиковые трубы  в зале натяжной потолок  на полу ламинат  ванная в кафеле  сан узел раздельный   балкон застеклен  рядом детская площадка  магазины  в двух шагах  школа №25</p>       

<p>   1 020 000&nbsp;руб.   </p>', '0', '0', '', '0', '0', '5');
INSERT INTO `eboard_db`(`id`, `ip`, `uid`, `cat`, `region`, `date_add`, `date_del`, `user_id`, `status`, `sendmail`, `approved`, `sort`, `email`, `user`, `title`, `text`, `marked`, `raised`, `date_raised`, `block`, `active`, `counter`) VALUES ('82', '95.215.45.75', 'b2feb29aa9873fe725ca603cccb1f0c0', '761', '120', '1517991720', '1520583720', '', '1', '1', '1', '10000000', 'i@board.ural56.ru', 'Плотникова Мария', 'Продам квартиру     
2-к квартира  45 м²  на 5 этаже  5-этажного блочного дома', '<p>Квартиры </p>
  <p>Продам  трех комнатную квартиру маломерку  ул. Новосибирская 40 А   В кв. поменина  проводка  на полу новый ленолеум  стены выровнены,потолки натяжные   балкон застеклен   куханый  гарниту  оставляет, ванна в кафеле.</p>       

<p>   950 000&nbsp;руб.   </p>', '0', '0', '', '0', '0', '6');
INSERT INTO `eboard_db`(`id`, `ip`, `uid`, `cat`, `region`, `date_add`, `date_del`, `user_id`, `status`, `sendmail`, `approved`, `sort`, `email`, `user`, `title`, `text`, `marked`, `raised`, `date_raised`, `block`, `active`, `counter`) VALUES ('83', '95.215.45.75', '1a81243e00712aecbe8b12ec864c243f', '761', '120', '1517991720', '1520583720', '', '1', '1', '1', '10000000', 'i@board.ural56.ru', 'Плотникова Мария', 'Продам квартиру     
2-к квартира  42 м²  на 5 этаже  5-этажного кирпичного дома', '<p>Квартиры </p>
  <p>Продам!! Двухкомнатную кв. 5/5 пр. Ленина дом 56 комнаты раздельные  пластиковые окна пластиковые трубы  рядам остановка  кино театр мир</p>       

<p>   810 000&nbsp;руб.   </p>', '0', '0', '', '0', '0', '3');
INSERT INTO `eboard_db`(`id`, `ip`, `uid`, `cat`, `region`, `date_add`, `date_del`, `user_id`, `status`, `sendmail`, `approved`, `sort`, `email`, `user`, `title`, `text`, `marked`, `raised`, `date_raised`, `block`, `active`, `counter`) VALUES ('84', '95.215.45.75', '9d5c0fadc75b5212e79dcdb5b80aa1e7', '761', '120', '1517991060', '1520583060', '', '1', '1', '1', '10000000', 'i@board.ural56.ru', 'Ольга', 'Продам квартиру     
2-к квартира  44.9 м²  на 2 этаже  5-этажного панельного дома', '<p>Квартиры </p>
  <p>2-Х.КОМН.КВ. .  ЦЕНТР. 2/5 ЭТАЖ.  ОСТ.МАГАЗИН \" ЛУЧ\" . РЕМОНТ, ПОЛЫ ЛАМИНАТ, В ВАННОЙ КОМНАТЕ КАФЕЛЬ, ОКНА ПЛАСТИК, БАЛКОН ЗАСТЕКЛЕН . КОНДИЦИОНЕР ! ОДИН СОБСТВЕННИК. БЕЗ ОБРЕМЕНЕНИЙ. ДОКУМЕНТЫ ГОТОВЫ К ПРОДАЖЕ! ЦЕНА 1350000 т. руб..</p>       

<p>   1 350 000&nbsp;руб.   </p>', '0', '0', '', '0', '0', '3');
INSERT INTO `eboard_db`(`id`, `ip`, `uid`, `cat`, `region`, `date_add`, `date_del`, `user_id`, `status`, `sendmail`, `approved`, `sort`, `email`, `user`, `title`, `text`, `marked`, `raised`, `date_raised`, `block`, `active`, `counter`) VALUES ('85', '95.215.45.75', '25dbda00bacb51ed4b0f78fcc85e2e85', '761', '120', '1517989080', '1520581080', '', '1', '1', '1', '10000000', 'i@board.ural56.ru', 'Димона, агентство недвижимости', 'Продам квартиру     
2-к квартира  40.2 м²  на 5 этаже  5-этажного кирпичного дома', '<p>Квартиры </p>
  <p>Продаётся отличная 2 комнатная квартира в кирпичном доме площадью 40 кв.м.</p> <p>Квартира находится по проспекту Ленина 75 (ост. Луч).</p> <p>- Квартира очень светлая, что обеспечит Вам комфортное проживание и всегда хорошее настроение </p> <p>- в квартире отличная звукоизоляция, широкие подоконники </p> <p>- просторные изолированные комнаты </p> <p>- балкон застеклен </p> <p>- раздельный санузел, с замененным водопроводом и приборами учета, что сэкономит средства при покупке данной квартиры</p> <p>- во всех комнатах качественные, непродуваемые стеклопакеты </p> <p>- хорошие соседи. </p> <p> </p> <p>Семье с детьми будет интересно наличие детского сада, среднеобразовательной школы №35 и №11. Все это находится рядом с домом.</p> <p>Магазины, торговые центры в шаговой доступности. </p> <p>Хорошая транспортная доступность в этом районе позволит без промедления быстро доехать в любую точку города всеми видами общественного городского транспорта.</p>       

<p>   890 000&nbsp;руб.   </p>', '0', '0', '', '0', '0', '3');
INSERT INTO `eboard_db`(`id`, `ip`, `uid`, `cat`, `region`, `date_add`, `date_del`, `user_id`, `status`, `sendmail`, `approved`, `sort`, `email`, `user`, `title`, `text`, `marked`, `raised`, `date_raised`, `block`, `active`, `counter`) VALUES ('86', '95.215.45.75', '54121c456f29054c6d5dac8103ff571e', '761', '120', '1517952420', '1520544420', '', '1', '1', '1', '10000000', 'i@board.ural56.ru', 'Виолетта Рифовна', 'Продам квартиру     
2-к квартира  43.7 м²  на 2 этаже  5-этажного панельного дома', '<p>Квартиры </p>
  <p>Продажа от собственника-без посредников и агентств! Продам долгую счастливую жизнь в замечательной двухкомнатной квартире в престижном районе!<br />Преимущества квартиры:<br />-самое \"сердце\" города - площадь Васнецова. Изображена на всех рекламных буклетах, посвящённых нашему городу<br />-евроремонт. Заезжай - живи и радуйся. Ибо теперь Ваша жизнь - полная чаша!<br />- самый удобный этаж! По всем опросам, именно второй этаж является наиболее удобным и даже престижным.<br />-замечательные душевные соседи - полны гостеприимства и щедрости. Они совсем не заметны, пока в этом нет необходимости. Но если Вы будете нуждаться в них - тут же проявят себя с самой лучшей человеческой стороны.<br />-дом находится в управлении одной из лучших УК города. Двор благоустроен, подъезд чистый и тёплый, хорошо освещён.<br />-вся цивилизация в шаговой доступности: остановка, магазины (Магнит, Пятерочка, Семья, Восход, К&Б, Желен, ОНОС и т.д.), кинотеатр, детская площадка, детская поликлиника, садик, школы (две), церковь, Универмаг, кафе, речка, парковая аллея, сквер.... <br />-до остановки общественного транспорта - всего 2 минуты<br />-кухонный гарнитур встроен и прекрасно послужит Вам долгие годы, также как и духовой электрический шкаф Ariston, варочная поверхность Cata, вытяжка<br />-в спальне остается кровать-тахта (с вместительным внутренним \"шифоньером\"</p><p>Вам не нужно вкладываться в ремонт. Потратьте сэкономленные деньги на себя!</p><p>Это тот самый случай, когда покупка недвижимости есть исполнение Вашей прекрасной мечты!<br />Реальному покупателю за наличный расчет уместный торг при осмотре квартиры (без посредников и агентств) !!!</p>       

<p>   1 250 000&nbsp;руб.   </p>', '0', '0', '', '0', '0', '2');
INSERT INTO `eboard_db`(`id`, `ip`, `uid`, `cat`, `region`, `date_add`, `date_del`, `user_id`, `status`, `sendmail`, `approved`, `sort`, `email`, `user`, `title`, `text`, `marked`, `raised`, `date_raised`, `block`, `active`, `counter`) VALUES ('87', '95.215.45.75', 'eb1730601444dacd5f7004c747ca3a06', '761', '120', '1517941980', '1520533980', '', '1', '1', '1', '10000000', 'i@board.ural56.ru', 'Станислав', 'Продам квартиру     
2-к квартира  51.7 м²  на 5 этаже  9-этажного панельного дома', '<p>Квартиры </p>
  <p>Удобства <br />Балкон, Телефон, Раздельные комнаты, Раздельный с/у, Газ<br /> <br />Продам 2-х комнатную квартиру улучшенной планировки от собственника. Квартира очень уютная и тёплая, металлическая входная дверь, на окнах новый немецкий стеклопакет, балкон застеклен. Вся инфраструктура в шаговой доступности, детский сад, оздоровительный комплекс,сбербанк, магазины. Подъезд тихий, соседи хорошие, что немаловажно.</p><p>Требуется ремонт</p>       

<p>   1 230 000&nbsp;руб.   </p>', '0', '0', '', '0', '0', '2');
INSERT INTO `eboard_db`(`id`, `ip`, `uid`, `cat`, `region`, `date_add`, `date_del`, `user_id`, `status`, `sendmail`, `approved`, `sort`, `email`, `user`, `title`, `text`, `marked`, `raised`, `date_raised`, `block`, `active`, `counter`) VALUES ('88', '95.215.45.75', 'eab2e98a88a8784595bea2f5373cb00b', '761', '120', '1517928720', '1520520720', '', '1', '1', '1', '10000000', 'i@board.ural56.ru', 'Татьяна', 'Продам квартиру     
2-к квартира  49 м²  на 4 этаже  9-этажного панельного дома', '<p>Квартиры </p>
  <p>Продам 2 ух комнатную квартиру в 6 ом микрорайоне по ул. Попова 5А. В квартире пластиковые окна, застекленная просторная и чистая лоджия, на кухне и в спальне заменены радиаторы, в квартире остается встроенный шкаф в коридоре. Квартира светлая, чистая. Рядом два парка (Пищевик и ЖД), рынок привокзальный, ТЗБ, остановки маршруток 12, 25, 36, 18.</p>       

<p>   1 550 000&nbsp;руб.   </p>', '0', '0', '', '0', '0', '6');
INSERT INTO `eboard_db`(`id`, `ip`, `uid`, `cat`, `region`, `date_add`, `date_del`, `user_id`, `status`, `sendmail`, `approved`, `sort`, `email`, `user`, `title`, `text`, `marked`, `raised`, `date_raised`, `block`, `active`, `counter`) VALUES ('89', '95.215.45.75', '37a9306114ab1b8e0d7e00886cfcb777', '761', '120', '1517914080', '1520506080', '', '1', '1', '1', '10000000', 'i@board.ural56.ru', 'Мария', 'Продам квартиру     
2-к квартира  45 м²  на 4 этаже  5-этажного блочного дома', '<p>Квартиры </p>
  <p>Продам 2 ком.кв. в теплом крупноблочном доме.С торца дома школа,дет.садик,рынок,детская и взрослая поликлиника,остановка.</p>       

<p>   950 000&nbsp;руб.   </p>', '0', '0', '', '0', '0', '2');
INSERT INTO `eboard_db`(`id`, `ip`, `uid`, `cat`, `region`, `date_add`, `date_del`, `user_id`, `status`, `sendmail`, `approved`, `sort`, `email`, `user`, `title`, `text`, `marked`, `raised`, `date_raised`, `block`, `active`, `counter`) VALUES ('90', '95.215.45.75', '9cdf85c2e23e62cbbf55d7ff6f94eb10', '762', '120', '1517121240', '1519713240', '', '2', '1', '1', '10000000', 'i@board.ural56.ru', 'Людмила', 'Продам квартиру     
3-к квартира  55.6 м²  на 4 этаже  5-этажного панельного дома', '<p>Квартиры </p>
  <p>Продам 3-х комнатную квартиру требующую ремонта. Район остановки \"Луч\" Обращаться c 18-20</p>       

<p>   1 200 000&nbsp;руб.   </p>', '0', '0', '', '0', '0', '2');
INSERT INTO `eboard_db`(`id`, `ip`, `uid`, `cat`, `region`, `date_add`, `date_del`, `user_id`, `status`, `sendmail`, `approved`, `sort`, `email`, `user`, `title`, `text`, `marked`, `raised`, `date_raised`, `block`, `active`, `counter`) VALUES ('91', '95.215.45.75', '369772db578697b08c167c232061cdb2', '763', '120', '1518085380', '1520677380', '', '1', '1', '1', '10000000', 'i@board.ural56.ru', '_______', 'Продам квартиру     
4-к квартира  73.6 м²  на 5 этаже  9-этажного кирпичного дома', '<p>Квартиры </p>
  <p>4-x комнатную квартиру на 5-ом этаже в 9-ти этажном кирпичном доме Ленинградской планировки. Большая лоджия с кладовкой и видом во двор. Квартира светлая, тёплая в отличном состоянии. Установлен водонагреватель на 80л. и кондиционер, окна пластиковые (профиль и фурнитура немецкие), пластиковый водопровод, на кухне под окном шкаф-холодильник, вода без перебоев, лифт работает круглосуточно. Рядом магазины, д/сады, школы, огромный парк Строителей с озером. Реальному покупателю торг. Возможен ОБМЕН на ДОМ с нашей доплатой.</p>       

<p>   2 300 000&nbsp;руб.   </p>', '0', '0', '', '0', '0', '11');
INSERT INTO `eboard_db`(`id`, `ip`, `uid`, `cat`, `region`, `date_add`, `date_del`, `user_id`, `status`, `sendmail`, `approved`, `sort`, `email`, `user`, `title`, `text`, `marked`, `raised`, `date_raised`, `block`, `active`, `counter`) VALUES ('92', '95.215.45.75', '154ab39a033e6009eda6559ddf1806d2', '763', '120', '1518022140', '1520614140', '', '1', '1', '1', '10000000', 'i@board.ural56.ru', 'Ирина', 'Продам квартиру     
4-к квартира  102 м²  на 3 этаже  3-этажного кирпичного дома', '<p>Квартиры </p>
  <p>Все комнаты раздельные. 2 балкона. Стеклопакеты. Газовая колонка. Все коммуникации заменены, требуется косметический ремонт. Рядом школа, детский сад. Остановка в шаговой доступности.</p>       

<p>   3 600 000&nbsp;руб.   </p>', '0', '0', '', '0', '0', '4');
INSERT INTO `eboard_db`(`id`, `ip`, `uid`, `cat`, `region`, `date_add`, `date_del`, `user_id`, `status`, `sendmail`, `approved`, `sort`, `email`, `user`, `title`, `text`, `marked`, `raised`, `date_raised`, `block`, `active`, `counter`) VALUES ('93', '95.215.45.75', '623bc3ba8858dda454512d35b40f3ebc', '763', '120', '1517870580', '1520462580', '', '1', '1', '1', '10000000', 'i@board.ural56.ru', 'Марина', 'Продам квартиру     
4-к квартира  101 м²  на 3 этаже  9-этажного панельного дома', '<p>Квартиры </p>
  <p>Продам блок квартир (3+1) 3/9,101 м^2, евроремонт, пластиковые окна, встроенная мебель, 3 кондиционера, 2 с/у. возможен обмен</p>       

<p>   2 800 000&nbsp;руб.   </p>', '0', '0', '', '0', '0', '2');
INSERT INTO `eboard_db`(`id`, `ip`, `uid`, `cat`, `region`, `date_add`, `date_del`, `user_id`, `status`, `sendmail`, `approved`, `sort`, `email`, `user`, `title`, `text`, `marked`, `raised`, `date_raised`, `block`, `active`, `counter`) VALUES ('94', '95.215.45.75', '20868665e0944f13b67938acc7a05ffb', '763', '120', '1517722200', '1520314200', '', '1', '1', '1', '10000000', 'i@board.ural56.ru', 'Автомабили с пробегом', 'Продам квартиру     
4-к квартира  63 м²  на 5 этаже  5-этажного кирпичного дома', '<p>Квартиры </p>
  <p>Продам 4 комн. квартиру,в 7 микрорайоне!Квартира в хорошем состоянии,везде пластиковые окна,поменяны все двери,в зале и двух комнатах натяжной потолок,на кухне,в ванне,туалете панели.Туалет,ванна,кухня-кафель.Пластиковый водопровод,счетчики на воду и газ.Интернет,кабельное.Квартира теплая,никогда не заливалась!Отличный вариант для большой семьи!</p>       

<p>   1 350 000&nbsp;руб.   </p>', '0', '0', '', '0', '0', '2');
INSERT INTO `eboard_db`(`id`, `ip`, `uid`, `cat`, `region`, `date_add`, `date_del`, `user_id`, `status`, `sendmail`, `approved`, `sort`, `email`, `user`, `title`, `text`, `marked`, `raised`, `date_raised`, `block`, `active`, `counter`) VALUES ('95', '95.215.45.75', 'f609ba70507d982f2be998f25a03c7e0', '763', '120', '1517379840', '1519971840', '', '1', '1', '1', '10000000', 'i@board.ural56.ru', 'Димона, агентство недвижимости', 'Продам квартиру     
4-к квартира  60.5 м²  на 4 этаже  5-этажного кирпичного дома', '<p>Квартиры </p>
  <p>Идеальное горячее предложение для ВСЕХ кто желает жить в кирпичном доме! По очень доступной цене можно купить с привлечением материнского капитала или под ипотеку, 4х-комнатную квартиру в самом тихом районе города!</p> <p>Квартира находится по адресу: ул.Добровольского 17 (ост. Добровольского) на 4 этаже 5 этажного кирпичного дома.</p> <p>Общая площадь квартиры - 60,5 кв.м., жилая площадь – 44,2 кв.м., кухня – 6 кв.м.</p> <p>• Квартира с качественным ремонтом, очень теплая и светлая (пластиковые окна, линолеум, хорошая металлическая дверь). Всё делалось для себя с любовью и заботой. Вам и Вашей семье будет комфортно жить в этой квартире!</p> <p>• Удобная планировка: гостинная комната и 3 отдельные комнаты;</p> <p>• Окна квартиры на две стороны;</p> <p>• Балкон застеклен, утеплён и облагорожена внутри.</p> <p>• Раздельный санузел, установлены пластиковый водопровод и счетчики учета вода, что сократит Ваши расходы.</p> <p>• Просторный коридор;</p> <p>• Кухонный гарнитур - остается новому хозяину в ПОДАРОК!</p> <p>• Тихий двор, доброжелательные соседи;</p> <p>• во дворе есть прекрасная детская площадка и много парковочных мест;</p> <p>• Хорошая транспортная доступность на все виды общественного городского транспорта;</p> <p>• Магазины - у дома;</p> <p>Семье с детьми будет интересно наличие школ №29, 32; детские сады.</p> <p> </p> <p>Эта замечательная квартира – Ваш шанс обеспечить своей семье удобство и комфорт! Не упустите его… Звоните немедленно!</p>       

<p>   1 500 000&nbsp;руб.   </p>', '0', '0', '', '0', '0', '3');
INSERT INTO `eboard_db`(`id`, `ip`, `uid`, `cat`, `region`, `date_add`, `date_del`, `user_id`, `status`, `sendmail`, `approved`, `sort`, `email`, `user`, `title`, `text`, `marked`, `raised`, `date_raised`, `block`, `active`, `counter`) VALUES ('96', '95.215.45.75', '8012ef33a2de2994f784c38e82526e57', '763', '120', '1517226180', '1519818180', '', '2', '1', '1', '10000000', 'i@board.ural56.ru', 'Марина', 'Продам квартиру     
4-к квартира  60 м²  на 5 этаже  5-этажного панельного дома', '<p>Квартиры </p>
  <p>Продается 4-х комн. квартира 60кв.м. Сделан отличный ремонт: заменена вся сан.техника, трубы и отопительные системы, душевая кабина.  Полы ламинат. Заменены все двери-входная и межкомнатные. Потолки подвесные. Мебель новая во всех комнатах и в кухне. Квартира  продается с мебелью. 2 сплит системы. Балкон застеклен. Заезжай и живи, ничего делать не надо.</p>       

<p>   1 600 000&nbsp;руб.   </p>', '0', '0', '', '0', '0', '2');
INSERT INTO `eboard_db`(`id`, `ip`, `uid`, `cat`, `region`, `date_add`, `date_del`, `user_id`, `status`, `sendmail`, `approved`, `sort`, `email`, `user`, `title`, `text`, `marked`, `raised`, `date_raised`, `block`, `active`, `counter`) VALUES ('97', '95.215.45.75', 'b5c612ffcff8ca8a78070df6e413aaaa', '763', '120', '1517167920', '1519759920', '', '2', '1', '1', '10000000', 'i@board.ural56.ru', 'Сергей', 'Продам квартиру     
4-к квартира  77 м²  на 4 этаже  9-этажного кирпичного дома', '<p>Квартиры </p>
  <p>Продам квартиру в отличном состоянии, пластиковые окна, евроремонт, лоджия застеклена.</p>       

<p>   2 100 000&nbsp;руб.   </p>', '0', '0', '', '0', '0', '3');
INSERT INTO `eboard_db`(`id`, `ip`, `uid`, `cat`, `region`, `date_add`, `date_del`, `user_id`, `status`, `sendmail`, `approved`, `sort`, `email`, `user`, `title`, `text`, `marked`, `raised`, `date_raised`, `block`, `active`, `counter`) VALUES ('98', '95.215.45.75', '7f17d1d814ef1467896a4e0ed3fba7b8', '763', '120', '1517074620', '1519666620', '', '2', '1', '1', '10000000', 'i@board.ural56.ru', 'Светлана', 'Продам квартиру     
4-к квартира  72 м²  на 3 этаже  5-этажного блочного дома', '<p>Квартиры </p>
  <p>Продам квартиру пер.Владивостокский 6, 3 этаж 5 этажного крупноблочного дома, обьединенную 1комн. +2 комн., 2 сан.узла, 2 балкона, гостиная + кухня (студия), все комнаты раздельные, евро ремонт. Частично остается мебель. Отличный район, 6 школа , садик, магазины, аптеки все в шаговой доступности.</p>       

<p>   2 150 000&nbsp;руб.   </p>', '0', '0', '', '0', '0', '2');
INSERT INTO `eboard_db`(`id`, `ip`, `uid`, `cat`, `region`, `date_add`, `date_del`, `user_id`, `status`, `sendmail`, `approved`, `sort`, `email`, `user`, `title`, `text`, `marked`, `raised`, `date_raised`, `block`, `active`, `counter`) VALUES ('99', '95.215.45.75', 'fa4f265b2f07fb692ae6e3742fd20145', '763', '120', '1516994280', '1519586280', '', '2', '1', '1', '10000000', 'i@board.ural56.ru', 'Анастасия', 'Продам квартиру     
4-к квартира  60.7 м²  на 5 этаже  5-этажного панельного дома', '<p>Квартиры </p>
  <p>Продам отличную светлую  4-х комнатную квартиру.Детская,гардеробная и кухню оставляю,люстры тоже в подарок.В удобном  районе,всё в шаговой доступности,стоянки,магазины,аптеки.<br />Во дворе замечательная детская площадка.<br />Соседи все порядочные люди ,подъезд тихий спокойный,после ремонта.Коммуникации все поменяны.<br />Более подробная инфо.по телефону.Торг.уместен</p>       

<p>   1 750 000&nbsp;руб.   </p>', '0', '0', '', '0', '0', '1');
INSERT INTO `eboard_db`(`id`, `ip`, `uid`, `cat`, `region`, `date_add`, `date_del`, `user_id`, `status`, `sendmail`, `approved`, `sort`, `email`, `user`, `title`, `text`, `marked`, `raised`, `date_raised`, `block`, `active`, `counter`) VALUES ('100', '95.215.45.75', '7e0b1a07c5b3ccc70202345028843213', '763', '120', '1516873320', '1519465320', '', '2', '1', '1', '10000000', 'i@board.ural56.ru', 'Алена', 'Продам квартиру     
4-к квартира  73 м²  на 9 этаже  9-этажного кирпичного дома', '<p>Квартиры </p>
  <p>Продам или обменяю 4х комнатную квартиру улучшенной планировки с евроремонтом! Сверху технический этаж.В квартире установлены качественные пластиковые окна, евробалкон, натяжные потолки, выровнены стены, пол, заменена эл. проводка. Во дворе хорошая детская площадка. Квартира не требует вложений, заходи и живи! Реальному покупателю-торг!</p>       

<p>   2 300 000&nbsp;руб.   </p>', '0', '0', '', '0', '0', '3');
INSERT INTO `eboard_db`(`id`, `ip`, `uid`, `cat`, `region`, `date_add`, `date_del`, `user_id`, `status`, `sendmail`, `approved`, `sort`, `email`, `user`, `title`, `text`, `marked`, `raised`, `date_raised`, `block`, `active`, `counter`) VALUES ('101', '95.215.45.75', 'dd83f942e8f3080b489088678270babf', '763', '120', '1516272540', '1518864540', '', '2', '1', '1', '10000000', 'i@board.ural56.ru', 'ООО &quot;Полтина&quot;', 'Продам квартиру     
4-к квартира  87.6 м²  на 2 этаже  5-этажного кирпичного дома', '<p>Квартиры </p>
  <p>Продается 4-комнатная квартира, расположенная на 2 этаже 5-этажного кирпичного дома 1983 г.п. Площадь - 87,6/12,3+17,4+11,5+11,8/11,6 кв м., лоджия. В шаговой доступности находятся: продуктовый магазин, спортивная площадка, Московская финансово-юридическая академия (Орский филиал). Свободна, возможна ипотека.</p>       

<p>   1 600 000&nbsp;руб.   </p>', '0', '0', '', '0', '0', '2');
INSERT INTO `eboard_db`(`id`, `ip`, `uid`, `cat`, `region`, `date_add`, `date_del`, `user_id`, `status`, `sendmail`, `approved`, `sort`, `email`, `user`, `title`, `text`, `marked`, `raised`, `date_raised`, `block`, `active`, `counter`) VALUES ('102', '95.215.45.75', '06c465350b1f04f9a84f5b7e5f21556c', '763', '120', '1516198380', '1518790380', '', '2', '1', '1', '10000000', 'i@board.ural56.ru', 'Андрей', 'Продам квартиру     
4-к квартира  63 м²  на 4 этаже  5-этажного панельного дома', '<p>Квартиры </p>
  <p>Продаем квартиру с частично с мебелью, заезжайте и живите, спасибо.</p>       

<p>   1 350 000&nbsp;руб.   </p>', '0', '0', '', '0', '0', '1');
INSERT INTO `eboard_db`(`id`, `ip`, `uid`, `cat`, `region`, `date_add`, `date_del`, `user_id`, `status`, `sendmail`, `approved`, `sort`, `email`, `user`, `title`, `text`, `marked`, `raised`, `date_raised`, `block`, `active`, `counter`) VALUES ('103', '95.215.45.75', '2e34f5669005b167464a475b2ff41ff0', '763', '120', '1515954240', '1518546240', '', '2', '1', '1', '10000000', 'i@board.ural56.ru', 'Ru', 'Продам квартиру     
4-к квартира  92 м²  на 2 этаже  4-этажного блочного дома', '<p>Квартиры </p>
  <p>ПРОДАЕТСЯ БОЛЬШАЯ ОЧЕНЬ УЮТНАЯ 4-х комн.КВАРТИРА. СОВРЕМЕННОЙ ПЛАНИРОВКИ! Сталинский дом! Раздельный СУ. Большая кухня!!!  В ОТЛИЧНОМ СОСТОЯНИИ - мебель делалась по индивидуальному дизайну, на кухне каменная столешница встроенная бытовая техника, посудомоечная машина, новый ламинат, евроремонт,новая медная эл.проводка, скрытая проводка для интернета и кабельного телевидения в каждой комнате. В квартире установлена газовая колонка, всегда в наличии горячая вода. Счётчики газ вода.   В шаговой доступности школа, дет сад, магазины Магнит Пятёрочка, остановка общественного транспорта. Тихий район в центре города.Любая форма расчета. Торг!!!</p>       

<p>   2 700 000&nbsp;руб.   </p>', '0', '0', '', '0', '0', '2');
INSERT INTO `eboard_db`(`id`, `ip`, `uid`, `cat`, `region`, `date_add`, `date_del`, `user_id`, `status`, `sendmail`, `approved`, `sort`, `email`, `user`, `title`, `text`, `marked`, `raised`, `date_raised`, `block`, `active`, `counter`) VALUES ('104', '95.215.45.75', 'b095124b184fb7082354c66fcaedaa3b', '175', '120', '1518092340', '1520684340', '', '1', '1', '1', '10000000', 'i@board.ural56.ru', 'Димона, агентство недвижимости', 'Продам комнату     
Комната 22.2 м²  в 5-к квартире  на 5 этаже  5-этажного кирпичного дома', '<p>Комнаты </p>
  <p>Продаются ДВЕ комнаты в общежитии секционного типа (11,3 кв.м.и 10,9 кв.м.) на 5 этаже 5-ного кирпичного дома.<br />Большие светлые комнаты. На в секции - туалет, душ, кухня.<br />Район хороший. Во дворе благоустроенная детская площадка, рядом аптека<br />Рассматриваем расчет материнским капиталом. Возможна продажа по отдельности.</p>       

<p>   450 000&nbsp;руб.   </p>', '0', '0', '', '0', '0', '13');
INSERT INTO `eboard_db`(`id`, `ip`, `uid`, `cat`, `region`, `date_add`, `date_del`, `user_id`, `status`, `sendmail`, `approved`, `sort`, `email`, `user`, `title`, `text`, `marked`, `raised`, `date_raised`, `block`, `active`, `counter`) VALUES ('105', '95.215.45.75', 'efda7383c26801ccf1135296f9833e4e', '175', '120', '1517787900', '1520379900', '', '1', '1', '1', '10000000', 'i@board.ural56.ru', 'Алексей', 'Продам комнату     
Комната 20 м²  в 4-к квартире  на 2 этаже  2-этажного блочного дома', '<p>Комнаты </p>
  <p>Продам комнату 20 м² в коммунальной квартире на 2 этаже.</p>       

<p>   350 000&nbsp;руб.   </p>', '0', '0', '', '0', '0', '2');
INSERT INTO `eboard_db`(`id`, `ip`, `uid`, `cat`, `region`, `date_add`, `date_del`, `user_id`, `status`, `sendmail`, `approved`, `sort`, `email`, `user`, `title`, `text`, `marked`, `raised`, `date_raised`, `block`, `active`, `counter`) VALUES ('106', '95.215.45.75', '7b0800706a48377956608ab7ca94472e', '175', '120', '1517659260', '1520251260', '', '1', '1', '1', '10000000', 'i@board.ural56.ru', 'Руслан', 'Сдам комнату     
Комната 18 м²  в 1-к квартире  на 2 этаже  5-этажного кирпичного дома', '<p>Комнаты </p>
  <p>Соседи семейные! Чистота и порядок!</p>       

<p>   2 500&nbsp;руб. в месяц   </p>', '0', '0', '', '0', '0', '3');
INSERT INTO `eboard_db`(`id`, `ip`, `uid`, `cat`, `region`, `date_add`, `date_del`, `user_id`, `status`, `sendmail`, `approved`, `sort`, `email`, `user`, `title`, `text`, `marked`, `raised`, `date_raised`, `block`, `active`, `counter`) VALUES ('107', '95.215.45.75', '9cc4fff403073367db5a3b3732dae0b2', '175', '120', '1517643240', '1520235240', '', '1', '1', '1', '10000000', 'i@board.ural56.ru', 'Наталья', 'Продам комнату     
Комната 11 м²  в 1-к квартире  на 4 этаже  9-этажного панельного дома', '<p>Комнаты </p>
  <p>Продам 2 комнаты в общежитии. по отдельности или вместе. или обменяю на 1 к. кв. + наша доплата. Отдельный туалет,пластиковые окна. Школы и садики, все магазины, больницы и рынок рядом.</p>       

<p>   280 000&nbsp;руб.   </p>', '0', '0', '', '0', '0', '2');
INSERT INTO `eboard_db`(`id`, `ip`, `uid`, `cat`, `region`, `date_add`, `date_del`, `user_id`, `status`, `sendmail`, `approved`, `sort`, `email`, `user`, `title`, `text`, `marked`, `raised`, `date_raised`, `block`, `active`, `counter`) VALUES ('108', '95.215.45.75', '7b25ae7206cabd1d359d3c5d2212aa7f', '175', '120', '1517425200', '1520017200', '', '1', '1', '1', '10000000', 'i@board.ural56.ru', '.', 'Сдам комнату     
Комната 15 м²  в 3-к квартире  на 2 этаже  2-этажного кирпичного дома', '<p>Комнаты </p>
  <p>Сдаётся комната в 3-х комнатной квартире по ул . Петровского 12 . Проживание с соседями . Предоплата .</p>       

<p>   100&nbsp;руб. в месяц   </p>', '0', '0', '', '0', '0', '2');
INSERT INTO `eboard_db`(`id`, `ip`, `uid`, `cat`, `region`, `date_add`, `date_del`, `user_id`, `status`, `sendmail`, `approved`, `sort`, `email`, `user`, `title`, `text`, `marked`, `raised`, `date_raised`, `block`, `active`, `counter`) VALUES ('109', '95.215.45.75', '5bd2d011a18a4e44b9429761e8286468', '175', '120', '1517330040', '1519922040', '', '1', '1', '1', '10000000', 'i@board.ural56.ru', 'Кристина', 'Продам комнату     
Комната 25 м²  в 1-к квартире  на 2 этаже  5-этажного кирпичного дома', '<p>Комнаты </p>
  <p>От СОБСТВЕННИКА в связи с переездом продается большая и светлая комната. Свежий современный ремонт, пластиковое окно, счетчик электричества, батарея, частично меблирована, возможность провести воду. На этаже имеется туалет и душ. Так же в шаговой доступности остановка общественного транспорта, школа, детские сады, парк, стадион, магазины, аптеки, поликлиники и больницы. Удобная транспортная развязка во все направления города. Возможна оплата мат капиталом!!! ТОРГ.</p>       

<p>   499 000&nbsp;руб.   </p>', '0', '0', '', '0', '0', '3');
INSERT INTO `eboard_db`(`id`, `ip`, `uid`, `cat`, `region`, `date_add`, `date_del`, `user_id`, `status`, `sendmail`, `approved`, `sort`, `email`, `user`, `title`, `text`, `marked`, `raised`, `date_raised`, `block`, `active`, `counter`) VALUES ('110', '95.215.45.75', '94d5038ef3e0267c9e489e5ce481b807', '175', '120', '1516863720', '1519455720', '', '2', '1', '1', '10000000', 'i@board.ural56.ru', 'Димона, агентство недвижимости', 'Продам комнату     
Комната 17.4 м²  в 3-к квартире  на 3 этаже  5-этажного панельного дома', '<p>Комнаты </p>
  <p>Продается замечательная комната в 3 комн. квартире коммунального заселения, по адресу: ул. Стартовая, 7а (240 квартал), комната 17,4 кв.м. расположена на 3 этаже 5 этажного панельного дома! Комната очень комфортная, светлая тёплая в комнате присутствует достаточно света, состояние комнаты и общей кухни - хорошее! К тому же из комнаты есть выход на просторную балкон.</p> <p>В раздельном санузле установлены пластиковые трубы, приборы учета. </p> <p>Доброжелательные соседи.</p> <p>Прекрасная транспортная доступность на все виды общественного городского транспорта.</p> <p>Район с развитой инфраструктурой. Рядом с домом находится школа, детский сад.</p> <p>Торопитесь! Это отличный вариант по доступной цене!</p>       

<p>   400 000&nbsp;руб.   </p>', '0', '0', '', '0', '0', '1');
INSERT INTO `eboard_db`(`id`, `ip`, `uid`, `cat`, `region`, `date_add`, `date_del`, `user_id`, `status`, `sendmail`, `approved`, `sort`, `email`, `user`, `title`, `text`, `marked`, `raised`, `date_raised`, `block`, `active`, `counter`) VALUES ('111', '95.215.45.75', 'be0cd40bdbaa3e5a9a1df98504b52337', '175', '120', '1516630080', '1519222080', '', '2', '1', '1', '10000000', 'i@board.ural56.ru', 'Димона, агентство недвижимости', 'Продам комнату     
Комната 13 м²  в 4-к квартире  на 5 этаже  5-этажного кирпичного дома', '<p>Комнаты </p>
  <p>Вам надоело снимать жилье в аренду и хочется иметь свой собственный уютный уголок? Ваше желание осуществимо прямо сейчас! Только у нас специально для Вас есть новое эксклюзивное предложение – комната вашей мечты! </p> <p>Продается комната общей площадью 13 кв.м в общежитии секционного типа, 5/5 этаж, кирпичного дом по адресу: ул. Московская, 17 (ДК Нефтяников\").</p> <p>Инфраструктура достаточно развита для удовлетворения всех жизненных потребностей. В шаговой доступности детский сад и школа, магазины. В самой комнате присутствует достаточно света, она чистая. </p> <p>В секции душ и туалет. Доброжелательные соседи. Места общего пользования ухоженные.</p>       

<p>   230 000&nbsp;руб.   </p>', '0', '0', '', '0', '0', '2');
INSERT INTO `eboard_db`(`id`, `ip`, `uid`, `cat`, `region`, `date_add`, `date_del`, `user_id`, `status`, `sendmail`, `approved`, `sort`, `email`, `user`, `title`, `text`, `marked`, `raised`, `date_raised`, `block`, `active`, `counter`) VALUES ('112', '95.215.45.75', '06455b95b268bfeb84c9efcb31b6bf66', '175', '120', '1516358520', '1518950520', '', '2', '1', '1', '10000000', 'i@board.ural56.ru', 'Светлана', 'Продам комнату     
Комната 21.2 м²  в 1-к квартире  на 8 этаже  9-этажного кирпичного дома', '<p>Комнаты </p>
  <p>Продаю комнату в общежитии. Общая площадь 42. Комната расположена не в секции, а отдельно в холле. Имеется отдельные комнаты. В одной расположен туалет и умывальник, а во второй кладовая, из которой можно сделать ванную комнату. Сама комната просторная, тёплая. Проведено кабельное ТВ, дверь железная, соседи хорошие. От остановки \"Сорокино\" идти буквально 3-4 мин. Рядом находятся садик, несколько школ, на 1 этаже имеется продуктовый магазин. Напротив здания сделана аллея, где можно отлично проводить время.</p>       

<p>   390 000&nbsp;руб.   </p>', '0', '0', '', '0', '0', '1');
INSERT INTO `eboard_db`(`id`, `ip`, `uid`, `cat`, `region`, `date_add`, `date_del`, `user_id`, `status`, `sendmail`, `approved`, `sort`, `email`, `user`, `title`, `text`, `marked`, `raised`, `date_raised`, `block`, `active`, `counter`) VALUES ('113', '95.215.45.75', '91967c22f844c00e891f43faed7745ab', '175', '120', '1516311060', '1518903060', '', '2', '1', '1', '10000000', 'i@board.ural56.ru', 'Александр Королевич', 'Сдам комнату     
Комната 18 м²  в 2-к квартире  на 6 этаже  9-этажного кирпичного дома', '<p>Комнаты </p>
  <p>Сдам комнату женщине,от 40лет.оплата только комуналка и помощь в приготовлении пищи пенсионеру.</p>       

<p>   1&nbsp;руб. в месяц   </p>', '0', '0', '', '0', '0', '2');
INSERT INTO `eboard_db`(`id`, `ip`, `uid`, `cat`, `region`, `date_add`, `date_del`, `user_id`, `status`, `sendmail`, `approved`, `sort`, `email`, `user`, `title`, `text`, `marked`, `raised`, `date_raised`, `block`, `active`, `counter`) VALUES ('114', '95.215.45.75', 'e18d960b25fc22cfbc20f1d079b1ece0', '175', '120', '1515966600', '1518558600', '', '2', '1', '1', '10000000', 'i@board.ural56.ru', 'Урал', 'Продам комнату     
Комната 17 м²  в 1-к квартире  на 7 этаже  9-этажного панельного дома', '<p>Комнаты </p>
  <p>Срочно!!! Торг!!! Можно под материнский капитал!!!</p>       

<p>   320 000&nbsp;руб.   </p>', '0', '0', '', '0', '0', '1');
INSERT INTO `eboard_db`(`id`, `ip`, `uid`, `cat`, `region`, `date_add`, `date_del`, `user_id`, `status`, `sendmail`, `approved`, `sort`, `email`, `user`, `title`, `text`, `marked`, `raised`, `date_raised`, `block`, `active`, `counter`) VALUES ('115', '95.215.45.75', '1d7b9af34f2c269bdd1c24233df84a77', '175', '120', '1515651000', '1518243000', '', '2', '1', '1', '10000000', 'i@board.ural56.ru', 'Димона, агентство недвижимости', 'Продам комнату     
Комната 13 м²  в 5-к квартире  на 7 этаже  9-этажного кирпичного дома', '<p>Комнаты </p>
  <p>Продам комнату в 4 комн. квартире. Площадь комнаты 13 м2, типовой ремонт, кухня - 10 м2. Квартира на 7 этаже 9 этажного дома, есть лоджия. Окна выходят во двор. Кирпичный дом. В квартире раздельный санузел. Рядом с домом есть магазин. Свободная продажа. Возможна продажа под материнский капитал.</p>       

<p>   330 000&nbsp;руб.   </p>', '0', '0', '', '0', '0', '0');
INSERT INTO `eboard_db`(`id`, `ip`, `uid`, `cat`, `region`, `date_add`, `date_del`, `user_id`, `status`, `sendmail`, `approved`, `sort`, `email`, `user`, `title`, `text`, `marked`, `raised`, `date_raised`, `block`, `active`, `counter`) VALUES ('116', '95.215.45.75', '0599679490237f4fbb1e87be07f8e13d', '175', '120', '1515637920', '1518229920', '', '2', '1', '1', '10000000', 'i@board.ural56.ru', 'Алексей', 'Сдам комнату     
Комната 20 м²  в 2-к квартире  на 5 этаже  5-этажного панельного дома', '<p>Комнаты </p>
  <p>Сдам комнату в двухкомнатной квартире, во второй комнате проживает парень студент, спрашивать Татьяну Алексеевну</p>       
<p> Комфорт        Балкон / лоджия        </p>
<p>   1&nbsp;руб. в месяц   </p>', '0', '0', '', '0', '0', '0');
INSERT INTO `eboard_db`(`id`, `ip`, `uid`, `cat`, `region`, `date_add`, `date_del`, `user_id`, `status`, `sendmail`, `approved`, `sort`, `email`, `user`, `title`, `text`, `marked`, `raised`, `date_raised`, `block`, `active`, `counter`) VALUES ('117', '95.215.45.75', 'd06c40c9cd7438cbaea11a98d3f354ef', '178', '120', '1517833380', '1520425380', '', '1', '1', '1', '10000000', 'i@board.ural56.ru', 'Маркина Ирина', 'Продам  дом     
1-этажный дом 86.3 м²  ( брус )  на участке 4.18 га  , в черте города', '<p>Дома, дачи, коттеджи </p>
  <p>Продам дом в хорошем состоянии. 3комнаты .Вода и туалет в доме Дом в черте города . Остановка рядом. На дворные постройки -сарай..</p>       

<p>   1 750 000&nbsp;руб.   </p>', '0', '0', '', '0', '0', '5');
INSERT INTO `eboard_db`(`id`, `ip`, `uid`, `cat`, `region`, `date_add`, `date_del`, `user_id`, `status`, `sendmail`, `approved`, `sort`, `email`, `user`, `title`, `text`, `marked`, `raised`, `date_raised`, `block`, `active`, `counter`) VALUES ('118', '95.215.45.75', 'ffbc4e8f2ce0ced05eb8a7edad4eee71', '178', '120', '1517833140', '1520425140', '', '1', '1', '1', '10000000', 'i@board.ural56.ru', 'Силкин Виктор', 'Продам  дом     
2-этажный дом 340 м²  ( кирпич )  на участке 7.4 сот.  , в черте города', '<p>Дома, дачи, коттеджи </p>
  <p>Продам Дом -340 кв. земли 7,4сот. всё в собственности, внутренняя отделка из экологического материала, комнаты просторные высота 2.70м. есть балкон, баня с бассейном, все коммуникации центральные, два гаража один в доме, насаждения абрикос, яблони и т.д... , тихий спокойный р-он рядом остановка, магазины, школа, садик, оставим почти всю мебель. ТОРГ.</p>       

<p>   6 300 000&nbsp;руб.   </p>', '0', '0', '', '0', '0', '2');
INSERT INTO `eboard_db`(`id`, `ip`, `uid`, `cat`, `region`, `date_add`, `date_del`, `user_id`, `status`, `sendmail`, `approved`, `sort`, `email`, `user`, `title`, `text`, `marked`, `raised`, `date_raised`, `block`, `active`, `counter`) VALUES ('119', '95.215.45.75', 'fa1e40255a35040ba3845d39ad094973', '178', '120', '1517832240', '1520424240', '', '1', '1', '1', '10000000', 'i@board.ural56.ru', 'Дмитриева Ирина', 'Продам  дом     
1-этажный дом 82.6 м²  ( брус )  на участке 6 сот.  , 1 км до города', '<p>Дома, дачи, коттеджи </p>
  <p>Продам дом уютный светлый,гараж 3-6 бетонный . 2-сарая,баня.</p>       

<p>   1 060 000&nbsp;руб.   </p>', '0', '0', '', '0', '0', '3');
INSERT INTO `eboard_db`(`id`, `ip`, `uid`, `cat`, `region`, `date_add`, `date_del`, `user_id`, `status`, `sendmail`, `approved`, `sort`, `email`, `user`, `title`, `text`, `marked`, `raised`, `date_raised`, `block`, `active`, `counter`) VALUES ('120', '95.215.45.75', 'e41bbc2a38d3890aa7ecf289e2030150', '178', '120', '1517767200', '1520359200', '', '1', '1', '1', '10000000', 'i@board.ural56.ru', 'ЕКатерина Горлова', 'Продам  дом     
1-этажный дом 90 м²  ( бревно )  на участке 6 сот.  , в черте города', '<p>Дома, дачи, коттеджи </p>
  <p>Продается дом в хорошем состоянии 90кв м.шпальный обложен кирпичем,железные ворота.В собственности.земельный участок 6 сот. приватизирован.Центральная канализация,гор/хол вода ,газ.4 раздельные жилые комнаты,одна смежная.ванная+туалет.кабельное  телевидение Уфанет + интернет.в доме(2) и на дворовом участке имеется погреба(бетонные)широкий большой двор под постройку бани,гаража и т.д Рядом с домом расположенны 2 дет. сада ,школа,магазины,остановка.Остальные подробности о продаже можно обсудить при личной встрече.</p>       

<p>   2 300 000&nbsp;руб.   </p>', '0', '0', '', '0', '0', '2');
INSERT INTO `eboard_db`(`id`, `ip`, `uid`, `cat`, `region`, `date_add`, `date_del`, `user_id`, `status`, `sendmail`, `approved`, `sort`, `email`, `user`, `title`, `text`, `marked`, `raised`, `date_raised`, `block`, `active`, `counter`) VALUES ('121', '95.215.45.75', 'a17eaa4b20ac729d2d88f483e782edf0', '178', '120', '1517765100', '1520357100', '', '1', '1', '1', '10000000', 'i@board.ural56.ru', 'Елена', 'Продам  дом     
1-этажный дом 68 м²  ( кирпич )  на участке 8 сот.  , в черте города', '<p>Дома, дачи, коттеджи </p>
  <p>ПРОДАЕТСЯ ДОМ! в связи с переездом!.Ремонт во всех помещениях,стены (не саманные)шлакоблочно-кирпичные,толщина 80см,снаружи обложен кирпичом,высота потолков(двухуровневые) - 2,7м, веранда с ремонтом,железная крепкая дверь, 4 комнаты,кухня-10кв.м,большой совмещенный санузел.Полы кафельные в с\\узле,на веранде,в прихожей,на кухне.В остальных помещениях-ламинат. Есть все удобства - вода (холодная-горячая),новый котел отопления, канализация.Кухонный гарнитур оставляем! <br />На участке есть сарай,беседка с мангалом,бассейн,место для чаепития в саду,есть все насаждения(яблони,груша,вишня,слива,абрикос,виноград)...отведено место для сезонных посадок(огурцы,помидоры,клубника и т.д.много цветов,газон)Имеется система водоотведения.Очень много места для строительства. <br />Есть капельный полив! <br />ЦЕНТР ГОРОДА! - по Тагильской вниз-частный сектор. Вдали от проезжей части(чистый воздух), соседи все замечательные! Улица хорошо освещена,зимой регулярно чистится! <br />ЗЕМЛЯ и ДОМ в СОБСТВЕННОСТИ,собственник один! Юридически готовы к разным видам оплаты (военный сертификат,материнский капитал,ипотека...) Звоните!!!</p>       

<p>   2 350 000&nbsp;руб.   </p>', '0', '0', '', '0', '0', '2');
INSERT INTO `eboard_db`(`id`, `ip`, `uid`, `cat`, `region`, `date_add`, `date_del`, `user_id`, `status`, `sendmail`, `approved`, `sort`, `email`, `user`, `title`, `text`, `marked`, `raised`, `date_raised`, `block`, `active`, `counter`) VALUES ('122', '95.215.45.75', '7ee7bf4daa606ca788d1bb7befb6fccf', '178', '120', '1517740380', '1520332380', '', '1', '1', '1', '10000000', 'i@board.ural56.ru', 'Сергей', 'Продам  дом     
1-этажный дом 140 м²  ( пеноблоки )  на участке 15 сот.  , в черте города', '<p>Дома, дачи, коттеджи </p>
  <p>По поводу вопроса \"Сколько вкладывать\" - не много, есть смета , позвоните. Дом по оригинальному проекту, который вы можете себе позволить! Газовый котёл запущен. Канализация и освещение по дому проведены. Полы готовы. Стены отделаны гипсокартоном на 2\\3. Исключительно качественные материалы. Газ, вода, канализация, электричество -центральные.Есть смета на оставшиеся работы. Есть бригада , которая сделает не дорого и качественно. Участок 15 соток, заезд с двух сторон.<br />До остановки 5 мин. Зимой дорогу не заметает.</p>       

<p>   2 400 000&nbsp;руб.   </p>', '0', '0', '', '0', '0', '2');
INSERT INTO `eboard_db`(`id`, `ip`, `uid`, `cat`, `region`, `date_add`, `date_del`, `user_id`, `status`, `sendmail`, `approved`, `sort`, `email`, `user`, `title`, `text`, `marked`, `raised`, `date_raised`, `block`, `active`, `counter`) VALUES ('123', '95.215.45.75', 'fdc72cb915e10e76d232915c59fad833', '178', '120', '1517736420', '1520328420', '', '1', '1', '1', '10000000', 'i@board.ural56.ru', 'Софья', 'Продам  дом     
1-этажный дом 102 м²  ( кирпич )  на участке 6 сот.  , в черте города', '<p>Дома, дачи, коттеджи </p>
  <p>Продается современный дом в центре города. 10 минут пешком до центра. В отличном состояни. Дом и земля в собственности. 4 комнат, все изолированные. Встроенная кухня, прихожая и кабинет входят в стоимость. Санузел совмещен. Установлен газовый котел на горячую воду и отопление. Холодная вода из собственной скважены.<br />Имеется:</p><p>Оборудованный гараж с полками под инструменты и всякую ерунду, так же в гараже имеется большой и вместительный оборудованный погреб. </p><p>Баня. рабочая. с комнатой отдыха.</p><p>Сарай.</p><p>Крытый вольер для собак.</p><p>Участок оборудован беседкой, мангальной зоной, пруд и фонтан. Так же на участке вырот и залит бетоном резервуар для бассейна осталось тользо положить изоляцию.</p><p>Продаем в связи с переездом. Имеем возможность оставить любую понравившуюся Вам мебель без доп. платы. </p><p>За доп. плату возможно так же оставить сплит системы.</p><p>Возможен торг</p>       

<p>   4 300 000&nbsp;руб.   </p>', '0', '0', '', '0', '0', '2');
INSERT INTO `eboard_db`(`id`, `ip`, `uid`, `cat`, `region`, `date_add`, `date_del`, `user_id`, `status`, `sendmail`, `approved`, `sort`, `email`, `user`, `title`, `text`, `marked`, `raised`, `date_raised`, `block`, `active`, `counter`) VALUES ('124', '95.215.45.75', '17951e96904f9709f1d83cba809087a2', '178', '120', '1518173280', '1520765280', '', '1', '1', '1', '10000000', 'i@board.ural56.ru', 'Димона, агентство недвижимости', 'Продам  дом     
2-этажный дом 320 м²  ( кирпич )  на участке 9 сот.  , в черте города', '<p>Дома, дачи, коттеджи </p>
  <p>Продается 2 этажный дом, расположенный за центральным парком. Готов под отделку! Высота потолков 3м. <br /> Участок 9 соток в собственности. На участке большой гараж 8, 5*6, 5. <br /> Дом газифицирован, вода - скважина.</p>       

<p>   3 300 000&nbsp;руб.   </p>', '0', '0', '', '0', '0', '47');
INSERT INTO `eboard_db`(`id`, `ip`, `uid`, `cat`, `region`, `date_add`, `date_del`, `user_id`, `status`, `sendmail`, `approved`, `sort`, `email`, `user`, `title`, `text`, `marked`, `raised`, `date_raised`, `block`, `active`, `counter`) VALUES ('125', '95.215.45.75', '543529a977dcb53ae753f229035be9b0', '178', '120', '1518173220', '1520765220', '', '1', '1', '1', '10000000', 'i@board.ural56.ru', 'Димона, агентство недвижимости', 'Продам  дом     
1-этажный дом 102 м²  ( кирпич )  на участке 7 сот.  , в черте города', '<p>Дома, дачи, коттеджи </p>
  <p>Продается дом ост. \"Тагильская\", рассматриваем расчет по сертификатам!<br /> Одноэтажный дом общей площадью 102 кв. м. <br /> Баня в доме. Центральная канализация, центр. вода холодная новая газовая колонка. <br /> Гараж, сарай. Туалет в доме.<br /> Земли 6, 5 соток в собственности.<br /> Отличный вариант для семьи!<br /> Документы готовы!</p>       

<p>   1 350 000&nbsp;руб.   </p>', '0', '0', '', '0', '0', '6');
INSERT INTO `eboard_db`(`id`, `ip`, `uid`, `cat`, `region`, `date_add`, `date_del`, `user_id`, `status`, `sendmail`, `approved`, `sort`, `email`, `user`, `title`, `text`, `marked`, `raised`, `date_raised`, `block`, `active`, `counter`) VALUES ('126', '95.215.45.75', 'bfc1cc873e911557d54b5061241fc49b', '178', '120', '1518172920', '1520764920', '', '1', '1', '1', '10000000', 'i@board.ural56.ru', 'Димона, агентство недвижимости', 'Продам  дом     
1-этажный дом 66 м²  ( брус )  на участке 9 сот.  , в черте города', '<p>Дома, дачи, коттеджи </p>
  <p>1 этажный жилой дом. 3 комнаты, газ, электричество. Газовое отопление. Стены самон, перекрытия – деревянные. Пристрой – шлакоблочный, крыша – шифер. На участке скважина, в доме воды нет. 2 сарая, отдельно стоящий погреб</p>       

<p>   850 000&nbsp;руб.   </p>', '0', '0', '', '0', '0', '6');
INSERT INTO `eboard_db`(`id`, `ip`, `uid`, `cat`, `region`, `date_add`, `date_del`, `user_id`, `status`, `sendmail`, `approved`, `sort`, `email`, `user`, `title`, `text`, `marked`, `raised`, `date_raised`, `block`, `active`, `counter`) VALUES ('127', '95.215.45.75', '2ca7bc6b05761c24ad2efc98576c8398', '178', '120', '1518172860', '1520764860', '', '1', '1', '1', '10000000', 'i@board.ural56.ru', 'Димона, агентство недвижимости', 'Продам  дом     
2-этажный дом 349 м²  ( кирпич )  на участке 10 сот.  , в черте города', '<p>Дома, дачи, коттеджи </p>
  <p>Специальное предложение для ценителей английского комфорта, немецкого уюта и русского простора!<br /> Спешите купить коттедж с шикарной планировкой, блестящим современным ремонтом в черте города!<br /> 2 этажный коттедж с мансардой общей площадью 349, 2 кв. м (жилая 149, 6 кв. м. , кухня 19, 2 кв. м) построен на участке размером 10 соток на ул. В. Буканова (район Елшанки). <br /> Дом, построенный в 2011 году по европейской планировке, словно специально спроектирован для любителей изысканного дизайна. <br /> В этом комфортабельном теплом доме очень много света за счет больших пластиковых французских окон и зеркальных натяжных потолков высотой 3 м. <br /> На 1 этаже просторная гостиная площадью 40 кв. м с панорамным окном имеет дополнительный выход внутрь двора. Ее пространство позволяет с удобством принимать достаточно большое количество гостей. Совмещённая с каминным залом гостиная включает в себя дополнительную зону для семейных посиделок или торжеств. Особый шарм интерьеру придают декоративные керамические предметы, художественные произведения и шикарная кожаная мебель. Пол выложен керамической плиткой в сочетании с ламинатом.<br /> Стилизованная кухня – 19, 2 кв. м. с большой обеденной зоной плавно переходит в зону гостиной.<br /> На 2 этаже 5 раздельных комнат с основательным ремонтом из дорогих материалов. Отдельная комната под кабинет позволит Вам организовать рабочее пространство.<br /> На каждом этаже санузлы, оборудованные современной сантехникой. Стены и полы санузлов отделаны кафельной плиткой.<br /> В доме оборудована отдельная котельная с современным отопительным оборудованием, необходимыми счетчиками и регулятором температуры.<br /> В подвале оборудован спортзал площадью 63 кв. м. , Вам больше не нужно тратиться на абонемент, ведь у Вас появится свой собственный зал! Так же имеется 2 подсобных помещения (42 и 6 кв. м. ) и кладовая.<br /> Построен большой отапливаемый гараж на 2 автомобильных места. Дорожки на территории из каменной плитки.<br /> За дом построена беседка для пользования летом!<br /> Как неотъемлемая часть дома в русских традициях – построена модная баня, которая снимает усталость и выгонит из тела любую хворь.<br /> Купите большой и стильный загородный дом и получите дорогостоящую мебель в подарок.</p>       

<p>   7 800 000&nbsp;руб.   </p>', '0', '0', '', '1', '0', '17');
INSERT INTO `eboard_db`(`id`, `ip`, `uid`, `cat`, `region`, `date_add`, `date_del`, `user_id`, `status`, `sendmail`, `approved`, `sort`, `email`, `user`, `title`, `text`, `marked`, `raised`, `date_raised`, `block`, `active`, `counter`) VALUES ('128', '95.215.45.75', '623ef9f86c60bfb5f1cecf5d0470a233', '178', '120', '1518168480', '1520760480', '', '1', '1', '1', '10000000', 'i@board.ural56.ru', 'Татьяна', 'Продам  дом     
1-этажный дом 110 м²  ( экспериментальные материалы )  на участке 8 сот.  , в черте города', '<p>Дома, дачи, коттеджи </p>
  <p>Продаётся дом,ОЗТП.<br />За рынком \"Восточный\". Дом и земля в собственности. Газ и вода центральные.<br />Удобства в доме. Комнаты раздельные. Крыша и фундамент новые. Есть летняя вода. Имеются насаждения: яблони,абрикосы,сливы,груша, виноград,малина,клубника....<br />Развита инфраструктура. Всё в шаговой доступности. До остановки и рынка 5 минут ходьбы.<br />Улица тихая,спокойная...</p>       

<p>   1 800 000&nbsp;руб.   </p>', '0', '0', '', '1', '0', '15');
INSERT INTO `eboard_db`(`id`, `ip`, `uid`, `cat`, `region`, `date_add`, `date_del`, `user_id`, `status`, `sendmail`, `approved`, `sort`, `email`, `user`, `title`, `text`, `marked`, `raised`, `date_raised`, `block`, `active`, `counter`) VALUES ('129', '95.215.45.75', '49f0f644fb1b4b4df0693f3655113b7c', '178', '120', '1518166800', '1520758800', '', '1', '1', '1', '10000000', 'i@board.ural56.ru', 'Анастасия Белая', 'Продам  дом     
2-этажный дом 215 м²  ( кирпич )  на участке 8 сот.  , в черте города', '<p>Дома, дачи, коттеджи </p>
  <p>Дом в г. Орск, п. Первомайский, год постройки - 2008.<br />Общая площадь - 215 кв.м.: <br />1-й этаж - 99,8 кв.м. (веранда, коридор, 2 комнаты, гостиная, кухня, с/у)<br />2-й мансардный этаж - 41.7 кв.м. (2 комнаты, коридор, чердак) <br />цокольный этаж - 73,7 кв.м. (оборудовано место для хранения заготовок на зиму, часть помещения свободна - можно сделать спортзал и игровую комнату)<br />ЦЕНТРАЛЬНЫЕ КОММУНИКАЦИИ: газ, вода, канализация, электричество. Интернет, городской телефон, Тв-триколор. <br />Отличный свежий ремонт. Комнаты частично остаются с мебелью, встроенная прихожая, кухня с необходимой бытовой техникой, камин на дровах, теплые полы в с/у. Дом полностью готов к проживанию.<br />На участке 7,5 соток имеется зона барбекю, газон, плодоносящий сад (яблони, груша, ирга, сливы, вишня, смородина, крыжовник, клубника, малина, ежевика, ежемалина, боярышник, жимолость), ухоженный огород с разведенной системой полива, кирпичный гараж, хоз. блок, баня на дровах, ливневая канализация. Участок ровный, грунтовые воды отсутствуют. <br />Двор полностью выложен плиткой. Дом и все постройки находятся на охранной сигнализации. <br />Отличное месторасположение! Вся инфраструктура в пешей доступности: детский сад и школа - 50 м, магазин Магнит - 150 м, автобусная остановка - 200 м, сбербанк, торговый центр, магазин Пятерочка, почта - 600 м, лес - 200 м, река Урал - 700 м.<br />В собственности более 3-х лет, один собственник. <br />Просмотр в любое время. Доп. фото вышлю по запросу</p>       

<p>   4 150 000&nbsp;руб.   </p>', '0', '0', '', '1', '0', '10');
INSERT INTO `eboard_db`(`id`, `ip`, `uid`, `cat`, `region`, `date_add`, `date_del`, `user_id`, `status`, `sendmail`, `approved`, `sort`, `email`, `user`, `title`, `text`, `marked`, `raised`, `date_raised`, `block`, `active`, `counter`) VALUES ('130', '95.215.45.75', '26c8057bf9921c9d56f7ee9beeaeb34c', '178', '120', '1518161700', '1520753700', '', '1', '1', '1', '10000000', 'i@board.ural56.ru', 'Александр', 'Продам  дом     
1-этажный дом 60 м²  ( бревно )  на участке 6 сот.  , в черте города', '<p>Дома, дачи, коттеджи </p>
  <p>Продаётся светлый тёплый  уютный дом жилой площадью 60.1 м², участок 6 сот., капитальный гараж на 2 авто, размером 6х8. В доме свет, АГВ, газ, городской телефон, центральное водоснабжение и канализация,. Дом угловой, одноэтажный, 3 комнаты, обложен белым кирпичом. Все коммуникации установлены и оформлены. Участок ровный широкий прямоугольный. Будущим хозяевам при желание можно ещё приватизировать прилегающую территорию площадью около 5 сот. Идеальное место под магазин или автосервис. <br />Дом расположен п.Мяокомбинат с <br />развитой инфраструктурой. В шаговой доступности все необходимое: школа, садики, продовольственные магазины, аптека, почта. Собственник. Об осмотре дома договариваемся заранее по телефону. Торг умеренный.</p>       

<p>   1 800 000&nbsp;руб.   </p>', '0', '0', '', '0', '0', '8');
INSERT INTO `eboard_db`(`id`, `ip`, `uid`, `cat`, `region`, `date_add`, `date_del`, `user_id`, `status`, `sendmail`, `approved`, `sort`, `email`, `user`, `title`, `text`, `marked`, `raised`, `date_raised`, `block`, `active`, `counter`) VALUES ('131', '95.215.45.75', '34981c3ee39d9f9f221680aa0fe7e839', '178', '120', '1518118080', '1520710080', '', '1', '1', '1', '10000000', 'i@board.ural56.ru', 'Владимир', 'Продам  дом     
2-этажный дом 150 м²  ( кирпич )  на участке 8 сот.  , в черте города', '<p>Дома, дачи, коттеджи </p>
  <p>Продам уютный , тёплый дом . Дом находится в хорошем , тихом районе .  В доме 100кв.м жилой площади , 5 комнат , 2 сан.узла , кухня 20 кв.м с тёплым полом, имеется подвал , светлый гараж в доме . На участке имеются садовые насождения , баня , летняя кухня с барбекю . Вода и канализация центральные , возле дома асфальт и центральное освещение улицы .</p>       

<p>   6 700 000&nbsp;руб.   </p>', '0', '0', '', '0', '0', '7');
INSERT INTO `eboard_db`(`id`, `ip`, `uid`, `cat`, `region`, `date_add`, `date_del`, `user_id`, `status`, `sendmail`, `approved`, `sort`, `email`, `user`, `title`, `text`, `marked`, `raised`, `date_raised`, `block`, `active`, `counter`) VALUES ('132', '95.215.45.75', '6cc64289807d6701723ec80078d27ccf', '178', '120', '1518092280', '1520684280', '', '1', '1', '1', '10000000', 'i@board.ural56.ru', 'Димона, агентство недвижимости', 'Продам  дом     
1-этажный дом 72 м²  ( кирпич )  на участке 5 сот.  , в черте города', '<p>Дома, дачи, коттеджи </p>
  <p>Продается уютный дом площадью 72 кв.м. Дом находится по адресу: ул. Новосибирская (ост. Клую Глухонемых).<br />· Прочные кирпичные стены дома и герметично поставленные окна защищают покой хозяев от постороннего шума, и сохраняют постоянное тепло в доме. <br />· В доме 4 жилые комнаты, из нах 2 отдельные комнаты дают возможность каждому члену семьи заниматься любимым делом, не мешая при этом остальным.<br />· Просторная кухня 10 кв.м. – мечта дружной и общительной семьи.<br />· Большой совмещенный санузел - дополнительное удобство для семьи.<br />· В доме проведены: газовое отопление, центральный водопровод, центральная канализация.<br />· Как неотъемлемая часть частного дома в русских традициях – есть баня на дровах с парилкой, душевой и комнатой отдыха, которая снимает усталость и выгонит из тела любую хворь. <br />· Земельный участок 5 соток позволит реализовать и мечты садовода и любые архитектурно-ландшафтные фантазии. <br />· На участке возведен гараж из цементных блоков 33 кв.м. со смотровой ямой.<br />· Семье с детьми будет интересно наличие детских садов и школ. Все это находится рядом с домом.</p>       

<p>   2 300 000&nbsp;руб.   </p>', '0', '0', '', '0', '0', '7');
INSERT INTO `eboard_db`(`id`, `ip`, `uid`, `cat`, `region`, `date_add`, `date_del`, `user_id`, `status`, `sendmail`, `approved`, `sort`, `email`, `user`, `title`, `text`, `marked`, `raised`, `date_raised`, `block`, `active`, `counter`) VALUES ('133', '95.215.45.75', '77028ce3f56bee9d05461b8f80356a6d', '178', '120', '1518083520', '1520675520', '', '1', '1', '1', '10000000', 'i@board.ural56.ru', 'Олег', 'Продам  дом     
2-этажный дом 300 м²  ( кирпич )  на участке 20 сот.  , в черте города', '<p>Дома, дачи, коттеджи </p>
  <p>Продам красивый, благоустроенный дом в центре города с баней. 2 этажа, подвал, современный дизайн, второй свет. Интересный ландшафтный дизайн, отдельно стоящий гараж на 2 машины, зона барбекю. Участок на 2 хозяина.</p>       

<p>   15 000 000&nbsp;руб.   </p>', '0', '0', '', '0', '0', '5');
INSERT INTO `eboard_db`(`id`, `ip`, `uid`, `cat`, `region`, `date_add`, `date_del`, `user_id`, `status`, `sendmail`, `approved`, `sort`, `email`, `user`, `title`, `text`, `marked`, `raised`, `date_raised`, `block`, `active`, `counter`) VALUES ('134', '95.215.45.75', 'b73aa2666a64f72c7e514c03cfb02b29', '178', '120', '1518077100', '1520669100', '', '1', '1', '1', '10000000', 'i@board.ural56.ru', 'Ольга', 'Продам  дом     
2-этажный дом 525 м²  ( пеноблоки )  на участке 9 сот.  , в черте города', '<p>Дома, дачи, коттеджи </p>
  <p>Продам дом в г. Орске (с мебелью). Год постройки 2009. Участок 9 соток. Все в собственности (один собственник). Центральная канализация, скважина на воду. Дом находится под охраной. Двор выложен плиткой. Во дворе мангал, беседка, большой бассейн, плодовые деревья. 1-й этаж: зал с камином, кабинет, столовая, кухня, большая веранда, с/у (теплый пол). 2-й этаж: 2 детские, гостевая, спальня, гардеробная с балконом, с/у (теплый пол). В подвале оборудован спорт зал с комнатой отдыха. Есть гараж для большого автомобиля, сауна с комнатой отдыха и бассейном. Остается комплект НТВ+ и комплект подключения к интернету. Торг.</p>       

<p>   9 500 000&nbsp;руб.   </p>', '0', '0', '', '0', '0', '4');
INSERT INTO `eboard_db`(`id`, `ip`, `uid`, `cat`, `region`, `date_add`, `date_del`, `user_id`, `status`, `sendmail`, `approved`, `sort`, `email`, `user`, `title`, `text`, `marked`, `raised`, `date_raised`, `block`, `active`, `counter`) VALUES ('135', '95.215.45.75', '193109edceb0f1e11d02aaa7dccc2485', '178', '120', '1518034320', '1520626320', '', '1', '1', '1', '10000000', 'i@board.ural56.ru', 'Екатерина', 'Продам  дом     
1-этажный дом 120 м²  ( кирпич )  на участке 7 сот.  , в черте города', '<p>Дома, дачи, коттеджи </p>
  <p>продам дом мансардного типа 2005 года постройки , дом шпальный  обложен кирпичем,в хорошем районе где все в шаговой доступности , в доме все коммуникации, имеется гараж не отапливаемый . продажа срочная в связи с переездом .</p>       

<p>   2 550 000&nbsp;руб.   </p>', '0', '0', '', '0', '0', '6');
INSERT INTO `eboard_db`(`id`, `ip`, `uid`, `cat`, `region`, `date_add`, `date_del`, `user_id`, `status`, `sendmail`, `approved`, `sort`, `email`, `user`, `title`, `text`, `marked`, `raised`, `date_raised`, `block`, `active`, `counter`) VALUES ('136', '95.215.45.75', 'a66867e2b1ea7252030b3440121ea4f5', '178', '120', '1518027900', '1520619900', '', '1', '1', '1', '10000000', 'i@board.ural56.ru', 'Людмила', 'Продам  дом     
2-этажный дом 260 м²  ( кирпич )  на участке 7 сот.  , в черте города', '<p>Дома, дачи, коттеджи </p>
  <p>Срочно продам дом, полностью или частично мебелированный, евроремонт. Дом расположен в тихом районе, рядом детские сады, школы, магазины, отличная транспортная развязка, до остановки 2 минуты ходьбы. В доме два больших гаража (вмещают 3 авто). Кухня со встроенной мебелью, столешница из натурального камня. В доме газовое отопление, кондиционеры,проведены пожарная и охранная сигнализация, видеонаблюдение, интернет (оптика), телефония. Дом полностью готов к проживанию, ремонта не требует. Фото реальные, продажа от собственника. Цена указана с учетом только встроенной мебели.</p>       

<p>   7 500 000&nbsp;руб.   </p>', '0', '0', '', '0', '0', '3');
INSERT INTO `eboard_db`(`id`, `ip`, `uid`, `cat`, `region`, `date_add`, `date_del`, `user_id`, `status`, `sendmail`, `approved`, `sort`, `email`, `user`, `title`, `text`, `marked`, `raised`, `date_raised`, `block`, `active`, `counter`) VALUES ('137', '95.215.45.75', 'd1c1049f477c22d9403aed275469547b', '178', '120', '1517991780', '1520583780', '', '1', '1', '1', '10000000', 'i@board.ural56.ru', 'Елена', 'Продам  дом     
1-этажный дом 48 м²  ( брус )  на участке 3 сот.  , в черте города', '<p>Дома, дачи, коттеджи </p>
  <p>Продается брусовой дом: 4 комнаты+кухня. Косметический ремонт, установлены новые: электросчетчик, газовый счетчик, газовый котел. Установлен септик, канализационные трубы уже выведены в дом, скважина в коридоре. Имеется телефон. Новые ворота. незатопляемая зона, хорошие соседи. Рядом остановка, магазины. Школа и дет.сад недалеко (примерно 300-400 метров). Все документы готовы. Чистая продажа, обмен НЕ ПРЕДЛАГАТЬ. Реальному покупателю торг.</p>       

<p>   950 000&nbsp;руб.   </p>', '0', '0', '', '0', '0', '10');
INSERT INTO `eboard_db`(`id`, `ip`, `uid`, `cat`, `region`, `date_add`, `date_del`, `user_id`, `status`, `sendmail`, `approved`, `sort`, `email`, `user`, `title`, `text`, `marked`, `raised`, `date_raised`, `block`, `active`, `counter`) VALUES ('138', '95.215.45.75', '9ee503ab847143a2ea8f44106f1da7a8', '178', '120', '1517942160', '1520534160', '', '1', '1', '1', '10000000', 'i@board.ural56.ru', 'Александр', 'Продам  дом     
1-этажный дом 131 м²  ( брус )  на участке 5 сот.  , в черте города', '<p>Дома, дачи, коттеджи </p>
  <p>Продаётся жилой  дом. документы август 2017:в хорошем состоянии с мебелью,имеется стационарный телефон,интернет,заезжай и живи! общая площадь 131 кВ.м,  участок земли- 5 соток.  На территории дома и в доме установлена сигнализация ( охраняемся вневедомственной  охраной) имеется видеонаблюдение. В доме имеются: -гостиная -23 м.кв::3 спальные комнаты ::просторная кухня -11.4 м.кв.::просторная ванная комната-8.6 м.кв.:: На территории дома расположены: -баня -пристройка(сарай) для хранения вещей ( велосипеды, старая мебель, колеса, запчасти и т.д) - : Гараж. - 35.6 м.кв.летний навес Отопление дома-газ газовый котёл.  подача горячей воды  осуществляется через газовую калонку. Подача воды- центральная ,также имеется в подвале дома скважина для полива. При желании новые хозяева могут организовать дополнительно жилую зону на крыше ( площадь позволяет вместить  ещё 1-2  небольшие комнаты).  Рядом с домом расположены в пешей доступности автобусная остановка, магазины, детские сад. школы.церковь.мечеть.  Звоните!! ТОРГ приветствуется ;) Продажа в связи с переездом, в другой город .</p>       

<p>   3 700 000&nbsp;руб.   </p>', '0', '0', '', '0', '0', '2');
INSERT INTO `eboard_db`(`id`, `ip`, `uid`, `cat`, `region`, `date_add`, `date_del`, `user_id`, `status`, `sendmail`, `approved`, `sort`, `email`, `user`, `title`, `text`, `marked`, `raised`, `date_raised`, `block`, `active`, `counter`) VALUES ('139', '95.215.45.75', 'b350e15e0c770e21da0b46b1e02710ed', '178', '120', '1517940360', '1520532360', '', '1', '1', '1', '10000000', 'i@board.ural56.ru', 'юлия', 'Продам  дом     
1-этажный дом 100 м²  ( бревно )  на участке 9 сот.  , в черте города', '<p>Дома, дачи, коттеджи </p>
  <p>Продам недостроенный дом с большим гаражом.район 240 кв</p>       

<p>   1 500 000&nbsp;руб.   </p>', '0', '0', '', '0', '0', '3');
INSERT INTO `eboard_db`(`id`, `ip`, `uid`, `cat`, `region`, `date_add`, `date_del`, `user_id`, `status`, `sendmail`, `approved`, `sort`, `email`, `user`, `title`, `text`, `marked`, `raised`, `date_raised`, `block`, `active`, `counter`) VALUES ('140', '95.215.45.75', 'b6450c775d3c032d3529f210e8b07833', '178', '120', '1517914380', '1520506380', '', '1', '1', '1', '10000000', 'i@board.ural56.ru', 'Мария', 'Продам  дом     
1-этажный дом 79 м²  ( пеноблоки )  на участке 5 сот.  , в черте города', '<p>Дома, дачи, коттеджи </p>
  <p>Продам большой теплый дом в р-не Тбилиской. Хороший ремонт, просторные комнаты,2-х этажный гараж, облагороженный двор и участок. Все коммуникации проведены.Школа, садик, остановка, магазины, рынок в шаговой доступности.</p>       

<p>   2 500 000&nbsp;руб.   </p>', '0', '0', '', '0', '0', '4');
INSERT INTO `eboard_db`(`id`, `ip`, `uid`, `cat`, `region`, `date_add`, `date_del`, `user_id`, `status`, `sendmail`, `approved`, `sort`, `email`, `user`, `title`, `text`, `marked`, `raised`, `date_raised`, `block`, `active`, `counter`) VALUES ('141', '95.215.45.75', 'e89a7acdd27c5b0b2809c78289151745', '178', '120', '1517911500', '1520503500', '', '1', '1', '1', '10000000', 'i@board.ural56.ru', 'Холомова Анастасия', 'Продам  дом     
1-этажный дом 47 м²  ( экспериментальные материалы )  на участке 7 сот.  , в черте города', '<p>Дома, дачи, коттеджи </p>
  <p>Продам дом в старом городе. Дом набивной. Две комнаты, коридор, кухня. Шпальный пристрой. Большой участок. Все в собственности. Прописанных нет. Вся инфраструктура в шаговой доступности. </p><p>Так же можем предложить соседний дом с ремонтом 43 кв.м. Цена 1 300 000.</p>       

<p>   750 000&nbsp;руб.   </p>', '0', '0', '', '0', '0', '2');
INSERT INTO `eboard_db`(`id`, `ip`, `uid`, `cat`, `region`, `date_add`, `date_del`, `user_id`, `status`, `sendmail`, `approved`, `sort`, `email`, `user`, `title`, `text`, `marked`, `raised`, `date_raised`, `block`, `active`, `counter`) VALUES ('142', '95.215.45.75', '6f5f4c63294c890ef64cb89ec443be55', '178', '120', '1517911440', '1520503440', '', '1', '1', '1', '10000000', 'i@board.ural56.ru', 'Холомова Анастасия', 'Продам  дом     
1-этажный дом 50 м²  ( экспериментальные материалы )  на участке 4 сот.  , в черте города', '<p>Дома, дачи, коттеджи </p>
  <p>Продам дом в советском районе (ост. школа. ) В доме 3 комнаты, большая кухня, санузел в доме, вода центральная, отопление газ, электричество. Установлены приборы учета. Во дворе есть гараж, сарай.</p>       

<p>   1 050 000&nbsp;руб.   </p>', '0', '0', '', '0', '0', '3');
INSERT INTO `eboard_db`(`id`, `ip`, `uid`, `cat`, `region`, `date_add`, `date_del`, `user_id`, `status`, `sendmail`, `approved`, `sort`, `email`, `user`, `title`, `text`, `marked`, `raised`, `date_raised`, `block`, `active`, `counter`) VALUES ('143', '95.215.45.75', 'c6c433154e96379e4d99cc2a1f4d2666', '178', '120', '1517911140', '1520503140', '', '1', '1', '1', '10000000', 'i@board.ural56.ru', 'Падалко Мария', 'Продам  дом     
1-этажный дом 60 м²  ( экспериментальные материалы )  на участке 2 сот.  , в черте города', '<p>Дома, дачи, коттеджи </p>
  <p>Продам дом мансардного типа в р-не Женского монастыря.Все коммуникации проведены.Просторная и светлая комната,просторный с/у в красивом кафеле,кухня Мечта-Хозяйки 16кв.м..На втором этаже есть возможность обустроить комнату либо спорт зал.Остановка,магазины в шаговой доступности.</p>       

<p>   830 000&nbsp;руб.   </p>', '0', '0', '', '0', '0', '5');
INSERT INTO `eboard_db`(`id`, `ip`, `uid`, `cat`, `region`, `date_add`, `date_del`, `user_id`, `status`, `sendmail`, `approved`, `sort`, `email`, `user`, `title`, `text`, `marked`, `raised`, `date_raised`, `block`, `active`, `counter`) VALUES ('144', '95.215.45.75', 'cd1943696676798cf4b9a346a297d357', '178', '120', '1517824440', '1520416440', '', '1', '1', '1', '10000000', 'i@board.ural56.ru', 'Оксана', 'Продам  дом     
1-этажный дом 42.6 м²  ( брус )  на участке 17 сот.  , в черте города', '<p>Дома, дачи, коттеджи </p>
  <p>Продаётся жилой  дом в центре города , тёплый и  уютный . Новый ремонт . Дом отделан и утеплён  . Дом состоит из 3 комнат жилая 38 . Крыша новая . Проведена холодная вода и  горячая есть . В доме все коммуникации  проведены . Есть в доме сан узел , сделан слив под стиральную машину . ОГВ отопление . Продам частично с мебелью . А также большой земельный участок 1730,0кв.м . Есть рядом с домом крытая парковка  под легковой автомобиль . А так же есть летняя кухня в которой проведён газ . ТОРГ УМЕСТЕН .</p>       

<p>   1 400 000&nbsp;руб.   </p>', '0', '0', '', '0', '0', '3');
INSERT INTO `eboard_db`(`id`, `ip`, `uid`, `cat`, `region`, `date_add`, `date_del`, `user_id`, `status`, `sendmail`, `approved`, `sort`, `email`, `user`, `title`, `text`, `marked`, `raised`, `date_raised`, `block`, `active`, `counter`) VALUES ('145', '95.215.45.75', '8d29e9d46b89d8fd2845c6ff7c49e0cf', '178', '120', '1517911020', '1520503020', '', '1', '1', '1', '10000000', 'i@board.ural56.ru', 'Падалко Мария', 'Продам  дом     
1-этажный дом 63 м²  ( пеноблоки )  на участке 5 сот.  , в черте города', '<p>Дома, дачи, коттеджи </p>
  <p>Продам дом в р-не Тагильской. Большой двор, облагороженный участок, хороший гараж. Все коммуникации проведены(скважина, местная канализация)Остановка, школа, магазины в шаговой доступности.</p>       

<p>   1 650 000&nbsp;руб.   </p>', '0', '0', '', '0', '0', '2');
INSERT INTO `eboard_db`(`id`, `ip`, `uid`, `cat`, `region`, `date_add`, `date_del`, `user_id`, `status`, `sendmail`, `approved`, `sort`, `email`, `user`, `title`, `text`, `marked`, `raised`, `date_raised`, `block`, `active`, `counter`) VALUES ('146', '95.215.45.75', '9180a95957ce6d197494021d646ef61d', '178', '120', '1517846160', '1520438160', '', '1', '1', '1', '10000000', 'i@board.ural56.ru', '-', 'Продам  дом     
1-этажный дом 112 м²  ( бревно )  на участке 10 сот.  , в черте города', '<p>Дома, дачи, коттеджи </p>
  <p>СРОЧНО! ТОРГ! Дом разделен на две половины, что позволяет комфортно проживать двум семьям (принадлежит одному хозяину).  В доме 2 входа, 2 кухни, 4 жилых комнаты, небольшой тренажерный зал, кладовая. Во дворе замечательная баня на дровах, парная сухая и жаркая, помещение для водных процедур отдельно, большой предбанник с зоной отдыха. На приусадебном участке находятся плодоносящие деревья: груши, яблони,  абрикосы с рекордными урожаями, плантация клубники, малины, винограда  и т.д.  Капитальная теплица.  На территории дома имеется 2 гаража, один для легкового автомобиля, второй большой капитальный гараж на две машины. В шаговой доступности детский сад, школа с современным стадионом, рынок, филиал сбербанка, магазины.</p>       

<p>   3 300 000&nbsp;руб.   </p>', '0', '0', '', '0', '0', '3');


DROP TABLE IF EXISTS `eboard_db_disabled`;
CREATE TABLE `eboard_db_disabled` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user` int(11) NOT NULL,
  `message` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS `eboard_db_fields`;
CREATE TABLE `eboard_db_fields` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `message` int(11) NOT NULL,
  `field` int(11) NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ind` (`message`,`field`),
  FULLTEXT KEY `txt` (`value`)
) ENGINE=MyISAM AUTO_INCREMENT=1333 DEFAULT CHARSET=utf8;

INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('1', '1', '475', '+7 987 884-70-17');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('2', '1', '477', 'ул Огородная, 31');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('3', '1', '481', '900000');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('8', '2', '475', '+7 937 202-64-56');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('9', '2', '477', 'Орск, улица Экологическая, д.6, кв.18.');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('10', '2', '481', '820000');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('20', '3', '475', '+7 905 882-70-27');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('21', '3', '477', 'ул Олимпийская, 30');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('22', '3', '481', '660000');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('27', '4', '475', '+7 919 858-12-15');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('28', '4', '477', 'Крамоторская 17');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('29', '4', '481', '1300000');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('40', '5', '475', '+7 909 975-02-09');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('41', '5', '477', 'ул Омская, 73');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('42', '5', '481', '655000');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('47', '6', '475', '+7 906 830-42-92');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('48', '6', '477', 'ул.Ялтинская74');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('49', '6', '481', '650000');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('50', '6', '483', '6_f_483_prodam-kvartiru---1-k-kvartira-29-m-na-6-etazhe-9-etazhnogo-kirpichnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('51', '6', '484', '6_f_484_prodam-kvartiru---1-k-kvartira-29-m-na-6-etazhe-9-etazhnogo-kirpichnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('52', '6', '485', '6_f_485_prodam-kvartiru---1-k-kvartira-29-m-na-6-etazhe-9-etazhnogo-kirpichnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('53', '6', '486', '6_f_486_prodam-kvartiru---1-k-kvartira-29-m-na-6-etazhe-9-etazhnogo-kirpichnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('54', '6', '487', '6_f_487_prodam-kvartiru---1-k-kvartira-29-m-na-6-etazhe-9-etazhnogo-kirpichnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('55', '6', '488', '6_f_488_prodam-kvartiru---1-k-kvartira-29-m-na-6-etazhe-9-etazhnogo-kirpichnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('56', '7', '475', '+7 905 882-70-27');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('57', '7', '477', 'ул Макаренко, 10');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('58', '7', '481', '680000');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('59', '7', '483', '7_f_483_prodam-kvartiru---1-k-kvartira-30.9-m-na-5-etazhe-5-etazhnogo-blochnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('60', '7', '484', '7_f_484_prodam-kvartiru---1-k-kvartira-30.9-m-na-5-etazhe-5-etazhnogo-blochnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('61', '7', '485', '7_f_485_prodam-kvartiru---1-k-kvartira-30.9-m-na-5-etazhe-5-etazhnogo-blochnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('62', '7', '486', '7_f_486_prodam-kvartiru---1-k-kvartira-30.9-m-na-5-etazhe-5-etazhnogo-blochnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('63', '7', '487', '7_f_487_prodam-kvartiru---1-k-kvartira-30.9-m-na-5-etazhe-5-etazhnogo-blochnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('64', '8', '475', '+7 905 813-65-72');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('65', '8', '477', 'ул Пацаева, 12А');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('66', '8', '481', '900000');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('67', '8', '483', '8_f_483_prodam-kvartiru---1-k-kvartira-31-m-na-7-etazhe-9-etazhnogo-panelnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('68', '8', '484', '8_f_484_prodam-kvartiru---1-k-kvartira-31-m-na-7-etazhe-9-etazhnogo-panelnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('69', '8', '485', '8_f_485_prodam-kvartiru---1-k-kvartira-31-m-na-7-etazhe-9-etazhnogo-panelnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('70', '8', '486', '8_f_486_prodam-kvartiru---1-k-kvartira-31-m-na-7-etazhe-9-etazhnogo-panelnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('71', '8', '487', '8_f_487_prodam-kvartiru---1-k-kvartira-31-m-na-7-etazhe-9-etazhnogo-panelnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('72', '9', '475', '+7 987 550-50-15');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('73', '9', '477', 'ул Добровольского, 8А');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('74', '9', '481', '770000');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('75', '9', '483', '9_f_483_prodam-kvartiru---1-k-kvartira-30.1-m-na-1-etazhe-5-etazhnogo-panelnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('76', '9', '484', '9_f_484_prodam-kvartiru---1-k-kvartira-30.1-m-na-1-etazhe-5-etazhnogo-panelnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('77', '9', '485', '9_f_485_prodam-kvartiru---1-k-kvartira-30.1-m-na-1-etazhe-5-etazhnogo-panelnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('78', '9', '486', '9_f_486_prodam-kvartiru---1-k-kvartira-30.1-m-na-1-etazhe-5-etazhnogo-panelnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('79', '9', '487', '9_f_487_prodam-kvartiru---1-k-kvartira-30.1-m-na-1-etazhe-5-etazhnogo-panelnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('80', '9', '488', '9_f_488_prodam-kvartiru---1-k-kvartira-30.1-m-na-1-etazhe-5-etazhnogo-panelnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('81', '9', '489', '9_f_489_prodam-kvartiru---1-k-kvartira-30.1-m-na-1-etazhe-5-etazhnogo-panelnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('82', '9', '490', '9_f_490_prodam-kvartiru---1-k-kvartira-30.1-m-na-1-etazhe-5-etazhnogo-panelnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('83', '9', '491', '9_f_491_prodam-kvartiru---1-k-kvartira-30.1-m-na-1-etazhe-5-etazhnogo-panelnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('84', '9', '492', '9_f_492_prodam-kvartiru---1-k-kvartira-30.1-m-na-1-etazhe-5-etazhnogo-panelnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('85', '10', '475', '+7 909 611-13-08');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('86', '10', '477', 'Квартальный проезд 14');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('87', '10', '481', '780000');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('88', '10', '483', '10_f_483_prodam-kvartiru---1-k-kvartira-31-m-na-4-etazhe-5-etazhnogo-panelnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('89', '10', '484', '10_f_484_prodam-kvartiru---1-k-kvartira-31-m-na-4-etazhe-5-etazhnogo-panelnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('90', '10', '485', '10_f_485_prodam-kvartiru---1-k-kvartira-31-m-na-4-etazhe-5-etazhnogo-panelnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('91', '10', '486', '10_f_486_prodam-kvartiru---1-k-kvartira-31-m-na-4-etazhe-5-etazhnogo-panelnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('92', '10', '487', '10_f_487_prodam-kvartiru---1-k-kvartira-31-m-na-4-etazhe-5-etazhnogo-panelnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('93', '10', '488', '10_f_488_prodam-kvartiru---1-k-kvartira-31-m-na-4-etazhe-5-etazhnogo-panelnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('94', '10', '489', '10_f_489_prodam-kvartiru---1-k-kvartira-31-m-na-4-etazhe-5-etazhnogo-panelnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('95', '10', '490', '10_f_490_prodam-kvartiru---1-k-kvartira-31-m-na-4-etazhe-5-etazhnogo-panelnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('96', '10', '491', '10_f_491_prodam-kvartiru---1-k-kvartira-31-m-na-4-etazhe-5-etazhnogo-panelnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('97', '10', '492', '10_f_492_prodam-kvartiru---1-k-kvartira-31-m-na-4-etazhe-5-etazhnogo-panelnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('98', '11', '475', '+7 905 473-62-41');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('99', '11', '477', 'ул. Комарова д.1');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('100', '11', '481', '800000');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('101', '11', '483', '11_f_483_prodam-kvartiru---1-k-kvartira-36-m-na-2-etazhe-9-etazhnogo-kirpichnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('102', '11', '484', '11_f_484_prodam-kvartiru---1-k-kvartira-36-m-na-2-etazhe-9-etazhnogo-kirpichnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('103', '11', '485', '11_f_485_prodam-kvartiru---1-k-kvartira-36-m-na-2-etazhe-9-etazhnogo-kirpichnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('104', '11', '486', '11_f_486_prodam-kvartiru---1-k-kvartira-36-m-na-2-etazhe-9-etazhnogo-kirpichnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('105', '11', '487', '11_f_487_prodam-kvartiru---1-k-kvartira-36-m-na-2-etazhe-9-etazhnogo-kirpichnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('106', '12', '475', '+7 905 846-15-45');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('107', '12', '477', 'Ленина пр-кт, 116');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('108', '12', '481', '800000');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('109', '12', '483', '12_f_483_prodam-kvartiru-v-novostroike---1-k-kvartira-34-m-na-8-etazhe-9-etazhnogo-kirpichnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('110', '12', '484', '12_f_484_prodam-kvartiru-v-novostroike---1-k-kvartira-34-m-na-8-etazhe-9-etazhnogo-kirpichnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('111', '12', '485', '12_f_485_prodam-kvartiru-v-novostroike---1-k-kvartira-34-m-na-8-etazhe-9-etazhnogo-kirpichnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('112', '12', '486', '12_f_486_prodam-kvartiru-v-novostroike---1-k-kvartira-34-m-na-8-etazhe-9-etazhnogo-kirpichnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('113', '12', '487', '12_f_487_prodam-kvartiru-v-novostroike---1-k-kvartira-34-m-na-8-etazhe-9-etazhnogo-kirpichnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('114', '12', '488', '12_f_488_prodam-kvartiru-v-novostroike---1-k-kvartira-34-m-na-8-etazhe-9-etazhnogo-kirpichnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('115', '12', '489', '12_f_489_prodam-kvartiru-v-novostroike---1-k-kvartira-34-m-na-8-etazhe-9-etazhnogo-kirpichnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('116', '12', '490', '12_f_490_prodam-kvartiru-v-novostroike---1-k-kvartira-34-m-na-8-etazhe-9-etazhnogo-kirpichnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('117', '12', '491', '12_f_491_prodam-kvartiru-v-novostroike---1-k-kvartira-34-m-na-8-etazhe-9-etazhnogo-kirpichnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('118', '13', '475', '+7 905 897-34-53');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('119', '13', '477', 'ул Омская, 63');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('120', '13', '481', '680000');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('121', '13', '483', '13_f_483_prodam-kvartiru---1-k-kvartira-34-m-na-4-etazhe-5-etazhnogo-kirpichnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('122', '13', '484', '13_f_484_prodam-kvartiru---1-k-kvartira-34-m-na-4-etazhe-5-etazhnogo-kirpichnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('123', '13', '485', '13_f_485_prodam-kvartiru---1-k-kvartira-34-m-na-4-etazhe-5-etazhnogo-kirpichnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('124', '14', '475', '+7 905 896-40-43');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('125', '14', '477', 'Театральный пер, 13');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('126', '14', '481', '780000');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('127', '14', '483', '14_f_483_prodam-kvartiru---1-k-kvartira-31.7-m-na-2-etazhe-5-etazhnogo-kirpichnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('128', '14', '484', '14_f_484_prodam-kvartiru---1-k-kvartira-31.7-m-na-2-etazhe-5-etazhnogo-kirpichnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('129', '14', '485', '14_f_485_prodam-kvartiru---1-k-kvartira-31.7-m-na-2-etazhe-5-etazhnogo-kirpichnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('130', '14', '486', '14_f_486_prodam-kvartiru---1-k-kvartira-31.7-m-na-2-etazhe-5-etazhnogo-kirpichnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('131', '14', '487', '14_f_487_prodam-kvartiru---1-k-kvartira-31.7-m-na-2-etazhe-5-etazhnogo-kirpichnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('132', '14', '488', '14_f_488_prodam-kvartiru---1-k-kvartira-31.7-m-na-2-etazhe-5-etazhnogo-kirpichnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('133', '15', '475', '+7 987 840-71-90');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('134', '15', '477', 'ул Пацаева, 17');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('135', '15', '481', '800000');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('136', '15', '483', '15_f_483_prodam-kvartiru---1-k-kvartira-33.4-m-na-6-etazhe-9-etazhnogo-panelnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('137', '15', '484', '15_f_484_prodam-kvartiru---1-k-kvartira-33.4-m-na-6-etazhe-9-etazhnogo-panelnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('138', '15', '485', '15_f_485_prodam-kvartiru---1-k-kvartira-33.4-m-na-6-etazhe-9-etazhnogo-panelnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('139', '15', '486', '15_f_486_prodam-kvartiru---1-k-kvartira-33.4-m-na-6-etazhe-9-etazhnogo-panelnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('140', '15', '487', '15_f_487_prodam-kvartiru---1-k-kvartira-33.4-m-na-6-etazhe-9-etazhnogo-panelnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('141', '15', '488', '15_f_488_prodam-kvartiru---1-k-kvartira-33.4-m-na-6-etazhe-9-etazhnogo-panelnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('142', '15', '489', '15_f_489_prodam-kvartiru---1-k-kvartira-33.4-m-na-6-etazhe-9-etazhnogo-panelnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('143', '15', '490', '15_f_490_prodam-kvartiru---1-k-kvartira-33.4-m-na-6-etazhe-9-etazhnogo-panelnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('144', '15', '491', '15_f_491_prodam-kvartiru---1-k-kvartira-33.4-m-na-6-etazhe-9-etazhnogo-panelnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('145', '15', '492', '15_f_492_prodam-kvartiru---1-k-kvartira-33.4-m-na-6-etazhe-9-etazhnogo-panelnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('146', '16', '475', '+7 905 897-95-90');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('147', '16', '477', 'ул Ломоносова, 2А');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('148', '16', '481', '800000');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('149', '16', '483', '16_f_483_prodam-kvartiru---1-k-kvartira-32-m-na-4-etazhe-5-etazhnogo-panelnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('150', '16', '484', '16_f_484_prodam-kvartiru---1-k-kvartira-32-m-na-4-etazhe-5-etazhnogo-panelnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('151', '16', '485', '16_f_485_prodam-kvartiru---1-k-kvartira-32-m-na-4-etazhe-5-etazhnogo-panelnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('152', '16', '486', '16_f_486_prodam-kvartiru---1-k-kvartira-32-m-na-4-etazhe-5-etazhnogo-panelnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('153', '16', '487', '16_f_487_prodam-kvartiru---1-k-kvartira-32-m-na-4-etazhe-5-etazhnogo-panelnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('154', '16', '488', '16_f_488_prodam-kvartiru---1-k-kvartira-32-m-na-4-etazhe-5-etazhnogo-panelnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('155', '16', '489', '16_f_489_prodam-kvartiru---1-k-kvartira-32-m-na-4-etazhe-5-etazhnogo-panelnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('156', '16', '490', '16_f_490_prodam-kvartiru---1-k-kvartira-32-m-na-4-etazhe-5-etazhnogo-panelnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('157', '16', '491', '16_f_491_prodam-kvartiru---1-k-kvartira-32-m-na-4-etazhe-5-etazhnogo-panelnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('158', '16', '492', '16_f_492_prodam-kvartiru---1-k-kvartira-32-m-na-4-etazhe-5-etazhnogo-panelnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('159', '17', '475', '+7 987 345-03-16');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('160', '17', '477', 'ул Вяземская');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('161', '17', '481', '670000');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('162', '17', '483', '17_f_483_prodam-kvartiru---1-k-kvartira-32-m-na-4-etazhe-5-etazhnogo-panelnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('163', '17', '484', '17_f_484_prodam-kvartiru---1-k-kvartira-32-m-na-4-etazhe-5-etazhnogo-panelnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('164', '17', '485', '17_f_485_prodam-kvartiru---1-k-kvartira-32-m-na-4-etazhe-5-etazhnogo-panelnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('165', '17', '486', '17_f_486_prodam-kvartiru---1-k-kvartira-32-m-na-4-etazhe-5-etazhnogo-panelnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('166', '18', '475', '+7 906 849-29-29');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('167', '18', '477', 'ул Станиславского');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('168', '18', '481', '870000');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('169', '18', '483', '18_f_483_prodam-kvartiru---1-k-kvartira-29-m-na-1-etazhe-9-etazhnogo-kirpichnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('170', '18', '484', '18_f_484_prodam-kvartiru---1-k-kvartira-29-m-na-1-etazhe-9-etazhnogo-kirpichnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('171', '18', '485', '18_f_485_prodam-kvartiru---1-k-kvartira-29-m-na-1-etazhe-9-etazhnogo-kirpichnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('172', '18', '486', '18_f_486_prodam-kvartiru---1-k-kvartira-29-m-na-1-etazhe-9-etazhnogo-kirpichnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('173', '18', '487', '18_f_487_prodam-kvartiru---1-k-kvartira-29-m-na-1-etazhe-9-etazhnogo-kirpichnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('174', '18', '488', '18_f_488_prodam-kvartiru---1-k-kvartira-29-m-na-1-etazhe-9-etazhnogo-kirpichnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('175', '18', '489', '18_f_489_prodam-kvartiru---1-k-kvartira-29-m-na-1-etazhe-9-etazhnogo-kirpichnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('176', '18', '490', '18_f_490_prodam-kvartiru---1-k-kvartira-29-m-na-1-etazhe-9-etazhnogo-kirpichnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('177', '18', '491', '18_f_491_prodam-kvartiru---1-k-kvartira-29-m-na-1-etazhe-9-etazhnogo-kirpichnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('178', '19', '475', '+7 911 125-78-28');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('179', '19', '477', 'Кубанская ул');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('180', '19', '481', '680000');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('181', '19', '483', '19_f_483_prodam-kvartiru---1-k-kvartira-27-m-na-3-etazhe-5-etazhnogo-kirpichnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('182', '19', '484', '19_f_484_prodam-kvartiru---1-k-kvartira-27-m-na-3-etazhe-5-etazhnogo-kirpichnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('183', '19', '485', '19_f_485_prodam-kvartiru---1-k-kvartira-27-m-na-3-etazhe-5-etazhnogo-kirpichnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('184', '19', '486', '19_f_486_prodam-kvartiru---1-k-kvartira-27-m-na-3-etazhe-5-etazhnogo-kirpichnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('185', '19', '487', '19_f_487_prodam-kvartiru---1-k-kvartira-27-m-na-3-etazhe-5-etazhnogo-kirpichnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('186', '19', '488', '19_f_488_prodam-kvartiru---1-k-kvartira-27-m-na-3-etazhe-5-etazhnogo-kirpichnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('187', '19', '489', '19_f_489_prodam-kvartiru---1-k-kvartira-27-m-na-3-etazhe-5-etazhnogo-kirpichnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('188', '19', '490', '19_f_490_prodam-kvartiru---1-k-kvartira-27-m-na-3-etazhe-5-etazhnogo-kirpichnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('189', '19', '491', '19_f_491_prodam-kvartiru---1-k-kvartira-27-m-na-3-etazhe-5-etazhnogo-kirpichnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('190', '19', '492', '19_f_492_prodam-kvartiru---1-k-kvartira-27-m-na-3-etazhe-5-etazhnogo-kirpichnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('191', '20', '475', '+7 987 883-89-14');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('192', '20', '477', 'Кишиневский пер');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('193', '20', '481', '600000');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('194', '20', '483', '20_f_483_prodam-kvartiru---1-k-kvartira-33-m-na-1-etazhe-3-etazhnogo-kirpichnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('195', '20', '484', '20_f_484_prodam-kvartiru---1-k-kvartira-33-m-na-1-etazhe-3-etazhnogo-kirpichnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('196', '20', '485', '20_f_485_prodam-kvartiru---1-k-kvartira-33-m-na-1-etazhe-3-etazhnogo-kirpichnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('197', '21', '475', '+7 902 248-18-92');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('198', '21', '477', 'Сарматский пер, 5');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('199', '21', '481', '800000');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('200', '21', '483', '21_f_483_prodam-kvartiru---1-k-kvartira-31-m-na-2-etazhe-5-etazhnogo-kirpichnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('201', '21', '484', '21_f_484_prodam-kvartiru---1-k-kvartira-31-m-na-2-etazhe-5-etazhnogo-kirpichnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('202', '21', '485', '21_f_485_prodam-kvartiru---1-k-kvartira-31-m-na-2-etazhe-5-etazhnogo-kirpichnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('203', '21', '486', '21_f_486_prodam-kvartiru---1-k-kvartira-31-m-na-2-etazhe-5-etazhnogo-kirpichnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('204', '21', '487', '21_f_487_prodam-kvartiru---1-k-kvartira-31-m-na-2-etazhe-5-etazhnogo-kirpichnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('205', '21', '488', '21_f_488_prodam-kvartiru---1-k-kvartira-31-m-na-2-etazhe-5-etazhnogo-kirpichnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('206', '21', '489', '21_f_489_prodam-kvartiru---1-k-kvartira-31-m-na-2-etazhe-5-etazhnogo-kirpichnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('207', '21', '490', '21_f_490_prodam-kvartiru---1-k-kvartira-31-m-na-2-etazhe-5-etazhnogo-kirpichnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('208', '21', '491', '21_f_491_prodam-kvartiru---1-k-kvartira-31-m-na-2-etazhe-5-etazhnogo-kirpichnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('209', '21', '492', '21_f_492_prodam-kvartiru---1-k-kvartira-31-m-na-2-etazhe-5-etazhnogo-kirpichnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('210', '22', '475', '+7 952 510-95-02');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('211', '22', '477', 'Россия, Оренбургская область, Орск, микрорайон Новый город, Новосибирская улица, 40');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('212', '22', '481', '630000');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('213', '22', '483', '22_f_483_prodam-kvartiru---1-k-kvartira-33-m-na-5-etazhe-5-etazhnogo-panelnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('214', '22', '484', '22_f_484_prodam-kvartiru---1-k-kvartira-33-m-na-5-etazhe-5-etazhnogo-panelnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('215', '22', '485', '22_f_485_prodam-kvartiru---1-k-kvartira-33-m-na-5-etazhe-5-etazhnogo-panelnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('216', '22', '486', '22_f_486_prodam-kvartiru---1-k-kvartira-33-m-na-5-etazhe-5-etazhnogo-panelnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('217', '22', '487', '22_f_487_prodam-kvartiru---1-k-kvartira-33-m-na-5-etazhe-5-etazhnogo-panelnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('218', '22', '488', '22_f_488_prodam-kvartiru---1-k-kvartira-33-m-na-5-etazhe-5-etazhnogo-panelnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('219', '22', '489', '22_f_489_prodam-kvartiru---1-k-kvartira-33-m-na-5-etazhe-5-etazhnogo-panelnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('220', '23', '475', '+7 982 704-30-90');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('221', '23', '477', 'Оренбургская область, Орск, Крайняя улица, 44А');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('222', '23', '481', '820000');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('223', '23', '483', '23_f_483_prodam-kvartiru---1-k-kvartira-35-m-na-8-etazhe-9-etazhnogo-panelnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('224', '23', '484', '23_f_484_prodam-kvartiru---1-k-kvartira-35-m-na-8-etazhe-9-etazhnogo-panelnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('225', '23', '485', '23_f_485_prodam-kvartiru---1-k-kvartira-35-m-na-8-etazhe-9-etazhnogo-panelnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('226', '23', '486', '23_f_486_prodam-kvartiru---1-k-kvartira-35-m-na-8-etazhe-9-etazhnogo-panelnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('227', '23', '487', '23_f_487_prodam-kvartiru---1-k-kvartira-35-m-na-8-etazhe-9-etazhnogo-panelnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('228', '23', '488', '23_f_488_prodam-kvartiru---1-k-kvartira-35-m-na-8-etazhe-9-etazhnogo-panelnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('229', '24', '475', '+7 906 848-41-46');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('230', '24', '477', 'челябинская 10 а');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('231', '24', '481', '610000');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('236', '25', '475', '+7 987 347-31-63');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('237', '25', '477', 'ул Добровольского, 21');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('238', '25', '481', '800000');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('247', '26', '475', '+7 987 845-78-98');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('248', '26', '477', 'ул Комарова, 24');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('249', '26', '481', '730000');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('253', '27', '475', '+7 919 853-52-18');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('254', '27', '477', 'ул Медногорская, 15Б');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('255', '27', '481', '750000');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('261', '28', '475', '+7 909 606-47-79');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('262', '28', '477', 'Ленина пр-кт, 84');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('263', '28', '481', '720000');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('271', '29', '475', '+7 950 188-11-95');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('272', '29', '477', 'ул Беляева, 2');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('273', '29', '481', '965000');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('277', '30', '475', '+7 961 921-44-69');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('278', '30', '477', 'ул Пржевальского 1 А');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('279', '30', '481', '690000');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('286', '31', '475', '+7 961 906-96-32');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('287', '31', '477', 'ул Короленко, 142А');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('288', '31', '481', '1190000');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('289', '31', '483', '31_f_483_prodam-kvartiru---2-k-kvartira-46-m-na-5-etazhe-5-etazhnogo-panelnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('290', '31', '484', '31_f_484_prodam-kvartiru---2-k-kvartira-46-m-na-5-etazhe-5-etazhnogo-panelnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('291', '31', '485', '31_f_485_prodam-kvartiru---2-k-kvartira-46-m-na-5-etazhe-5-etazhnogo-panelnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('292', '31', '486', '31_f_486_prodam-kvartiru---2-k-kvartira-46-m-na-5-etazhe-5-etazhnogo-panelnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('293', '31', '487', '31_f_487_prodam-kvartiru---2-k-kvartira-46-m-na-5-etazhe-5-etazhnogo-panelnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('294', '31', '488', '31_f_488_prodam-kvartiru---2-k-kvartira-46-m-na-5-etazhe-5-etazhnogo-panelnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('295', '31', '489', '31_f_489_prodam-kvartiru---2-k-kvartira-46-m-na-5-etazhe-5-etazhnogo-panelnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('296', '32', '475', '+7 905 897-39-65');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('297', '32', '477', 'проспект Ленина, 2');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('298', '32', '481', '870000');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('299', '33', '475', '+7 919 864-27-29');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('300', '33', '477', 'Ленина пр-кт, 42');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('301', '33', '481', '1600000');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('302', '33', '483', '33_f_483_prodam-kvartiru---2-k-kvartira-59-m-na-4-etazhe-5-etazhnogo-kirpichnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('303', '33', '484', '33_f_484_prodam-kvartiru---2-k-kvartira-59-m-na-4-etazhe-5-etazhnogo-kirpichnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('304', '33', '485', '33_f_485_prodam-kvartiru---2-k-kvartira-59-m-na-4-etazhe-5-etazhnogo-kirpichnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('305', '33', '486', '33_f_486_prodam-kvartiru---2-k-kvartira-59-m-na-4-etazhe-5-etazhnogo-kirpichnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('306', '33', '487', '33_f_487_prodam-kvartiru---2-k-kvartira-59-m-na-4-etazhe-5-etazhnogo-kirpichnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('307', '34', '475', '+7 987 884-70-17');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('308', '34', '477', 'ул Васнецова, 14');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('309', '34', '481', '1030000');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('310', '34', '483', '34_f_483_prodam-kvartiru---2-k-kvartira-43.7-m-na-5-etazhe-5-etazhnogo-panelnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('311', '34', '484', '34_f_484_prodam-kvartiru---2-k-kvartira-43.7-m-na-5-etazhe-5-etazhnogo-panelnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('312', '34', '485', '34_f_485_prodam-kvartiru---2-k-kvartira-43.7-m-na-5-etazhe-5-etazhnogo-panelnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('313', '34', '486', '34_f_486_prodam-kvartiru---2-k-kvartira-43.7-m-na-5-etazhe-5-etazhnogo-panelnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('314', '34', '487', '34_f_487_prodam-kvartiru---2-k-kvartira-43.7-m-na-5-etazhe-5-etazhnogo-panelnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('315', '34', '488', '34_f_488_prodam-kvartiru---2-k-kvartira-43.7-m-na-5-etazhe-5-etazhnogo-panelnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('316', '35', '475', '+7 922 544-45-27');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('317', '35', '477', 'ул Станционная, 12');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('318', '35', '481', '1050000');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('319', '35', '483', '35_f_483_prodam-kvartiru---2-k-kvartira-48.8-m-na-4-etazhe-5-etazhnogo-kirpichnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('320', '35', '484', '35_f_484_prodam-kvartiru---2-k-kvartira-48.8-m-na-4-etazhe-5-etazhnogo-kirpichnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('321', '35', '485', '35_f_485_prodam-kvartiru---2-k-kvartira-48.8-m-na-4-etazhe-5-etazhnogo-kirpichnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('322', '35', '486', '35_f_486_prodam-kvartiru---2-k-kvartira-48.8-m-na-4-etazhe-5-etazhnogo-kirpichnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('323', '35', '487', '35_f_487_prodam-kvartiru---2-k-kvartira-48.8-m-na-4-etazhe-5-etazhnogo-kirpichnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('324', '35', '488', '35_f_488_prodam-kvartiru---2-k-kvartira-48.8-m-na-4-etazhe-5-etazhnogo-kirpichnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('325', '35', '489', '35_f_489_prodam-kvartiru---2-k-kvartira-48.8-m-na-4-etazhe-5-etazhnogo-kirpichnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('326', '35', '490', '35_f_490_prodam-kvartiru---2-k-kvartira-48.8-m-na-4-etazhe-5-etazhnogo-kirpichnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('327', '35', '491', '35_f_491_prodam-kvartiru---2-k-kvartira-48.8-m-na-4-etazhe-5-etazhnogo-kirpichnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('328', '35', '492', '35_f_492_prodam-kvartiru---2-k-kvartira-48.8-m-na-4-etazhe-5-etazhnogo-kirpichnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('329', '36', '475', '+7 999 735-13-52');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('330', '36', '477', 'ул Макаренко д. 9');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('331', '36', '481', '1950000');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('332', '36', '483', '36_f_483_prodam-kvartiru---2-k-kvartira-60-m-na-1-etazhe-3-etazhnogo-kirpichnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('333', '36', '484', '36_f_484_prodam-kvartiru---2-k-kvartira-60-m-na-1-etazhe-3-etazhnogo-kirpichnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('334', '36', '485', '36_f_485_prodam-kvartiru---2-k-kvartira-60-m-na-1-etazhe-3-etazhnogo-kirpichnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('335', '36', '486', '36_f_486_prodam-kvartiru---2-k-kvartira-60-m-na-1-etazhe-3-etazhnogo-kirpichnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('336', '36', '487', '36_f_487_prodam-kvartiru---2-k-kvartira-60-m-na-1-etazhe-3-etazhnogo-kirpichnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('337', '36', '488', '36_f_488_prodam-kvartiru---2-k-kvartira-60-m-na-1-etazhe-3-etazhnogo-kirpichnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('338', '36', '489', '36_f_489_prodam-kvartiru---2-k-kvartira-60-m-na-1-etazhe-3-etazhnogo-kirpichnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('339', '36', '490', '36_f_490_prodam-kvartiru---2-k-kvartira-60-m-na-1-etazhe-3-etazhnogo-kirpichnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('340', '36', '491', '36_f_491_prodam-kvartiru---2-k-kvartira-60-m-na-1-etazhe-3-etazhnogo-kirpichnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('341', '37', '475', '+7 905 897-34-53');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('342', '37', '477', 'ул Медногорская, 20');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('343', '37', '481', '945000');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('344', '37', '483', '37_f_483_prodam-kvartiru---2-k-kvartira-43-m-na-2-etazhe-3-etazhnogo-kirpichnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('345', '38', '475', '+7 905 897-33-91');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('346', '38', '477', 'Вяземская 38А');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('347', '38', '481', '1200000');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('348', '38', '483', '38_f_483_prodam-kvartiru---2-k-kvartira-43-m-na-2-etazhe-5-etazhnogo-panelnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('349', '38', '484', '38_f_484_prodam-kvartiru---2-k-kvartira-43-m-na-2-etazhe-5-etazhnogo-panelnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('350', '38', '485', '38_f_485_prodam-kvartiru---2-k-kvartira-43-m-na-2-etazhe-5-etazhnogo-panelnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('351', '38', '486', '38_f_486_prodam-kvartiru---2-k-kvartira-43-m-na-2-etazhe-5-etazhnogo-panelnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('352', '38', '487', '38_f_487_prodam-kvartiru---2-k-kvartira-43-m-na-2-etazhe-5-etazhnogo-panelnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('353', '39', '475', '+7 906 839-36-00');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('354', '39', '477', 'Орский пр-кт, 35');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('355', '39', '481', '1050000');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('356', '39', '483', '39_f_483_prodam-kvartiru---2-k-kvartira-50.8-m-na-7-etazhe-9-etazhnogo-panelnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('357', '39', '484', '39_f_484_prodam-kvartiru---2-k-kvartira-50.8-m-na-7-etazhe-9-etazhnogo-panelnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('358', '39', '485', '39_f_485_prodam-kvartiru---2-k-kvartira-50.8-m-na-7-etazhe-9-etazhnogo-panelnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('359', '39', '486', '39_f_486_prodam-kvartiru---2-k-kvartira-50.8-m-na-7-etazhe-9-etazhnogo-panelnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('360', '39', '487', '39_f_487_prodam-kvartiru---2-k-kvartira-50.8-m-na-7-etazhe-9-etazhnogo-panelnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('361', '39', '488', '39_f_488_prodam-kvartiru---2-k-kvartira-50.8-m-na-7-etazhe-9-etazhnogo-panelnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('362', '39', '489', '39_f_489_prodam-kvartiru---2-k-kvartira-50.8-m-na-7-etazhe-9-etazhnogo-panelnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('363', '39', '490', '39_f_490_prodam-kvartiru---2-k-kvartira-50.8-m-na-7-etazhe-9-etazhnogo-panelnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('364', '39', '491', '39_f_491_prodam-kvartiru---2-k-kvartira-50.8-m-na-7-etazhe-9-etazhnogo-panelnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('365', '39', '492', '39_f_492_prodam-kvartiru---2-k-kvartira-50.8-m-na-7-etazhe-9-etazhnogo-panelnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('366', '40', '475', '+7 905 896-04-33');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('367', '40', '477', 'ул Пацаева, 15');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('368', '40', '481', '1400000');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('369', '40', '483', '40_f_483_prodam-kvartiru---2-k-kvartira-43-m-na-2-etazhe-9-etazhnogo-panelnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('370', '40', '484', '40_f_484_prodam-kvartiru---2-k-kvartira-43-m-na-2-etazhe-9-etazhnogo-panelnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('371', '40', '485', '40_f_485_prodam-kvartiru---2-k-kvartira-43-m-na-2-etazhe-9-etazhnogo-panelnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('372', '40', '486', '40_f_486_prodam-kvartiru---2-k-kvartira-43-m-na-2-etazhe-9-etazhnogo-panelnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('373', '40', '487', '40_f_487_prodam-kvartiru---2-k-kvartira-43-m-na-2-etazhe-9-etazhnogo-panelnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('374', '40', '488', '40_f_488_prodam-kvartiru---2-k-kvartira-43-m-na-2-etazhe-9-etazhnogo-panelnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('375', '40', '489', '40_f_489_prodam-kvartiru---2-k-kvartira-43-m-na-2-etazhe-9-etazhnogo-panelnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('376', '40', '490', '40_f_490_prodam-kvartiru---2-k-kvartira-43-m-na-2-etazhe-9-etazhnogo-panelnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('377', '40', '491', '40_f_491_prodam-kvartiru---2-k-kvartira-43-m-na-2-etazhe-9-etazhnogo-panelnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('378', '40', '492', '40_f_492_prodam-kvartiru---2-k-kvartira-43-m-na-2-etazhe-9-etazhnogo-panelnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('379', '41', '475', '+7 905 896-04-33');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('380', '41', '477', 'ул Ферганская, 6');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('381', '41', '481', '1650000');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('382', '41', '483', '41_f_483_prodam-kvartiru---2-k-kvartira-50.6-m-na-6-etazhe-9-etazhnogo-panelnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('383', '41', '484', '41_f_484_prodam-kvartiru---2-k-kvartira-50.6-m-na-6-etazhe-9-etazhnogo-panelnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('384', '41', '485', '41_f_485_prodam-kvartiru---2-k-kvartira-50.6-m-na-6-etazhe-9-etazhnogo-panelnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('385', '41', '486', '41_f_486_prodam-kvartiru---2-k-kvartira-50.6-m-na-6-etazhe-9-etazhnogo-panelnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('386', '41', '487', '41_f_487_prodam-kvartiru---2-k-kvartira-50.6-m-na-6-etazhe-9-etazhnogo-panelnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('387', '41', '488', '41_f_488_prodam-kvartiru---2-k-kvartira-50.6-m-na-6-etazhe-9-etazhnogo-panelnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('388', '41', '489', '41_f_489_prodam-kvartiru---2-k-kvartira-50.6-m-na-6-etazhe-9-etazhnogo-panelnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('389', '41', '490', '41_f_490_prodam-kvartiru---2-k-kvartira-50.6-m-na-6-etazhe-9-etazhnogo-panelnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('390', '41', '491', '41_f_491_prodam-kvartiru---2-k-kvartira-50.6-m-na-6-etazhe-9-etazhnogo-panelnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('391', '41', '492', '41_f_492_prodam-kvartiru---2-k-kvartira-50.6-m-na-6-etazhe-9-etazhnogo-panelnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('392', '42', '475', '+7 987 845-78-98');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('393', '42', '477', 'ул Шалина, 7А');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('394', '42', '481', '1400000');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('395', '42', '483', '42_f_483_prodam-kvartiru---3-k-kvartira-60.7-m-na-4-etazhe-5-etazhnogo-panelnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('396', '42', '484', '42_f_484_prodam-kvartiru---3-k-kvartira-60.7-m-na-4-etazhe-5-etazhnogo-panelnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('397', '42', '485', '42_f_485_prodam-kvartiru---3-k-kvartira-60.7-m-na-4-etazhe-5-etazhnogo-panelnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('398', '42', '486', '42_f_486_prodam-kvartiru---3-k-kvartira-60.7-m-na-4-etazhe-5-etazhnogo-panelnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('399', '42', '487', '42_f_487_prodam-kvartiru---3-k-kvartira-60.7-m-na-4-etazhe-5-etazhnogo-panelnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('400', '42', '488', '42_f_488_prodam-kvartiru---3-k-kvartira-60.7-m-na-4-etazhe-5-etazhnogo-panelnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('401', '42', '489', '42_f_489_prodam-kvartiru---3-k-kvartira-60.7-m-na-4-etazhe-5-etazhnogo-panelnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('402', '42', '490', '42_f_490_prodam-kvartiru---3-k-kvartira-60.7-m-na-4-etazhe-5-etazhnogo-panelnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('403', '43', '475', '+7 919 864-27-29');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('404', '43', '477', 'Нежинский пер, 13');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('405', '43', '481', '750000');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('406', '43', '483', '43_f_483_prodam-kvartiru---3-k-kvartira-60.3-m-na-5-etazhe-5-etazhnogo-kirpichnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('407', '44', '475', '+7 987 845-78-98');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('408', '44', '477', 'ул Достоевского, 14');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('409', '44', '481', '480000');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('410', '44', '483', '44_f_483_prodam-kvartiru---3-k-kvartira-70.6-m-na-1-etazhe-3-etazhnogo-blochnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('411', '45', '475', '+7 922 536-28-81');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('412', '45', '477', 'ул Попова, 4А');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('413', '45', '481', '1600000');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('414', '45', '483', '45_f_483_prodam-kvartiru---3-k-kvartira-63-m-na-6-etazhe-9-etazhnogo-panelnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('415', '45', '484', '45_f_484_prodam-kvartiru---3-k-kvartira-63-m-na-6-etazhe-9-etazhnogo-panelnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('416', '45', '485', '45_f_485_prodam-kvartiru---3-k-kvartira-63-m-na-6-etazhe-9-etazhnogo-panelnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('417', '45', '486', '45_f_486_prodam-kvartiru---3-k-kvartira-63-m-na-6-etazhe-9-etazhnogo-panelnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('418', '45', '487', '45_f_487_prodam-kvartiru---3-k-kvartira-63-m-na-6-etazhe-9-etazhnogo-panelnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('419', '45', '488', '45_f_488_prodam-kvartiru---3-k-kvartira-63-m-na-6-etazhe-9-etazhnogo-panelnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('420', '45', '489', '45_f_489_prodam-kvartiru---3-k-kvartira-63-m-na-6-etazhe-9-etazhnogo-panelnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('421', '45', '490', '45_f_490_prodam-kvartiru---3-k-kvartira-63-m-na-6-etazhe-9-etazhnogo-panelnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('422', '45', '491', '45_f_491_prodam-kvartiru---3-k-kvartira-63-m-na-6-etazhe-9-etazhnogo-panelnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('423', '45', '492', '45_f_492_prodam-kvartiru---3-k-kvartira-63-m-na-6-etazhe-9-etazhnogo-panelnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('424', '46', '475', '+7 922 621-41-65');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('425', '46', '477', 'Домбаровская 30');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('426', '46', '481', '1850000');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('427', '46', '483', '46_f_483_prodam-kvartiru---3-k-kvartira-57.7-m-na-1-etazhe-5-etazhnogo-panelnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('428', '46', '484', '46_f_484_prodam-kvartiru---3-k-kvartira-57.7-m-na-1-etazhe-5-etazhnogo-panelnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('429', '46', '485', '46_f_485_prodam-kvartiru---3-k-kvartira-57.7-m-na-1-etazhe-5-etazhnogo-panelnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('430', '46', '486', '46_f_486_prodam-kvartiru---3-k-kvartira-57.7-m-na-1-etazhe-5-etazhnogo-panelnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('431', '46', '487', '46_f_487_prodam-kvartiru---3-k-kvartira-57.7-m-na-1-etazhe-5-etazhnogo-panelnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('432', '46', '488', '46_f_488_prodam-kvartiru---3-k-kvartira-57.7-m-na-1-etazhe-5-etazhnogo-panelnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('433', '46', '489', '46_f_489_prodam-kvartiru---3-k-kvartira-57.7-m-na-1-etazhe-5-etazhnogo-panelnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('434', '46', '490', '46_f_490_prodam-kvartiru---3-k-kvartira-57.7-m-na-1-etazhe-5-etazhnogo-panelnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('435', '46', '491', '46_f_491_prodam-kvartiru---3-k-kvartira-57.7-m-na-1-etazhe-5-etazhnogo-panelnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('436', '46', '492', '46_f_492_prodam-kvartiru---3-k-kvartira-57.7-m-na-1-etazhe-5-etazhnogo-panelnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('437', '47', '475', '+7 903 365-17-51');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('438', '47', '477', 'ул Макаренко, 5А');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('439', '47', '481', '3050000');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('440', '47', '483', '47_f_483_prodam-kvartiru---3-k-kvartira-104-m-na-1-etazhe-3-etazhnogo-kirpichnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('441', '47', '484', '47_f_484_prodam-kvartiru---3-k-kvartira-104-m-na-1-etazhe-3-etazhnogo-kirpichnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('442', '47', '485', '47_f_485_prodam-kvartiru---3-k-kvartira-104-m-na-1-etazhe-3-etazhnogo-kirpichnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('443', '47', '486', '47_f_486_prodam-kvartiru---3-k-kvartira-104-m-na-1-etazhe-3-etazhnogo-kirpichnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('444', '47', '487', '47_f_487_prodam-kvartiru---3-k-kvartira-104-m-na-1-etazhe-3-etazhnogo-kirpichnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('445', '47', '488', '47_f_488_prodam-kvartiru---3-k-kvartira-104-m-na-1-etazhe-3-etazhnogo-kirpichnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('446', '47', '489', '47_f_489_prodam-kvartiru---3-k-kvartira-104-m-na-1-etazhe-3-etazhnogo-kirpichnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('447', '47', '490', '47_f_490_prodam-kvartiru---3-k-kvartira-104-m-na-1-etazhe-3-etazhnogo-kirpichnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('448', '47', '491', '47_f_491_prodam-kvartiru---3-k-kvartira-104-m-na-1-etazhe-3-etazhnogo-kirpichnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('449', '48', '475', '+7 903 365-17-51');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('450', '48', '477', 'Ленина пр-кт, 46');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('451', '48', '481', '2800000');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('452', '48', '483', '48_f_483_prodam-kvartiru---3-k-kvartira-65-m-na-3-etazhe-4-etazhnogo-blochnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('453', '48', '484', '48_f_484_prodam-kvartiru---3-k-kvartira-65-m-na-3-etazhe-4-etazhnogo-blochnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('454', '48', '485', '48_f_485_prodam-kvartiru---3-k-kvartira-65-m-na-3-etazhe-4-etazhnogo-blochnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('455', '48', '486', '48_f_486_prodam-kvartiru---3-k-kvartira-65-m-na-3-etazhe-4-etazhnogo-blochnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('456', '48', '487', '48_f_487_prodam-kvartiru---3-k-kvartira-65-m-na-3-etazhe-4-etazhnogo-blochnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('457', '48', '488', '48_f_488_prodam-kvartiru---3-k-kvartira-65-m-na-3-etazhe-4-etazhnogo-blochnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('458', '48', '489', '48_f_489_prodam-kvartiru---3-k-kvartira-65-m-na-3-etazhe-4-etazhnogo-blochnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('459', '48', '490', '48_f_490_prodam-kvartiru---3-k-kvartira-65-m-na-3-etazhe-4-etazhnogo-blochnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('460', '49', '475', '+7 987 845-78-98');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('461', '49', '477', 'Оренбургская область, Орск, микрорайон Новый город, улица Беляева, 2А');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('462', '49', '481', '1850000');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('463', '49', '483', '49_f_483_prodam-kvartiru---3-k-kvartira-62-m-na-7-etazhe-9-etazhnogo-panelnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('464', '49', '484', '49_f_484_prodam-kvartiru---3-k-kvartira-62-m-na-7-etazhe-9-etazhnogo-panelnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('465', '49', '485', '49_f_485_prodam-kvartiru---3-k-kvartira-62-m-na-7-etazhe-9-etazhnogo-panelnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('466', '49', '486', '49_f_486_prodam-kvartiru---3-k-kvartira-62-m-na-7-etazhe-9-etazhnogo-panelnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('467', '50', '475', '+7 919 857-26-37');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('468', '50', '477', 'ул Огородная, 29');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('469', '50', '481', '1250000');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('470', '50', '483', '50_f_483_prodam-kvartiru---3-k-kvartira-60-m-na-2-etazhe-5-etazhnogo-kirpichnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('471', '50', '484', '50_f_484_prodam-kvartiru---3-k-kvartira-60-m-na-2-etazhe-5-etazhnogo-kirpichnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('472', '50', '485', '50_f_485_prodam-kvartiru---3-k-kvartira-60-m-na-2-etazhe-5-etazhnogo-kirpichnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('473', '50', '486', '50_f_486_prodam-kvartiru---3-k-kvartira-60-m-na-2-etazhe-5-etazhnogo-kirpichnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('474', '50', '487', '50_f_487_prodam-kvartiru---3-k-kvartira-60-m-na-2-etazhe-5-etazhnogo-kirpichnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('475', '50', '488', '50_f_488_prodam-kvartiru---3-k-kvartira-60-m-na-2-etazhe-5-etazhnogo-kirpichnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('476', '51', '475', '+7 905 897-39-65');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('477', '51', '477', 'Тагильская улица, 13А');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('478', '51', '481', '1330000');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('479', '51', '483', '51_f_483_prodam-kvartiru---3-k-kvartira-61-m-na-1-etazhe-5-etazhnogo-panelnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('480', '51', '484', '51_f_484_prodam-kvartiru---3-k-kvartira-61-m-na-1-etazhe-5-etazhnogo-panelnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('481', '51', '485', '51_f_485_prodam-kvartiru---3-k-kvartira-61-m-na-1-etazhe-5-etazhnogo-panelnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('482', '51', '486', '51_f_486_prodam-kvartiru---3-k-kvartira-61-m-na-1-etazhe-5-etazhnogo-panelnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('483', '51', '487', '51_f_487_prodam-kvartiru---3-k-kvartira-61-m-na-1-etazhe-5-etazhnogo-panelnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('484', '51', '488', '51_f_488_prodam-kvartiru---3-k-kvartira-61-m-na-1-etazhe-5-etazhnogo-panelnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('485', '52', '475', '+7 905 896-04-87');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('486', '52', '477', 'ул Крайняя, 44');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('487', '52', '481', '1750000');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('488', '52', '483', '52_f_483_prodam-kvartiru---3-k-kvartira-63-m-na-7-etazhe-9-etazhnogo-panelnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('489', '52', '484', '52_f_484_prodam-kvartiru---3-k-kvartira-63-m-na-7-etazhe-9-etazhnogo-panelnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('490', '52', '485', '52_f_485_prodam-kvartiru---3-k-kvartira-63-m-na-7-etazhe-9-etazhnogo-panelnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('491', '52', '486', '52_f_486_prodam-kvartiru---3-k-kvartira-63-m-na-7-etazhe-9-etazhnogo-panelnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('492', '52', '487', '52_f_487_prodam-kvartiru---3-k-kvartira-63-m-na-7-etazhe-9-etazhnogo-panelnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('493', '52', '488', '52_f_488_prodam-kvartiru---3-k-kvartira-63-m-na-7-etazhe-9-etazhnogo-panelnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('494', '52', '489', '52_f_489_prodam-kvartiru---3-k-kvartira-63-m-na-7-etazhe-9-etazhnogo-panelnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('495', '53', '475', '+7 961 923-23-53');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('496', '53', '477', 'Ленина пр-кт, 105');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('497', '53', '481', '1800000');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('498', '53', '483', '53_f_483_prodam-kvartiru---3-k-kvartira-57.8-m-na-8-etazhe-9-etazhnogo-kirpichnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('499', '53', '484', '53_f_484_prodam-kvartiru---3-k-kvartira-57.8-m-na-8-etazhe-9-etazhnogo-kirpichnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('500', '53', '485', '53_f_485_prodam-kvartiru---3-k-kvartira-57.8-m-na-8-etazhe-9-etazhnogo-kirpichnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('501', '53', '486', '53_f_486_prodam-kvartiru---3-k-kvartira-57.8-m-na-8-etazhe-9-etazhnogo-kirpichnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('502', '53', '487', '53_f_487_prodam-kvartiru---3-k-kvartira-57.8-m-na-8-etazhe-9-etazhnogo-kirpichnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('503', '53', '488', '53_f_488_prodam-kvartiru---3-k-kvartira-57.8-m-na-8-etazhe-9-etazhnogo-kirpichnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('504', '54', '475', '+7 953 453-11-20');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('505', '54', '477', 'Пр Мира 7 24');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('506', '54', '481', '2850000');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('507', '54', '483', '54_f_483_prodam-kvartiru---3-k-kvartira-78-m-na-4-etazhe-4-etazhnogo-kirpichnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('508', '54', '484', '54_f_484_prodam-kvartiru---3-k-kvartira-78-m-na-4-etazhe-4-etazhnogo-kirpichnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('509', '54', '485', '54_f_485_prodam-kvartiru---3-k-kvartira-78-m-na-4-etazhe-4-etazhnogo-kirpichnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('510', '54', '486', '54_f_486_prodam-kvartiru---3-k-kvartira-78-m-na-4-etazhe-4-etazhnogo-kirpichnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('511', '54', '487', '54_f_487_prodam-kvartiru---3-k-kvartira-78-m-na-4-etazhe-4-etazhnogo-kirpichnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('512', '54', '488', '54_f_488_prodam-kvartiru---3-k-kvartira-78-m-na-4-etazhe-4-etazhnogo-kirpichnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('513', '54', '489', '54_f_489_prodam-kvartiru---3-k-kvartira-78-m-na-4-etazhe-4-etazhnogo-kirpichnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('514', '54', '490', '54_f_490_prodam-kvartiru---3-k-kvartira-78-m-na-4-etazhe-4-etazhnogo-kirpichnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('515', '54', '491', '54_f_491_prodam-kvartiru---3-k-kvartira-78-m-na-4-etazhe-4-etazhnogo-kirpichnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('516', '54', '492', '54_f_492_prodam-kvartiru---3-k-kvartira-78-m-na-4-etazhe-4-etazhnogo-kirpichnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('517', '55', '475', '+7 905 897-34-53');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('518', '55', '477', 'ул Нефтяников, 2');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('519', '55', '481', '2850000');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('520', '55', '483', '55_f_483_prodam-kvartiru---3-k-kvartira-90-m-na-2-etazhe-3-etazhnogo-blochnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('521', '55', '484', '55_f_484_prodam-kvartiru---3-k-kvartira-90-m-na-2-etazhe-3-etazhnogo-blochnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('522', '55', '485', '55_f_485_prodam-kvartiru---3-k-kvartira-90-m-na-2-etazhe-3-etazhnogo-blochnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('523', '55', '486', '55_f_486_prodam-kvartiru---3-k-kvartira-90-m-na-2-etazhe-3-etazhnogo-blochnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('524', '55', '487', '55_f_487_prodam-kvartiru---3-k-kvartira-90-m-na-2-etazhe-3-etazhnogo-blochnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('525', '56', '475', '+7 909 605-46-15');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('526', '56', '477', 'Ленина пр-кт, 126');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('527', '56', '481', '1900000');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('528', '56', '483', '56_f_483_prodam-kvartiru---3-k-kvartira-66-m-na-1-etazhe-9-etazhnogo-kirpichnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('529', '56', '484', '56_f_484_prodam-kvartiru---3-k-kvartira-66-m-na-1-etazhe-9-etazhnogo-kirpichnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('530', '56', '485', '56_f_485_prodam-kvartiru---3-k-kvartira-66-m-na-1-etazhe-9-etazhnogo-kirpichnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('531', '56', '486', '56_f_486_prodam-kvartiru---3-k-kvartira-66-m-na-1-etazhe-9-etazhnogo-kirpichnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('532', '56', '487', '56_f_487_prodam-kvartiru---3-k-kvartira-66-m-na-1-etazhe-9-etazhnogo-kirpichnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('533', '56', '488', '56_f_488_prodam-kvartiru---3-k-kvartira-66-m-na-1-etazhe-9-etazhnogo-kirpichnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('534', '56', '489', '56_f_489_prodam-kvartiru---3-k-kvartira-66-m-na-1-etazhe-9-etazhnogo-kirpichnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('535', '56', '490', '56_f_490_prodam-kvartiru---3-k-kvartira-66-m-na-1-etazhe-9-etazhnogo-kirpichnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('536', '57', '475', '+7 965 813-36-39');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('537', '57', '477', 'ул Шелухина, 22');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('538', '57', '481', '1400000');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('539', '57', '483', '57_f_483_prodam-kvartiru---3-k-kvartira-69-m-na-2-etazhe-2-etazhnogo-kirpichnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('540', '57', '484', '57_f_484_prodam-kvartiru---3-k-kvartira-69-m-na-2-etazhe-2-etazhnogo-kirpichnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('541', '57', '485', '57_f_485_prodam-kvartiru---3-k-kvartira-69-m-na-2-etazhe-2-etazhnogo-kirpichnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('542', '57', '486', '57_f_486_prodam-kvartiru---3-k-kvartira-69-m-na-2-etazhe-2-etazhnogo-kirpichnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('543', '57', '487', '57_f_487_prodam-kvartiru---3-k-kvartira-69-m-na-2-etazhe-2-etazhnogo-kirpichnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('544', '57', '488', '57_f_488_prodam-kvartiru---3-k-kvartira-69-m-na-2-etazhe-2-etazhnogo-kirpichnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('545', '57', '489', '57_f_489_prodam-kvartiru---3-k-kvartira-69-m-na-2-etazhe-2-etazhnogo-kirpichnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('546', '57', '490', '57_f_490_prodam-kvartiru---3-k-kvartira-69-m-na-2-etazhe-2-etazhnogo-kirpichnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('547', '57', '491', '57_f_491_prodam-kvartiru---3-k-kvartira-69-m-na-2-etazhe-2-etazhnogo-kirpichnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('548', '57', '492', '57_f_492_prodam-kvartiru---3-k-kvartira-69-m-na-2-etazhe-2-etazhnogo-kirpichnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('549', '58', '475', '+7 900 001-60-15');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('550', '58', '477', 'Сарматский 5 а');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('551', '58', '481', '1000000');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('552', '58', '483', '58_f_483_prodam-kvartiru---3-k-kvartira-48-m-na-5-etazhe-5-etazhnogo-panelnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('553', '58', '484', '58_f_484_prodam-kvartiru---3-k-kvartira-48-m-na-5-etazhe-5-etazhnogo-panelnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('554', '58', '485', '58_f_485_prodam-kvartiru---3-k-kvartira-48-m-na-5-etazhe-5-etazhnogo-panelnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('555', '58', '486', '58_f_486_prodam-kvartiru---3-k-kvartira-48-m-na-5-etazhe-5-etazhnogo-panelnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('556', '58', '487', '58_f_487_prodam-kvartiru---3-k-kvartira-48-m-na-5-etazhe-5-etazhnogo-panelnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('557', '58', '488', '58_f_488_prodam-kvartiru---3-k-kvartira-48-m-na-5-etazhe-5-etazhnogo-panelnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('558', '58', '489', '58_f_489_prodam-kvartiru---3-k-kvartira-48-m-na-5-etazhe-5-etazhnogo-panelnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('559', '58', '490', '58_f_490_prodam-kvartiru---3-k-kvartira-48-m-na-5-etazhe-5-etazhnogo-panelnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('560', '58', '491', '58_f_491_prodam-kvartiru---3-k-kvartira-48-m-na-5-etazhe-5-etazhnogo-panelnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('561', '58', '492', '58_f_492_prodam-kvartiru---3-k-kvartira-48-m-na-5-etazhe-5-etazhnogo-panelnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('562', '59', '475', '+7 919 844-56-85');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('563', '59', '477', 'ул Багратиона, 18А');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('564', '59', '481', '1200000');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('565', '60', '475', '+7 987 204-66-53');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('566', '60', '477', 'Музыкальный пер, 5');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('567', '60', '481', '2500000');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('568', '60', '483', '60_f_483_prodam-kvartiru---3-k-kvartira-78-m-na-2-etazhe-4-etazhnogo-kirpichnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('569', '60', '484', '60_f_484_prodam-kvartiru---3-k-kvartira-78-m-na-2-etazhe-4-etazhnogo-kirpichnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('570', '60', '485', '60_f_485_prodam-kvartiru---3-k-kvartira-78-m-na-2-etazhe-4-etazhnogo-kirpichnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('571', '60', '486', '60_f_486_prodam-kvartiru---3-k-kvartira-78-m-na-2-etazhe-4-etazhnogo-kirpichnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('572', '60', '487', '60_f_487_prodam-kvartiru---3-k-kvartira-78-m-na-2-etazhe-4-etazhnogo-kirpichnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('573', '60', '488', '60_f_488_prodam-kvartiru---3-k-kvartira-78-m-na-2-etazhe-4-etazhnogo-kirpichnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('574', '60', '489', '60_f_489_prodam-kvartiru---3-k-kvartira-78-m-na-2-etazhe-4-etazhnogo-kirpichnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('575', '60', '490', '60_f_490_prodam-kvartiru---3-k-kvartira-78-m-na-2-etazhe-4-etazhnogo-kirpichnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('576', '60', '491', '60_f_491_prodam-kvartiru---3-k-kvartira-78-m-na-2-etazhe-4-etazhnogo-kirpichnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('577', '60', '492', '60_f_492_prodam-kvartiru---3-k-kvartira-78-m-na-2-etazhe-4-etazhnogo-kirpichnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('578', '61', '475', '+7 905 880-01-78');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('579', '61', '477', 'ул Макаренко, 11');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('580', '61', '481', '1200000');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('581', '61', '483', '61_f_483_prodam-kvartiru---3-k-kvartira-42-m-na-1-etazhe-5-etazhnogo-kirpichnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('582', '61', '484', '61_f_484_prodam-kvartiru---3-k-kvartira-42-m-na-1-etazhe-5-etazhnogo-kirpichnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('583', '61', '485', '61_f_485_prodam-kvartiru---3-k-kvartira-42-m-na-1-etazhe-5-etazhnogo-kirpichnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('584', '61', '486', '61_f_486_prodam-kvartiru---3-k-kvartira-42-m-na-1-etazhe-5-etazhnogo-kirpichnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('585', '61', '487', '61_f_487_prodam-kvartiru---3-k-kvartira-42-m-na-1-etazhe-5-etazhnogo-kirpichnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('586', '61', '488', '61_f_488_prodam-kvartiru---3-k-kvartira-42-m-na-1-etazhe-5-etazhnogo-kirpichnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('587', '61', '489', '61_f_489_prodam-kvartiru---3-k-kvartira-42-m-na-1-etazhe-5-etazhnogo-kirpichnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('588', '61', '490', '61_f_490_prodam-kvartiru---3-k-kvartira-42-m-na-1-etazhe-5-etazhnogo-kirpichnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('589', '61', '491', '61_f_491_prodam-kvartiru---3-k-kvartira-42-m-na-1-etazhe-5-etazhnogo-kirpichnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('590', '61', '492', '61_f_492_prodam-kvartiru---3-k-kvartira-42-m-na-1-etazhe-5-etazhnogo-kirpichnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('591', '62', '475', '+7 987 884-70-17');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('592', '62', '477', 'Бажова пер, 24');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('593', '62', '481', '1200000');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('594', '62', '483', '62_f_483_prodam-kvartiru---3-k-kvartira-74.6-m-na-3-etazhe-3-etazhnogo-kirpichnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('595', '62', '484', '62_f_484_prodam-kvartiru---3-k-kvartira-74.6-m-na-3-etazhe-3-etazhnogo-kirpichnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('596', '62', '485', '62_f_485_prodam-kvartiru---3-k-kvartira-74.6-m-na-3-etazhe-3-etazhnogo-kirpichnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('597', '62', '486', '62_f_486_prodam-kvartiru---3-k-kvartira-74.6-m-na-3-etazhe-3-etazhnogo-kirpichnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('598', '62', '487', '62_f_487_prodam-kvartiru---3-k-kvartira-74.6-m-na-3-etazhe-3-etazhnogo-kirpichnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('599', '62', '488', '62_f_488_prodam-kvartiru---3-k-kvartira-74.6-m-na-3-etazhe-3-etazhnogo-kirpichnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('600', '63', '475', '+7 967 775-00-55');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('601', '63', '477', 'Ленина пр-кт, 39');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('602', '63', '481', '2750000');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('603', '63', '483', '63_f_483_prodam-kvartiru---3-k-kvartira-91-m-na-3-etazhe-4-etazhnogo-kirpichnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('604', '63', '484', '63_f_484_prodam-kvartiru---3-k-kvartira-91-m-na-3-etazhe-4-etazhnogo-kirpichnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('605', '63', '485', '63_f_485_prodam-kvartiru---3-k-kvartira-91-m-na-3-etazhe-4-etazhnogo-kirpichnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('606', '63', '486', '63_f_486_prodam-kvartiru---3-k-kvartira-91-m-na-3-etazhe-4-etazhnogo-kirpichnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('607', '63', '487', '63_f_487_prodam-kvartiru---3-k-kvartira-91-m-na-3-etazhe-4-etazhnogo-kirpichnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('608', '63', '488', '63_f_488_prodam-kvartiru---3-k-kvartira-91-m-na-3-etazhe-4-etazhnogo-kirpichnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('609', '63', '489', '63_f_489_prodam-kvartiru---3-k-kvartira-91-m-na-3-etazhe-4-etazhnogo-kirpichnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('610', '63', '490', '63_f_490_prodam-kvartiru---3-k-kvartira-91-m-na-3-etazhe-4-etazhnogo-kirpichnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('611', '63', '491', '63_f_491_prodam-kvartiru---3-k-kvartira-91-m-na-3-etazhe-4-etazhnogo-kirpichnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('612', '63', '492', '63_f_492_prodam-kvartiru---3-k-kvartira-91-m-na-3-etazhe-4-etazhnogo-kirpichnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('613', '64', '475', '+7 905 892-98-80');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('614', '64', '477', 'ул Багратиона, 16А');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('615', '64', '481', '990000');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('616', '64', '483', '64_f_483_prodam-kvartiru---3-k-kvartira-56-m-na-3-etazhe-5-etazhnogo-panelnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('617', '64', '484', '64_f_484_prodam-kvartiru---3-k-kvartira-56-m-na-3-etazhe-5-etazhnogo-panelnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('618', '64', '485', '64_f_485_prodam-kvartiru---3-k-kvartira-56-m-na-3-etazhe-5-etazhnogo-panelnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('619', '64', '486', '64_f_486_prodam-kvartiru---3-k-kvartira-56-m-na-3-etazhe-5-etazhnogo-panelnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('620', '64', '487', '64_f_487_prodam-kvartiru---3-k-kvartira-56-m-na-3-etazhe-5-etazhnogo-panelnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('621', '64', '488', '64_f_488_prodam-kvartiru---3-k-kvartira-56-m-na-3-etazhe-5-etazhnogo-panelnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('622', '64', '489', '64_f_489_prodam-kvartiru---3-k-kvartira-56-m-na-3-etazhe-5-etazhnogo-panelnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('623', '64', '490', '64_f_490_prodam-kvartiru---3-k-kvartira-56-m-na-3-etazhe-5-etazhnogo-panelnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('624', '64', '491', '64_f_491_prodam-kvartiru---3-k-kvartira-56-m-na-3-etazhe-5-etazhnogo-panelnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('625', '64', '492', '64_f_492_prodam-kvartiru---3-k-kvartira-56-m-na-3-etazhe-5-etazhnogo-panelnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('626', '65', '475', '+7 987 884-70-17');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('627', '65', '477', 'ул Вяземская, 36А');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('628', '65', '481', '1450000');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('629', '65', '483', '65_f_483_prodam-kvartiru---3-k-kvartira-57.8-m-na-3-etazhe-5-etazhnogo-panelnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('630', '65', '484', '65_f_484_prodam-kvartiru---3-k-kvartira-57.8-m-na-3-etazhe-5-etazhnogo-panelnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('631', '65', '485', '65_f_485_prodam-kvartiru---3-k-kvartira-57.8-m-na-3-etazhe-5-etazhnogo-panelnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('632', '65', '486', '65_f_486_prodam-kvartiru---3-k-kvartira-57.8-m-na-3-etazhe-5-etazhnogo-panelnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('633', '65', '487', '65_f_487_prodam-kvartiru---3-k-kvartira-57.8-m-na-3-etazhe-5-etazhnogo-panelnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('634', '66', '475', '+7 961 923-23-53');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('635', '66', '477', 'ул Радостева, 13');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('636', '66', '481', '1100000');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('637', '66', '483', '66_f_483_prodam-kvartiru---3-k-kvartira-59.8-m-na-3-etazhe-6-etazhnogo-kirpichnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('638', '66', '484', '66_f_484_prodam-kvartiru---3-k-kvartira-59.8-m-na-3-etazhe-6-etazhnogo-kirpichnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('639', '66', '485', '66_f_485_prodam-kvartiru---3-k-kvartira-59.8-m-na-3-etazhe-6-etazhnogo-kirpichnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('640', '66', '486', '66_f_486_prodam-kvartiru---3-k-kvartira-59.8-m-na-3-etazhe-6-etazhnogo-kirpichnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('641', '67', '475', '+7 950 188-00-00');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('642', '67', '477', 'Кутузова ул, 17А');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('643', '67', '481', '4800000');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('645', '68', '475', '+7 950 188-00-00');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('646', '68', '477', 'Кутузова ул, 17А');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('647', '68', '481', '3500000');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('651', '69', '475', '+7 919 864-27-29');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('652', '69', '477', 'ул Стасова, 4');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('653', '69', '481', '1250000');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('655', '70', '475', '+7 961 924-96-63');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('656', '70', '477', 'Ленина пр-кт, 16');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('657', '70', '481', '1250000');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('666', '71', '475', '+7 987 884-70-17');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('667', '71', '477', 'ул Короленко, 144А');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('668', '71', '481', '850000');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('669', '71', '483', '71_f_483_prodam-kvartiru---2-k-kvartira-44-m-na-1-etazhe-5-etazhnogo-panelnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('670', '71', '484', '71_f_484_prodam-kvartiru---2-k-kvartira-44-m-na-1-etazhe-5-etazhnogo-panelnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('671', '71', '485', '71_f_485_prodam-kvartiru---2-k-kvartira-44-m-na-1-etazhe-5-etazhnogo-panelnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('672', '71', '486', '71_f_486_prodam-kvartiru---2-k-kvartira-44-m-na-1-etazhe-5-etazhnogo-panelnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('673', '72', '475', '+7 905 882-70-27');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('674', '72', '477', 'с. Крыловка, ул Клубная, 8');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('675', '72', '481', '400000');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('676', '72', '483', '72_f_483_prodam-kvartiru---2-k-kvartira-43-m-na-2-etazhe-2-etazhnogo-kirpichnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('677', '72', '484', '72_f_484_prodam-kvartiru---2-k-kvartira-43-m-na-2-etazhe-2-etazhnogo-kirpichnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('678', '72', '485', '72_f_485_prodam-kvartiru---2-k-kvartira-43-m-na-2-etazhe-2-etazhnogo-kirpichnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('679', '73', '475', '+7 919 864-27-29');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('680', '73', '477', 'ул Короленко, 140А');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('681', '73', '481', '800000');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('682', '73', '483', '73_f_483_prodam-kvartiru---2-k-kvartira-47-m-na-4-etazhe-5-etazhnogo-kirpichnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('683', '74', '475', '+7 932 535-43-43');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('684', '74', '477', 'Оренбургская область, Орск, микрорайон Новый город, Гомельская улица, 78А');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('685', '74', '481', '1300000');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('686', '74', '483', '74_f_483_prodam-kvartiru---2-k-kvartira-44-m-na-4-etazhe-5-etazhnogo-panelnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('687', '74', '484', '74_f_484_prodam-kvartiru---2-k-kvartira-44-m-na-4-etazhe-5-etazhnogo-panelnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('688', '74', '485', '74_f_485_prodam-kvartiru---2-k-kvartira-44-m-na-4-etazhe-5-etazhnogo-panelnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('689', '74', '486', '74_f_486_prodam-kvartiru---2-k-kvartira-44-m-na-4-etazhe-5-etazhnogo-panelnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('690', '74', '487', '74_f_487_prodam-kvartiru---2-k-kvartira-44-m-na-4-etazhe-5-etazhnogo-panelnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('691', '74', '488', '74_f_488_prodam-kvartiru---2-k-kvartira-44-m-na-4-etazhe-5-etazhnogo-panelnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('692', '74', '489', '74_f_489_prodam-kvartiru---2-k-kvartira-44-m-na-4-etazhe-5-etazhnogo-panelnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('693', '74', '490', '74_f_490_prodam-kvartiru---2-k-kvartira-44-m-na-4-etazhe-5-etazhnogo-panelnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('694', '74', '491', '74_f_491_prodam-kvartiru---2-k-kvartira-44-m-na-4-etazhe-5-etazhnogo-panelnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('695', '74', '492', '74_f_492_prodam-kvartiru---2-k-kvartira-44-m-na-4-etazhe-5-etazhnogo-panelnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('696', '75', '475', '+7 911 901-50-55');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('697', '75', '477', 'Станиславского, 61');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('698', '75', '481', '1800000');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('699', '75', '483', '75_f_483_prodam-kvartiru---2-k-kvartira-56-m-na-2-etazhe-4-etazhnogo-blochnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('700', '75', '484', '75_f_484_prodam-kvartiru---2-k-kvartira-56-m-na-2-etazhe-4-etazhnogo-blochnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('701', '75', '485', '75_f_485_prodam-kvartiru---2-k-kvartira-56-m-na-2-etazhe-4-etazhnogo-blochnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('702', '75', '486', '75_f_486_prodam-kvartiru---2-k-kvartira-56-m-na-2-etazhe-4-etazhnogo-blochnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('703', '75', '487', '75_f_487_prodam-kvartiru---2-k-kvartira-56-m-na-2-etazhe-4-etazhnogo-blochnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('704', '76', '475', '+7 905 813-65-72');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('705', '76', '477', 'ул Маршала Жукова, 7А');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('706', '76', '481', '1700000');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('707', '76', '483', '76_f_483_prodam-kvartiru---2-k-kvartira-51-m-na-3-etazhe-9-etazhnogo-panelnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('708', '76', '484', '76_f_484_prodam-kvartiru---2-k-kvartira-51-m-na-3-etazhe-9-etazhnogo-panelnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('709', '76', '485', '76_f_485_prodam-kvartiru---2-k-kvartira-51-m-na-3-etazhe-9-etazhnogo-panelnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('710', '76', '486', '76_f_486_prodam-kvartiru---2-k-kvartira-51-m-na-3-etazhe-9-etazhnogo-panelnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('711', '76', '487', '76_f_487_prodam-kvartiru---2-k-kvartira-51-m-na-3-etazhe-9-etazhnogo-panelnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('712', '76', '488', '76_f_488_prodam-kvartiru---2-k-kvartira-51-m-na-3-etazhe-9-etazhnogo-panelnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('713', '76', '489', '76_f_489_prodam-kvartiru---2-k-kvartira-51-m-na-3-etazhe-9-etazhnogo-panelnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('714', '76', '490', '76_f_490_prodam-kvartiru---2-k-kvartira-51-m-na-3-etazhe-9-etazhnogo-panelnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('715', '76', '491', '76_f_491_prodam-kvartiru---2-k-kvartira-51-m-na-3-etazhe-9-etazhnogo-panelnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('716', '76', '492', '76_f_492_prodam-kvartiru---2-k-kvartira-51-m-na-3-etazhe-9-etazhnogo-panelnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('717', '77', '475', '+7 961 923-23-53');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('718', '77', '477', 'ул Станиславского, 91А');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('719', '77', '481', '1300000');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('720', '77', '483', '77_f_483_prodam-kvartiru---2-k-kvartira-44.6-m-na-4-etazhe-5-etazhnogo-panelnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('721', '77', '484', '77_f_484_prodam-kvartiru---2-k-kvartira-44.6-m-na-4-etazhe-5-etazhnogo-panelnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('722', '77', '485', '77_f_485_prodam-kvartiru---2-k-kvartira-44.6-m-na-4-etazhe-5-etazhnogo-panelnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('723', '77', '486', '77_f_486_prodam-kvartiru---2-k-kvartira-44.6-m-na-4-etazhe-5-etazhnogo-panelnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('724', '78', '475', '+7 922 893-75-00');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('725', '78', '477', 'Ул. Кутузова  д.58 а');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('726', '78', '481', '1050000');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('727', '78', '483', '78_f_483_prodam-kvartiru---2-k-kvartira-44-m-na-4-etazhe-5-etazhnogo-panelnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('728', '78', '484', '78_f_484_prodam-kvartiru---2-k-kvartira-44-m-na-4-etazhe-5-etazhnogo-panelnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('729', '78', '485', '78_f_485_prodam-kvartiru---2-k-kvartira-44-m-na-4-etazhe-5-etazhnogo-panelnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('730', '78', '486', '78_f_486_prodam-kvartiru---2-k-kvartira-44-m-na-4-etazhe-5-etazhnogo-panelnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('731', '78', '487', '78_f_487_prodam-kvartiru---2-k-kvartira-44-m-na-4-etazhe-5-etazhnogo-panelnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('732', '78', '488', '78_f_488_prodam-kvartiru---2-k-kvartira-44-m-na-4-etazhe-5-etazhnogo-panelnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('733', '78', '489', '78_f_489_prodam-kvartiru---2-k-kvartira-44-m-na-4-etazhe-5-etazhnogo-panelnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('734', '78', '490', '78_f_490_prodam-kvartiru---2-k-kvartira-44-m-na-4-etazhe-5-etazhnogo-panelnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('735', '79', '475', '+7 967 978-99-51');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('736', '79', '477', 'ул Щорса, 4');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('737', '79', '481', '1200000');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('738', '79', '483', '79_f_483_prodam-kvartiru---2-k-kvartira-43.7-m-na-3-etazhe-5-etazhnogo-panelnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('739', '79', '484', '79_f_484_prodam-kvartiru---2-k-kvartira-43.7-m-na-3-etazhe-5-etazhnogo-panelnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('740', '79', '485', '79_f_485_prodam-kvartiru---2-k-kvartira-43.7-m-na-3-etazhe-5-etazhnogo-panelnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('741', '79', '486', '79_f_486_prodam-kvartiru---2-k-kvartira-43.7-m-na-3-etazhe-5-etazhnogo-panelnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('742', '79', '487', '79_f_487_prodam-kvartiru---2-k-kvartira-43.7-m-na-3-etazhe-5-etazhnogo-panelnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('743', '79', '488', '79_f_488_prodam-kvartiru---2-k-kvartira-43.7-m-na-3-etazhe-5-etazhnogo-panelnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('744', '80', '475', '+7 987 884-70-17');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('745', '80', '477', 'ул Медногорская, 26');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('746', '80', '481', '980000');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('747', '80', '483', '80_f_483_prodam-kvartiru---2-k-kvartira-42-m-na-2-etazhe-3-etazhnogo-blochnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('748', '80', '484', '80_f_484_prodam-kvartiru---2-k-kvartira-42-m-na-2-etazhe-3-etazhnogo-blochnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('749', '80', '485', '80_f_485_prodam-kvartiru---2-k-kvartira-42-m-na-2-etazhe-3-etazhnogo-blochnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('750', '80', '486', '80_f_486_prodam-kvartiru---2-k-kvartira-42-m-na-2-etazhe-3-etazhnogo-blochnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('751', '81', '475', '+7 922 850-70-76');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('752', '81', '477', 'ул Щорса д 2');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('753', '81', '481', '1020000');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('754', '82', '475', '+7 922 850-70-76');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('755', '82', '477', 'ул Новосибирская д,40 А');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('756', '82', '481', '950000');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('757', '83', '475', '+7 922 850-70-76');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('758', '83', '477', 'Ленина пр-кт, 56');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('759', '83', '481', '810000');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('760', '84', '475', '+7 988 316-64-98');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('761', '84', '477', 'пр. Ленина 60');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('762', '84', '481', '1350000');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('763', '84', '483', '84_f_483_prodam-kvartiru---2-k-kvartira-44.9-m-na-2-etazhe-5-etazhnogo-panelnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('764', '84', '484', '84_f_484_prodam-kvartiru---2-k-kvartira-44.9-m-na-2-etazhe-5-etazhnogo-panelnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('765', '84', '485', '84_f_485_prodam-kvartiru---2-k-kvartira-44.9-m-na-2-etazhe-5-etazhnogo-panelnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('766', '84', '486', '84_f_486_prodam-kvartiru---2-k-kvartira-44.9-m-na-2-etazhe-5-etazhnogo-panelnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('767', '85', '475', '+7 987 845-78-98');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('768', '85', '477', 'Ленина пр-кт, 75');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('769', '85', '481', '890000');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('770', '85', '483', '85_f_483_prodam-kvartiru---2-k-kvartira-40.2-m-na-5-etazhe-5-etazhnogo-kirpichnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('771', '85', '484', '85_f_484_prodam-kvartiru---2-k-kvartira-40.2-m-na-5-etazhe-5-etazhnogo-kirpichnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('772', '85', '485', '85_f_485_prodam-kvartiru---2-k-kvartira-40.2-m-na-5-etazhe-5-etazhnogo-kirpichnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('773', '86', '475', '+7 906 846-74-76');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('774', '86', '477', 'Оренбургская область, Орск, микрорайон Новый город, Краматорская улица, 10А');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('775', '86', '481', '1250000');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('776', '86', '483', '86_f_483_prodam-kvartiru---2-k-kvartira-43.7-m-na-2-etazhe-5-etazhnogo-panelnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('777', '86', '484', '86_f_484_prodam-kvartiru---2-k-kvartira-43.7-m-na-2-etazhe-5-etazhnogo-panelnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('778', '86', '485', '86_f_485_prodam-kvartiru---2-k-kvartira-43.7-m-na-2-etazhe-5-etazhnogo-panelnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('779', '86', '486', '86_f_486_prodam-kvartiru---2-k-kvartira-43.7-m-na-2-etazhe-5-etazhnogo-panelnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('780', '86', '487', '86_f_487_prodam-kvartiru---2-k-kvartira-43.7-m-na-2-etazhe-5-etazhnogo-panelnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('781', '86', '488', '86_f_488_prodam-kvartiru---2-k-kvartira-43.7-m-na-2-etazhe-5-etazhnogo-panelnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('782', '86', '489', '86_f_489_prodam-kvartiru---2-k-kvartira-43.7-m-na-2-etazhe-5-etazhnogo-panelnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('783', '86', '490', '86_f_490_prodam-kvartiru---2-k-kvartira-43.7-m-na-2-etazhe-5-etazhnogo-panelnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('784', '86', '491', '86_f_491_prodam-kvartiru---2-k-kvartira-43.7-m-na-2-etazhe-5-etazhnogo-panelnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('785', '86', '492', '86_f_492_prodam-kvartiru---2-k-kvartira-43.7-m-na-2-etazhe-5-etazhnogo-panelnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('786', '87', '475', '+7 905 845-40-64');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('787', '87', '477', 'Маршала жукова 17');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('788', '87', '481', '1230000');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('789', '88', '475', '+7 905 845-02-60');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('790', '88', '477', 'ул Попова, 5А');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('791', '88', '481', '1550000');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('792', '88', '483', '88_f_483_prodam-kvartiru---2-k-kvartira-49-m-na-4-etazhe-9-etazhnogo-panelnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('793', '88', '484', '88_f_484_prodam-kvartiru---2-k-kvartira-49-m-na-4-etazhe-9-etazhnogo-panelnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('794', '88', '485', '88_f_485_prodam-kvartiru---2-k-kvartira-49-m-na-4-etazhe-9-etazhnogo-panelnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('795', '88', '486', '88_f_486_prodam-kvartiru---2-k-kvartira-49-m-na-4-etazhe-9-etazhnogo-panelnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('796', '88', '487', '88_f_487_prodam-kvartiru---2-k-kvartira-49-m-na-4-etazhe-9-etazhnogo-panelnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('797', '88', '488', '88_f_488_prodam-kvartiru---2-k-kvartira-49-m-na-4-etazhe-9-etazhnogo-panelnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('798', '88', '489', '88_f_489_prodam-kvartiru---2-k-kvartira-49-m-na-4-etazhe-9-etazhnogo-panelnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('799', '88', '490', '88_f_490_prodam-kvartiru---2-k-kvartira-49-m-na-4-etazhe-9-etazhnogo-panelnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('800', '88', '491', '88_f_491_prodam-kvartiru---2-k-kvartira-49-m-na-4-etazhe-9-etazhnogo-panelnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('801', '88', '492', '88_f_492_prodam-kvartiru---2-k-kvartira-49-m-na-4-etazhe-9-etazhnogo-panelnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('802', '89', '475', '+7 986 794-06-59');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('803', '89', '477', 'ул Макаренко, 14');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('804', '89', '481', '950000');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('805', '89', '483', '89_f_483_prodam-kvartiru---2-k-kvartira-45-m-na-4-etazhe-5-etazhnogo-blochnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('806', '89', '484', '89_f_484_prodam-kvartiru---2-k-kvartira-45-m-na-4-etazhe-5-etazhnogo-blochnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('807', '89', '485', '89_f_485_prodam-kvartiru---2-k-kvartira-45-m-na-4-etazhe-5-etazhnogo-blochnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('808', '89', '486', '89_f_486_prodam-kvartiru---2-k-kvartira-45-m-na-4-etazhe-5-etazhnogo-blochnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('809', '90', '475', '+7 905 847-43-62');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('810', '90', '477', 'Горького ул, 46А');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('811', '90', '481', '1200000');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('812', '91', '475', '+7 906 830-68-00');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('813', '91', '477', 'ул Докучаева, 17');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('814', '91', '481', '2300000');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('815', '91', '483', '91_f_483_prodam-kvartiru---4-k-kvartira-73.6-m-na-5-etazhe-9-etazhnogo-kirpichnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('816', '91', '484', '91_f_484_prodam-kvartiru---4-k-kvartira-73.6-m-na-5-etazhe-9-etazhnogo-kirpichnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('817', '91', '485', '91_f_485_prodam-kvartiru---4-k-kvartira-73.6-m-na-5-etazhe-9-etazhnogo-kirpichnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('818', '91', '486', '91_f_486_prodam-kvartiru---4-k-kvartira-73.6-m-na-5-etazhe-9-etazhnogo-kirpichnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('819', '91', '487', '91_f_487_prodam-kvartiru---4-k-kvartira-73.6-m-na-5-etazhe-9-etazhnogo-kirpichnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('820', '91', '488', '91_f_488_prodam-kvartiru---4-k-kvartira-73.6-m-na-5-etazhe-9-etazhnogo-kirpichnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('821', '91', '489', '91_f_489_prodam-kvartiru---4-k-kvartira-73.6-m-na-5-etazhe-9-etazhnogo-kirpichnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('822', '91', '490', '91_f_490_prodam-kvartiru---4-k-kvartira-73.6-m-na-5-etazhe-9-etazhnogo-kirpichnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('823', '91', '491', '91_f_491_prodam-kvartiru---4-k-kvartira-73.6-m-na-5-etazhe-9-etazhnogo-kirpichnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('824', '91', '492', '91_f_492_prodam-kvartiru---4-k-kvartira-73.6-m-na-5-etazhe-9-etazhnogo-kirpichnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('825', '92', '475', '+7 905 845-16-77');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('826', '92', '477', 'Россия, Оренбургская область, Орск, микрорайон Новый город, Синегорский переулок, 5');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('827', '92', '481', '3600000');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('828', '93', '475', '+7 905 896-41-37');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('829', '93', '477', 'ул Ялтинская, 99');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('830', '93', '481', '2800000');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('831', '93', '483', '93_f_483_prodam-kvartiru---4-k-kvartira-101-m-na-3-etazhe-9-etazhnogo-panelnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('832', '93', '484', '93_f_484_prodam-kvartiru---4-k-kvartira-101-m-na-3-etazhe-9-etazhnogo-panelnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('833', '93', '485', '93_f_485_prodam-kvartiru---4-k-kvartira-101-m-na-3-etazhe-9-etazhnogo-panelnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('834', '93', '486', '93_f_486_prodam-kvartiru---4-k-kvartira-101-m-na-3-etazhe-9-etazhnogo-panelnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('835', '93', '487', '93_f_487_prodam-kvartiru---4-k-kvartira-101-m-na-3-etazhe-9-etazhnogo-panelnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('836', '93', '488', '93_f_488_prodam-kvartiru---4-k-kvartira-101-m-na-3-etazhe-9-etazhnogo-panelnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('837', '93', '489', '93_f_489_prodam-kvartiru---4-k-kvartira-101-m-na-3-etazhe-9-etazhnogo-panelnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('838', '93', '490', '93_f_490_prodam-kvartiru---4-k-kvartira-101-m-na-3-etazhe-9-etazhnogo-panelnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('839', '93', '491', '93_f_491_prodam-kvartiru---4-k-kvartira-101-m-na-3-etazhe-9-etazhnogo-panelnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('840', '93', '492', '93_f_492_prodam-kvartiru---4-k-kvartira-101-m-na-3-etazhe-9-etazhnogo-panelnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('841', '94', '475', '+7 961 901-91-90');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('842', '94', '477', 'Сарматский пер, 5');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('843', '94', '481', '1350000');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('844', '94', '483', '94_f_483_prodam-kvartiru---4-k-kvartira-63-m-na-5-etazhe-5-etazhnogo-kirpichnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('845', '94', '484', '94_f_484_prodam-kvartiru---4-k-kvartira-63-m-na-5-etazhe-5-etazhnogo-kirpichnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('846', '94', '485', '94_f_485_prodam-kvartiru---4-k-kvartira-63-m-na-5-etazhe-5-etazhnogo-kirpichnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('847', '94', '486', '94_f_486_prodam-kvartiru---4-k-kvartira-63-m-na-5-etazhe-5-etazhnogo-kirpichnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('848', '94', '487', '94_f_487_prodam-kvartiru---4-k-kvartira-63-m-na-5-etazhe-5-etazhnogo-kirpichnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('849', '94', '488', '94_f_488_prodam-kvartiru---4-k-kvartira-63-m-na-5-etazhe-5-etazhnogo-kirpichnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('850', '95', '475', '+7 987 845-78-98');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('851', '95', '477', 'ул Добровольского, 17');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('852', '95', '481', '1500000');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('853', '95', '483', '95_f_483_prodam-kvartiru---4-k-kvartira-60.5-m-na-4-etazhe-5-etazhnogo-kirpichnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('854', '95', '484', '95_f_484_prodam-kvartiru---4-k-kvartira-60.5-m-na-4-etazhe-5-etazhnogo-kirpichnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('855', '95', '485', '95_f_485_prodam-kvartiru---4-k-kvartira-60.5-m-na-4-etazhe-5-etazhnogo-kirpichnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('856', '95', '486', '95_f_486_prodam-kvartiru---4-k-kvartira-60.5-m-na-4-etazhe-5-etazhnogo-kirpichnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('857', '95', '487', '95_f_487_prodam-kvartiru---4-k-kvartira-60.5-m-na-4-etazhe-5-etazhnogo-kirpichnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('858', '95', '488', '95_f_488_prodam-kvartiru---4-k-kvartira-60.5-m-na-4-etazhe-5-etazhnogo-kirpichnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('859', '95', '489', '95_f_489_prodam-kvartiru---4-k-kvartira-60.5-m-na-4-etazhe-5-etazhnogo-kirpichnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('860', '96', '475', '+7 989 165-00-41');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('861', '96', '477', 'ул Станиславского, 6');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('862', '96', '481', '1600000');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('873', '97', '475', '+7 912 685-58-00');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('874', '97', '477', 'ул Докучаева');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('875', '97', '481', '2100000');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('883', '98', '475', '+7 905 896-84-94');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('884', '98', '477', 'Владивостокский пер.');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('885', '98', '481', '2150000');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('888', '99', '475', '+7 912 351-71-37');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('889', '99', '477', 'ул Станиславского, 99');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('890', '99', '481', '1750000');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('895', '100', '475', '+7 905 898-98-12');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('896', '100', '477', 'ул Ялтинская, 76');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('897', '100', '481', '2300000');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('906', '101', '475', '+7 987 795-52-31');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('907', '101', '477', 'пер. Белогорский, д.17');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('908', '101', '481', '1600000');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('919', '102', '475', '+7 917 551-86-82');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('920', '102', '477', 'Оренбургская область, Орск, микрорайон Новый город, Краматорская улица, 9Б');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('921', '102', '481', '1350000');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('932', '103', '475', '+7 905 847-68-83');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('933', '103', '477', 'ул Краматорская, 50');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('934', '103', '481', '2700000');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('945', '104', '475', '+7 961 923-23-53');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('946', '104', '477', 'ул Перегонная, 6А');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('947', '104', '481', '450000');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('948', '104', '483', '104_f_483_prodam-komnatu---komnata-22.2-m-v-5-k-kvartire-na-5-etazhe-5-etazhnogo-kirpichnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('949', '104', '484', '104_f_484_prodam-komnatu---komnata-22.2-m-v-5-k-kvartire-na-5-etazhe-5-etazhnogo-kirpichnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('950', '105', '475', '+7 906 225-53-33');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('951', '105', '477', 'ул.Просвещения д.50');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('952', '105', '481', '350000');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('953', '105', '483', '105_f_483_prodam-komnatu---komnata-20-m-v-4-k-kvartire-na-2-etazhe-2-etazhnogo-blochnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('954', '106', '475', '+7 905 896-86-38');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('955', '106', '477', 'улица станиславского д.71б');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('956', '106', '481', '2500');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('957', '107', '475', '+7 922 876-75-09');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('958', '107', '477', 'микрорайон Новый город, Орск, Оренбургская область, улица Горького, 153А');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('959', '107', '481', '280000');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('960', '107', '483', '107_f_483_prodam-komnatu---komnata-11-m-v-1-k-kvartire-na-4-etazhe-9-etazhnogo-panelnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('961', '107', '484', '107_f_484_prodam-komnatu---komnata-11-m-v-1-k-kvartire-na-4-etazhe-9-etazhnogo-panelnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('962', '107', '485', '107_f_485_prodam-komnatu---komnata-11-m-v-1-k-kvartire-na-4-etazhe-9-etazhnogo-panelnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('963', '107', '486', '107_f_486_prodam-komnatu---komnata-11-m-v-1-k-kvartire-na-4-etazhe-9-etazhnogo-panelnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('964', '107', '487', '107_f_487_prodam-komnatu---komnata-11-m-v-1-k-kvartire-na-4-etazhe-9-etazhnogo-panelnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('965', '108', '475', '+7 987 787-13-52');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('966', '108', '477', 'ул Петровского, 12');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('967', '108', '481', '100');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('968', '109', '475', '+7 906 839-00-51');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('969', '109', '477', 'ул Просвещения, 57');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('970', '109', '481', '499000');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('971', '109', '483', '109_f_483_prodam-komnatu---komnata-25-m-v-1-k-kvartire-na-2-etazhe-5-etazhnogo-kirpichnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('972', '109', '484', '109_f_484_prodam-komnatu---komnata-25-m-v-1-k-kvartire-na-2-etazhe-5-etazhnogo-kirpichnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('973', '109', '485', '109_f_485_prodam-komnatu---komnata-25-m-v-1-k-kvartire-na-2-etazhe-5-etazhnogo-kirpichnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('974', '109', '486', '109_f_486_prodam-komnatu---komnata-25-m-v-1-k-kvartire-na-2-etazhe-5-etazhnogo-kirpichnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('975', '109', '487', '109_f_487_prodam-komnatu---komnata-25-m-v-1-k-kvartire-na-2-etazhe-5-etazhnogo-kirpichnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('976', '109', '488', '109_f_488_prodam-komnatu---komnata-25-m-v-1-k-kvartire-na-2-etazhe-5-etazhnogo-kirpichnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('977', '109', '489', '109_f_489_prodam-komnatu---komnata-25-m-v-1-k-kvartire-na-2-etazhe-5-etazhnogo-kirpichnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('978', '109', '490', '109_f_490_prodam-komnatu---komnata-25-m-v-1-k-kvartire-na-2-etazhe-5-etazhnogo-kirpichnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('979', '109', '491', '109_f_491_prodam-komnatu---komnata-25-m-v-1-k-kvartire-na-2-etazhe-5-etazhnogo-kirpichnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('980', '109', '492', '109_f_492_prodam-komnatu---komnata-25-m-v-1-k-kvartire-na-2-etazhe-5-etazhnogo-kirpichnogo-doma.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('981', '110', '475', '+7 987 884-70-17');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('982', '110', '477', 'ул Стартовая, 7А');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('983', '110', '481', '400000');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('987', '111', '475', '+7 919 864-27-29');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('988', '111', '477', 'ул Московская, 17');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('989', '111', '481', '230000');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('990', '112', '475', '+7 919 868-25-36');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('991', '112', '477', 'ул Горького, 153А');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('992', '112', '481', '390000');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('1000', '113', '475', '+7 913 497-53-81');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('1001', '113', '477', 'Ленина пр-кт, 87');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('1002', '113', '481', '1');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('1003', '114', '475', '+7 911 010-63-57');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('1004', '114', '477', 'Ленина пр-кт, 62');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('1005', '114', '481', '320000');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('1006', '115', '475', '+7 987 845-78-98');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('1007', '115', '477', 'Ленина пр-кт, 126');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('1008', '115', '481', '330000');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('1021', '117', '485', '117_f_485_prodam-dom---1-etazhnyi-dom-86.3-m--brus--na-uchastke-4.18-ga--v-cherte-goroda.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('1020', '117', '484', '117_f_484_prodam-dom---1-etazhnyi-dom-86.3-m--brus--na-uchastke-4.18-ga--v-cherte-goroda.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('1018', '117', '481', '1750000');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('1019', '117', '483', '117_f_483_prodam-dom---1-etazhnyi-dom-86.3-m--brus--na-uchastke-4.18-ga--v-cherte-goroda.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('1016', '117', '475', '+7 905 896-04-33');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('1017', '117', '477', 'уд.Бебеля');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('1013', '116', '475', '+7 987 875-08-65');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('1014', '116', '477', 'ул Кутузова, 58А');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('1015', '116', '481', '1');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('1022', '117', '486', '117_f_486_prodam-dom---1-etazhnyi-dom-86.3-m--brus--na-uchastke-4.18-ga--v-cherte-goroda.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('1023', '117', '487', '117_f_487_prodam-dom---1-etazhnyi-dom-86.3-m--brus--na-uchastke-4.18-ga--v-cherte-goroda.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('1024', '117', '488', '117_f_488_prodam-dom---1-etazhnyi-dom-86.3-m--brus--na-uchastke-4.18-ga--v-cherte-goroda.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('1025', '118', '475', '+7 905 846-15-45');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('1026', '118', '477', 'Запорожский пер, 6');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('1027', '118', '481', '6300000');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('1028', '118', '483', '118_f_483_prodam-dom---2-etazhnyi-dom-340-m--kirpich--na-uchastke-7.4-sot.--v-cherte-goroda.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('1029', '118', '484', '118_f_484_prodam-dom---2-etazhnyi-dom-340-m--kirpich--na-uchastke-7.4-sot.--v-cherte-goroda.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('1030', '118', '485', '118_f_485_prodam-dom---2-etazhnyi-dom-340-m--kirpich--na-uchastke-7.4-sot.--v-cherte-goroda.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('1031', '118', '486', '118_f_486_prodam-dom---2-etazhnyi-dom-340-m--kirpich--na-uchastke-7.4-sot.--v-cherte-goroda.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('1032', '118', '487', '118_f_487_prodam-dom---2-etazhnyi-dom-340-m--kirpich--na-uchastke-7.4-sot.--v-cherte-goroda.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('1033', '118', '488', '118_f_488_prodam-dom---2-etazhnyi-dom-340-m--kirpich--na-uchastke-7.4-sot.--v-cherte-goroda.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('1034', '118', '489', '118_f_489_prodam-dom---2-etazhnyi-dom-340-m--kirpich--na-uchastke-7.4-sot.--v-cherte-goroda.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('1035', '118', '490', '118_f_490_prodam-dom---2-etazhnyi-dom-340-m--kirpich--na-uchastke-7.4-sot.--v-cherte-goroda.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('1036', '118', '491', '118_f_491_prodam-dom---2-etazhnyi-dom-340-m--kirpich--na-uchastke-7.4-sot.--v-cherte-goroda.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('1037', '118', '492', '118_f_492_prodam-dom---2-etazhnyi-dom-340-m--kirpich--na-uchastke-7.4-sot.--v-cherte-goroda.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('1038', '119', '475', '+7 905 898-26-42');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('1039', '119', '477', 'ул Маршака');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('1040', '119', '481', '1060000');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('1041', '119', '483', '119_f_483_prodam-dom---1-etazhnyi-dom-82.6-m--brus--na-uchastke-6-sot.--1-km-do-goroda.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('1042', '119', '484', '119_f_484_prodam-dom---1-etazhnyi-dom-82.6-m--brus--na-uchastke-6-sot.--1-km-do-goroda.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('1043', '119', '485', '119_f_485_prodam-dom---1-etazhnyi-dom-82.6-m--brus--na-uchastke-6-sot.--1-km-do-goroda.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('1044', '119', '486', '119_f_486_prodam-dom---1-etazhnyi-dom-82.6-m--brus--na-uchastke-6-sot.--1-km-do-goroda.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('1045', '119', '487', '119_f_487_prodam-dom---1-etazhnyi-dom-82.6-m--brus--na-uchastke-6-sot.--1-km-do-goroda.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('1046', '119', '488', '119_f_488_prodam-dom---1-etazhnyi-dom-82.6-m--brus--na-uchastke-6-sot.--1-km-do-goroda.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('1047', '119', '489', '119_f_489_prodam-dom---1-etazhnyi-dom-82.6-m--brus--na-uchastke-6-sot.--1-km-do-goroda.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('1048', '119', '490', '119_f_490_prodam-dom---1-etazhnyi-dom-82.6-m--brus--na-uchastke-6-sot.--1-km-do-goroda.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('1049', '120', '475', '+7 906 833-15-23');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('1050', '120', '477', 'ул Байкальская');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('1051', '120', '481', '2300000');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('1052', '120', '483', '120_f_483_prodam-dom---1-etazhnyi-dom-90-m--brevno--na-uchastke-6-sot.--v-cherte-goroda.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('1053', '120', '484', '120_f_484_prodam-dom---1-etazhnyi-dom-90-m--brevno--na-uchastke-6-sot.--v-cherte-goroda.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('1054', '120', '485', '120_f_485_prodam-dom---1-etazhnyi-dom-90-m--brevno--na-uchastke-6-sot.--v-cherte-goroda.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('1055', '121', '477', 'ул Мамина-Сибиряка');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('1056', '121', '481', '2350000');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('1057', '121', '483', '121_f_483_prodam-dom---1-etazhnyi-dom-68-m--kirpich--na-uchastke-8-sot.--v-cherte-goroda.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('1058', '121', '484', '121_f_484_prodam-dom---1-etazhnyi-dom-68-m--kirpich--na-uchastke-8-sot.--v-cherte-goroda.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('1059', '121', '485', '121_f_485_prodam-dom---1-etazhnyi-dom-68-m--kirpich--na-uchastke-8-sot.--v-cherte-goroda.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('1060', '121', '486', '121_f_486_prodam-dom---1-etazhnyi-dom-68-m--kirpich--na-uchastke-8-sot.--v-cherte-goroda.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('1061', '121', '487', '121_f_487_prodam-dom---1-etazhnyi-dom-68-m--kirpich--na-uchastke-8-sot.--v-cherte-goroda.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('1062', '121', '488', '121_f_488_prodam-dom---1-etazhnyi-dom-68-m--kirpich--na-uchastke-8-sot.--v-cherte-goroda.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('1063', '121', '489', '121_f_489_prodam-dom---1-etazhnyi-dom-68-m--kirpich--na-uchastke-8-sot.--v-cherte-goroda.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('1064', '121', '490', '121_f_490_prodam-dom---1-etazhnyi-dom-68-m--kirpich--na-uchastke-8-sot.--v-cherte-goroda.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('1065', '121', '491', '121_f_491_prodam-dom---1-etazhnyi-dom-68-m--kirpich--na-uchastke-8-sot.--v-cherte-goroda.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('1066', '121', '492', '121_f_492_prodam-dom---1-etazhnyi-dom-68-m--kirpich--na-uchastke-8-sot.--v-cherte-goroda.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('1067', '122', '475', '+7 901 097-90-97');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('1068', '122', '477', 'ул.Андреева,17');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('1069', '122', '481', '2400000');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('1070', '122', '483', '122_f_483_prodam-dom---1-etazhnyi-dom-140-m--penobloki--na-uchastke-15-sot.--v-cherte-goroda.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('1071', '122', '484', '122_f_484_prodam-dom---1-etazhnyi-dom-140-m--penobloki--na-uchastke-15-sot.--v-cherte-goroda.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('1072', '122', '485', '122_f_485_prodam-dom---1-etazhnyi-dom-140-m--penobloki--na-uchastke-15-sot.--v-cherte-goroda.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('1073', '122', '486', '122_f_486_prodam-dom---1-etazhnyi-dom-140-m--penobloki--na-uchastke-15-sot.--v-cherte-goroda.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('1074', '122', '487', '122_f_487_prodam-dom---1-etazhnyi-dom-140-m--penobloki--na-uchastke-15-sot.--v-cherte-goroda.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('1075', '122', '488', '122_f_488_prodam-dom---1-etazhnyi-dom-140-m--penobloki--na-uchastke-15-sot.--v-cherte-goroda.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('1076', '122', '489', '122_f_489_prodam-dom---1-etazhnyi-dom-140-m--penobloki--na-uchastke-15-sot.--v-cherte-goroda.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('1077', '122', '490', '122_f_490_prodam-dom---1-etazhnyi-dom-140-m--penobloki--na-uchastke-15-sot.--v-cherte-goroda.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('1078', '122', '491', '122_f_491_prodam-dom---1-etazhnyi-dom-140-m--penobloki--na-uchastke-15-sot.--v-cherte-goroda.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('1079', '123', '475', '+7 905 899-65-37');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('1080', '123', '477', 'ул Покровская, 16');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('1081', '123', '481', '4300000');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('1082', '123', '483', '123_f_483_prodam-dom---1-etazhnyi-dom-102-m--kirpich--na-uchastke-6-sot.--v-cherte-goroda.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('1083', '123', '484', '123_f_484_prodam-dom---1-etazhnyi-dom-102-m--kirpich--na-uchastke-6-sot.--v-cherte-goroda.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('1084', '123', '485', '123_f_485_prodam-dom---1-etazhnyi-dom-102-m--kirpich--na-uchastke-6-sot.--v-cherte-goroda.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('1085', '123', '486', '123_f_486_prodam-dom---1-etazhnyi-dom-102-m--kirpich--na-uchastke-6-sot.--v-cherte-goroda.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('1086', '123', '487', '123_f_487_prodam-dom---1-etazhnyi-dom-102-m--kirpich--na-uchastke-6-sot.--v-cherte-goroda.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('1087', '123', '488', '123_f_488_prodam-dom---1-etazhnyi-dom-102-m--kirpich--na-uchastke-6-sot.--v-cherte-goroda.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('1088', '123', '489', '123_f_489_prodam-dom---1-etazhnyi-dom-102-m--kirpich--na-uchastke-6-sot.--v-cherte-goroda.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('1089', '123', '490', '123_f_490_prodam-dom---1-etazhnyi-dom-102-m--kirpich--na-uchastke-6-sot.--v-cherte-goroda.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('1090', '123', '491', '123_f_491_prodam-dom---1-etazhnyi-dom-102-m--kirpich--na-uchastke-6-sot.--v-cherte-goroda.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('1091', '123', '492', '123_f_492_prodam-dom---1-etazhnyi-dom-102-m--kirpich--na-uchastke-6-sot.--v-cherte-goroda.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('1092', '124', '475', '+7 905 882-70-27');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('1093', '124', '477', 'ул Швейников');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('1094', '124', '481', '3300000');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('1095', '124', '483', '124_f_483_prodam-dom---2-etazhnyi-dom-320-m--kirpich--na-uchastke-9-sot.--v-cherte-goroda.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('1096', '124', '484', '124_f_484_prodam-dom---2-etazhnyi-dom-320-m--kirpich--na-uchastke-9-sot.--v-cherte-goroda.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('1097', '124', '485', '124_f_485_prodam-dom---2-etazhnyi-dom-320-m--kirpich--na-uchastke-9-sot.--v-cherte-goroda.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('1098', '124', '486', '124_f_486_prodam-dom---2-etazhnyi-dom-320-m--kirpich--na-uchastke-9-sot.--v-cherte-goroda.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('1099', '125', '475', '+7 919 864-27-29');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('1100', '125', '477', 'ул Ковыльная');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('1101', '125', '481', '1350000');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('1102', '125', '483', '125_f_483_prodam-dom---1-etazhnyi-dom-102-m--kirpich--na-uchastke-7-sot.--v-cherte-goroda.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('1103', '126', '475', '+7 905 882-70-27');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('1104', '126', '477', 'ул Энергетиков');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('1105', '126', '481', '850000');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('1106', '126', '483', '126_f_483_prodam-dom---1-etazhnyi-dom-66-m--brus--na-uchastke-9-sot.--v-cherte-goroda.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('1107', '126', '484', '126_f_484_prodam-dom---1-etazhnyi-dom-66-m--brus--na-uchastke-9-sot.--v-cherte-goroda.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('1108', '127', '475', '+7 987 845-78-98');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('1109', '127', '477', 'ул Буканова');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('1110', '127', '481', '7800000');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('1111', '127', '483', '127_f_483_prodam-dom---2-etazhnyi-dom-349-m--kirpich--na-uchastke-10-sot.--v-cherte-goroda.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('1112', '127', '484', '127_f_484_prodam-dom---2-etazhnyi-dom-349-m--kirpich--na-uchastke-10-sot.--v-cherte-goroda.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('1113', '127', '485', '127_f_485_prodam-dom---2-etazhnyi-dom-349-m--kirpich--na-uchastke-10-sot.--v-cherte-goroda.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('1114', '127', '486', '127_f_486_prodam-dom---2-etazhnyi-dom-349-m--kirpich--na-uchastke-10-sot.--v-cherte-goroda.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('1115', '127', '487', '127_f_487_prodam-dom---2-etazhnyi-dom-349-m--kirpich--na-uchastke-10-sot.--v-cherte-goroda.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('1116', '127', '488', '127_f_488_prodam-dom---2-etazhnyi-dom-349-m--kirpich--na-uchastke-10-sot.--v-cherte-goroda.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('1117', '127', '489', '127_f_489_prodam-dom---2-etazhnyi-dom-349-m--kirpich--na-uchastke-10-sot.--v-cherte-goroda.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('1118', '127', '490', '127_f_490_prodam-dom---2-etazhnyi-dom-349-m--kirpich--na-uchastke-10-sot.--v-cherte-goroda.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('1119', '127', '491', '127_f_491_prodam-dom---2-etazhnyi-dom-349-m--kirpich--na-uchastke-10-sot.--v-cherte-goroda.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('1120', '127', '492', '127_f_492_prodam-dom---2-etazhnyi-dom-349-m--kirpich--na-uchastke-10-sot.--v-cherte-goroda.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('1121', '128', '475', '+7 961 911-60-08');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('1122', '128', '477', 'Баумана пер');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('1123', '128', '481', '1800000');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('1124', '128', '483', '128_f_483_prodam-dom---1-etazhnyi-dom-110-m--eksperimentalnye-materialy--na-uchastke-8-sot.--v-cherte-goroda.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('1125', '128', '484', '128_f_484_prodam-dom---1-etazhnyi-dom-110-m--eksperimentalnye-materialy--na-uchastke-8-sot.--v-cherte-goroda.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('1126', '129', '475', '+7 926 433-48-84');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('1127', '129', '477', 'ул Южно-Уральская');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('1128', '129', '481', '4150000');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('1129', '129', '483', '129_f_483_prodam-dom---2-etazhnyi-dom-215-m--kirpich--na-uchastke-8-sot.--v-cherte-goroda.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('1130', '129', '484', '129_f_484_prodam-dom---2-etazhnyi-dom-215-m--kirpich--na-uchastke-8-sot.--v-cherte-goroda.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('1131', '129', '485', '129_f_485_prodam-dom---2-etazhnyi-dom-215-m--kirpich--na-uchastke-8-sot.--v-cherte-goroda.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('1132', '129', '486', '129_f_486_prodam-dom---2-etazhnyi-dom-215-m--kirpich--na-uchastke-8-sot.--v-cherte-goroda.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('1133', '129', '487', '129_f_487_prodam-dom---2-etazhnyi-dom-215-m--kirpich--na-uchastke-8-sot.--v-cherte-goroda.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('1134', '129', '488', '129_f_488_prodam-dom---2-etazhnyi-dom-215-m--kirpich--na-uchastke-8-sot.--v-cherte-goroda.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('1135', '129', '489', '129_f_489_prodam-dom---2-etazhnyi-dom-215-m--kirpich--na-uchastke-8-sot.--v-cherte-goroda.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('1136', '129', '490', '129_f_490_prodam-dom---2-etazhnyi-dom-215-m--kirpich--na-uchastke-8-sot.--v-cherte-goroda.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('1137', '129', '491', '129_f_491_prodam-dom---2-etazhnyi-dom-215-m--kirpich--na-uchastke-8-sot.--v-cherte-goroda.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('1138', '129', '492', '129_f_492_prodam-dom---2-etazhnyi-dom-215-m--kirpich--na-uchastke-8-sot.--v-cherte-goroda.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('1139', '130', '475', '+7 905 896-71-58');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('1140', '130', '477', 'ул Балакирева, 40');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('1141', '130', '481', '1800000');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('1142', '130', '483', '130_f_483_prodam-dom---1-etazhnyi-dom-60-m--brevno--na-uchastke-6-sot.--v-cherte-goroda.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('1143', '130', '484', '130_f_484_prodam-dom---1-etazhnyi-dom-60-m--brevno--na-uchastke-6-sot.--v-cherte-goroda.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('1144', '130', '485', '130_f_485_prodam-dom---1-etazhnyi-dom-60-m--brevno--na-uchastke-6-sot.--v-cherte-goroda.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('1145', '130', '486', '130_f_486_prodam-dom---1-etazhnyi-dom-60-m--brevno--na-uchastke-6-sot.--v-cherte-goroda.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('1146', '130', '487', '130_f_487_prodam-dom---1-etazhnyi-dom-60-m--brevno--na-uchastke-6-sot.--v-cherte-goroda.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('1147', '130', '488', '130_f_488_prodam-dom---1-etazhnyi-dom-60-m--brevno--na-uchastke-6-sot.--v-cherte-goroda.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('1148', '130', '489', '130_f_489_prodam-dom---1-etazhnyi-dom-60-m--brevno--na-uchastke-6-sot.--v-cherte-goroda.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('1149', '130', '490', '130_f_490_prodam-dom---1-etazhnyi-dom-60-m--brevno--na-uchastke-6-sot.--v-cherte-goroda.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('1150', '130', '491', '130_f_491_prodam-dom---1-etazhnyi-dom-60-m--brevno--na-uchastke-6-sot.--v-cherte-goroda.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('1151', '131', '475', '+7 987 772-12-56');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('1152', '131', '477', 'Белореченский проезд д.13');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('1153', '131', '481', '6700000');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('1154', '131', '483', '131_f_483_prodam-dom---2-etazhnyi-dom-150-m--kirpich--na-uchastke-8-sot.--v-cherte-goroda.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('1155', '131', '484', '131_f_484_prodam-dom---2-etazhnyi-dom-150-m--kirpich--na-uchastke-8-sot.--v-cherte-goroda.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('1156', '131', '485', '131_f_485_prodam-dom---2-etazhnyi-dom-150-m--kirpich--na-uchastke-8-sot.--v-cherte-goroda.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('1157', '131', '486', '131_f_486_prodam-dom---2-etazhnyi-dom-150-m--kirpich--na-uchastke-8-sot.--v-cherte-goroda.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('1158', '131', '487', '131_f_487_prodam-dom---2-etazhnyi-dom-150-m--kirpich--na-uchastke-8-sot.--v-cherte-goroda.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('1159', '131', '488', '131_f_488_prodam-dom---2-etazhnyi-dom-150-m--kirpich--na-uchastke-8-sot.--v-cherte-goroda.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('1160', '131', '489', '131_f_489_prodam-dom---2-etazhnyi-dom-150-m--kirpich--na-uchastke-8-sot.--v-cherte-goroda.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('1161', '131', '490', '131_f_490_prodam-dom---2-etazhnyi-dom-150-m--kirpich--na-uchastke-8-sot.--v-cherte-goroda.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('1162', '131', '491', '131_f_491_prodam-dom---2-etazhnyi-dom-150-m--kirpich--na-uchastke-8-sot.--v-cherte-goroda.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('1163', '132', '475', '+7 987 845-78-98');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('1164', '132', '477', 'ул Новосибирская');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('1165', '132', '481', '2300000');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('1166', '132', '483', '132_f_483_prodam-dom---1-etazhnyi-dom-72-m--kirpich--na-uchastke-5-sot.--v-cherte-goroda.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('1167', '132', '484', '132_f_484_prodam-dom---1-etazhnyi-dom-72-m--kirpich--na-uchastke-5-sot.--v-cherte-goroda.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('1168', '132', '485', '132_f_485_prodam-dom---1-etazhnyi-dom-72-m--kirpich--na-uchastke-5-sot.--v-cherte-goroda.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('1169', '132', '486', '132_f_486_prodam-dom---1-etazhnyi-dom-72-m--kirpich--na-uchastke-5-sot.--v-cherte-goroda.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('1170', '132', '487', '132_f_487_prodam-dom---1-etazhnyi-dom-72-m--kirpich--na-uchastke-5-sot.--v-cherte-goroda.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('1171', '132', '488', '132_f_488_prodam-dom---1-etazhnyi-dom-72-m--kirpich--na-uchastke-5-sot.--v-cherte-goroda.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('1172', '132', '489', '132_f_489_prodam-dom---1-etazhnyi-dom-72-m--kirpich--na-uchastke-5-sot.--v-cherte-goroda.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('1173', '132', '490', '132_f_490_prodam-dom---1-etazhnyi-dom-72-m--kirpich--na-uchastke-5-sot.--v-cherte-goroda.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('1174', '133', '475', '+7 906 679-27-16');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('1175', '133', '477', 'ул Кутузова, 19А');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('1176', '133', '481', '15000000');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('1177', '133', '483', '133_f_483_prodam-dom---2-etazhnyi-dom-300-m--kirpich--na-uchastke-20-sot.--v-cherte-goroda.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('1178', '133', '484', '133_f_484_prodam-dom---2-etazhnyi-dom-300-m--kirpich--na-uchastke-20-sot.--v-cherte-goroda.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('1179', '133', '485', '133_f_485_prodam-dom---2-etazhnyi-dom-300-m--kirpich--na-uchastke-20-sot.--v-cherte-goroda.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('1180', '133', '486', '133_f_486_prodam-dom---2-etazhnyi-dom-300-m--kirpich--na-uchastke-20-sot.--v-cherte-goroda.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('1181', '133', '487', '133_f_487_prodam-dom---2-etazhnyi-dom-300-m--kirpich--na-uchastke-20-sot.--v-cherte-goroda.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('1182', '133', '488', '133_f_488_prodam-dom---2-etazhnyi-dom-300-m--kirpich--na-uchastke-20-sot.--v-cherte-goroda.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('1183', '134', '475', '+7 961 949-73-30');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('1184', '134', '477', 'ул Якутская');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('1185', '134', '481', '9500000');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('1186', '134', '483', '134_f_483_prodam-dom---2-etazhnyi-dom-525-m--penobloki--na-uchastke-9-sot.--v-cherte-goroda.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('1187', '134', '484', '134_f_484_prodam-dom---2-etazhnyi-dom-525-m--penobloki--na-uchastke-9-sot.--v-cherte-goroda.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('1188', '134', '485', '134_f_485_prodam-dom---2-etazhnyi-dom-525-m--penobloki--na-uchastke-9-sot.--v-cherte-goroda.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('1189', '134', '486', '134_f_486_prodam-dom---2-etazhnyi-dom-525-m--penobloki--na-uchastke-9-sot.--v-cherte-goroda.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('1190', '134', '487', '134_f_487_prodam-dom---2-etazhnyi-dom-525-m--penobloki--na-uchastke-9-sot.--v-cherte-goroda.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('1191', '134', '488', '134_f_488_prodam-dom---2-etazhnyi-dom-525-m--penobloki--na-uchastke-9-sot.--v-cherte-goroda.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('1192', '134', '489', '134_f_489_prodam-dom---2-etazhnyi-dom-525-m--penobloki--na-uchastke-9-sot.--v-cherte-goroda.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('1193', '134', '490', '134_f_490_prodam-dom---2-etazhnyi-dom-525-m--penobloki--na-uchastke-9-sot.--v-cherte-goroda.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('1194', '134', '491', '134_f_491_prodam-dom---2-etazhnyi-dom-525-m--penobloki--na-uchastke-9-sot.--v-cherte-goroda.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('1195', '134', '492', '134_f_492_prodam-dom---2-etazhnyi-dom-525-m--penobloki--na-uchastke-9-sot.--v-cherte-goroda.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('1196', '135', '475', '+7 906 844-97-62');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('1197', '135', '477', 'ул Садовая');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('1198', '135', '481', '2550000');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('1199', '135', '483', '135_f_483_prodam-dom---1-etazhnyi-dom-120-m--kirpich--na-uchastke-7-sot.--v-cherte-goroda.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('1200', '135', '484', '135_f_484_prodam-dom---1-etazhnyi-dom-120-m--kirpich--na-uchastke-7-sot.--v-cherte-goroda.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('1201', '135', '485', '135_f_485_prodam-dom---1-etazhnyi-dom-120-m--kirpich--na-uchastke-7-sot.--v-cherte-goroda.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('1202', '135', '486', '135_f_486_prodam-dom---1-etazhnyi-dom-120-m--kirpich--na-uchastke-7-sot.--v-cherte-goroda.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('1203', '135', '487', '135_f_487_prodam-dom---1-etazhnyi-dom-120-m--kirpich--na-uchastke-7-sot.--v-cherte-goroda.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('1204', '135', '488', '135_f_488_prodam-dom---1-etazhnyi-dom-120-m--kirpich--na-uchastke-7-sot.--v-cherte-goroda.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('1205', '135', '489', '135_f_489_prodam-dom---1-etazhnyi-dom-120-m--kirpich--na-uchastke-7-sot.--v-cherte-goroda.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('1206', '136', '475', '+7 932 841-67-61');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('1207', '136', '477', 'ул Ялтинская');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('1208', '136', '481', '7500000');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('1209', '136', '483', '136_f_483_prodam-dom---2-etazhnyi-dom-260-m--kirpich--na-uchastke-7-sot.--v-cherte-goroda.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('1210', '136', '484', '136_f_484_prodam-dom---2-etazhnyi-dom-260-m--kirpich--na-uchastke-7-sot.--v-cherte-goroda.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('1211', '136', '485', '136_f_485_prodam-dom---2-etazhnyi-dom-260-m--kirpich--na-uchastke-7-sot.--v-cherte-goroda.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('1212', '136', '486', '136_f_486_prodam-dom---2-etazhnyi-dom-260-m--kirpich--na-uchastke-7-sot.--v-cherte-goroda.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('1213', '136', '487', '136_f_487_prodam-dom---2-etazhnyi-dom-260-m--kirpich--na-uchastke-7-sot.--v-cherte-goroda.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('1214', '136', '488', '136_f_488_prodam-dom---2-etazhnyi-dom-260-m--kirpich--na-uchastke-7-sot.--v-cherte-goroda.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('1215', '136', '489', '136_f_489_prodam-dom---2-etazhnyi-dom-260-m--kirpich--na-uchastke-7-sot.--v-cherte-goroda.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('1216', '136', '490', '136_f_490_prodam-dom---2-etazhnyi-dom-260-m--kirpich--na-uchastke-7-sot.--v-cherte-goroda.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('1217', '136', '491', '136_f_491_prodam-dom---2-etazhnyi-dom-260-m--kirpich--na-uchastke-7-sot.--v-cherte-goroda.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('1218', '136', '492', '136_f_492_prodam-dom---2-etazhnyi-dom-260-m--kirpich--na-uchastke-7-sot.--v-cherte-goroda.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('1219', '137', '475', '+7 903 393-36-00');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('1220', '137', '477', 'ул Краснощекова, 45');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('1221', '137', '481', '950000');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('1222', '137', '483', '137_f_483_prodam-dom---1-etazhnyi-dom-48-m--brus--na-uchastke-3-sot.--v-cherte-goroda.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('1223', '137', '484', '137_f_484_prodam-dom---1-etazhnyi-dom-48-m--brus--na-uchastke-3-sot.--v-cherte-goroda.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('1224', '137', '485', '137_f_485_prodam-dom---1-etazhnyi-dom-48-m--brus--na-uchastke-3-sot.--v-cherte-goroda.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('1225', '137', '486', '137_f_486_prodam-dom---1-etazhnyi-dom-48-m--brus--na-uchastke-3-sot.--v-cherte-goroda.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('1226', '137', '487', '137_f_487_prodam-dom---1-etazhnyi-dom-48-m--brus--na-uchastke-3-sot.--v-cherte-goroda.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('1227', '137', '488', '137_f_488_prodam-dom---1-etazhnyi-dom-48-m--brus--na-uchastke-3-sot.--v-cherte-goroda.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('1228', '137', '489', '137_f_489_prodam-dom---1-etazhnyi-dom-48-m--brus--na-uchastke-3-sot.--v-cherte-goroda.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('1229', '137', '490', '137_f_490_prodam-dom---1-etazhnyi-dom-48-m--brus--na-uchastke-3-sot.--v-cherte-goroda.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('1230', '137', '491', '137_f_491_prodam-dom---1-etazhnyi-dom-48-m--brus--na-uchastke-3-sot.--v-cherte-goroda.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('1231', '137', '492', '137_f_492_prodam-dom---1-etazhnyi-dom-48-m--brus--na-uchastke-3-sot.--v-cherte-goroda.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('1232', '138', '475', '+7 906 831-60-23');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('1233', '138', '477', 'ул Луначарского д. 27');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('1234', '138', '481', '3700000');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('1235', '138', '483', '138_f_483_prodam-dom---1-etazhnyi-dom-131-m--brus--na-uchastke-5-sot.--v-cherte-goroda.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('1236', '138', '484', '138_f_484_prodam-dom---1-etazhnyi-dom-131-m--brus--na-uchastke-5-sot.--v-cherte-goroda.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('1237', '138', '485', '138_f_485_prodam-dom---1-etazhnyi-dom-131-m--brus--na-uchastke-5-sot.--v-cherte-goroda.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('1238', '138', '486', '138_f_486_prodam-dom---1-etazhnyi-dom-131-m--brus--na-uchastke-5-sot.--v-cherte-goroda.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('1239', '138', '487', '138_f_487_prodam-dom---1-etazhnyi-dom-131-m--brus--na-uchastke-5-sot.--v-cherte-goroda.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('1240', '138', '488', '138_f_488_prodam-dom---1-etazhnyi-dom-131-m--brus--na-uchastke-5-sot.--v-cherte-goroda.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('1241', '138', '489', '138_f_489_prodam-dom---1-etazhnyi-dom-131-m--brus--na-uchastke-5-sot.--v-cherte-goroda.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('1242', '138', '490', '138_f_490_prodam-dom---1-etazhnyi-dom-131-m--brus--na-uchastke-5-sot.--v-cherte-goroda.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('1243', '138', '491', '138_f_491_prodam-dom---1-etazhnyi-dom-131-m--brus--na-uchastke-5-sot.--v-cherte-goroda.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('1244', '138', '492', '138_f_492_prodam-dom---1-etazhnyi-dom-131-m--brus--na-uchastke-5-sot.--v-cherte-goroda.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('1245', '139', '475', '+7 986 783-85-37');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('1246', '139', '477', 'ул Тбилисская86');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('1247', '139', '481', '1500000');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('1248', '139', '483', '139_f_483_prodam-dom---1-etazhnyi-dom-100-m--brevno--na-uchastke-9-sot.--v-cherte-goroda.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('1249', '139', '484', '139_f_484_prodam-dom---1-etazhnyi-dom-100-m--brevno--na-uchastke-9-sot.--v-cherte-goroda.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('1250', '139', '485', '139_f_485_prodam-dom---1-etazhnyi-dom-100-m--brevno--na-uchastke-9-sot.--v-cherte-goroda.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('1251', '139', '486', '139_f_486_prodam-dom---1-etazhnyi-dom-100-m--brevno--na-uchastke-9-sot.--v-cherte-goroda.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('1252', '139', '487', '139_f_487_prodam-dom---1-etazhnyi-dom-100-m--brevno--na-uchastke-9-sot.--v-cherte-goroda.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('1253', '139', '488', '139_f_488_prodam-dom---1-etazhnyi-dom-100-m--brevno--na-uchastke-9-sot.--v-cherte-goroda.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('1254', '140', '475', '+7 986 794-06-59');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('1255', '140', '477', 'ул Черногорская');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('1256', '140', '481', '2500000');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('1257', '140', '483', '140_f_483_prodam-dom---1-etazhnyi-dom-79-m--penobloki--na-uchastke-5-sot.--v-cherte-goroda.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('1258', '140', '484', '140_f_484_prodam-dom---1-etazhnyi-dom-79-m--penobloki--na-uchastke-5-sot.--v-cherte-goroda.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('1259', '140', '485', '140_f_485_prodam-dom---1-etazhnyi-dom-79-m--penobloki--na-uchastke-5-sot.--v-cherte-goroda.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('1260', '140', '486', '140_f_486_prodam-dom---1-etazhnyi-dom-79-m--penobloki--na-uchastke-5-sot.--v-cherte-goroda.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('1261', '140', '487', '140_f_487_prodam-dom---1-etazhnyi-dom-79-m--penobloki--na-uchastke-5-sot.--v-cherte-goroda.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('1262', '141', '475', '+7 905 896-04-87');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('1263', '141', '477', 'ул Бестужева, 20');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('1264', '141', '481', '750000');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('1265', '141', '483', '141_f_483_prodam-dom---1-etazhnyi-dom-47-m--eksperimentalnye-materialy--na-uchastke-7-sot.--v-cherte-goroda.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('1266', '141', '484', '141_f_484_prodam-dom---1-etazhnyi-dom-47-m--eksperimentalnye-materialy--na-uchastke-7-sot.--v-cherte-goroda.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('1267', '141', '485', '141_f_485_prodam-dom---1-etazhnyi-dom-47-m--eksperimentalnye-materialy--na-uchastke-7-sot.--v-cherte-goroda.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('1268', '142', '475', '+7 905 896-04-87');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('1269', '142', '477', 'ул Шелухина, 17');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('1270', '142', '481', '1050000');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('1271', '142', '483', '142_f_483_prodam-dom---1-etazhnyi-dom-50-m--eksperimentalnye-materialy--na-uchastke-4-sot.--v-cherte-goroda.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('1272', '143', '475', '+7 905 897-33-91');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('1273', '143', '477', 'ул Малишевского');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('1274', '143', '481', '830000');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('1275', '143', '483', '143_f_483_prodam-dom---1-etazhnyi-dom-60-m--eksperimentalnye-materialy--na-uchastke-2-sot.--v-cherte-goroda.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('1276', '143', '484', '143_f_484_prodam-dom---1-etazhnyi-dom-60-m--eksperimentalnye-materialy--na-uchastke-2-sot.--v-cherte-goroda.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('1277', '143', '485', '143_f_485_prodam-dom---1-etazhnyi-dom-60-m--eksperimentalnye-materialy--na-uchastke-2-sot.--v-cherte-goroda.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('1278', '143', '486', '143_f_486_prodam-dom---1-etazhnyi-dom-60-m--eksperimentalnye-materialy--na-uchastke-2-sot.--v-cherte-goroda.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('1279', '143', '487', '143_f_487_prodam-dom---1-etazhnyi-dom-60-m--eksperimentalnye-materialy--na-uchastke-2-sot.--v-cherte-goroda.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('1280', '143', '488', '143_f_488_prodam-dom---1-etazhnyi-dom-60-m--eksperimentalnye-materialy--na-uchastke-2-sot.--v-cherte-goroda.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('1281', '143', '489', '143_f_489_prodam-dom---1-etazhnyi-dom-60-m--eksperimentalnye-materialy--na-uchastke-2-sot.--v-cherte-goroda.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('1282', '144', '475', '+7 905 898-75-77');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('1283', '144', '477', 'ул Дунайская');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('1284', '144', '481', '1400000');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('1285', '144', '483', '144_f_483_prodam-dom---1-etazhnyi-dom-42.6-m--brus--na-uchastke-17-sot.--v-cherte-goroda.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('1286', '144', '484', '144_f_484_prodam-dom---1-etazhnyi-dom-42.6-m--brus--na-uchastke-17-sot.--v-cherte-goroda.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('1287', '144', '485', '144_f_485_prodam-dom---1-etazhnyi-dom-42.6-m--brus--na-uchastke-17-sot.--v-cherte-goroda.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('1288', '144', '486', '144_f_486_prodam-dom---1-etazhnyi-dom-42.6-m--brus--na-uchastke-17-sot.--v-cherte-goroda.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('1289', '144', '487', '144_f_487_prodam-dom---1-etazhnyi-dom-42.6-m--brus--na-uchastke-17-sot.--v-cherte-goroda.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('1290', '144', '488', '144_f_488_prodam-dom---1-etazhnyi-dom-42.6-m--brus--na-uchastke-17-sot.--v-cherte-goroda.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('1291', '144', '489', '144_f_489_prodam-dom---1-etazhnyi-dom-42.6-m--brus--na-uchastke-17-sot.--v-cherte-goroda.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('1292', '145', '475', '+7 905 897-33-91');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('1293', '145', '477', 'Никитина б-р, 3');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('1294', '145', '481', '1650000');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('1295', '145', '483', '145_f_483_prodam-dom---1-etazhnyi-dom-63-m--penobloki--na-uchastke-5-sot.--v-cherte-goroda.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('1296', '145', '484', '145_f_484_prodam-dom---1-etazhnyi-dom-63-m--penobloki--na-uchastke-5-sot.--v-cherte-goroda.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('1297', '145', '485', '145_f_485_prodam-dom---1-etazhnyi-dom-63-m--penobloki--na-uchastke-5-sot.--v-cherte-goroda.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('1298', '145', '486', '145_f_486_prodam-dom---1-etazhnyi-dom-63-m--penobloki--na-uchastke-5-sot.--v-cherte-goroda.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('1299', '145', '487', '145_f_487_prodam-dom---1-etazhnyi-dom-63-m--penobloki--na-uchastke-5-sot.--v-cherte-goroda.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('1300', '145', '488', '145_f_488_prodam-dom---1-etazhnyi-dom-63-m--penobloki--na-uchastke-5-sot.--v-cherte-goroda.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('1301', '145', '489', '145_f_489_prodam-dom---1-etazhnyi-dom-63-m--penobloki--na-uchastke-5-sot.--v-cherte-goroda.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('1302', '145', '490', '145_f_490_prodam-dom---1-etazhnyi-dom-63-m--penobloki--na-uchastke-5-sot.--v-cherte-goroda.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('1303', '145', '491', '145_f_491_prodam-dom---1-etazhnyi-dom-63-m--penobloki--na-uchastke-5-sot.--v-cherte-goroda.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('1304', '145', '492', '145_f_492_prodam-dom---1-etazhnyi-dom-63-m--penobloki--na-uchastke-5-sot.--v-cherte-goroda.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('1305', '146', '475', '+7 922 622-54-70');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('1306', '146', '477', 'ул 18 лет Октября 133');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('1307', '146', '481', '3300000');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('1308', '146', '483', '146_f_483_prodam-dom---1-etazhnyi-dom-112-m--brevno--na-uchastke-10-sot.--v-cherte-goroda.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('1309', '146', '484', '146_f_484_prodam-dom---1-etazhnyi-dom-112-m--brevno--na-uchastke-10-sot.--v-cherte-goroda.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('1310', '146', '485', '146_f_485_prodam-dom---1-etazhnyi-dom-112-m--brevno--na-uchastke-10-sot.--v-cherte-goroda.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('1311', '146', '486', '146_f_486_prodam-dom---1-etazhnyi-dom-112-m--brevno--na-uchastke-10-sot.--v-cherte-goroda.jpg');
INSERT INTO `eboard_db_fields`(`id`, `message`, `field`, `value`) VALUES ('1312', '146', '487', '146_f_487_prodam-dom---1-etazhnyi-dom-112-m--brevno--na-uchastke-10-sot.--v-cherte-goroda.jpg');


DROP TABLE IF EXISTS `eboard_db_tags`;
CREATE TABLE `eboard_db_tags` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `message` int(11) NOT NULL,
  `tag` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ind` (`message`,`tag`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS `eboard_fields`;
CREATE TABLE `eboard_fields` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cat` int(11) DEFAULT '0',
  `name` varchar(1000) NOT NULL,
  `comment` varchar(2000) DEFAULT NULL,
  `values` mediumtext,
  `max` int(11) DEFAULT NULL,
  `type` varchar(1) DEFAULT NULL,
  `type_string` varchar(1) DEFAULT NULL,
  `req` int(1) NOT NULL DEFAULT '2',
  `hide` int(1) DEFAULT '0',
  `block` int(1) NOT NULL,
  `sort` int(10) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=494 DEFAULT CHARSET=utf8;

INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('490', '0', 'Фото 8', 'Вы можете загрузить <br />фотографию', '', '1000', 'i', '', '2', '0', '1', '77');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('491', '0', 'Фото 9', 'Вы можете загрузить <br />фотографию', 'jpg
GIF
gif
JPG
PNG
png', '1000', 'i', '', '2', '0', '1', '78');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('489', '0', 'Фото 7', 'Вы можете загрузить <br />фотографию', '', '1000', 'i', '', '2', '0', '1', '76');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('487', '0', 'Фото 5', 'Вы можете загрузить <br />фотографию', '', '1000', 'i', '', '2', '0', '1', '74');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('488', '0', 'Фото 6', 'Вы можете загрузить <br />фотографию', '', '1000', 'i', '', '2', '0', '1', '75');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('322', '178', 'Количество комнат', '', '1
2
3
4
5
6
7
8
9
&gt;9', '100', 's', '', '1', '0', '1', '1');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('323', '476', 'Вид объекта', '', 'Вторичка
Новостройка', '100', 's', '', '1', '0', '1', '2');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('324', '760', 'Этаж', '', '1
2
3
4
5
6
7
8
9
10
11
12
13
14
15
16
17
18
19
20
21
22
23
24
25
26
27
28
29
30
31
32
33
34
35
36
37
38
39
40
41
42
43
44
45
46
47
48
49
50
51
52
53
54
55
56
57
58
59
60
61
62
63
64
65
66
67
68
69
70
71
72
73
74
75
76
77
78
79
80
81
82
83
84
85
86
87
88
89
90
91
92
93
94
95
96
97
98
99', '100', 's', '', '1', '0', '1', '3');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('325', '476', 'Этажей в доме', '', '1
2
3
4
5
6
7
8
9
10
11
12
13
14
15
16
17
18
19
20
21
22
23
24
25
26
27
28
29
30
31
32
33
34
35
36
37
38
39
40
41
42
43
44
45
46
47
48
49
50
51
52
53
54
55
56
57
58
59
60
61
62
63
64
65
66
67
68
69
70
71
72
73
74
75
76
77
78
79
80
81
82
83
84
85
86
87
88
89
90
91
92
93
94
95
96
97
98
99', '100', 's', '', '1', '0', '1', '4');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('326', '476', 'Тип дома', '', 'Кирпичный
Панельный
Блочный
Монолитный
Деревянный', '100', 's', '', '1', '0', '1', '5');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('327', '477', 'Количество комнат', '', '1
2
3
4
5
6
7
8
9
&gt;9', '100', 's', '', '1', '0', '1', '6');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('328', '477', 'Срок аренды', '', 'На длительный срок
Месяц
Сутки
Час', '100', 's', '', '1', '0', '1', '7');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('329', '477', 'Этаж', '', '1
2
3
4
5
6
7
8
9
10
11
12
13
14
15
16
17
18
19
20
21
22
23
24
25
26
27
28
29
30
31
32
33
34
35
36
37
38
39
40
41
42
43
44
45
46
47
48
49
50
51
52
53
54
55
56
57
58
59
60
61
62
63
64
65
66
67
68
69
70
71
72
73
74
75
76
77
78
79
80
81
82
83
84
85
86
87
88
89
90
91
92
93
94
95
96
97
98
99', '100', 's', '', '1', '0', '1', '8');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('330', '477', 'Этажей в доме', '', '1
2
3
4
5
6
7
8
9
10
11
12
13
14
15
16
17
18
19
20
21
22
23
24
25
26
27
28
29
30
31
32
33
34
35
36
37
38
39
40
41
42
43
44
45
46
47
48
49
50
51
52
53
54
55
56
57
58
59
60
61
62
63
64
65
66
67
68
69
70
71
72
73
74
75
76
77
78
79
80
81
82
83
84
85
86
87
88
89
90
91
92
93
94
95
96
97
98
99', '100', 's', '', '1', '0', '1', '9');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('331', '477', 'Тип дома', '', 'Кирпичный
Панельный
Блочный
Монолитный
Деревянный', '100', 's', '', '1', '0', '1', '10');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('332', '478', 'Количество комнат', '', 'Любое
Студия
1
2
3
4
5
6
7
8
9
&gt;9', '100', 's', '', '1', '0', '1', '11');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('333', '479', 'Количество комнат', '', 'Любое
Студия
1
2
3
4
5
6
7
8
9
&gt;9', '100', 's', '', '1', '0', '1', '12');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('334', '479', 'Срок аренды', '', 'На длительный срок
Месяц
Сутки
Час', '100', 's', '', '1', '0', '1', '13');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('335', '492', 'Вид объекта', '', 'Дом
Дача
Коттедж
Таунхаус', '100', 's', '', '1', '0', '1', '14');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('336', '492', 'Этажей в доме', '', '1
2
3
4
&gt;4', '100', 's', '', '1', '0', '1', '15');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('337', '492', 'Материал стен', '', 'Кирпич
Брус
Бревно
Металл
Пеноблоки
Сэндвич-панели
Ж/б панели
Экспериментальные материалы', '100', 's', '', '1', '0', '1', '16');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('338', '492', 'Расстояние до города, км', '', '0
1
2
3
4
5
6
7
8
9
10
11
12
13
14
15
16
17
18
19
20
21
22
23
24
25
26
27
28
29
30
31
32
33
34
35
36
37
38
39
40
41
42
43
44
45
46
47
48
49
50
51
52
53
54
55
56
57
58
59
60
61
62
63
64
65
66
67
68
69
70
71
72
73
74
75
76
77
78
79
80
81
82
83
84
85
86
87
88
89
90
91
92
93
94
95
96
97
98
99
100
101
102
103
104
105
106
107
108
109
110
111
112
113
114
115
116
117
118
119
120
121
122
123
124
125
126
127
128
129
130
131
132
133
134
135
136
137
138
139
140
141
142
143
144
145
146
147
148
149
150
151
152
153
154
155
156
157
158
159
160', '100', 's', '', '1', '0', '1', '17');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('339', '178', 'Вид объекта', '', 'Дом
Дача
Коттедж
Таунхаус', '100', 's', '', '1', '0', '1', '18');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('340', '493', 'Этажей в доме', '', '1
2
3
4
&gt;4', '100', 's', '', '1', '0', '1', '19');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('341', '493', 'Материал стен', '', 'Кирпич
Брус
Бревно
Металл
Пеноблоки
Сэндвич-панели
Ж/б панели
Экспериментальные материалы', '100', 's', '', '1', '0', '1', '20');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('342', '493', 'Срок аренды', '', 'На длительный срок
Месяц
Сутки
Час', '100', 's', '', '1', '0', '1', '21');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('343', '493', 'Расстояние до города, км', '', '0
1
2
3
4
5
6
7
8
9
10
11
12
13
14
15
16
17
18
19
20
21
22
23
24
25
26
27
28
29
30
31
32
33
34
35
36
37
38
39
40
41
42
43
44
45
46
47
48
49
50
51
52
53
54
55
56
57
58
59
60
61
62
63
64
65
66
67
68
69
70
71
72
73
74
75
76
77
78
79
80
81
82
83
84
85
86
87
88
89
90
91
92
93
94
95
96
97
98
99
100
101
102
103
104
105
106
107
108
109
110
111
112
113
114
115
116
117
118
119
120
121
122
123
124
125
126
127
128
129
130
131
132
133
134
135
136
137
138
139
140
141
142
143
144
145
146
147
148
149
150
151
152
153
154
155
156
157
158
159
160', '100', 's', '', '1', '0', '1', '22');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('344', '494', 'Вид объекта', '', 'Дом
Дача
Коттедж
Таунхаус', '100', 's', '', '1', '0', '1', '23');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('345', '494', 'Местонахождение', '', 'В черте города
За городом', '100', 's', '', '1', '0', '1', '24');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('346', '495', 'Вид объекта', '', 'Дом
Дача
Коттедж
Таунхаус', '100', 's', '', '1', '0', '1', '25');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('347', '495', 'Срок аренды', '', 'На длительный срок
Месяц
Сутки
Час', '100', 's', '', '1', '0', '1', '26');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('348', '495', 'Местонахождение', '', 'В черте города
За городом', '100', 's', '', '1', '0', '1', '27');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('349', '177', 'Категория земель', '', 'Поселений (ИЖС)
Сельхозназначения (СНТ, ДНП)
Промназначения', '100', 's', '', '1', '0', '1', '28');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('350', '488', 'Расстояние до города, км', '', '0
1
2
3
4
5
6
7
8
9
10
11
12
13
14
15
16
17
18
19
20
21
22
23
24
25
26
27
28
29
30
31
32
33
34
35
36
37
38
39
40
41
42
43
44
45
46
47
48
49
50
51
52
53
54
55
56
57
58
59
60
61
62
63
64
65
66
67
68
69
70
71
72
73
74
75
76
77
78
79
80
81
82
83
84
85
86
87
88
89
90
91
92
93
94
95
96
97
98
99
100
101
102
103
104
105
106
107
108
109
110
111
112
113
114
115
116
117
118
119
120
121
122
123
124
125
126
127
128
129
130
131
132
133
134
135
136
137
138
139
140
141
142
143
144
145
146
147
148
149
150
151
152
153
154
155
156
157
158
159
160', '100', 's', '', '1', '0', '1', '29');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('351', '489', 'Расстояние до города, км', '', '0
1
2
3
4
5
6
7
8
9
10
11
12
13
14
15
16
17
18
19
20
21
22
23
24
25
26
27
28
29
30
31
32
33
34
35
36
37
38
39
40
41
42
43
44
45
46
47
48
49
50
51
52
53
54
55
56
57
58
59
60
61
62
63
64
65
66
67
68
69
70
71
72
73
74
75
76
77
78
79
80
81
82
83
84
85
86
87
88
89
90
91
92
93
94
95
96
97
98
99
100
101
102
103
104
105
106
107
108
109
110
111
112
113
114
115
116
117
118
119
120
121
122
123
124
125
126
127
128
129
130
131
132
133
134
135
136
137
138
139
140
141
142
143
144
145
146
147
148
149
150
151
152
153
154
155
156
157
158
159
160', '100', 's', '', '1', '0', '1', '30');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('352', '490', 'Местонахождение', '', 'В черте города
За городом', '100', 's', '', '1', '0', '1', '31');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('353', '491', 'Местонахождение', '', 'В черте города
За городом', '100', 's', '', '1', '0', '1', '32');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('354', '179', 'Вид объекта', '', 'Гараж
Машиноместо', '100', 's', '', '1', '0', '1', '33');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('355', '496', 'Площадь, м²', '', '10
11
12
13
14
15
16
17
18
19
20
21
22
23
24
25
26
27
28
29
30
&gt;30', '100', 's', '', '1', '0', '1', '34');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('356', '496', 'Охрана', '', 'Да
Нет', '100', 's', '', '1', '0', '1', '35');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('357', '497', 'Площадь, м²', '', '10
11
12
13
14
15
16
17
18
19
20
21
22
23
24
25
26
27
28
29
30
&gt;30', '100', 's', '', '1', '0', '1', '36');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('358', '497', 'Охрана', '', 'Да
Нет', '100', 's', '', '1', '0', '1', '37');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('361', '176', 'Вид объекта', '', 'Гостиница
Офисное помещение
Помещение свободного назначения
Производственное помещение
Складское помещение
Торговое помещение', '100', 's', '', '1', '0', '1', '38');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('362', '180', 'Вид объекта', '', 'Квартира, апартаменты
Дом, вилла
Земельный участок
Гараж, машиноместо
Коммерческая недвижимость', '100', 's', '', '1', '0', '1', '39');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('364', '501', 'Срок аренды', '', 'На длительный срок
Посуточно', '100', 's', '', '1', '0', '1', '40');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('365', '503', 'Срок аренды', '', 'На длительный срок
Посуточно', '100', 's', '', '1', '0', '1', '41');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('414', '481', 'Тип дома', '', 'Кирпичный
Панельный
Блочный
Монолитный
Деревянный', '100', 's', '', '1', '0', '1', '42');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('413', '481', 'Этажей в доме', '', '1
2
3
4
5
6
7
8
9
10
11
12
13
14
15
16
17
18
19
20
21
22
23
24
25
26
27
28
29
30
31
32
33
34
35
36
37
38
39
40
41
42
43
44
45
46
47
48
49
50
51
52
53
54
55
56
57
58
59
60
61
62
63
64
65
66
67
68
69
70
71
72
73
74
75
76
77
78
79
80
81
82
83
84
85
86
87
88
89
90
91
92
93
94
95
96
97
98
99', '100', 's', '', '1', '0', '1', '43');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('410', '481', 'Срок аренды', '', 'На длительный срок
Месяц
Сутки
Час', '100', 's', '', '1', '0', '1', '44');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('411', '481', 'Комнат в квартире', '', '1
2
3
4
5
6
7
8
9
&gt;9', '100', 's', '', '1', '0', '1', '45');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('412', '481', 'Этаж', '', '1
2
3
4
5
6
7
8
9
10
11
12
13
14
15
16
17
18
19
20
21
22
23
24
25
26
27
28
29
30
31
32
33
34
35
36
37
38
39
40
41
42
43
44
45
46
47
48
49
50
51
52
53
54
55
56
57
58
59
60
61
62
63
64
65
66
67
68
69
70
71
72
73
74
75
76
77
78
79
80
81
82
83
84
85
86
87
88
89
90
91
92
93
94
95
96
97
98
99', '100', 's', '', '1', '0', '1', '46');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('415', '483', 'Срок аренды', '', 'На длительный срок
Месяц
Сутки
Час', '100', 's', '', '1', '0', '1', '47');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('406', '480', 'Комнат в квартире', '', '1
2
3
4
5
6
7
8
9
&gt;9', '100', 's', '', '1', '0', '1', '48');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('407', '480', 'Тип дома', '', 'Кирпичный
Панельный
Блочный
Монолитный
Деревянный', '100', 's', '', '1', '0', '1', '49');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('408', '480', 'Этаж', '', '1
2
3
4
5
6
7
8
9
10
11
12
13
14
15
16
17
18
19
20
21
22
23
24
25
26
27
28
29
30
31
32
33
34
35
36
37
38
39
40
41
42
43
44
45
46
47
48
49
50
51
52
53
54
55
56
57
58
59
60
61
62
63
64
65
66
67
68
69
70
71
72
73
74
75
76
77
78
79
80
81
82
83
84
85
86
87
88
89
90
91
92
93
94
95
96
97
98
99', '100', 's', '', '1', '0', '1', '50');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('409', '480', 'Этажей в доме', '', '1
2
3
4
5
6
7
8
9
10
11
12
13
14
15
16
17
18
19
20
21
22
23
24
25
26
27
28
29
30
31
32
33
34
35
36
37
38
39
40
41
42
43
44
45
46
47
48
49
50
51
52
53
54
55
56
57
58
59
60
61
62
63
64
65
66
67
68
69
70
71
72
73
74
75
76
77
78
79
80
81
82
83
84
85
86
87
88
89
90
91
92
93
94
95
96
97
98
99', '100', 's', '', '1', '0', '1', '51');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('429', '175', 'Площадь, м²', '', '', '100', 'v', 'n', '1', '0', '1', '52');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('430', '477', 'Площадь, м²', '', '', '100', 'v', '', '1', '0', '1', '53');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('431', '480', 'Площадь, м²', '', '', '100', 'v', '', '1', '0', '1', '54');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('432', '481', 'Площадь, м²', '', '', '100', 'v', '', '1', '0', '1', '55');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('433', '178', 'Площадь дома, м²', '', '', '100', 'v', '', '1', '0', '1', '56');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('434', '492', 'Площадь участка, соток', '', '', '100', 'v', '', '1', '0', '1', '57');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('435', '493', 'Площадь дома, м²', '', '', '100', 'v', '', '1', '0', '1', '58');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('436', '493', 'Площадь участка, соток', '', '', '100', 'v', '', '1', '0', '1', '59');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('437', '488', 'Площадь, соток', '', '', '100', 'v', '', '1', '0', '1', '60');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('438', '489', 'Площадь, соток', '', '', '100', 'v', '', '1', '0', '1', '61');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('439', '760', 'Площадь, м²', '', '', '100', 'v', '', '1', '0', '1', '62');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('440', '485', 'Площадь, м²', '', '', '100', 'v', '', '1', '0', '1', '63');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('486', '0', 'Фото 4', 'Вы можете загрузить <br />фотографию', '', '1000', 'i', '', '2', '0', '1', '73');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('485', '0', 'Фото 3', 'Вы можете загрузить <br />фотографию', '', '1000', 'i', '', '2', '0', '1', '72');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('484', '0', 'Фото 2', 'Вы можете загрузить <br />фотографию', '', '1000', 'i', '', '2', '0', '1', '71');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('475', '0', 'Телефон', '', '+7', '100', 'v', 't', '2', '0', '0', '64');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('477', '158', 'Адрес', '', '', '200', 'v', '', '2', '0', '0', '65');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('478', '0', 'Адрес сайта', '', '', '100', 'v', 'u', '2', '0', '0', '66');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('480', '0', 'Видео с YouTube', '', '', '100', 'y', '', '2', '0', '1', '67');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('481', '0', 'Цена', '', '', '9', 'p', '', '1', '0', '1', '68');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('482', '0', 'Торг', '', 'торг', '100', 'c', '', '2', '0', '0', '69');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('483', '0', 'Фото 1', 'jpg, png, gif', 'jpg
GIF
gif
JPG
PNG
png', '10000', 'i', '', '2', '0', '1', '70');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('493', '769', 'Что Вы хотите сделать', '', 'Продать
Купить
Сдать
Снять', '50', 'r', '', '1', '0', '1', '0');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('492', '0', 'Фото 10', 'Только изображения <br />jpg, png, gif<br />и не более чем 1мб', 'jpg
GIF
gif
JPG
PNG
png', '1000', 'i', '', '2', '0', '1', '79');


DROP TABLE IF EXISTS `eboard_images`;
CREATE TABLE `eboard_images` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent` int(5) NOT NULL,
  `file` varchar(256) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS `eboard_ind_cat`;
CREATE TABLE `eboard_ind_cat` (
  `message` int(11) NOT NULL,
  `cat` int(11) NOT NULL,
  PRIMARY KEY (`message`,`cat`),
  KEY `cat` (`cat`),
  KEY `message` (`message`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO `eboard_ind_cat`(`message`, `cat`) VALUES ('6', '760');
INSERT INTO `eboard_ind_cat`(`message`, `cat`) VALUES ('6', '769');
INSERT INTO `eboard_ind_cat`(`message`, `cat`) VALUES ('7', '760');
INSERT INTO `eboard_ind_cat`(`message`, `cat`) VALUES ('7', '769');
INSERT INTO `eboard_ind_cat`(`message`, `cat`) VALUES ('8', '760');
INSERT INTO `eboard_ind_cat`(`message`, `cat`) VALUES ('8', '769');
INSERT INTO `eboard_ind_cat`(`message`, `cat`) VALUES ('9', '760');
INSERT INTO `eboard_ind_cat`(`message`, `cat`) VALUES ('9', '769');
INSERT INTO `eboard_ind_cat`(`message`, `cat`) VALUES ('10', '760');
INSERT INTO `eboard_ind_cat`(`message`, `cat`) VALUES ('10', '769');
INSERT INTO `eboard_ind_cat`(`message`, `cat`) VALUES ('11', '760');
INSERT INTO `eboard_ind_cat`(`message`, `cat`) VALUES ('11', '769');
INSERT INTO `eboard_ind_cat`(`message`, `cat`) VALUES ('12', '760');
INSERT INTO `eboard_ind_cat`(`message`, `cat`) VALUES ('12', '769');
INSERT INTO `eboard_ind_cat`(`message`, `cat`) VALUES ('13', '760');
INSERT INTO `eboard_ind_cat`(`message`, `cat`) VALUES ('13', '769');
INSERT INTO `eboard_ind_cat`(`message`, `cat`) VALUES ('14', '760');
INSERT INTO `eboard_ind_cat`(`message`, `cat`) VALUES ('14', '769');
INSERT INTO `eboard_ind_cat`(`message`, `cat`) VALUES ('15', '760');
INSERT INTO `eboard_ind_cat`(`message`, `cat`) VALUES ('15', '769');
INSERT INTO `eboard_ind_cat`(`message`, `cat`) VALUES ('16', '760');
INSERT INTO `eboard_ind_cat`(`message`, `cat`) VALUES ('16', '769');
INSERT INTO `eboard_ind_cat`(`message`, `cat`) VALUES ('17', '760');
INSERT INTO `eboard_ind_cat`(`message`, `cat`) VALUES ('17', '769');
INSERT INTO `eboard_ind_cat`(`message`, `cat`) VALUES ('18', '760');
INSERT INTO `eboard_ind_cat`(`message`, `cat`) VALUES ('18', '769');
INSERT INTO `eboard_ind_cat`(`message`, `cat`) VALUES ('19', '760');
INSERT INTO `eboard_ind_cat`(`message`, `cat`) VALUES ('19', '769');
INSERT INTO `eboard_ind_cat`(`message`, `cat`) VALUES ('20', '760');
INSERT INTO `eboard_ind_cat`(`message`, `cat`) VALUES ('20', '769');
INSERT INTO `eboard_ind_cat`(`message`, `cat`) VALUES ('21', '760');
INSERT INTO `eboard_ind_cat`(`message`, `cat`) VALUES ('21', '769');
INSERT INTO `eboard_ind_cat`(`message`, `cat`) VALUES ('22', '760');
INSERT INTO `eboard_ind_cat`(`message`, `cat`) VALUES ('22', '769');
INSERT INTO `eboard_ind_cat`(`message`, `cat`) VALUES ('23', '760');
INSERT INTO `eboard_ind_cat`(`message`, `cat`) VALUES ('23', '769');
INSERT INTO `eboard_ind_cat`(`message`, `cat`) VALUES ('31', '761');
INSERT INTO `eboard_ind_cat`(`message`, `cat`) VALUES ('31', '769');
INSERT INTO `eboard_ind_cat`(`message`, `cat`) VALUES ('32', '761');
INSERT INTO `eboard_ind_cat`(`message`, `cat`) VALUES ('32', '769');
INSERT INTO `eboard_ind_cat`(`message`, `cat`) VALUES ('33', '761');
INSERT INTO `eboard_ind_cat`(`message`, `cat`) VALUES ('33', '769');
INSERT INTO `eboard_ind_cat`(`message`, `cat`) VALUES ('34', '761');
INSERT INTO `eboard_ind_cat`(`message`, `cat`) VALUES ('34', '769');
INSERT INTO `eboard_ind_cat`(`message`, `cat`) VALUES ('35', '761');
INSERT INTO `eboard_ind_cat`(`message`, `cat`) VALUES ('35', '769');
INSERT INTO `eboard_ind_cat`(`message`, `cat`) VALUES ('36', '761');
INSERT INTO `eboard_ind_cat`(`message`, `cat`) VALUES ('36', '769');
INSERT INTO `eboard_ind_cat`(`message`, `cat`) VALUES ('37', '761');
INSERT INTO `eboard_ind_cat`(`message`, `cat`) VALUES ('37', '769');
INSERT INTO `eboard_ind_cat`(`message`, `cat`) VALUES ('38', '761');
INSERT INTO `eboard_ind_cat`(`message`, `cat`) VALUES ('38', '769');
INSERT INTO `eboard_ind_cat`(`message`, `cat`) VALUES ('39', '761');
INSERT INTO `eboard_ind_cat`(`message`, `cat`) VALUES ('39', '769');
INSERT INTO `eboard_ind_cat`(`message`, `cat`) VALUES ('40', '761');
INSERT INTO `eboard_ind_cat`(`message`, `cat`) VALUES ('40', '769');
INSERT INTO `eboard_ind_cat`(`message`, `cat`) VALUES ('41', '761');
INSERT INTO `eboard_ind_cat`(`message`, `cat`) VALUES ('41', '769');
INSERT INTO `eboard_ind_cat`(`message`, `cat`) VALUES ('42', '762');
INSERT INTO `eboard_ind_cat`(`message`, `cat`) VALUES ('42', '769');
INSERT INTO `eboard_ind_cat`(`message`, `cat`) VALUES ('43', '762');
INSERT INTO `eboard_ind_cat`(`message`, `cat`) VALUES ('43', '769');
INSERT INTO `eboard_ind_cat`(`message`, `cat`) VALUES ('44', '762');
INSERT INTO `eboard_ind_cat`(`message`, `cat`) VALUES ('44', '769');
INSERT INTO `eboard_ind_cat`(`message`, `cat`) VALUES ('45', '762');
INSERT INTO `eboard_ind_cat`(`message`, `cat`) VALUES ('45', '769');
INSERT INTO `eboard_ind_cat`(`message`, `cat`) VALUES ('46', '762');
INSERT INTO `eboard_ind_cat`(`message`, `cat`) VALUES ('46', '769');
INSERT INTO `eboard_ind_cat`(`message`, `cat`) VALUES ('47', '762');
INSERT INTO `eboard_ind_cat`(`message`, `cat`) VALUES ('47', '769');
INSERT INTO `eboard_ind_cat`(`message`, `cat`) VALUES ('48', '762');
INSERT INTO `eboard_ind_cat`(`message`, `cat`) VALUES ('48', '769');
INSERT INTO `eboard_ind_cat`(`message`, `cat`) VALUES ('49', '762');
INSERT INTO `eboard_ind_cat`(`message`, `cat`) VALUES ('49', '769');
INSERT INTO `eboard_ind_cat`(`message`, `cat`) VALUES ('50', '762');
INSERT INTO `eboard_ind_cat`(`message`, `cat`) VALUES ('50', '769');
INSERT INTO `eboard_ind_cat`(`message`, `cat`) VALUES ('51', '762');
INSERT INTO `eboard_ind_cat`(`message`, `cat`) VALUES ('51', '769');
INSERT INTO `eboard_ind_cat`(`message`, `cat`) VALUES ('52', '762');
INSERT INTO `eboard_ind_cat`(`message`, `cat`) VALUES ('52', '769');
INSERT INTO `eboard_ind_cat`(`message`, `cat`) VALUES ('53', '762');
INSERT INTO `eboard_ind_cat`(`message`, `cat`) VALUES ('53', '769');
INSERT INTO `eboard_ind_cat`(`message`, `cat`) VALUES ('54', '762');
INSERT INTO `eboard_ind_cat`(`message`, `cat`) VALUES ('54', '769');
INSERT INTO `eboard_ind_cat`(`message`, `cat`) VALUES ('55', '762');
INSERT INTO `eboard_ind_cat`(`message`, `cat`) VALUES ('55', '769');
INSERT INTO `eboard_ind_cat`(`message`, `cat`) VALUES ('56', '762');
INSERT INTO `eboard_ind_cat`(`message`, `cat`) VALUES ('56', '769');
INSERT INTO `eboard_ind_cat`(`message`, `cat`) VALUES ('57', '762');
INSERT INTO `eboard_ind_cat`(`message`, `cat`) VALUES ('57', '769');
INSERT INTO `eboard_ind_cat`(`message`, `cat`) VALUES ('58', '762');
INSERT INTO `eboard_ind_cat`(`message`, `cat`) VALUES ('58', '769');
INSERT INTO `eboard_ind_cat`(`message`, `cat`) VALUES ('59', '762');
INSERT INTO `eboard_ind_cat`(`message`, `cat`) VALUES ('59', '769');
INSERT INTO `eboard_ind_cat`(`message`, `cat`) VALUES ('60', '762');
INSERT INTO `eboard_ind_cat`(`message`, `cat`) VALUES ('60', '769');
INSERT INTO `eboard_ind_cat`(`message`, `cat`) VALUES ('61', '762');
INSERT INTO `eboard_ind_cat`(`message`, `cat`) VALUES ('61', '769');
INSERT INTO `eboard_ind_cat`(`message`, `cat`) VALUES ('62', '762');
INSERT INTO `eboard_ind_cat`(`message`, `cat`) VALUES ('62', '769');
INSERT INTO `eboard_ind_cat`(`message`, `cat`) VALUES ('63', '762');
INSERT INTO `eboard_ind_cat`(`message`, `cat`) VALUES ('63', '769');
INSERT INTO `eboard_ind_cat`(`message`, `cat`) VALUES ('64', '762');
INSERT INTO `eboard_ind_cat`(`message`, `cat`) VALUES ('64', '769');
INSERT INTO `eboard_ind_cat`(`message`, `cat`) VALUES ('65', '762');
INSERT INTO `eboard_ind_cat`(`message`, `cat`) VALUES ('65', '769');
INSERT INTO `eboard_ind_cat`(`message`, `cat`) VALUES ('66', '762');
INSERT INTO `eboard_ind_cat`(`message`, `cat`) VALUES ('66', '769');
INSERT INTO `eboard_ind_cat`(`message`, `cat`) VALUES ('71', '761');
INSERT INTO `eboard_ind_cat`(`message`, `cat`) VALUES ('71', '769');
INSERT INTO `eboard_ind_cat`(`message`, `cat`) VALUES ('72', '761');
INSERT INTO `eboard_ind_cat`(`message`, `cat`) VALUES ('72', '769');
INSERT INTO `eboard_ind_cat`(`message`, `cat`) VALUES ('73', '761');
INSERT INTO `eboard_ind_cat`(`message`, `cat`) VALUES ('73', '769');
INSERT INTO `eboard_ind_cat`(`message`, `cat`) VALUES ('74', '761');
INSERT INTO `eboard_ind_cat`(`message`, `cat`) VALUES ('74', '769');
INSERT INTO `eboard_ind_cat`(`message`, `cat`) VALUES ('75', '761');
INSERT INTO `eboard_ind_cat`(`message`, `cat`) VALUES ('75', '769');
INSERT INTO `eboard_ind_cat`(`message`, `cat`) VALUES ('76', '761');
INSERT INTO `eboard_ind_cat`(`message`, `cat`) VALUES ('76', '769');
INSERT INTO `eboard_ind_cat`(`message`, `cat`) VALUES ('77', '761');
INSERT INTO `eboard_ind_cat`(`message`, `cat`) VALUES ('77', '769');
INSERT INTO `eboard_ind_cat`(`message`, `cat`) VALUES ('78', '761');
INSERT INTO `eboard_ind_cat`(`message`, `cat`) VALUES ('78', '769');
INSERT INTO `eboard_ind_cat`(`message`, `cat`) VALUES ('79', '761');
INSERT INTO `eboard_ind_cat`(`message`, `cat`) VALUES ('79', '769');
INSERT INTO `eboard_ind_cat`(`message`, `cat`) VALUES ('80', '761');
INSERT INTO `eboard_ind_cat`(`message`, `cat`) VALUES ('80', '769');
INSERT INTO `eboard_ind_cat`(`message`, `cat`) VALUES ('81', '761');
INSERT INTO `eboard_ind_cat`(`message`, `cat`) VALUES ('81', '769');
INSERT INTO `eboard_ind_cat`(`message`, `cat`) VALUES ('82', '761');
INSERT INTO `eboard_ind_cat`(`message`, `cat`) VALUES ('82', '769');
INSERT INTO `eboard_ind_cat`(`message`, `cat`) VALUES ('83', '761');
INSERT INTO `eboard_ind_cat`(`message`, `cat`) VALUES ('83', '769');
INSERT INTO `eboard_ind_cat`(`message`, `cat`) VALUES ('84', '761');
INSERT INTO `eboard_ind_cat`(`message`, `cat`) VALUES ('84', '769');
INSERT INTO `eboard_ind_cat`(`message`, `cat`) VALUES ('85', '761');
INSERT INTO `eboard_ind_cat`(`message`, `cat`) VALUES ('85', '769');
INSERT INTO `eboard_ind_cat`(`message`, `cat`) VALUES ('86', '761');
INSERT INTO `eboard_ind_cat`(`message`, `cat`) VALUES ('86', '769');
INSERT INTO `eboard_ind_cat`(`message`, `cat`) VALUES ('87', '761');
INSERT INTO `eboard_ind_cat`(`message`, `cat`) VALUES ('87', '769');
INSERT INTO `eboard_ind_cat`(`message`, `cat`) VALUES ('88', '761');
INSERT INTO `eboard_ind_cat`(`message`, `cat`) VALUES ('88', '769');
INSERT INTO `eboard_ind_cat`(`message`, `cat`) VALUES ('89', '761');
INSERT INTO `eboard_ind_cat`(`message`, `cat`) VALUES ('89', '769');
INSERT INTO `eboard_ind_cat`(`message`, `cat`) VALUES ('91', '763');
INSERT INTO `eboard_ind_cat`(`message`, `cat`) VALUES ('91', '769');
INSERT INTO `eboard_ind_cat`(`message`, `cat`) VALUES ('92', '763');
INSERT INTO `eboard_ind_cat`(`message`, `cat`) VALUES ('92', '769');
INSERT INTO `eboard_ind_cat`(`message`, `cat`) VALUES ('93', '763');
INSERT INTO `eboard_ind_cat`(`message`, `cat`) VALUES ('93', '769');
INSERT INTO `eboard_ind_cat`(`message`, `cat`) VALUES ('94', '763');
INSERT INTO `eboard_ind_cat`(`message`, `cat`) VALUES ('94', '769');
INSERT INTO `eboard_ind_cat`(`message`, `cat`) VALUES ('95', '763');
INSERT INTO `eboard_ind_cat`(`message`, `cat`) VALUES ('95', '769');
INSERT INTO `eboard_ind_cat`(`message`, `cat`) VALUES ('104', '175');
INSERT INTO `eboard_ind_cat`(`message`, `cat`) VALUES ('104', '769');
INSERT INTO `eboard_ind_cat`(`message`, `cat`) VALUES ('105', '175');
INSERT INTO `eboard_ind_cat`(`message`, `cat`) VALUES ('105', '769');
INSERT INTO `eboard_ind_cat`(`message`, `cat`) VALUES ('106', '175');
INSERT INTO `eboard_ind_cat`(`message`, `cat`) VALUES ('106', '769');
INSERT INTO `eboard_ind_cat`(`message`, `cat`) VALUES ('107', '175');
INSERT INTO `eboard_ind_cat`(`message`, `cat`) VALUES ('107', '769');
INSERT INTO `eboard_ind_cat`(`message`, `cat`) VALUES ('108', '175');
INSERT INTO `eboard_ind_cat`(`message`, `cat`) VALUES ('108', '769');
INSERT INTO `eboard_ind_cat`(`message`, `cat`) VALUES ('109', '175');
INSERT INTO `eboard_ind_cat`(`message`, `cat`) VALUES ('109', '769');
INSERT INTO `eboard_ind_cat`(`message`, `cat`) VALUES ('117', '178');
INSERT INTO `eboard_ind_cat`(`message`, `cat`) VALUES ('117', '769');
INSERT INTO `eboard_ind_cat`(`message`, `cat`) VALUES ('118', '178');
INSERT INTO `eboard_ind_cat`(`message`, `cat`) VALUES ('118', '769');
INSERT INTO `eboard_ind_cat`(`message`, `cat`) VALUES ('119', '178');
INSERT INTO `eboard_ind_cat`(`message`, `cat`) VALUES ('119', '769');
INSERT INTO `eboard_ind_cat`(`message`, `cat`) VALUES ('120', '178');
INSERT INTO `eboard_ind_cat`(`message`, `cat`) VALUES ('120', '769');
INSERT INTO `eboard_ind_cat`(`message`, `cat`) VALUES ('121', '178');
INSERT INTO `eboard_ind_cat`(`message`, `cat`) VALUES ('121', '769');
INSERT INTO `eboard_ind_cat`(`message`, `cat`) VALUES ('122', '178');
INSERT INTO `eboard_ind_cat`(`message`, `cat`) VALUES ('122', '769');
INSERT INTO `eboard_ind_cat`(`message`, `cat`) VALUES ('123', '178');
INSERT INTO `eboard_ind_cat`(`message`, `cat`) VALUES ('123', '769');
INSERT INTO `eboard_ind_cat`(`message`, `cat`) VALUES ('124', '178');
INSERT INTO `eboard_ind_cat`(`message`, `cat`) VALUES ('124', '769');
INSERT INTO `eboard_ind_cat`(`message`, `cat`) VALUES ('125', '178');
INSERT INTO `eboard_ind_cat`(`message`, `cat`) VALUES ('125', '769');
INSERT INTO `eboard_ind_cat`(`message`, `cat`) VALUES ('126', '178');
INSERT INTO `eboard_ind_cat`(`message`, `cat`) VALUES ('126', '769');
INSERT INTO `eboard_ind_cat`(`message`, `cat`) VALUES ('127', '178');
INSERT INTO `eboard_ind_cat`(`message`, `cat`) VALUES ('127', '769');
INSERT INTO `eboard_ind_cat`(`message`, `cat`) VALUES ('128', '178');
INSERT INTO `eboard_ind_cat`(`message`, `cat`) VALUES ('128', '769');
INSERT INTO `eboard_ind_cat`(`message`, `cat`) VALUES ('129', '178');
INSERT INTO `eboard_ind_cat`(`message`, `cat`) VALUES ('129', '769');
INSERT INTO `eboard_ind_cat`(`message`, `cat`) VALUES ('130', '178');
INSERT INTO `eboard_ind_cat`(`message`, `cat`) VALUES ('130', '769');
INSERT INTO `eboard_ind_cat`(`message`, `cat`) VALUES ('131', '178');
INSERT INTO `eboard_ind_cat`(`message`, `cat`) VALUES ('131', '769');
INSERT INTO `eboard_ind_cat`(`message`, `cat`) VALUES ('132', '178');
INSERT INTO `eboard_ind_cat`(`message`, `cat`) VALUES ('132', '769');
INSERT INTO `eboard_ind_cat`(`message`, `cat`) VALUES ('133', '178');
INSERT INTO `eboard_ind_cat`(`message`, `cat`) VALUES ('133', '769');
INSERT INTO `eboard_ind_cat`(`message`, `cat`) VALUES ('134', '178');
INSERT INTO `eboard_ind_cat`(`message`, `cat`) VALUES ('134', '769');
INSERT INTO `eboard_ind_cat`(`message`, `cat`) VALUES ('135', '178');
INSERT INTO `eboard_ind_cat`(`message`, `cat`) VALUES ('135', '769');
INSERT INTO `eboard_ind_cat`(`message`, `cat`) VALUES ('136', '178');
INSERT INTO `eboard_ind_cat`(`message`, `cat`) VALUES ('136', '769');
INSERT INTO `eboard_ind_cat`(`message`, `cat`) VALUES ('137', '178');
INSERT INTO `eboard_ind_cat`(`message`, `cat`) VALUES ('137', '769');
INSERT INTO `eboard_ind_cat`(`message`, `cat`) VALUES ('138', '178');
INSERT INTO `eboard_ind_cat`(`message`, `cat`) VALUES ('138', '769');
INSERT INTO `eboard_ind_cat`(`message`, `cat`) VALUES ('139', '178');
INSERT INTO `eboard_ind_cat`(`message`, `cat`) VALUES ('139', '769');
INSERT INTO `eboard_ind_cat`(`message`, `cat`) VALUES ('140', '178');
INSERT INTO `eboard_ind_cat`(`message`, `cat`) VALUES ('140', '769');
INSERT INTO `eboard_ind_cat`(`message`, `cat`) VALUES ('141', '178');
INSERT INTO `eboard_ind_cat`(`message`, `cat`) VALUES ('141', '769');
INSERT INTO `eboard_ind_cat`(`message`, `cat`) VALUES ('142', '178');
INSERT INTO `eboard_ind_cat`(`message`, `cat`) VALUES ('142', '769');
INSERT INTO `eboard_ind_cat`(`message`, `cat`) VALUES ('143', '178');
INSERT INTO `eboard_ind_cat`(`message`, `cat`) VALUES ('143', '769');
INSERT INTO `eboard_ind_cat`(`message`, `cat`) VALUES ('144', '178');
INSERT INTO `eboard_ind_cat`(`message`, `cat`) VALUES ('144', '769');
INSERT INTO `eboard_ind_cat`(`message`, `cat`) VALUES ('145', '178');
INSERT INTO `eboard_ind_cat`(`message`, `cat`) VALUES ('145', '769');
INSERT INTO `eboard_ind_cat`(`message`, `cat`) VALUES ('146', '178');
INSERT INTO `eboard_ind_cat`(`message`, `cat`) VALUES ('146', '769');


DROP TABLE IF EXISTS `eboard_ind_region`;
CREATE TABLE `eboard_ind_region` (
  `message` int(11) NOT NULL,
  `cat` int(11) NOT NULL,
  PRIMARY KEY (`message`,`cat`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO `eboard_ind_region`(`message`, `cat`) VALUES ('6', '120');
INSERT INTO `eboard_ind_region`(`message`, `cat`) VALUES ('7', '120');
INSERT INTO `eboard_ind_region`(`message`, `cat`) VALUES ('8', '120');
INSERT INTO `eboard_ind_region`(`message`, `cat`) VALUES ('9', '120');
INSERT INTO `eboard_ind_region`(`message`, `cat`) VALUES ('10', '120');
INSERT INTO `eboard_ind_region`(`message`, `cat`) VALUES ('11', '120');
INSERT INTO `eboard_ind_region`(`message`, `cat`) VALUES ('12', '120');
INSERT INTO `eboard_ind_region`(`message`, `cat`) VALUES ('13', '120');
INSERT INTO `eboard_ind_region`(`message`, `cat`) VALUES ('14', '120');
INSERT INTO `eboard_ind_region`(`message`, `cat`) VALUES ('15', '120');
INSERT INTO `eboard_ind_region`(`message`, `cat`) VALUES ('16', '120');
INSERT INTO `eboard_ind_region`(`message`, `cat`) VALUES ('17', '120');
INSERT INTO `eboard_ind_region`(`message`, `cat`) VALUES ('18', '120');
INSERT INTO `eboard_ind_region`(`message`, `cat`) VALUES ('19', '120');
INSERT INTO `eboard_ind_region`(`message`, `cat`) VALUES ('20', '120');
INSERT INTO `eboard_ind_region`(`message`, `cat`) VALUES ('21', '120');
INSERT INTO `eboard_ind_region`(`message`, `cat`) VALUES ('22', '120');
INSERT INTO `eboard_ind_region`(`message`, `cat`) VALUES ('23', '120');
INSERT INTO `eboard_ind_region`(`message`, `cat`) VALUES ('31', '120');
INSERT INTO `eboard_ind_region`(`message`, `cat`) VALUES ('32', '120');
INSERT INTO `eboard_ind_region`(`message`, `cat`) VALUES ('33', '120');
INSERT INTO `eboard_ind_region`(`message`, `cat`) VALUES ('34', '120');
INSERT INTO `eboard_ind_region`(`message`, `cat`) VALUES ('35', '120');
INSERT INTO `eboard_ind_region`(`message`, `cat`) VALUES ('36', '120');
INSERT INTO `eboard_ind_region`(`message`, `cat`) VALUES ('37', '120');
INSERT INTO `eboard_ind_region`(`message`, `cat`) VALUES ('38', '120');
INSERT INTO `eboard_ind_region`(`message`, `cat`) VALUES ('39', '120');
INSERT INTO `eboard_ind_region`(`message`, `cat`) VALUES ('40', '120');
INSERT INTO `eboard_ind_region`(`message`, `cat`) VALUES ('41', '120');
INSERT INTO `eboard_ind_region`(`message`, `cat`) VALUES ('42', '120');
INSERT INTO `eboard_ind_region`(`message`, `cat`) VALUES ('43', '120');
INSERT INTO `eboard_ind_region`(`message`, `cat`) VALUES ('44', '120');
INSERT INTO `eboard_ind_region`(`message`, `cat`) VALUES ('45', '120');
INSERT INTO `eboard_ind_region`(`message`, `cat`) VALUES ('46', '120');
INSERT INTO `eboard_ind_region`(`message`, `cat`) VALUES ('47', '120');
INSERT INTO `eboard_ind_region`(`message`, `cat`) VALUES ('48', '120');
INSERT INTO `eboard_ind_region`(`message`, `cat`) VALUES ('49', '120');
INSERT INTO `eboard_ind_region`(`message`, `cat`) VALUES ('50', '120');
INSERT INTO `eboard_ind_region`(`message`, `cat`) VALUES ('51', '120');
INSERT INTO `eboard_ind_region`(`message`, `cat`) VALUES ('52', '120');
INSERT INTO `eboard_ind_region`(`message`, `cat`) VALUES ('53', '120');
INSERT INTO `eboard_ind_region`(`message`, `cat`) VALUES ('54', '120');
INSERT INTO `eboard_ind_region`(`message`, `cat`) VALUES ('55', '120');
INSERT INTO `eboard_ind_region`(`message`, `cat`) VALUES ('56', '120');
INSERT INTO `eboard_ind_region`(`message`, `cat`) VALUES ('57', '120');
INSERT INTO `eboard_ind_region`(`message`, `cat`) VALUES ('58', '120');
INSERT INTO `eboard_ind_region`(`message`, `cat`) VALUES ('59', '120');
INSERT INTO `eboard_ind_region`(`message`, `cat`) VALUES ('60', '120');
INSERT INTO `eboard_ind_region`(`message`, `cat`) VALUES ('61', '120');
INSERT INTO `eboard_ind_region`(`message`, `cat`) VALUES ('62', '120');
INSERT INTO `eboard_ind_region`(`message`, `cat`) VALUES ('63', '120');
INSERT INTO `eboard_ind_region`(`message`, `cat`) VALUES ('64', '120');
INSERT INTO `eboard_ind_region`(`message`, `cat`) VALUES ('65', '120');
INSERT INTO `eboard_ind_region`(`message`, `cat`) VALUES ('66', '120');
INSERT INTO `eboard_ind_region`(`message`, `cat`) VALUES ('71', '120');
INSERT INTO `eboard_ind_region`(`message`, `cat`) VALUES ('72', '120');
INSERT INTO `eboard_ind_region`(`message`, `cat`) VALUES ('73', '120');
INSERT INTO `eboard_ind_region`(`message`, `cat`) VALUES ('74', '120');
INSERT INTO `eboard_ind_region`(`message`, `cat`) VALUES ('75', '120');
INSERT INTO `eboard_ind_region`(`message`, `cat`) VALUES ('76', '120');
INSERT INTO `eboard_ind_region`(`message`, `cat`) VALUES ('77', '120');
INSERT INTO `eboard_ind_region`(`message`, `cat`) VALUES ('78', '120');
INSERT INTO `eboard_ind_region`(`message`, `cat`) VALUES ('79', '120');
INSERT INTO `eboard_ind_region`(`message`, `cat`) VALUES ('80', '120');
INSERT INTO `eboard_ind_region`(`message`, `cat`) VALUES ('81', '120');
INSERT INTO `eboard_ind_region`(`message`, `cat`) VALUES ('82', '120');
INSERT INTO `eboard_ind_region`(`message`, `cat`) VALUES ('83', '120');
INSERT INTO `eboard_ind_region`(`message`, `cat`) VALUES ('84', '120');
INSERT INTO `eboard_ind_region`(`message`, `cat`) VALUES ('85', '120');
INSERT INTO `eboard_ind_region`(`message`, `cat`) VALUES ('86', '120');
INSERT INTO `eboard_ind_region`(`message`, `cat`) VALUES ('87', '120');
INSERT INTO `eboard_ind_region`(`message`, `cat`) VALUES ('88', '120');
INSERT INTO `eboard_ind_region`(`message`, `cat`) VALUES ('89', '120');
INSERT INTO `eboard_ind_region`(`message`, `cat`) VALUES ('91', '120');
INSERT INTO `eboard_ind_region`(`message`, `cat`) VALUES ('92', '120');
INSERT INTO `eboard_ind_region`(`message`, `cat`) VALUES ('93', '120');
INSERT INTO `eboard_ind_region`(`message`, `cat`) VALUES ('94', '120');
INSERT INTO `eboard_ind_region`(`message`, `cat`) VALUES ('95', '120');
INSERT INTO `eboard_ind_region`(`message`, `cat`) VALUES ('104', '120');
INSERT INTO `eboard_ind_region`(`message`, `cat`) VALUES ('105', '120');
INSERT INTO `eboard_ind_region`(`message`, `cat`) VALUES ('106', '120');
INSERT INTO `eboard_ind_region`(`message`, `cat`) VALUES ('107', '120');
INSERT INTO `eboard_ind_region`(`message`, `cat`) VALUES ('108', '120');
INSERT INTO `eboard_ind_region`(`message`, `cat`) VALUES ('109', '120');
INSERT INTO `eboard_ind_region`(`message`, `cat`) VALUES ('117', '120');
INSERT INTO `eboard_ind_region`(`message`, `cat`) VALUES ('118', '120');
INSERT INTO `eboard_ind_region`(`message`, `cat`) VALUES ('119', '120');
INSERT INTO `eboard_ind_region`(`message`, `cat`) VALUES ('120', '120');
INSERT INTO `eboard_ind_region`(`message`, `cat`) VALUES ('121', '120');
INSERT INTO `eboard_ind_region`(`message`, `cat`) VALUES ('122', '120');
INSERT INTO `eboard_ind_region`(`message`, `cat`) VALUES ('123', '120');
INSERT INTO `eboard_ind_region`(`message`, `cat`) VALUES ('124', '120');
INSERT INTO `eboard_ind_region`(`message`, `cat`) VALUES ('125', '120');
INSERT INTO `eboard_ind_region`(`message`, `cat`) VALUES ('126', '120');
INSERT INTO `eboard_ind_region`(`message`, `cat`) VALUES ('127', '120');
INSERT INTO `eboard_ind_region`(`message`, `cat`) VALUES ('128', '120');
INSERT INTO `eboard_ind_region`(`message`, `cat`) VALUES ('129', '120');
INSERT INTO `eboard_ind_region`(`message`, `cat`) VALUES ('130', '120');
INSERT INTO `eboard_ind_region`(`message`, `cat`) VALUES ('131', '120');
INSERT INTO `eboard_ind_region`(`message`, `cat`) VALUES ('132', '120');
INSERT INTO `eboard_ind_region`(`message`, `cat`) VALUES ('133', '120');
INSERT INTO `eboard_ind_region`(`message`, `cat`) VALUES ('134', '120');
INSERT INTO `eboard_ind_region`(`message`, `cat`) VALUES ('135', '120');
INSERT INTO `eboard_ind_region`(`message`, `cat`) VALUES ('136', '120');
INSERT INTO `eboard_ind_region`(`message`, `cat`) VALUES ('137', '120');
INSERT INTO `eboard_ind_region`(`message`, `cat`) VALUES ('138', '120');
INSERT INTO `eboard_ind_region`(`message`, `cat`) VALUES ('139', '120');
INSERT INTO `eboard_ind_region`(`message`, `cat`) VALUES ('140', '120');
INSERT INTO `eboard_ind_region`(`message`, `cat`) VALUES ('141', '120');
INSERT INTO `eboard_ind_region`(`message`, `cat`) VALUES ('142', '120');
INSERT INTO `eboard_ind_region`(`message`, `cat`) VALUES ('143', '120');
INSERT INTO `eboard_ind_region`(`message`, `cat`) VALUES ('144', '120');
INSERT INTO `eboard_ind_region`(`message`, `cat`) VALUES ('145', '120');
INSERT INTO `eboard_ind_region`(`message`, `cat`) VALUES ('146', '120');


DROP TABLE IF EXISTS `eboard_mailing_db`;
CREATE TABLE `eboard_mailing_db` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `time` int(11) NOT NULL,
  `title` varchar(200) NOT NULL,
  `text` text NOT NULL,
  `single` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

INSERT INTO `eboard_mailing_db`(`id`, `time`, `title`, `text`, `single`) VALUES ('1', '3', 'Ваше объявление на сайте %title%', '<p>Здравствуйте, %user%,</p>
<p>Вы добавили объявление %message_title% на сайт %title%,</p>
<p>спасибо, что воспользовались нашими услугами. Ссылка на Ваше объявление:</p>
<p>%link%</p>
<p>Со временем, объявление уходит вниз в общем списке, поэтому Вы можете воспользоваться дополнительными услугами, чтобы увеличить количество просмотров объявления.</p>', '0');
INSERT INTO `eboard_mailing_db`(`id`, `time`, `title`, `text`, `single`) VALUES ('2', '7', 'Уже неделю у нас размещено объявление &quot;%message_title%&quot;', '<p>Здравствуйте, %user%,</p>
<p>спасибо, что добавили объявление на сайт %title%.</p>
<p>Если объявление ещё актуально&nbsp; Вы можете  воспользоваться дополнительными услугами, чтобы увеличить количество  просмотров объявления: поднять объявление в общем списке, выделить цветом или вынести в отдельный рекламны блок.</p>
<p>Ссылка на Ваше объявление:</p>
<p>%link%</p>', '0');
INSERT INTO `eboard_mailing_db`(`id`, `time`, `title`, `text`, `single`) VALUES ('3', '14', 'Прошло 2 недели с момента публикации', '<p>Здравствуйте, %user%,</p>
<p>уже прошло две денели с момента публикации объявления %message_title% на сайт %title%.</p>
<p>Если объявление ещё актуально&nbsp; Вы можете  воспользоваться дополнительными услугами, чтобы увеличить количество  просмотров объявления: поднять объявление в общем списке, выделить цветом или вынести в отдельный рекламны блок.</p>
<p>Ссылка на Ваше объявление:</p>
<p>%link%</p>', '0');
INSERT INTO `eboard_mailing_db`(`id`, `time`, `title`, `text`, `single`) VALUES ('4', '30', 'Прошёл месяц с момента публикации &quot;%message_title%&quot;', '<p>Здравствуйте, %user%,</p>
<p>месяц тому назад Вы опубликовали объявление %message_title% на сайте %title%</p>
<p>Если объявление ещё актуально&nbsp; Вы можете  воспользоваться дополнительными услугами, чтобы увеличить количество  просмотров объявления: поднять объявление в общем списке, выделить цветом или вынести в отдельный рекламны блок.</p>
<p>Ссылка на Ваше объявление:</p>
<p>%link%</p>', '0');
INSERT INTO `eboard_mailing_db`(`id`, `time`, `title`, `text`, `single`) VALUES ('5', '0', 'Вы зарегистрированы на сайте %title%', '<p>Здравствуйте, %user%,</p>
<p>Вы зарегистрированы на сайте %title%. Позвольте напомнить, что Вы всё ещё можете воспользоваться услугами нашего сервиса.</p>', '1');


DROP TABLE IF EXISTS `eboard_mailing_queue`;
CREATE TABLE `eboard_mailing_queue` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `db` int(11) NOT NULL,
  `message` int(11) NOT NULL,
  `email` varchar(100) NOT NULL,
  `title` varchar(200) NOT NULL,
  `text` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS `eboard_mailing_sended`;
CREATE TABLE `eboard_mailing_sended` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `db` int(11) NOT NULL,
  `message` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `db` (`db`,`message`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS `eboard_mailing_unsubscribe`;
CREATE TABLE `eboard_mailing_unsubscribe` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS `eboard_modules`;
CREATE TABLE `eboard_modules` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cat` varchar(100) NOT NULL,
  `title` varchar(200) DEFAULT NULL,
  `type` varchar(4) DEFAULT NULL,
  `content` text,
  `autor` varchar(200) NOT NULL,
  `keywords` varchar(200) NOT NULL,
  `copyright` varchar(200) NOT NULL,
  `description` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

INSERT INTO `eboard_modules`(`id`, `cat`, `title`, `type`, `content`, `autor`, `keywords`, `copyright`, `description`) VALUES ('1', 'rules', 'Политика конфиденциальности', 'html', '<h1 style=\"box-sizing: inherit; font-size: 2.14286rem; margin: 0px 0px 1.78571rem; padding: 0px; font-family: NotoSerif-Bold, Arial, sans-serif; font-weight: bold; color: rgb(0, 0, 0); text-rendering: optimizeLegibility; line-height: 1.4;\">Соглашение</h1>

<p style=\"box-sizing: inherit; margin: 0px 0px 15px; padding: 0px; font-size: 14px; line-height: 1.36; text-rendering: optimizeLegibility; color: rgb(0, 0, 0); font-family: &quot;PT Sans Caption&quot;, serif;\">&nbsp;</p>

<p style=\"box-sizing: inherit; margin: 0px 0px 15px; padding: 0px; font-size: 14px; line-height: 1.36; text-rendering: optimizeLegibility; color: rgb(0, 0, 0); font-family: &quot;PT Sans Caption&quot;, serif;\"><b style=\"box-sizing: inherit; line-height: inherit;\"><u style=\"box-sizing: inherit;\">Список представленных документов:</u></b></p>

<p style=\"box-sizing: inherit; margin: 0px 0px 15px; padding: 0px; font-size: 14px; line-height: 1.36; text-rendering: optimizeLegibility; color: rgb(0, 0, 0); font-family: &quot;PT Sans Caption&quot;, serif;\">&nbsp;</p>

<ul style=\"box-sizing: inherit; margin: 0px 0px 1.5rem 1.25rem; padding-right: 0px; padding-left: 0px; line-height: 1.36; list-style-position: outside; color: rgb(0, 0, 0); font-family: &quot;PT Sans Caption&quot;, serif; font-size: 14px;\">
	<li style=\"box-sizing: inherit; margin: 0px; padding: 0px; font-size: inherit;\">Политика конфиденциальности интернет-сайта ural56.ru;</li>
	<li style=\"box-sizing: inherit; margin: 0px; padding: 0px; font-size: inherit;\">Соглашение об использовании материалов и сервисов интернет-сайта ural56.ru (пользовательское соглашение);</li>
	<li style=\"box-sizing: inherit; margin: 0px; padding: 0px; font-size: inherit;\">Согласие посетителя сайта ural56.ru на обработку персональных данных.</li>
</ul>

<p>&nbsp;</p>

<p style=\"box-sizing: inherit; margin: 0px 0px 15px; padding: 0px; font-size: 14px; line-height: 1.36; text-rendering: optimizeLegibility; color: rgb(0, 0, 0); font-family: &quot;PT Sans Caption&quot;, serif;\">&nbsp;</p>

<p style=\"box-sizing: inherit; margin: 0px 0px 15px; padding: 0px; font-size: 14px; line-height: 1.36; text-rendering: optimizeLegibility; color: rgb(0, 0, 0); font-family: &quot;PT Sans Caption&quot;, serif;\">&nbsp;</p>

<hr style=\"box-sizing: content-box; height: 0px; max-width: 85.7143rem; border-top: 0px; border-bottom: 1px solid rgb(230, 230, 230); margin: 0px auto; clear: both; color: rgb(0, 0, 0); font-family: &quot;PT Sans Caption&quot;, serif; font-size: 14px;\" />
<p style=\"box-sizing: inherit; margin: 0px 0px 15px; padding: 0px; font-size: 14px; line-height: 1.36; text-rendering: optimizeLegibility; color: rgb(0, 0, 0); font-family: &quot;PT Sans Caption&quot;, serif;\">&nbsp;</p>

<p style=\"box-sizing: inherit; margin: 0px 0px 15px; padding: 0px; font-size: 14px; line-height: 1.36; text-rendering: optimizeLegibility; color: rgb(0, 0, 0); font-family: &quot;PT Sans Caption&quot;, serif; text-align: center;\">&nbsp;</p>

<p style=\"box-sizing: inherit; margin: 0px 0px 15px; padding: 0px; font-size: 14px; line-height: 1.36; text-rendering: optimizeLegibility; color: rgb(0, 0, 0); font-family: &quot;PT Sans Caption&quot;, serif; text-align: center;\"><b style=\"box-sizing: inherit; line-height: inherit;\"><span style=\"box-sizing: inherit; font-size: 12pt;\">Политика конфиденциальности</span></b><br style=\"box-sizing: inherit;\" />
<b style=\"box-sizing: inherit; line-height: inherit;\"><span style=\"box-sizing: inherit; font-size: 12pt;\">интернет-сайта ural56.ru</span></b></p>

<p style=\"box-sizing: inherit; margin: 0px 0px 15px; padding: 0px; font-size: 14px; line-height: 1.36; text-rendering: optimizeLegibility; color: rgb(0, 0, 0); font-family: &quot;PT Sans Caption&quot;, serif;\"><br style=\"box-sizing: inherit;\" />
г. Орск&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &laquo;01&raquo; мая 2017 г.<br style=\"box-sizing: inherit;\" />
<br style=\"box-sizing: inherit;\" />
Настоящая&nbsp; Политика&nbsp; конфиденциальности&nbsp; персональных&nbsp; данных&nbsp; (далее - Политика&nbsp;&nbsp; конфиденциальности)&nbsp;&nbsp; действует&nbsp; в&nbsp; отношении&nbsp; всей&nbsp; информации, размещенной&nbsp;&nbsp;&nbsp;&nbsp; на&nbsp;&nbsp;&nbsp;&nbsp; сайте&nbsp;&nbsp;&nbsp;&nbsp; в&nbsp;&nbsp;&nbsp;&nbsp; сети&nbsp;&nbsp;&nbsp;&nbsp; Интернет по адресу:&nbsp;<a href=\"https://www.ural56.ru/\" style=\"box-sizing: inherit; background-color: transparent; color: rgb(33, 150, 243); text-decoration-line: none; line-height: inherit; cursor: pointer;\" target=\"_blank\">www.ural56.ru</a>&nbsp;(далее - Сайт), которую посетители, другие пользователи могут&nbsp; получить о&nbsp;&nbsp; Пользователе&nbsp; во&nbsp; время&nbsp; использования&nbsp; Сайта,&nbsp; его&nbsp; сервисов,&nbsp; программ&nbsp; и продуктов.</p>

<p style=\"box-sizing: inherit; margin: 0px 0px 15px; padding: 0px; font-size: 14px; line-height: 1.36; text-rendering: optimizeLegibility; color: rgb(0, 0, 0); font-family: &quot;PT Sans Caption&quot;, serif;\">Использование сервисов Сайта означает безоговорочное согласие Пользователя с настоящей Политикой и указанными в ней условиями обработки его персональной информации; в случае несогласия с этими условиями Пользователь должен воздержаться от использования сервисов.<br style=\"box-sizing: inherit;\" />
<br style=\"box-sizing: inherit;\" />
<b style=\"box-sizing: inherit; line-height: inherit;\">1. ОБЩИЕ ПОЛОЖЕНИЯ</b><br style=\"box-sizing: inherit;\" />
<br style=\"box-sizing: inherit;\" />
1.1. В рамках настоящей Политики под персональной информацией Пользователя понимаются:<br style=\"box-sizing: inherit;\" />
1.1.1. Персональная информация, которую Пользователь предоставляет о себе самостоятельно при регистрации (создании учетной записи) или в процессе использования Сервисов, включая персональные данные Пользователя. Обязательная для предоставления Сервисов информация помечена специальным образом. Иная информация предоставляется Пользователем на его усмотрение.<br style=\"box-sizing: inherit;\" />
1.1.2. Данные, которые автоматически передаются сервисам Сайта в процессе их использования с помощью установленного на устройстве Пользователя программного обеспечения, в том числе IP-адрес, данные файлов cookie, информация о браузере Пользователя (или иной программе, с помощью которой осуществляется доступ к сервисам), технические характеристики оборудования и программного обеспечения, используемых Пользователем, дата и время доступа к сервисам, адреса запрашиваемых страниц и иная подобная информация.<br style=\"box-sizing: inherit;\" />
1.1.3. Иная информация о Пользователе, обработка которой предусмотрена Соглашением об использовании Сайта.<br style=\"box-sizing: inherit;\" />
1.1.4. Настоящая Политика конфиденциальности применяется только к Сайту&nbsp;<a href=\"https://www.ural56.ru/\" style=\"box-sizing: inherit; background-color: transparent; color: rgb(33, 150, 243); text-decoration-line: none; line-height: inherit; cursor: pointer;\" target=\"_blank\">www.ural56.ru</a>. Сайт&nbsp;<a href=\"https://www.ural56.ru/\" style=\"box-sizing: inherit; background-color: transparent; color: rgb(33, 150, 243); text-decoration-line: none; line-height: inherit; cursor: pointer;\" target=\"_blank\">www.ural56.ru</a>&nbsp;не контролирует и не несет ответственности за сайты третьих лиц, на которые Пользователь может перейти по ссылкам, доступным на Сайте&nbsp;<a href=\"https://www.ural56.ru/\" style=\"box-sizing: inherit; background-color: transparent; color: rgb(33, 150, 243); text-decoration-line: none; line-height: inherit; cursor: pointer;\" target=\"_blank\">www.ural56.ru</a>.<br style=\"box-sizing: inherit;\" />
<br style=\"box-sizing: inherit;\" />
<b style=\"box-sizing: inherit; line-height: inherit;\">2. ЦЕЛИ ОБРАБОТКИ ПЕРСОНАЛЬНОЙ ИНФОРМАЦИИ ПОЛЬЗОВАТЕЛЕЙ</b><br style=\"box-sizing: inherit;\" />
<br style=\"box-sizing: inherit;\" />
2.1. Сайт собирает и хранит только ту персональную информацию, которая необходима для предоставления сервисов или исполнения соглашений и договоров с Пользователем, за исключением случаев, когда законодательством предусмотрено обязательное хранение персональной информации в течение определенного законом срока.<br style=\"box-sizing: inherit;\" />
2.2. Персональную информацию Пользователя Сайт обрабатывает в следующих целях:<br style=\"box-sizing: inherit;\" />
2.2.1. Идентификации Пользователя, зарегистрированного на Сайте.<br style=\"box-sizing: inherit;\" />
2.2.2. Предоставления Пользователю доступа к персонализированным ресурсам Сайта.<br style=\"box-sizing: inherit;\" />
2.2.3. Установления с Пользователем обратной связи, включая направление уведомлений, запросов, касающихся использования Сайта, оказания услуг, обработку запросов и заявок от Пользователя.<br style=\"box-sizing: inherit;\" />
2.2.4. Определения места нахождения Пользователя для обеспечения безопасности, предотвращения мошенничества.<br style=\"box-sizing: inherit;\" />
2.2.5. Подтверждения достоверности и полноты персональных данных, предоставленных Пользователем.<br style=\"box-sizing: inherit;\" />
2.2.6. Создания учетной записи, если Пользователь дал согласие на создание учетной записи.<br style=\"box-sizing: inherit;\" />
2.2.7. Уведомления Пользователя Сайта.<br style=\"box-sizing: inherit;\" />
2.2.8. Предоставления Пользователю эффективной клиентской и технической поддержки при возникновении проблем, связанных с использованием Сайта.<br style=\"box-sizing: inherit;\" />
2.2.9. Осуществления рекламной деятельности с согласия Пользователя.<br style=\"box-sizing: inherit;\" />
<br style=\"box-sizing: inherit;\" />
<b style=\"box-sizing: inherit; line-height: inherit;\">3. УСЛОВИЯ ОБРАБОТКИ ПЕРСОНАЛЬНОЙ ИНФОРМАЦИИ ПОЛЬЗОВАТЕЛЕЙ&nbsp;</b><b style=\"box-sizing: inherit; line-height: inherit;\">И ЕЕ ПЕРЕДАЧИ ТРЕТЬИМ ЛИЦАМ</b><br style=\"box-sizing: inherit;\" />
<br style=\"box-sizing: inherit;\" />
3.1. Сайт хранит персональную информацию Пользователей в соответствии с внутренними регламентами конкретных сервисов.<br style=\"box-sizing: inherit;\" />
3.2. В отношении персональной информации Пользователя сохраняется ее конфиденциальность, кроме случаев добровольного предоставления Пользователем информации о себе для общего доступа неограниченному кругу лиц. При использовании отдельных сервисов Пользователь соглашается с тем, что определенная часть его персональной информации становится общедоступной.<br style=\"box-sizing: inherit;\" />
3.3. Сайт вправе передать персональную информацию Пользователя третьим лицам в следующих случаях:<br style=\"box-sizing: inherit;\" />
3.3.1. Пользователь выразил согласие на такие действия.<br style=\"box-sizing: inherit;\" />
3.3.2. Передача необходима для использования Пользователем определенного сервиса либо для исполнения определенного соглашения или договора с Пользователем.<br style=\"box-sizing: inherit;\" />
3.3.4. Передача предусмотрена российским или иным применимым законодательством в рамках установленной законодательством процедуры.<br style=\"box-sizing: inherit;\" />
3.3.5. В случае продажи Сайта к приобретателю переходят все обязательства по соблюдению условий настоящей Политики применительно к полученной им персональной информации.<br style=\"box-sizing: inherit;\" />
3.4. Обработка персональных данных Пользователя осуществляется без ограничения срока любым законным способом, в том числе в информационных системах персональных данных с использованием средств автоматизации или без использования таких средств. Обработка персональных данных Пользователей осуществляется в соответствии с Федеральным законом от 27.07.2006 N 152-ФЗ &quot;О персональных данных&quot;.<br style=\"box-sizing: inherit;\" />
3.5. При утрате или разглашении персональных данных Администрация Сайта информирует Пользователя об утрате или разглашении персональных данных.<br style=\"box-sizing: inherit;\" />
3.6. Администрация Сайта принимает необходимые организационные и технические меры для защиты персональной информации Пользователя от неправомерного или случайного доступа, уничтожения, изменения, блокирования, копирования, распространения, а также от иных неправомерных действий третьих лиц.<br style=\"box-sizing: inherit;\" />
3.7. Администрация Сайта совместно с Пользователем принимает все необходимые меры по предотвращению убытков или иных отрицательных последствий, вызванных утратой или разглашением персональных данных Пользователя.<br style=\"box-sizing: inherit;\" />
<br style=\"box-sizing: inherit;\" />
<b style=\"box-sizing: inherit; line-height: inherit;\">4. ОБЯЗАТЕЛЬСТВА СТОРОН</b><br style=\"box-sizing: inherit;\" />
<br style=\"box-sizing: inherit;\" />
4.1. Пользователь обязан:<br style=\"box-sizing: inherit;\" />
4.1.1. Предоставить информацию о персональных данных, необходимую для пользования Сайтом.<br style=\"box-sizing: inherit;\" />
4.1.2. Обновлять, дополнять предоставленную информацию о персональных данных в случае изменения данной информации.<br style=\"box-sizing: inherit;\" />
4.2. Администрация Сайта обязана:<br style=\"box-sizing: inherit;\" />
4.2.1. Использовать полученную информацию исключительно для целей, указанных в настоящей Политике конфиденциальности.<br style=\"box-sizing: inherit;\" />
4.2.2. Обеспечить хранение конфиденциальной информации в тайне, не разглашать без предварительного письменного разрешения Пользователя, а также не осуществлять продажу, обмен, опубликование либо разглашение иными возможными способами переданных персональных данных Пользователя, за исключением предусмотренных настоящей Политикой конфиденциальности.<br style=\"box-sizing: inherit;\" />
4.2.3. Принимать меры предосторожности для защиты конфиденциальности персональных данных Пользователя согласно порядку, обычно используемому для защиты такого рода информации в существующем деловом обороте.<br style=\"box-sizing: inherit;\" />
4.2.4. Осуществить блокирование персональных данных, относящихся к соответствующему Пользователю, с момента обращения или запроса Пользователя или его законного представителя либо уполномоченного органа по защите прав субъектов персональных данных на период проверки в случае выявления недостоверных персональных данных или неправомерных действий.<br style=\"box-sizing: inherit;\" />
<br style=\"box-sizing: inherit;\" />
<b style=\"box-sizing: inherit; line-height: inherit;\">5. ОТВЕТСТВЕННОСТЬ СТОРОН</b><br style=\"box-sizing: inherit;\" />
<br style=\"box-sizing: inherit;\" />
5.1. Администрация Сайта, не исполнившая свои обязательства, несет ответственность за убытки, понесенные Пользователем в связи с неправомерным использованием персональных данных, в соответствии с законодательством Российской Федерации.<br style=\"box-sizing: inherit;\" />
5.2. В случае утраты или разглашения конфиденциальной информации Администрация Сайта не несет ответственности, если данная конфиденциальная информация:<br style=\"box-sizing: inherit;\" />
5.2.1. Стала публичным достоянием до ее утраты или разглашения.<br style=\"box-sizing: inherit;\" />
5.2.2. Была получена от третьей стороны до момента ее получения Администрацией Сайта.<br style=\"box-sizing: inherit;\" />
5.2.3. Была разглашена с согласия Пользователя.<br style=\"box-sizing: inherit;\" />
<br style=\"box-sizing: inherit;\" />
<b style=\"box-sizing: inherit; line-height: inherit;\">6. РАЗРЕШЕНИЕ СПОРОВ</b><br style=\"box-sizing: inherit;\" />
<br style=\"box-sizing: inherit;\" />
6.1. До обращения в суд с иском по спорам, возникающим из отношений между Пользователем Сайта и Администрацией Сайта, обязательным является предъявление претензии (письменного предложения о добровольном урегулировании спора).<br style=\"box-sizing: inherit;\" />
6.2. Получатель претензии в течение 10 календарных дней со дня получения претензии письменно уведомляет заявителя претензии о результатах рассмотрения претензии.<br style=\"box-sizing: inherit;\" />
6.3. При недостижении соглашения спор будет передан на рассмотрение в суд в соответствии с действующим законодательством Российской Федерации.<br style=\"box-sizing: inherit;\" />
6.4. К настоящей Политике конфиденциальности и отношениям между Пользователем и Администрацией Сайта применяется действующее законодательство Российской Федерации.<br style=\"box-sizing: inherit;\" />
<br style=\"box-sizing: inherit;\" />
<b style=\"box-sizing: inherit; line-height: inherit;\">7. ДОПОЛНИТЕЛЬНЫЕ УСЛОВИЯ</b><br style=\"box-sizing: inherit;\" />
<br style=\"box-sizing: inherit;\" />
7.1. Администрация Сайта вправе вносить изменения в настоящую Политику конфиденциальности без согласия Пользователя.<br style=\"box-sizing: inherit;\" />
7.2. Новая Политика конфиденциальности вступает в силу с момента ее размещения на Сайте, если иное не предусмотрено новой редакцией Политики конфиденциальности.<br style=\"box-sizing: inherit;\" />
7.3. Все предложения или вопросы по настоящей Политике конфиденциальности следует сообщать&nbsp;<a href=\"mailto:mailto:info@ural56.ru\" style=\"box-sizing: inherit; background-color: transparent; color: rgb(33, 150, 243); text-decoration-line: none; line-height: inherit; cursor: pointer;\" target=\"_blank\">info@ural56.ru</a>.<br style=\"box-sizing: inherit;\" />
7.4. Действующая Политика конфиденциальности размещена на странице по адресу:&nbsp;<a href=\"https://www.ural56.ru/soglashenie/\" style=\"box-sizing: inherit; background-color: transparent; color: rgb(33, 150, 243); text-decoration-line: none; line-height: inherit; cursor: pointer;\" target=\"_blank\">www.ural56.ru/soglashenie/</a>.<br style=\"box-sizing: inherit;\" />
&nbsp;</p>

<p style=\"box-sizing: inherit; margin: 0px 0px 15px; padding: 0px; font-size: 14px; line-height: 1.36; text-rendering: optimizeLegibility; color: rgb(0, 0, 0); font-family: &quot;PT Sans Caption&quot;, serif;\">&nbsp;</p>

<hr style=\"box-sizing: content-box; height: 0px; max-width: 85.7143rem; border-top: 0px; border-bottom: 1px solid rgb(230, 230, 230); margin: 0px auto; clear: both; color: rgb(0, 0, 0); font-family: &quot;PT Sans Caption&quot;, serif; font-size: 14px;\" />
<p style=\"box-sizing: inherit; margin: 0px 0px 15px; padding: 0px; font-size: 14px; line-height: 1.36; text-rendering: optimizeLegibility; color: rgb(0, 0, 0); font-family: &quot;PT Sans Caption&quot;, serif; text-align: center;\">&nbsp;</p>

<p style=\"box-sizing: inherit; margin: 0px 0px 15px; padding: 0px; font-size: 14px; line-height: 1.36; text-rendering: optimizeLegibility; color: rgb(0, 0, 0); font-family: &quot;PT Sans Caption&quot;, serif; text-align: center;\"><b style=\"box-sizing: inherit; line-height: inherit;\"><span style=\"box-sizing: inherit; font-size: 12pt;\">Соглашение</span></b></p>

<p style=\"box-sizing: inherit; margin: 0px 0px 15px; padding: 0px; font-size: 14px; line-height: 1.36; text-rendering: optimizeLegibility; color: rgb(0, 0, 0); font-family: &quot;PT Sans Caption&quot;, serif; text-align: center;\"><b style=\"box-sizing: inherit; line-height: inherit;\"><span style=\"box-sizing: inherit; font-size: 12pt;\">об использовании материалов и сервисов интернет-сайта ural56.ru</span></b><br style=\"box-sizing: inherit;\" />
<b style=\"box-sizing: inherit; line-height: inherit;\"><span style=\"box-sizing: inherit; font-size: 12pt;\">(пользовательское соглашение)</span></b></p>

<p style=\"box-sizing: inherit; margin: 0px 0px 15px; padding: 0px; font-size: 14px; line-height: 1.36; text-rendering: optimizeLegibility; color: rgb(0, 0, 0); font-family: &quot;PT Sans Caption&quot;, serif; text-align: center;\">&nbsp;</p>

<p><br style=\"box-sizing: inherit; color: rgb(0, 0, 0); font-family: &quot;PT Sans Caption&quot;, serif; font-size: 14px;\" />
<span style=\"color: rgb(0, 0, 0); font-family: &quot;PT Sans Caption&quot;, serif; font-size: 14px;\">г. Орск</span></p>

<p style=\"box-sizing: inherit; margin: 0px 0px 15px; padding: 0px; font-size: 14px; line-height: 1.36; text-rendering: optimizeLegibility; color: rgb(0, 0, 0); font-family: &quot;PT Sans Caption&quot;, serif; text-align: right;\">&laquo;01&raquo; мая 2017 года</p>

<p style=\"box-sizing: inherit; margin: 0px 0px 15px; padding: 0px; font-size: 14px; line-height: 1.36; text-rendering: optimizeLegibility; color: rgb(0, 0, 0); font-family: &quot;PT Sans Caption&quot;, serif;\">Настоящее&nbsp; Соглашение&nbsp; является&nbsp; публичной офертой и определяет условия использования материалов&nbsp; и сервисов, размещенных на сайте в&nbsp; сети Интернет по адресу:&nbsp;<a href=\"http://www.ural56.ru/\" style=\"box-sizing: inherit; background-color: transparent; color: rgb(33, 150, 243); text-decoration-line: none; line-height: inherit; cursor: pointer;\">www.ural56.ru</a>, посетителями и пользователями данного интернет-сайта (далее - Сайт).</p>

<p><b style=\"box-sizing: inherit; line-height: inherit; color: rgb(0, 0, 0); font-family: &quot;PT Sans Caption&quot;, serif; font-size: 14px;\">1. Общие условия</b><br style=\"box-sizing: inherit; color: rgb(0, 0, 0); font-family: &quot;PT Sans Caption&quot;, serif; font-size: 14px;\" />
<br style=\"box-sizing: inherit; color: rgb(0, 0, 0); font-family: &quot;PT Sans Caption&quot;, serif; font-size: 14px;\" />
<span style=\"color: rgb(0, 0, 0); font-family: &quot;PT Sans Caption&quot;, serif; font-size: 14px;\">1.1. Сайт создан в целях информирования населения.</span><br style=\"box-sizing: inherit; color: rgb(0, 0, 0); font-family: &quot;PT Sans Caption&quot;, serif; font-size: 14px;\" />
<span style=\"color: rgb(0, 0, 0); font-family: &quot;PT Sans Caption&quot;, serif; font-size: 14px;\">1.2. Сайт разработан ООО &laquo;Цетера Лабс&raquo; для ООО &laquo;Твой Дом&raquo; по Договору оказания услуг от &laquo;28&raquo; марта 2016 г. N 2016-40.</span><br style=\"box-sizing: inherit; color: rgb(0, 0, 0); font-family: &quot;PT Sans Caption&quot;, serif; font-size: 14px;\" />
<span style=\"color: rgb(0, 0, 0); font-family: &quot;PT Sans Caption&quot;, serif; font-size: 14px;\">1.3. Сайт содержит разделы:&nbsp;</span><a href=\"https://www.ural56.ru/news/\" style=\"box-sizing: inherit; color: rgb(33, 150, 243); text-decoration-line: none; line-height: inherit; cursor: pointer; font-family: &quot;PT Sans Caption&quot;, serif; font-size: 14px;\" target=\"_blank\">&laquo;Новости&raquo;</a><span style=\"color: rgb(0, 0, 0); font-family: &quot;PT Sans Caption&quot;, serif; font-size: 14px;\">,&nbsp;</span><a href=\"https://www.ural56.ru/chestnaya-kommunalka/\" style=\"box-sizing: inherit; color: rgb(33, 150, 243); text-decoration-line: none; line-height: inherit; cursor: pointer; font-family: &quot;PT Sans Caption&quot;, serif; font-size: 14px;\" target=\"_blank\">&laquo;Честная коммуналка&raquo;</a><span style=\"color: rgb(0, 0, 0); font-family: &quot;PT Sans Caption&quot;, serif; font-size: 14px;\">,&nbsp;</span><a href=\"https://www.ural56.ru/fashion/\" style=\"box-sizing: inherit; color: rgb(33, 150, 243); text-decoration-line: none; line-height: inherit; cursor: pointer; font-family: &quot;PT Sans Caption&quot;, serif; font-size: 14px;\" target=\"_blank\">&laquo;MODA&raquo;</a><span style=\"color: rgb(0, 0, 0); font-family: &quot;PT Sans Caption&quot;, serif; font-size: 14px;\">,&nbsp;</span><a href=\"https://www.ural56.ru/hockey/\" style=\"box-sizing: inherit; color: rgb(33, 150, 243); text-decoration-line: none; line-height: inherit; cursor: pointer; font-family: &quot;PT Sans Caption&quot;, serif; font-size: 14px;\" target=\"_blank\">&laquo;Хоккей&raquo;</a><span style=\"color: rgb(0, 0, 0); font-family: &quot;PT Sans Caption&quot;, serif; font-size: 14px;\">,&nbsp;</span><a href=\"https://www.ural56.ru/radio_dfm/\" style=\"box-sizing: inherit; color: rgb(33, 150, 243); text-decoration-line: none; line-height: inherit; cursor: pointer; font-family: &quot;PT Sans Caption&quot;, serif; font-size: 14px;\" target=\"_blank\">&laquo;DFM&raquo;</a><span style=\"color: rgb(0, 0, 0); font-family: &quot;PT Sans Caption&quot;, serif; font-size: 14px;\">,&nbsp;</span><a href=\"https://www.ural56.ru/top5/\" style=\"box-sizing: inherit; color: rgb(33, 150, 243); text-decoration-line: none; line-height: inherit; cursor: pointer; font-family: &quot;PT Sans Caption&quot;, serif; font-size: 14px;\" target=\"_blank\">&laquo;ТОП-5&raquo;</a><span style=\"color: rgb(0, 0, 0); font-family: &quot;PT Sans Caption&quot;, serif; font-size: 14px;\">,&nbsp;</span><a href=\"https://www.ural56.ru/longread/\" style=\"box-sizing: inherit; color: rgb(33, 150, 243); text-decoration-line: none; line-height: inherit; cursor: pointer; font-family: &quot;PT Sans Caption&quot;, serif; font-size: 14px;\" target=\"_blank\">&laquo;Лонгрид&raquo;</a><span style=\"color: rgb(0, 0, 0); font-family: &quot;PT Sans Caption&quot;, serif; font-size: 14px;\">,&nbsp;</span><a href=\"https://www.ural56.ru/online/\" style=\"box-sizing: inherit; color: rgb(33, 150, 243); text-decoration-line: none; line-height: inherit; cursor: pointer; font-family: &quot;PT Sans Caption&quot;, serif; font-size: 14px;\" target=\"_blank\">&laquo;Онлайн&raquo;</a><span style=\"color: rgb(0, 0, 0); font-family: &quot;PT Sans Caption&quot;, serif; font-size: 14px;\">,&nbsp;</span><a href=\"https://www.ural56.ru/webcam/\" style=\"box-sizing: inherit; color: rgb(33, 150, 243); text-decoration-line: none; line-height: inherit; cursor: pointer; font-family: &quot;PT Sans Caption&quot;, serif; font-size: 14px;\" target=\"_blank\">&laquo;Web-камеры&raquo;</a><span style=\"color: rgb(0, 0, 0); font-family: &quot;PT Sans Caption&quot;, serif; font-size: 14px;\">,&nbsp;</span><a href=\"https://www.ural56.ru/contests/\" style=\"box-sizing: inherit; color: rgb(33, 150, 243); text-decoration-line: none; line-height: inherit; cursor: pointer; font-family: &quot;PT Sans Caption&quot;, serif; font-size: 14px;\" target=\"_blank\">&laquo;Конкурсы&raquo;</a><span style=\"color: rgb(0, 0, 0); font-family: &quot;PT Sans Caption&quot;, serif; font-size: 14px;\">, &laquo;Архив&raquo;, сервис онлайн-радио, Zopim, форма обратной связи с редакцией, комментарии (сервис hypercomments.com).</span><br style=\"box-sizing: inherit; color: rgb(0, 0, 0); font-family: &quot;PT Sans Caption&quot;, serif; font-size: 14px;\" />
<span style=\"color: rgb(0, 0, 0); font-family: &quot;PT Sans Caption&quot;, serif; font-size: 14px;\">1.4. Использование материалов и сервисов Сайта регулируется нормами действующего законодательства Российской Федерации.</span><br style=\"box-sizing: inherit; color: rgb(0, 0, 0); font-family: &quot;PT Sans Caption&quot;, serif; font-size: 14px;\" />
<span style=\"color: rgb(0, 0, 0); font-family: &quot;PT Sans Caption&quot;, serif; font-size: 14px;\">1.5. Для получения доступа к Форме обратной связи с редакцией, сервису Zopim и к форме комментариев hypercomments.com Пользователю необходимо выполнить следующие действия:</span><br style=\"box-sizing: inherit; color: rgb(0, 0, 0); font-family: &quot;PT Sans Caption&quot;, serif; font-size: 14px;\" />
<span style=\"color: rgb(0, 0, 0); font-family: &quot;PT Sans Caption&quot;, serif; font-size: 14px;\">- заполнить регистрационную форму;</span><br style=\"box-sizing: inherit; color: rgb(0, 0, 0); font-family: &quot;PT Sans Caption&quot;, serif; font-size: 14px;\" />
<span style=\"color: rgb(0, 0, 0); font-family: &quot;PT Sans Caption&quot;, serif; font-size: 14px;\">- оставить комментарий или информацию для Редакции.</span><br style=\"box-sizing: inherit; color: rgb(0, 0, 0); font-family: &quot;PT Sans Caption&quot;, serif; font-size: 14px;\" />
<span style=\"color: rgb(0, 0, 0); font-family: &quot;PT Sans Caption&quot;, serif; font-size: 14px;\">1.6. Получая доступ к материалам Сайта, Пользователь считается присоединившимся к настоящему Соглашению.</span><br style=\"box-sizing: inherit; color: rgb(0, 0, 0); font-family: &quot;PT Sans Caption&quot;, serif; font-size: 14px;\" />
<span style=\"color: rgb(0, 0, 0); font-family: &quot;PT Sans Caption&quot;, serif; font-size: 14px;\">1.7. Пользователь может использовать материалы Сайта и предоставляемые на Сайте сервисы следующим образом: ознакомления, цитирования, использования текстов, фото и видео с указанием прямой активной ссылки на ресурс&nbsp;</span><a href=\"http://www.ural56.ru/\" style=\"box-sizing: inherit; color: rgb(33, 150, 243); text-decoration-line: none; line-height: inherit; cursor: pointer; font-family: &quot;PT Sans Caption&quot;, serif; font-size: 14px;\">www.ural56.ru</a><span style=\"color: rgb(0, 0, 0); font-family: &quot;PT Sans Caption&quot;, serif; font-size: 14px;\">.</span><br style=\"box-sizing: inherit; color: rgb(0, 0, 0); font-family: &quot;PT Sans Caption&quot;, serif; font-size: 14px;\" />
<br style=\"box-sizing: inherit; color: rgb(0, 0, 0); font-family: &quot;PT Sans Caption&quot;, serif; font-size: 14px;\" />
<b style=\"box-sizing: inherit; line-height: inherit; color: rgb(0, 0, 0); font-family: &quot;PT Sans Caption&quot;, serif; font-size: 14px;\">2. Обязательства Пользователя</b><br style=\"box-sizing: inherit; color: rgb(0, 0, 0); font-family: &quot;PT Sans Caption&quot;, serif; font-size: 14px;\" />
<br style=\"box-sizing: inherit; color: rgb(0, 0, 0); font-family: &quot;PT Sans Caption&quot;, serif; font-size: 14px;\" />
<span style=\"color: rgb(0, 0, 0); font-family: &quot;PT Sans Caption&quot;, serif; font-size: 14px;\">2.1. Пользователь соглашается не предпринимать действий и не оставлять комментарии и записи, которые могут рассматриваться как нарушающие российское законодательство или нормы международного права, в том числе в сфере интеллектуальной собственности, авторских и/или смежных прав, общепринятые нормы морали и нравственности, а также любых действий, которые приводят или могут привести к нарушению нормальной работы Сайта и сервисов Сайта.</span><br style=\"box-sizing: inherit; color: rgb(0, 0, 0); font-family: &quot;PT Sans Caption&quot;, serif; font-size: 14px;\" />
<span style=\"color: rgb(0, 0, 0); font-family: &quot;PT Sans Caption&quot;, serif; font-size: 14px;\">2.2. Использование материалов Сайта без согласия правообладателей не допускается.</span><br style=\"box-sizing: inherit; color: rgb(0, 0, 0); font-family: &quot;PT Sans Caption&quot;, serif; font-size: 14px;\" />
<span style=\"color: rgb(0, 0, 0); font-family: &quot;PT Sans Caption&quot;, serif; font-size: 14px;\">2.3. При цитировании материалов Сайта, включая охраняемые авторские произведения, ссылка на Сайт обязательна.</span><br style=\"box-sizing: inherit; color: rgb(0, 0, 0); font-family: &quot;PT Sans Caption&quot;, serif; font-size: 14px;\" />
<span style=\"color: rgb(0, 0, 0); font-family: &quot;PT Sans Caption&quot;, serif; font-size: 14px;\">2.4. Администрация Сайта не несет ответственности за посещение и использование им внешних ресурсов, ссылки на которые могут содержаться на Сайте.</span><br style=\"box-sizing: inherit; color: rgb(0, 0, 0); font-family: &quot;PT Sans Caption&quot;, serif; font-size: 14px;\" />
<span style=\"color: rgb(0, 0, 0); font-family: &quot;PT Sans Caption&quot;, serif; font-size: 14px;\">2.5. Администрация Сайта не несет ответственности и не имеет прямых или косвенных обязательств перед Пользователем в связи с любыми возможными или возникшими потерями или убытками, связанными с любым содержанием Сайта, регистрацией авторских прав и сведениями о такой регистрации, товарами или услугами, доступными на или полученными через внешние сайты или ресурсы либо иные контакты Пользователя, в которые он вступил, используя размещенную на Сайте информацию или ссылки на внешние ресурсы.</span><br style=\"box-sizing: inherit; color: rgb(0, 0, 0); font-family: &quot;PT Sans Caption&quot;, serif; font-size: 14px;\" />
<span style=\"color: rgb(0, 0, 0); font-family: &quot;PT Sans Caption&quot;, serif; font-size: 14px;\">2.6. Пользователь согласен с тем, что Администрация Сайта не несет какой-либо ответственности и не имеет каких-либо обязательств в связи с рекламой, которая может быть размещена на Сайте.</span><br style=\"box-sizing: inherit; color: rgb(0, 0, 0); font-family: &quot;PT Sans Caption&quot;, serif; font-size: 14px;\" />
<br style=\"box-sizing: inherit; color: rgb(0, 0, 0); font-family: &quot;PT Sans Caption&quot;, serif; font-size: 14px;\" />
<b style=\"box-sizing: inherit; line-height: inherit; color: rgb(0, 0, 0); font-family: &quot;PT Sans Caption&quot;, serif; font-size: 14px;\">3. Прочие условия</b><br style=\"box-sizing: inherit; color: rgb(0, 0, 0); font-family: &quot;PT Sans Caption&quot;, serif; font-size: 14px;\" />
<br style=\"box-sizing: inherit; color: rgb(0, 0, 0); font-family: &quot;PT Sans Caption&quot;, serif; font-size: 14px;\" />
<span style=\"color: rgb(0, 0, 0); font-family: &quot;PT Sans Caption&quot;, serif; font-size: 14px;\">3.1. Все возможные споры, вытекающие из настоящего Соглашения или связанные с ним, подлежат разрешению в соответствии с действующим законодательством Российской Федерации.</span><br style=\"box-sizing: inherit; color: rgb(0, 0, 0); font-family: &quot;PT Sans Caption&quot;, serif; font-size: 14px;\" />
<span style=\"color: rgb(0, 0, 0); font-family: &quot;PT Sans Caption&quot;, serif; font-size: 14px;\">3.2. Признание судом какого-либо положения Соглашения недействительным или не подлежащим принудительному исполнению не влечет недействительности иных положений Соглашения.</span><br style=\"box-sizing: inherit; color: rgb(0, 0, 0); font-family: &quot;PT Sans Caption&quot;, serif; font-size: 14px;\" />
<span style=\"color: rgb(0, 0, 0); font-family: &quot;PT Sans Caption&quot;, serif; font-size: 14px;\">3.3. Бездействие со стороны Администрации Сайта в случае нарушения кем-либо из Пользователей положений Соглашения не лишает Администрацию Сайта права предпринять позднее соответствующие действия в защиту своих интересов и защиту авторских прав на охраняемые в соответствии с законодательством материалы Сайта, в том числе, но не исключительно, в судебном порядке.</span><br style=\"box-sizing: inherit; color: rgb(0, 0, 0); font-family: &quot;PT Sans Caption&quot;, serif; font-size: 14px;\" />
<span style=\"color: rgb(0, 0, 0); font-family: &quot;PT Sans Caption&quot;, serif; font-size: 14px;\">3.4. Администрация Сайта вправе в любое время в одностороннем порядке изменять условия настоящего Соглашения. Такие изменения вступают в силу по истечении 2 (двух) дней с момента размещения новой версии Соглашения на сайте. При несогласии Пользователя с внесенными изменениями он обязан отказаться от доступа к Сайту, прекратить использование материалов и сервисов Сайта.</span><br style=\"box-sizing: inherit; color: rgb(0, 0, 0); font-family: &quot;PT Sans Caption&quot;, serif; font-size: 14px;\" />
<span style=\"color: rgb(0, 0, 0); font-family: &quot;PT Sans Caption&quot;, serif; font-size: 14px;\">3.5. Переходя по ссылке&nbsp;</span><a href=\"https://www.ural56.ru/soglashenie/\" style=\"box-sizing: inherit; color: rgb(33, 150, 243); text-decoration-line: none; line-height: inherit; cursor: pointer; font-family: &quot;PT Sans Caption&quot;, serif; font-size: 14px;\" target=\"_blank\">www.ural56.ru/soglashenie/</a><span style=\"color: rgb(0, 0, 0); font-family: &quot;PT Sans Caption&quot;, serif; font-size: 14px;\">, Пользователь подтверждает, что принимает условия настоящего Соглашения, а также Политики конфиденциальности Сайта, являющейся неотъемлемой частью настоящего Соглашения и размещенной на странице по адресу:&nbsp;</span><a href=\"https://www.ural56.ru/\" style=\"box-sizing: inherit; color: rgb(33, 150, 243); text-decoration-line: none; line-height: inherit; cursor: pointer; font-family: &quot;PT Sans Caption&quot;, serif; font-size: 14px;\" target=\"_blank\">www.ural56.ru</a><span style=\"color: rgb(0, 0, 0); font-family: &quot;PT Sans Caption&quot;, serif; font-size: 14px;\">.</span><br style=\"box-sizing: inherit; color: rgb(0, 0, 0); font-family: &quot;PT Sans Caption&quot;, serif; font-size: 14px;\" />
<br style=\"box-sizing: inherit; color: rgb(0, 0, 0); font-family: &quot;PT Sans Caption&quot;, serif; font-size: 14px;\" />
<b style=\"box-sizing: inherit; line-height: inherit; color: rgb(0, 0, 0); font-family: &quot;PT Sans Caption&quot;, serif; font-size: 14px;\">4. Согласие на сбор и обработку персональных данных:</b><br style=\"box-sizing: inherit; color: rgb(0, 0, 0); font-family: &quot;PT Sans Caption&quot;, serif; font-size: 14px;\" />
<br style=\"box-sizing: inherit; color: rgb(0, 0, 0); font-family: &quot;PT Sans Caption&quot;, serif; font-size: 14px;\" />
<span style=\"color: rgb(0, 0, 0); font-family: &quot;PT Sans Caption&quot;, serif; font-size: 14px;\">4.1. Присоединяясь к настоящему Соглашению и оставляя свои данные на Сайте, путем заполнения полей онлайн-заявки (регистрации) Пользователь:&nbsp;</span><br style=\"box-sizing: inherit; color: rgb(0, 0, 0); font-family: &quot;PT Sans Caption&quot;, serif; font-size: 14px;\" />
<span style=\"color: rgb(0, 0, 0); font-family: &quot;PT Sans Caption&quot;, serif; font-size: 14px;\">&bull;&nbsp;&nbsp; &nbsp;подтверждает, что указанные им персональные данные принадлежат лично ему;&nbsp;</span><br style=\"box-sizing: inherit; color: rgb(0, 0, 0); font-family: &quot;PT Sans Caption&quot;, serif; font-size: 14px;\" />
<span style=\"color: rgb(0, 0, 0); font-family: &quot;PT Sans Caption&quot;, serif; font-size: 14px;\">&bull;&nbsp;&nbsp; &nbsp;признает и подтверждает, что он внимательно и в полном объеме ознакомился с настоящим Соглашением и содержащимися в нем условиями обработки его персональных данных, указываемых им в полях он-лайн заявки (регистрации) на сайте;</span><br style=\"box-sizing: inherit; color: rgb(0, 0, 0); font-family: &quot;PT Sans Caption&quot;, serif; font-size: 14px;\" />
<span style=\"color: rgb(0, 0, 0); font-family: &quot;PT Sans Caption&quot;, serif; font-size: 14px;\">&bull;&nbsp;&nbsp; &nbsp;признает и подтверждает, что все положения настоящего Соглашения и условия обработки его персональных данных ему понятны;&nbsp;</span><br style=\"box-sizing: inherit; color: rgb(0, 0, 0); font-family: &quot;PT Sans Caption&quot;, serif; font-size: 14px;\" />
<span style=\"color: rgb(0, 0, 0); font-family: &quot;PT Sans Caption&quot;, serif; font-size: 14px;\">&bull;&nbsp;&nbsp; &nbsp;дает согласие на обработку Сайтом предоставляемых персональных данных в целях регистрации Пользователя на Сайте;</span><br style=\"box-sizing: inherit; color: rgb(0, 0, 0); font-family: &quot;PT Sans Caption&quot;, serif; font-size: 14px;\" />
<span style=\"color: rgb(0, 0, 0); font-family: &quot;PT Sans Caption&quot;, serif; font-size: 14px;\">&bull;&nbsp;&nbsp; &nbsp;выражает согласие с условиями обработки персональных данных без каких-либо оговорок и ограничений.</span><br style=\"box-sizing: inherit; color: rgb(0, 0, 0); font-family: &quot;PT Sans Caption&quot;, serif; font-size: 14px;\" />
<span style=\"color: rgb(0, 0, 0); font-family: &quot;PT Sans Caption&quot;, serif; font-size: 14px;\">4.2. Пользователь дает свое согласие на обработку его персональных данных, а именно совершение действий, предусмотренных п. 3 ч. 1 ст. 3 Федерального закона от 27.07.2006 N 152-ФЗ &quot;О персональных данных&quot;, и подтверждает, что, давая такое согласие, он действует свободно, своей волей и в своем интересе.</span><br style=\"box-sizing: inherit; color: rgb(0, 0, 0); font-family: &quot;PT Sans Caption&quot;, serif; font-size: 14px;\" />
<span style=\"color: rgb(0, 0, 0); font-family: &quot;PT Sans Caption&quot;, serif; font-size: 14px;\">4.3. Согласие Пользователя на обработку персональных данных является конкретным, информированным и сознательным.</span><br style=\"box-sizing: inherit; color: rgb(0, 0, 0); font-family: &quot;PT Sans Caption&quot;, serif; font-size: 14px;\" />
<span style=\"color: rgb(0, 0, 0); font-family: &quot;PT Sans Caption&quot;, serif; font-size: 14px;\">4.4. Настоящее согласие Пользователя применяется в отношении обработки следующих персональных данных:</span><br style=\"box-sizing: inherit; color: rgb(0, 0, 0); font-family: &quot;PT Sans Caption&quot;, serif; font-size: 14px;\" />
<span style=\"color: rgb(0, 0, 0); font-family: &quot;PT Sans Caption&quot;, serif; font-size: 14px;\">&bull;&nbsp;&nbsp; &nbsp;фамилия, имя, отчество;</span><br style=\"box-sizing: inherit; color: rgb(0, 0, 0); font-family: &quot;PT Sans Caption&quot;, serif; font-size: 14px;\" />
<span style=\"color: rgb(0, 0, 0); font-family: &quot;PT Sans Caption&quot;, serif; font-size: 14px;\">&bull;&nbsp;&nbsp; &nbsp;место пребывания (город, область);</span><br style=\"box-sizing: inherit; color: rgb(0, 0, 0); font-family: &quot;PT Sans Caption&quot;, serif; font-size: 14px;\" />
<span style=\"color: rgb(0, 0, 0); font-family: &quot;PT Sans Caption&quot;, serif; font-size: 14px;\">&bull;&nbsp;&nbsp; &nbsp;номера телефонов;</span><br style=\"box-sizing: inherit; color: rgb(0, 0, 0); font-family: &quot;PT Sans Caption&quot;, serif; font-size: 14px;\" />
<span style=\"color: rgb(0, 0, 0); font-family: &quot;PT Sans Caption&quot;, serif; font-size: 14px;\">&bull;&nbsp;&nbsp; &nbsp;адресах электронной почты (E-mail).</span><br style=\"box-sizing: inherit; color: rgb(0, 0, 0); font-family: &quot;PT Sans Caption&quot;, serif; font-size: 14px;\" />
<span style=\"color: rgb(0, 0, 0); font-family: &quot;PT Sans Caption&quot;, serif; font-size: 14px;\">4.4. Пользователь, предоставляет Сайту&nbsp; осуществлять следующие действия (операции) с персональными данными:</span><br style=\"box-sizing: inherit; color: rgb(0, 0, 0); font-family: &quot;PT Sans Caption&quot;, serif; font-size: 14px;\" />
<span style=\"color: rgb(0, 0, 0); font-family: &quot;PT Sans Caption&quot;, serif; font-size: 14px;\">&bull;&nbsp;&nbsp; &nbsp;сбор и накопление;</span><br style=\"box-sizing: inherit; color: rgb(0, 0, 0); font-family: &quot;PT Sans Caption&quot;, serif; font-size: 14px;\" />
<span style=\"color: rgb(0, 0, 0); font-family: &quot;PT Sans Caption&quot;, serif; font-size: 14px;\">&bull;&nbsp;&nbsp; &nbsp;хранение в течение установленных нормативными документами сроков хранения отчетности, но не менее трех лет, с момента даты прекращения пользования услуг Сайта Пользователем;</span><br style=\"box-sizing: inherit; color: rgb(0, 0, 0); font-family: &quot;PT Sans Caption&quot;, serif; font-size: 14px;\" />
<span style=\"color: rgb(0, 0, 0); font-family: &quot;PT Sans Caption&quot;, serif; font-size: 14px;\">&bull;&nbsp;&nbsp; &nbsp;уточнение (обновление, изменение);</span><br style=\"box-sizing: inherit; color: rgb(0, 0, 0); font-family: &quot;PT Sans Caption&quot;, serif; font-size: 14px;\" />
<span style=\"color: rgb(0, 0, 0); font-family: &quot;PT Sans Caption&quot;, serif; font-size: 14px;\">&bull;&nbsp;&nbsp; &nbsp;использование в целях регистрации Пользователя на Сайте;</span><br style=\"box-sizing: inherit; color: rgb(0, 0, 0); font-family: &quot;PT Sans Caption&quot;, serif; font-size: 14px;\" />
<span style=\"color: rgb(0, 0, 0); font-family: &quot;PT Sans Caption&quot;, serif; font-size: 14px;\">&bull;&nbsp;&nbsp; &nbsp;уничтожение;</span><br style=\"box-sizing: inherit; color: rgb(0, 0, 0); font-family: &quot;PT Sans Caption&quot;, serif; font-size: 14px;\" />
<span style=\"color: rgb(0, 0, 0); font-family: &quot;PT Sans Caption&quot;, serif; font-size: 14px;\">&bull;&nbsp;&nbsp; &nbsp;передача по требованию суда, в т.ч. третьим лицам, с соблюдением мер, обеспечивающих защиту персональных данных от несанкционированного доступа.</span><br style=\"box-sizing: inherit; color: rgb(0, 0, 0); font-family: &quot;PT Sans Caption&quot;, serif; font-size: 14px;\" />
<span style=\"color: rgb(0, 0, 0); font-family: &quot;PT Sans Caption&quot;, serif; font-size: 14px;\">4.5. Указанное согласие действует бессрочно с момента предоставления данных и может быть отозвано Вами путем подачи заявления администрации Сайта с указанием данных, определенных ст. 14 Закона &laquo;О персональных данных&raquo;. Отзыв согласия на обработку персональных данных может быть осуществлен путем направления Пользователем соответствующего распоряжения в простой письменной форме на адрес электронной почты (E-mail)&nbsp;</span><a href=\"mailto:mailto:info@ural56.ru\" style=\"box-sizing: inherit; color: rgb(33, 150, 243); text-decoration-line: none; line-height: inherit; cursor: pointer; font-family: &quot;PT Sans Caption&quot;, serif; font-size: 14px;\" target=\"_blank\">info@ural56.ru</a><span style=\"color: rgb(0, 0, 0); font-family: &quot;PT Sans Caption&quot;, serif; font-size: 14px;\">.</span><br style=\"box-sizing: inherit; color: rgb(0, 0, 0); font-family: &quot;PT Sans Caption&quot;, serif; font-size: 14px;\" />
<span style=\"color: rgb(0, 0, 0); font-family: &quot;PT Sans Caption&quot;, serif; font-size: 14px;\">4.6. Сайт не несет ответственности за использование (как правомерное, так и неправомерное) третьими лицами информации, размещенной Пользователем на Сайте, включая её воспроизведение и распространение, осуществленные всеми возможными способами.</span><br style=\"box-sizing: inherit; color: rgb(0, 0, 0); font-family: &quot;PT Sans Caption&quot;, serif; font-size: 14px;\" />
<span style=\"color: rgb(0, 0, 0); font-family: &quot;PT Sans Caption&quot;, serif; font-size: 14px;\">4.7. Сайт имеет право вносить изменения в настоящее Соглашение. При внесении изменений в актуальной редакции указывается дата последнего обновления. Новая редакция Соглашения вступает в силу с момента ее размещения, если иное не предусмотрено новой редакцией Соглашения.</span><br style=\"box-sizing: inherit; color: rgb(0, 0, 0); font-family: &quot;PT Sans Caption&quot;, serif; font-size: 14px;\" />
<span style=\"color: rgb(0, 0, 0); font-family: &quot;PT Sans Caption&quot;, serif; font-size: 14px;\">Действующая редакция всегда находится на странице по адресу:</span><a href=\"https://www.ural56.ru/soglashenie/\" style=\"box-sizing: inherit; color: rgb(33, 150, 243); text-decoration-line: none; line-height: inherit; cursor: pointer; font-family: &quot;PT Sans Caption&quot;, serif; font-size: 14px;\" target=\"_blank\">www.ural56.ru/soglashenie/</a><span style=\"color: rgb(0, 0, 0); font-family: &quot;PT Sans Caption&quot;, serif; font-size: 14px;\">.</span><br style=\"box-sizing: inherit; color: rgb(0, 0, 0); font-family: &quot;PT Sans Caption&quot;, serif; font-size: 14px;\" />
<span style=\"color: rgb(0, 0, 0); font-family: &quot;PT Sans Caption&quot;, serif; font-size: 14px;\">4.7. К настоящему Соглашению и отношениям между пользователем и Сайтом, возникающим в связи с применением Соглашения подлежит применению материальное и процессуальное право Российской Федерации.</span><br style=\"box-sizing: inherit; color: rgb(0, 0, 0); font-family: &quot;PT Sans Caption&quot;, serif; font-size: 14px;\" />
<br style=\"box-sizing: inherit; color: rgb(0, 0, 0); font-family: &quot;PT Sans Caption&quot;, serif; font-size: 14px;\" />
<b style=\"box-sizing: inherit; line-height: inherit; color: rgb(0, 0, 0); font-family: &quot;PT Sans Caption&quot;, serif; font-size: 14px;\">5. Сбор сведений из социальных сетей (сервисов):</b><br style=\"box-sizing: inherit; color: rgb(0, 0, 0); font-family: &quot;PT Sans Caption&quot;, serif; font-size: 14px;\" />
<br style=\"box-sizing: inherit; color: rgb(0, 0, 0); font-family: &quot;PT Sans Caption&quot;, serif; font-size: 14px;\" />
<span style=\"color: rgb(0, 0, 0); font-family: &quot;PT Sans Caption&quot;, serif; font-size: 14px;\">5.1. В целях оптимизации работы сервиса и взаимодействия с Пользователем Сайт вправе собирать указанные в настоящем разделе данные о Пользователе из социальных сетей.</span><br style=\"box-sizing: inherit; color: rgb(0, 0, 0); font-family: &quot;PT Sans Caption&quot;, serif; font-size: 14px;\" />
<span style=\"color: rgb(0, 0, 0); font-family: &quot;PT Sans Caption&quot;, serif; font-size: 14px;\">5.2. Регистрация Пользователя может осуществляться через социальные сервисы. Данный способ регистрации избирает сам Пользователь путем совершения указанных на Сайте действий в момент регистрации.</span><br style=\"box-sizing: inherit; color: rgb(0, 0, 0); font-family: &quot;PT Sans Caption&quot;, serif; font-size: 14px;\" />
<span style=\"color: rgb(0, 0, 0); font-family: &quot;PT Sans Caption&quot;, serif; font-size: 14px;\">5.3. При регистрации через социальные сервисы Сайт в целях автоматического заполнения аналогичных данных о Пользователе, а также для оптимизации работы фильтра Сайта по соответствующему критерию собирает следующие сведения о Пользователе из системы facebook.com:</span><br style=\"box-sizing: inherit; color: rgb(0, 0, 0); font-family: &quot;PT Sans Caption&quot;, serif; font-size: 14px;\" />
<span style=\"color: rgb(0, 0, 0); font-family: &quot;PT Sans Caption&quot;, serif; font-size: 14px;\">&bull;&nbsp;&nbsp; &nbsp;имя и фамилия Пользователя, а также его никнейм;</span><br style=\"box-sizing: inherit; color: rgb(0, 0, 0); font-family: &quot;PT Sans Caption&quot;, serif; font-size: 14px;\" />
<span style=\"color: rgb(0, 0, 0); font-family: &quot;PT Sans Caption&quot;, serif; font-size: 14px;\">&bull;&nbsp;&nbsp; &nbsp;пол Пользователя;</span><br style=\"box-sizing: inherit; color: rgb(0, 0, 0); font-family: &quot;PT Sans Caption&quot;, serif; font-size: 14px;\" />
<span style=\"color: rgb(0, 0, 0); font-family: &quot;PT Sans Caption&quot;, serif; font-size: 14px;\">&bull;&nbsp;&nbsp; &nbsp;место пребывания (город, населенный пункт) и иные данные, которые содержит социальный сервис.</span></p>

<hr style=\"box-sizing: content-box; height: 0px; max-width: 85.7143rem; border-top: 0px; border-bottom: 1px solid rgb(230, 230, 230); margin: 0px auto; clear: both; color: rgb(0, 0, 0); font-family: &quot;PT Sans Caption&quot;, serif; font-size: 14px;\" />
<p style=\"box-sizing: inherit; margin: 0px 0px 15px; padding: 0px; font-size: 14px; line-height: 1.36; text-rendering: optimizeLegibility; color: rgb(0, 0, 0); font-family: &quot;PT Sans Caption&quot;, serif; text-align: center;\"><b style=\"box-sizing: inherit; line-height: inherit;\"><span style=\"box-sizing: inherit; font-size: 12pt;\">СОГЛАСИЕ</span></b><br style=\"box-sizing: inherit;\" />
<b style=\"box-sizing: inherit; line-height: inherit;\"><span style=\"box-sizing: inherit; font-size: 12pt;\">посетителя сайта ural56.ru</span><span style=\"box-sizing: inherit; font-size: 12pt;\">&nbsp;на обработку персональных данных</span></b></p>

<p><br style=\"box-sizing: inherit; color: rgb(0, 0, 0); font-family: &quot;PT Sans Caption&quot;, serif; font-size: 14px;\" />
<span style=\"color: rgb(0, 0, 0); font-family: &quot;PT Sans Caption&quot;, serif; font-size: 14px;\">Настоящим свободно, своей волей и в своем интересе даю согласие на обработку персональных данных, которое находится по адресу:&nbsp;</span><a href=\"https://www.ural56.ru/soglashenie/\" style=\"box-sizing: inherit; color: rgb(33, 150, 243); text-decoration-line: none; line-height: inherit; cursor: pointer; font-family: &quot;PT Sans Caption&quot;, serif; font-size: 14px;\" target=\"_blank\">www.ural56.ru/soglashenie/</a><span style=\"color: rgb(0, 0, 0); font-family: &quot;PT Sans Caption&quot;, serif; font-size: 14px;\">(далее &ndash; Сайт), на автоматизированную и неавтоматизированную обработку моих персональных данных, в том числе ', '', '', '', '');


DROP TABLE IF EXISTS `eboard_msg`;
CREATE TABLE `eboard_msg` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `text` text,
  `type` varchar(100) DEFAULT NULL,
  `comments` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

INSERT INTO `eboard_msg`(`id`, `text`, `type`, `comments`) VALUES ('4', '<p align=\"left\">Здравствуйте, %user%!</p>
<p align=\"left\">Кто-то, возможно Вы, сделал запрос на смену пароля Вашего аккаунта на сайте %title%.</p>
<p align=\"left\"><em>Для смены пароля пройдите по ссылке:</em></p>
<p align=\"left\">%link%</p>', 'password_recovery', '376');
INSERT INTO `eboard_msg`(`id`, `text`, `type`, `comments`) VALUES ('2', '<p align=\"left\">Здравствуйте, %user%! <br />
Добро пожаловать на сайт %title%!</p>
<p align=\"left\">Чтобы активировать аккаунт и подтвердить свой адрес электронной почты, нажмите на эту ссылку:</p>
<p align=\"left\">%link%</p>', 'reg_check', '377');
INSERT INTO `eboard_msg`(`id`, `text`, `type`, `comments`) VALUES ('5', '<p align=\"left\">Здравствуйте, %user%!</p>
<p align=\"left\">Истекает срок публикации Вашего объявления %message_title% на сайте %title%.</p>
<p align=\"left\">Объявление будет удалено через %days% дней.</p>
<p align=\"left\">Для смены продления срока публикации пройдите по ссылке:</p>
<p align=\"left\">%link%</p>', 'del_mess', '378');
INSERT INTO `eboard_msg`(`id`, `text`, `type`, `comments`) VALUES ('6', '<p align=\"left\">Здравствуйте,</p>
<p align=\"left\">ставим Вас в известность, что на Ваше сообщение &laquo;<a href=\"%message_link%\">%message_title%</a>&raquo; на сайте %title% пришёл ответ.</p>
<p>&nbsp;</p>
<p align=\"left\">Отправитель: <b>%name%</b></p>
<p align=\"left\">E-mail: <b>%email%</b></p>
<p align=\"center\"><strong>Текст сообщения</strong></p>
<hr />
<p>%message%</p>', 'reply', '379');
INSERT INTO `eboard_msg`(`id`, `text`, `type`, `comments`) VALUES ('7', '<p align=\"left\">Здравствуйте, %user%,</p>
<p align=\"left\">ставим Вас в известность, что на Вам пришло сообщение с cайта %title%.</p>
<p>&nbsp;</p>
<p align=\"left\">Отправитель: <b>%name%</b></p>
<p align=\"left\">E-mail: <b>%email%</b></p>
<p align=\"center\"><strong>Текст сообщения</strong></p>
<hr />
<p>%message%</p>', 'message2user', '774');
INSERT INTO `eboard_msg`(`id`, `text`, `type`, `comments`) VALUES ('8', '<p align=\"left\">Здравствуйте, %user%,</p>
<p align=\"left\">ставим Вас в известность, что на Ваше объявление %message% на сайте %title% одобрено модератором и опубликовано</p>', 'message_allowed', '923');
INSERT INTO `eboard_msg`(`id`, `text`, `type`, `comments`) VALUES ('9', '<p align=\"left\">Здравствуйте, %user%,</p>
<p align=\"left\">ставим Вас в известность, что на Ваше объявление %message% на сайте %title% отклонено модератором</p>', 'message_denied', '924');
INSERT INTO `eboard_msg`(`id`, `text`, `type`, `comments`) VALUES ('10', '<p style=\"text-align: center;\">Автоматическая система биллинга отключена.</p>
<p style=\"text-align: center;\">Вы можете пополнить баланс личного счёта, уточнив реквизиты у администратора.</p>', 'pay_none', '630');
INSERT INTO `eboard_msg`(`id`, `text`, `type`, `comments`) VALUES ('11', '
<p>Здравствуйте, %user%!</p>

<p>Истек срок действия услуги %service% для объявления %message_title% на сайте %title%:</p>
<p>Для повторного заказа услуги пройдите по ссылке:</p>

<p>%link%</p>

<p>--</p>

<p>%unsubscribe%</p>
', 'email_update', '1102');
INSERT INTO `eboard_msg`(`id`, `text`, `type`, `comments`) VALUES ('12', '
<p>Здравствуйте, %user%!</p>

<p>Истекает срок публикации Ваших объявлений на сайте %title%:</p>
%messages%
<p>Для продления срока публикации объявлений пройдите по ссылке:</p>

<p>%link%</p>

<p>--</p>

<p>%unsubscribe%</p>
', 'del_mess_all', '1090');


DROP TABLE IF EXISTS `eboard_nav`;
CREATE TABLE `eboard_nav` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `status` int(1) DEFAULT '0',
  `name` varchar(300) NOT NULL,
  `url` varchar(300) NOT NULL,
  `sort` int(11) NOT NULL DEFAULT '1000000',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=38 DEFAULT CHARSET=utf8;

INSERT INTO `eboard_nav`(`id`, `status`, `name`, `url`, `sort`) VALUES ('6', '9', 'Регистрация', '/users/register/', '4');
INSERT INTO `eboard_nav`(`id`, `status`, `name`, `url`, `sort`) VALUES ('7', '8', 'Личный кабинет', '/users/', '5');
INSERT INTO `eboard_nav`(`id`, `status`, `name`, `url`, `sort`) VALUES ('9', '2', 'Панель администрирования', '/admin/', '7');
INSERT INTO `eboard_nav`(`id`, `status`, `name`, `url`, `sort`) VALUES ('10', '0', 'Добавить объявление', '/add/', '6');
INSERT INTO `eboard_nav`(`id`, `status`, `name`, `url`, `sort`) VALUES ('37', '0', 'Магазины', '/shops/', '3');
INSERT INTO `eboard_nav`(`id`, `status`, `name`, `url`, `sort`) VALUES ('36', '0', 'Статьи', '/articles/', '2');
INSERT INTO `eboard_nav`(`id`, `status`, `name`, `url`, `sort`) VALUES ('34', '0', 'На главную', '/', '1');


DROP TABLE IF EXISTS `eboard_news`;
CREATE TABLE `eboard_news` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `md` varchar(20) DEFAULT NULL,
  `time` int(11) NOT NULL,
  `cat` int(11) NOT NULL,
  `name` varchar(200) DEFAULT NULL,
  `ann` text,
  `text` text,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS `eboard_news_cat`;
CREATE TABLE `eboard_news_cat` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `md` varchar(20) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `uri` varchar(50) DEFAULT NULL,
  `sort` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS `eboard_orders`;
CREATE TABLE `eboard_orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `time_end` int(11) NOT NULL,
  `days` int(11) NOT NULL,
  `type` varchar(1) NOT NULL,
  `message_id` int(11) NOT NULL,
  `status` int(1) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

INSERT INTO `eboard_orders`(`id`, `user_id`, `time_end`, `days`, `type`, `message_id`, `status`) VALUES ('17', '0', '1521035717', '30', 'm', '74', '1');
INSERT INTO `eboard_orders`(`id`, `user_id`, `time_end`, `days`, `type`, `message_id`, `status`) VALUES ('16', '0', '1521035703', '30', 'b', '72', '1');
INSERT INTO `eboard_orders`(`id`, `user_id`, `time_end`, `days`, `type`, `message_id`, `status`) VALUES ('15', '0', '1521035703', '30', 'm', '72', '1');
INSERT INTO `eboard_orders`(`id`, `user_id`, `time_end`, `days`, `type`, `message_id`, `status`) VALUES ('14', '0', '1521035685', '30', 'b', '42', '1');
INSERT INTO `eboard_orders`(`id`, `user_id`, `time_end`, `days`, `type`, `message_id`, `status`) VALUES ('13', '0', '1521035675', '30', 'b', '127', '1');
INSERT INTO `eboard_orders`(`id`, `user_id`, `time_end`, `days`, `type`, `message_id`, `status`) VALUES ('12', '0', '1521035667', '30', 'b', '128', '1');
INSERT INTO `eboard_orders`(`id`, `user_id`, `time_end`, `days`, `type`, `message_id`, `status`) VALUES ('11', '0', '1521035658', '30', 'b', '129', '1');


DROP TABLE IF EXISTS `eboard_packages`;
CREATE TABLE `eboard_packages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `days` int(11) NOT NULL,
  `text` varchar(200) NOT NULL,
  `service` int(11) NOT NULL,
  `sort` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

INSERT INTO `eboard_packages`(`id`, `days`, `text`, `service`, `sort`) VALUES ('3', '7', 'Неделя', '4', '1');
INSERT INTO `eboard_packages`(`id`, `days`, `text`, `service`, `sort`) VALUES ('4', '30', 'Месяц', '4', '2');


DROP TABLE IF EXISTS `eboard_pay`;
CREATE TABLE `eboard_pay` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` varchar(100) NOT NULL,
  `user_id` int(11) NOT NULL,
  `time` int(11) NOT NULL,
  `type` varchar(1) NOT NULL,
  `pay` float DEFAULT NULL,
  `rest` float DEFAULT NULL,
  `comments` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

INSERT INTO `eboard_pay`(`id`, `uid`, `user_id`, `time`, `type`, `pay`, `rest`, `comments`) VALUES ('1', '', '1', '1514283389', 'o', '3000', '27000', 'Продление срока публикации магазина');


DROP TABLE IF EXISTS `eboard_payments`;
CREATE TABLE `eboard_payments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `amount` float DEFAULT NULL,
  `currency` varchar(5) NOT NULL,
  `user_id` int(11) NOT NULL,
  `message_id` int(11) NOT NULL,
  `service_type` varchar(1) NOT NULL,
  `time` int(11) NOT NULL,
  `status` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;

INSERT INTO `eboard_payments`(`id`, `amount`, `currency`, `user_id`, `message_id`, `service_type`, `time`, `status`) VALUES ('1', '2900', 'rur', '1', '1', 's', '1514223071', '0');
INSERT INTO `eboard_payments`(`id`, `amount`, `currency`, `user_id`, `message_id`, `service_type`, `time`, `status`) VALUES ('2', '100', 'rur', '7', '0', '', '1518042263', '0');
INSERT INTO `eboard_payments`(`id`, `amount`, `currency`, `user_id`, `message_id`, `service_type`, `time`, `status`) VALUES ('3', '0.5', 'rur', '0', '6', 'm', '1518107348', '0');
INSERT INTO `eboard_payments`(`id`, `amount`, `currency`, `user_id`, `message_id`, `service_type`, `time`, `status`) VALUES ('4', '0.5', 'rur', '0', '6', 'r', '1518107368', '0');
INSERT INTO `eboard_payments`(`id`, `amount`, `currency`, `user_id`, `message_id`, `service_type`, `time`, `status`) VALUES ('5', '7.5', 'rur', '0', '6', 'b', '1518107404', '0');
INSERT INTO `eboard_payments`(`id`, `amount`, `currency`, `user_id`, `message_id`, `service_type`, `time`, `status`) VALUES ('6', '45', 'rur', '0', '104', 'b', '1518232622', '0');
INSERT INTO `eboard_payments`(`id`, `amount`, `currency`, `user_id`, `message_id`, `service_type`, `time`, `status`) VALUES ('7', '10.5', 'rur', '0', '91', 'r', '1518243880', '0');
INSERT INTO `eboard_payments`(`id`, `amount`, `currency`, `user_id`, `message_id`, `service_type`, `time`, `status`) VALUES ('8', '10.5', 'rur', '0', '91', 'r', '1518243936', '0');
INSERT INTO `eboard_payments`(`id`, `amount`, `currency`, `user_id`, `message_id`, `service_type`, `time`, `status`) VALUES ('9', '31.5', 'rur', '0', '71', 'b', '1518244317', '0');
INSERT INTO `eboard_payments`(`id`, `amount`, `currency`, `user_id`, `message_id`, `service_type`, `time`, `status`) VALUES ('10', '3', 'rur', '0', '78', 'r', '1518256721', '0');
INSERT INTO `eboard_payments`(`id`, `amount`, `currency`, `user_id`, `message_id`, `service_type`, `time`, `status`) VALUES ('11', '100', 'rur', '8', '0', '', '1518287628', '0');
INSERT INTO `eboard_payments`(`id`, `amount`, `currency`, `user_id`, `message_id`, `service_type`, `time`, `status`) VALUES ('12', '100', 'rur', '8', '0', '', '1518287672', '0');
INSERT INTO `eboard_payments`(`id`, `amount`, `currency`, `user_id`, `message_id`, `service_type`, `time`, `status`) VALUES ('13', '31.5', 'rur', '0', '143', 'b', '1518295343', '0');
INSERT INTO `eboard_payments`(`id`, `amount`, `currency`, `user_id`, `message_id`, `service_type`, `time`, `status`) VALUES ('14', '10.5', 'rur', '0', '124', 'r', '1518296079', '0');
INSERT INTO `eboard_payments`(`id`, `amount`, `currency`, `user_id`, `message_id`, `service_type`, `time`, `status`) VALUES ('15', '31.5', 'rur', '0', '71', 'b', '1518329725', '0');
INSERT INTO `eboard_payments`(`id`, `amount`, `currency`, `user_id`, `message_id`, `service_type`, `time`, `status`) VALUES ('16', '31.5', 'rur', '0', '42', 'b', '1518633301', '0');
INSERT INTO `eboard_payments`(`id`, `amount`, `currency`, `user_id`, `message_id`, `service_type`, `time`, `status`) VALUES ('17', '31.5', 'rur', '0', '42', 'b', '1518633309', '0');
INSERT INTO `eboard_payments`(`id`, `amount`, `currency`, `user_id`, `message_id`, `service_type`, `time`, `status`) VALUES ('18', '10.5', 'rur', '0', '42', 'r', '1518633392', '0');
INSERT INTO `eboard_payments`(`id`, `amount`, `currency`, `user_id`, `message_id`, `service_type`, `time`, `status`) VALUES ('19', '31.5', 'rur', '0', '42', 'b', '1518633585', '0');
INSERT INTO `eboard_payments`(`id`, `amount`, `currency`, `user_id`, `message_id`, `service_type`, `time`, `status`) VALUES ('20', '10.5', 'rur', '0', '128', 'm', '1518810969', '0');
INSERT INTO `eboard_payments`(`id`, `amount`, `currency`, `user_id`, `message_id`, `service_type`, `time`, `status`) VALUES ('21', '31.5', 'rur', '0', '7', 'b', '1519686615', '0');
INSERT INTO `eboard_payments`(`id`, `amount`, `currency`, `user_id`, `message_id`, `service_type`, `time`, `status`) VALUES ('22', '10.5', 'rur', '0', '124', 'r', '1519720016', '0');
INSERT INTO `eboard_payments`(`id`, `amount`, `currency`, `user_id`, `message_id`, `service_type`, `time`, `status`) VALUES ('23', '10.5', 'rur', '0', '79', 'r', '1519755074', '0');


DROP TABLE IF EXISTS `eboard_rates`;
CREATE TABLE `eboard_rates` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `numcode` int(11) NOT NULL,
  `charcode` varchar(10) NOT NULL,
  `name` varchar(20) NOT NULL,
  `text` varchar(150) NOT NULL,
  `def` int(1) NOT NULL,
  `value` float NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

INSERT INTO `eboard_rates`(`id`, `numcode`, `charcode`, `name`, `text`, `def`, `value`) VALUES ('1', '0', 'rur', 'рубли', 'рубль,рубля,рублей', '1', '1');


DROP TABLE IF EXISTS `eboard_regions`;
CREATE TABLE `eboard_regions` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `uri` varchar(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `parent` int(5) DEFAULT NULL,
  `ipgeo_field` varchar(1) NOT NULL,
  `ipgeo_value` varchar(100) NOT NULL,
  `sort` int(10) NOT NULL DEFAULT '10000000',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=124 DEFAULT CHARSET=utf8;

INSERT INTO `eboard_regions`(`id`, `uri`, `name`, `parent`, `ipgeo_field`, `ipgeo_value`, `sort`) VALUES ('121', 'novotroizk', 'Новотроицк', '0', '', '', '2');
INSERT INTO `eboard_regions`(`id`, `uri`, `name`, `parent`, `ipgeo_field`, `ipgeo_value`, `sort`) VALUES ('122', 'Orenburg', 'Оренбург', '0', '', '', '3');
INSERT INTO `eboard_regions`(`id`, `uri`, `name`, `parent`, `ipgeo_field`, `ipgeo_value`, `sort`) VALUES ('123', 'Gai', 'Гай', '0', '', '', '4');
INSERT INTO `eboard_regions`(`id`, `uri`, `name`, `parent`, `ipgeo_field`, `ipgeo_value`, `sort`) VALUES ('120', 'orsk', 'Орск', '0', '', '', '1');


DROP TABLE IF EXISTS `eboard_seo`;
CREATE TABLE `eboard_seo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `url` varchar(255) NOT NULL,
  `title` text NOT NULL,
  `keywords` text NOT NULL,
  `description` text NOT NULL,
  `type` varchar(1) NOT NULL DEFAULT 'n',
  `redirect_url` varchar(255) NOT NULL,
  `nonstrict` int(1) NOT NULL,
  `sort` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `url` (`url`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS `eboard_services`;
CREATE TABLE `eboard_services` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(1) NOT NULL,
  `price` float DEFAULT NULL,
  `min` int(11) NOT NULL,
  `max` int(11) NOT NULL,
  `name` varchar(200) NOT NULL,
  `field` varchar(100) NOT NULL,
  `tip` varchar(300) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

INSERT INTO `eboard_services`(`id`, `type`, `price`, `min`, `max`, `name`, `field`, `tip`) VALUES ('1', 'm', '1.5', '7', '100', 'Выделение объявления', 'marked', 'Объявление будет выделено цветом');
INSERT INTO `eboard_services`(`id`, `type`, `price`, `min`, `max`, `name`, `field`, `tip`) VALUES ('2', 'r', '1.5', '2', '100', 'Поднятие объявление', 'raised', 'Объявление будет выводится в списке самым первым');
INSERT INTO `eboard_services`(`id`, `type`, `price`, `min`, `max`, `name`, `field`, `tip`) VALUES ('3', 'b', '4.5', '7', '150', 'VIP объявление', 'block', 'Объявление будет отображаться в блоке слева и на страницах соответсвующих рубрик');
INSERT INTO `eboard_services`(`id`, `type`, `price`, `min`, `max`, `name`, `field`, `tip`) VALUES ('4', 'a', '0.25', '3', '1000', 'Публикация объявления', 'active', 'Объявление будет опубликовано в течении заданного срока');


DROP TABLE IF EXISTS `eboard_settings`;
CREATE TABLE `eboard_settings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `k` varchar(100) NOT NULL,
  `v` text,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=147 DEFAULT CHARSET=utf8;

INSERT INTO `eboard_settings`(`id`, `k`, `v`) VALUES ('50', '', '');
INSERT INTO `eboard_settings`(`id`, `k`, `v`) VALUES ('2', 'locale', 'russian');
INSERT INTO `eboard_settings`(`id`, `k`, `v`) VALUES ('3', 'title', 'ОБЪЯВЛЕНИЯ');
INSERT INTO `eboard_settings`(`id`, `k`, `v`) VALUES ('4', 'email', 'developer@itgsystem.ru');
INSERT INTO `eboard_settings`(`id`, `k`, `v`) VALUES ('5', 'autor', '');
INSERT INTO `eboard_settings`(`id`, `k`, `v`) VALUES ('6', 'keywords', '');
INSERT INTO `eboard_settings`(`id`, `k`, `v`) VALUES ('7', 'copyright', '');
INSERT INTO `eboard_settings`(`id`, `k`, `v`) VALUES ('8', 'description', '');
INSERT INTO `eboard_settings`(`id`, `k`, `v`) VALUES ('9', 'onpage', '40');
INSERT INTO `eboard_settings`(`id`, `k`, `v`) VALUES ('10', 'stlb', '2');
INSERT INTO `eboard_settings`(`id`, `k`, `v`) VALUES ('11', 'ind_type', '2');
INSERT INTO `eboard_settings`(`id`, `k`, `v`) VALUES ('12', 'messages_on_ind', '40');
INSERT INTO `eboard_settings`(`id`, `k`, `v`) VALUES ('13', 'raised_on_ind', '1');
INSERT INTO `eboard_settings`(`id`, `k`, `v`) VALUES ('14', 'subscribe', '1');
INSERT INTO `eboard_settings`(`id`, `k`, `v`) VALUES ('15', 'max_subscribe', '3');
INSERT INTO `eboard_settings`(`id`, `k`, `v`) VALUES ('16', 'randtime', '0');
INSERT INTO `eboard_settings`(`id`, `k`, `v`) VALUES ('17', 'max_text', '2000');
INSERT INTO `eboard_settings`(`id`, `k`, `v`) VALUES ('18', 'sendmail_days', '5');
INSERT INTO `eboard_settings`(`id`, `k`, `v`) VALUES ('19', 'del_files', '1');
INSERT INTO `eboard_settings`(`id`, `k`, `v`) VALUES ('20', 'theme', 'aqua');
INSERT INTO `eboard_settings`(`id`, `k`, `v`) VALUES ('21', 'site_address', 'illusionweb.org');
INSERT INTO `eboard_settings`(`id`, `k`, `v`) VALUES ('22', 'patch', '');
INSERT INTO `eboard_settings`(`id`, `k`, `v`) VALUES ('44', 'admin_password', '6f9c6c82f4a5045934ddb8066134f542');
INSERT INTO `eboard_settings`(`id`, `k`, `v`) VALUES ('24', 'charset', 'utf-8');
INSERT INTO `eboard_settings`(`id`, `k`, `v`) VALUES ('25', 'logo', 'logo.png');
INSERT INTO `eboard_settings`(`id`, `k`, `v`) VALUES ('26', 'middle_block', '5');
INSERT INTO `eboard_settings`(`id`, `k`, `v`) VALUES ('27', 'message_block_position', 'lb');
INSERT INTO `eboard_settings`(`id`, `k`, `v`) VALUES ('28', 'rand', 'es48OpNBB9jsS1QtItvWAm9tqruIeuKyrIQFDmFCDNOvK8xsrndUUXLmVuJXMWkcJeeV0brFu47gzm6qL8BOHJffM8Wlq7fblso');
INSERT INTO `eboard_settings`(`id`, `k`, `v`) VALUES ('29', 'default_user_status', '0');
INSERT INTO `eboard_settings`(`id`, `k`, `v`) VALUES ('30', 'default_message_status', '1');
INSERT INTO `eboard_settings`(`id`, `k`, `v`) VALUES ('31', 'default_order_status', '0');
INSERT INTO `eboard_settings`(`id`, `k`, `v`) VALUES ('32', 'captcha', '0');
INSERT INTO `eboard_settings`(`id`, `k`, `v`) VALUES ('33', 'unreg', '1');
INSERT INTO `eboard_settings`(`id`, `k`, `v`) VALUES ('34', 'make_meta', '1');
INSERT INTO `eboard_settings`(`id`, `k`, `v`) VALUES ('35', 'fckeditor', '1');
INSERT INTO `eboard_settings`(`id`, `k`, `v`) VALUES ('36', 'img_big_width', '800');
INSERT INTO `eboard_settings`(`id`, `k`, `v`) VALUES ('37', 'img_big_height', '600');
INSERT INTO `eboard_settings`(`id`, `k`, `v`) VALUES ('38', 'img_small_width', '400');
INSERT INTO `eboard_settings`(`id`, `k`, `v`) VALUES ('39', 'img_small_height', '300');
INSERT INTO `eboard_settings`(`id`, `k`, `v`) VALUES ('40', 'merchant', 'none');
INSERT INTO `eboard_settings`(`id`, `k`, `v`) VALUES ('41', 'mrh_pass1', '');
INSERT INTO `eboard_settings`(`id`, `k`, `v`) VALUES ('42', 'mrh_pass2', '');
INSERT INTO `eboard_settings`(`id`, `k`, `v`) VALUES ('43', 'admin_login', 'ainuradmin');
INSERT INTO `eboard_settings`(`id`, `k`, `v`) VALUES ('45', 'theme_admin', 'aqua');
INSERT INTO `eboard_settings`(`id`, `k`, `v`) VALUES ('46', 'error_reporting', 'E_ALL');
INSERT INTO `eboard_settings`(`id`, `k`, `v`) VALUES ('47', 'caching', '0');
INSERT INTO `eboard_settings`(`id`, `k`, `v`) VALUES ('48', 'deleted_keywords', '');
INSERT INTO `eboard_settings`(`id`, `k`, `v`) VALUES ('49', 'cortime', '0');
INSERT INTO `eboard_settings`(`id`, `k`, `v`) VALUES ('51', 'license_key', '27B3-CD4D-E9CD-677E-65CB BC61-0D0A-4853-DF1C-BC0D 45FF-0963-B798-8DC6-BB19 0275-F227-E096');
INSERT INTO `eboard_settings`(`id`, `k`, `v`) VALUES ('52', 'default_user_balance', '0');
INSERT INTO `eboard_settings`(`id`, `k`, `v`) VALUES ('53', 'spshopid', '');
INSERT INTO `eboard_settings`(`id`, `k`, `v`) VALUES ('54', 'spsecretkey', '');
INSERT INTO `eboard_settings`(`id`, `k`, `v`) VALUES ('55', 'currency', 'rur');
INSERT INTO `eboard_settings`(`id`, `k`, `v`) VALUES ('56', 'block_all', '1');
INSERT INTO `eboard_settings`(`id`, `k`, `v`) VALUES ('57', 'default_block_status', '0');
INSERT INTO `eboard_settings`(`id`, `k`, `v`) VALUES ('58', 'yaapi', '');
INSERT INTO `eboard_settings`(`id`, `k`, `v`) VALUES ('59', 'randtime2', '100');
INSERT INTO `eboard_settings`(`id`, `k`, `v`) VALUES ('60', 'cron_del', '3600');
INSERT INTO `eboard_settings`(`id`, `k`, `v`) VALUES ('61', 'cron_mail', '300');
INSERT INTO `eboard_settings`(`id`, `k`, `v`) VALUES ('62', 'cron_order', '300');
INSERT INTO `eboard_settings`(`id`, `k`, `v`) VALUES ('63', 'orders_fill', 'ON');
INSERT INTO `eboard_settings`(`id`, `k`, `v`) VALUES ('64', 'onpage_users', '20');
INSERT INTO `eboard_settings`(`id`, `k`, `v`) VALUES ('65', 'rand_block', '10');
INSERT INTO `eboard_settings`(`id`, `k`, `v`) VALUES ('66', 'message_block_type', '2');
INSERT INTO `eboard_settings`(`id`, `k`, `v`) VALUES ('67', 'active_service', '0');
INSERT INTO `eboard_settings`(`id`, `k`, `v`) VALUES ('68', 'prevent_indexing_cat', '1');
INSERT INTO `eboard_settings`(`id`, `k`, `v`) VALUES ('69', 'prevent_indexing_region', '0');
INSERT INTO `eboard_settings`(`id`, `k`, `v`) VALUES ('70', 'prevent_indexing_sort', '1');
INSERT INTO `eboard_settings`(`id`, `k`, `v`) VALUES ('71', 'sms_username', 'developer@itgsystem.ru');
INSERT INTO `eboard_settings`(`id`, `k`, `v`) VALUES ('72', 'sms_password', 'v7C9m4R9p5Fb');
INSERT INTO `eboard_settings`(`id`, `k`, `v`) VALUES ('73', 'sms_sender', 'test');
INSERT INTO `eboard_settings`(`id`, `k`, `v`) VALUES ('74', 'sms_text', 'Код подтверждения: %code%');
INSERT INTO `eboard_settings`(`id`, `k`, `v`) VALUES ('75', 'sms', '0');
INSERT INTO `eboard_settings`(`id`, `k`, `v`) VALUES ('76', 'num_limit', '3');
INSERT INTO `eboard_settings`(`id`, `k`, `v`) VALUES ('77', 'num_limit_on', '0');
INSERT INTO `eboard_settings`(`id`, `k`, `v`) VALUES ('78', 'comment_on', '1');
INSERT INTO `eboard_settings`(`id`, `k`, `v`) VALUES ('79', 'comment_unreg', '0');
INSERT INTO `eboard_settings`(`id`, `k`, `v`) VALUES ('80', 'smtp', '0');
INSERT INTO `eboard_settings`(`id`, `k`, `v`) VALUES ('81', 'smtp_from', 'info@illusionweb.ru');
INSERT INTO `eboard_settings`(`id`, `k`, `v`) VALUES ('82', 'smtp_host', 'smtp.gmail.com');
INSERT INTO `eboard_settings`(`id`, `k`, `v`) VALUES ('83', 'smtp_port', '465');
INSERT INTO `eboard_settings`(`id`, `k`, `v`) VALUES ('84', 'smtp_crypt', 'ssl');
INSERT INTO `eboard_settings`(`id`, `k`, `v`) VALUES ('85', 'smtp_login', '');
INSERT INTO `eboard_settings`(`id`, `k`, `v`) VALUES ('86', 'smtp_password', '');
INSERT INTO `eboard_settings`(`id`, `k`, `v`) VALUES ('87', 'smtp_pop', '');
INSERT INTO `eboard_settings`(`id`, `k`, `v`) VALUES ('90', 'post_filter', '');
INSERT INTO `eboard_settings`(`id`, `k`, `v`) VALUES ('88', 'ipgeo', '1');
INSERT INTO `eboard_settings`(`id`, `k`, `v`) VALUES ('89', 'cron_cssjs', '60');
INSERT INTO `eboard_settings`(`id`, `k`, `v`) VALUES ('91', 'login', '');
INSERT INTO `eboard_settings`(`id`, `k`, `v`) VALUES ('92', 'password', '');
INSERT INTO `eboard_settings`(`id`, `k`, `v`) VALUES ('93', 'pay_funct', '0');
INSERT INTO `eboard_settings`(`id`, `k`, `v`) VALUES ('94', 'uploadtype', '1');
INSERT INTO `eboard_settings`(`id`, `k`, `v`) VALUES ('95', 'approve_text', 'НЕ ПРОВЕРЕНО! Это объявление 
ещё не проверено модератором 
сайта. Администрация не 
несет ответственности за 
содержание, достоверность и 
точность материалов, 
опубликованных 
пользователями.');
INSERT INTO `eboard_settings`(`id`, `k`, `v`) VALUES ('96', '160526', '1');
INSERT INTO `eboard_settings`(`id`, `k`, `v`) VALUES ('97', 'closed_info', 'Сайт закрыт на обслуживание. Приносим извинения за временные неудобства!');
INSERT INTO `eboard_settings`(`id`, `k`, `v`) VALUES ('98', 'closed_time', '2018/01/10 10:00:00');
INSERT INTO `eboard_settings`(`id`, `k`, `v`) VALUES ('99', 'captcha_type', '3');
INSERT INTO `eboard_settings`(`id`, `k`, `v`) VALUES ('100', 'captcha_complexity', '4');
INSERT INTO `eboard_settings`(`id`, `k`, `v`) VALUES ('101', 'license_text', 'Все материалы, добавляемые 
на сайт, становятся 
собственностью сайта и 
администрация сайта имеет 
право использовать все 
тексты и медиа материалы в 
своих нуждах. Вся 
ответственность за 
содержание объявлений в 
полном объёме возлагается на 
авторов объявлений. 
Администрация сайта 
оставляет за собой право 
удалять и редактировать 
объявление без уведомления 
автора объявления и без 
объяснения причин.
Вы согласны получать смс и/
или email сообщения от 
администрации сайта. 
Вы подтверждаете свое 
согласие на обработку 
персональных данных: сбор, 
систематизацию, накопление, 
хранение, уточнение 
(обновление, изменение), 
использование, передачу, 
блокирование, обезличивание, 
уничтожение. Срок действия 
Вашего согласия является 
неограниченным.

К публикации запрещается:
- информация, нарушающая 
законы Российской Федерации;
- одинаковые объявления;
- объявления содержащие 
заведомо ложную информацию.');
INSERT INTO `eboard_settings`(`id`, `k`, `v`) VALUES ('102', 'license_tpl', '');
INSERT INTO `eboard_settings`(`id`, `k`, `v`) VALUES ('103', 'cache', '2');
INSERT INTO `eboard_settings`(`id`, `k`, `v`) VALUES ('104', 'memcache_host', '127.0.0.1');
INSERT INTO `eboard_settings`(`id`, `k`, `v`) VALUES ('105', 'memcache_port', '11211');
INSERT INTO `eboard_settings`(`id`, `k`, `v`) VALUES ('106', 'update_days', '1');
INSERT INTO `eboard_settings`(`id`, `k`, `v`) VALUES ('107', 'max_title', '50');
INSERT INTO `eboard_settings`(`id`, `k`, `v`) VALUES ('108', 'ulogin', '1');
INSERT INTO `eboard_settings`(`id`, `k`, `v`) VALUES ('109', 'default_comment_status', '0');
INSERT INTO `eboard_settings`(`id`, `k`, `v`) VALUES ('110', 'cache_region_tree', '0');
INSERT INTO `eboard_settings`(`id`, `k`, `v`) VALUES ('111', 'optimized_query', '0');
INSERT INTO `eboard_settings`(`id`, `k`, `v`) VALUES ('112', 'cache_query', '1');
INSERT INTO `eboard_settings`(`id`, `k`, `v`) VALUES ('113', 'update_allow', '1');
INSERT INTO `eboard_settings`(`id`, `k`, `v`) VALUES ('114', 'email_orders', '1');
INSERT INTO `eboard_settings`(`id`, `k`, `v`) VALUES ('115', 'shop', '1');
INSERT INTO `eboard_settings`(`id`, `k`, `v`) VALUES ('116', 'sharing', '1');
INSERT INTO `eboard_settings`(`id`, `k`, `v`) VALUES ('117', 'closed', '0');
INSERT INTO `eboard_settings`(`id`, `k`, `v`) VALUES ('118', 'importcsv', 'a:8:{s:8:\"def_user\";i:0;s:7:\"def_cat\";i:24;s:10:\"def_region\";i:2;s:3:\"pub\";i:365;s:4:\"html\";i:1;s:2:\"br\";i:1;s:8:\"encoding\";s:6:\"CP1251\";s:3:\"sep\";s:1:\";\";}');
INSERT INTO `eboard_settings`(`id`, `k`, `v`) VALUES ('119', 'indexing', '0');
INSERT INTO `eboard_settings`(`id`, `k`, `v`) VALUES ('120', 'recaptcha1', '6LcdSjsUAAAAABLBtESFsNSIb4zCTMKE37t9E-7t');
INSERT INTO `eboard_settings`(`id`, `k`, `v`) VALUES ('121', 'recaptcha2', '6LcdSjsUAAAAAJuWkXAXbPPaNuf_flSer1nhl5k4');
INSERT INTO `eboard_settings`(`id`, `k`, `v`) VALUES ('122', 'maptype', '0');
INSERT INTO `eboard_settings`(`id`, `k`, `v`) VALUES ('123', 'mapkey', '');
INSERT INTO `eboard_settings`(`id`, `k`, `v`) VALUES ('124', 'license_reg_text', 'Предоставляя свои персональные 
данные пользователь даёт 
согласие на обработку, 
хранение и использование своих 
персональных данных на 
основании ФЗ № 152-ФЗ «О 
персональных данных» от 
27.07.2006 г.');
INSERT INTO `eboard_settings`(`id`, `k`, `v`) VALUES ('125', 'moderation_notifications', '1');
INSERT INTO `eboard_settings`(`id`, `k`, `v`) VALUES ('126', 'cat_type', '2');
INSERT INTO `eboard_settings`(`id`, `k`, `v`) VALUES ('127', 'shop_img_w', '300');
INSERT INTO `eboard_settings`(`id`, `k`, `v`) VALUES ('128', 'shop_img_h', '200');
INSERT INTO `eboard_settings`(`id`, `k`, `v`) VALUES ('129', 'shop_onpage', '50');
INSERT INTO `eboard_settings`(`id`, `k`, `v`) VALUES ('130', 'shop_min_name', '5');
INSERT INTO `eboard_settings`(`id`, `k`, `v`) VALUES ('131', 'shop_max_name', '100');
INSERT INTO `eboard_settings`(`id`, `k`, `v`) VALUES ('132', 'shop_min_description', '200');
INSERT INTO `eboard_settings`(`id`, `k`, `v`) VALUES ('133', 'shop_max_description', '2000');
INSERT INTO `eboard_settings`(`id`, `k`, `v`) VALUES ('134', 'shop_min_addr', '30');
INSERT INTO `eboard_settings`(`id`, `k`, `v`) VALUES ('135', 'shop_max_addr', '100');
INSERT INTO `eboard_settings`(`id`, `k`, `v`) VALUES ('136', 'shop_min_phone1', '5');
INSERT INTO `eboard_settings`(`id`, `k`, `v`) VALUES ('137', 'shop_max_phone1', '20');
INSERT INTO `eboard_settings`(`id`, `k`, `v`) VALUES ('138', 'shop_min_phone2', '0');
INSERT INTO `eboard_settings`(`id`, `k`, `v`) VALUES ('139', 'shop_max_phone2', '0');
INSERT INTO `eboard_settings`(`id`, `k`, `v`) VALUES ('140', 'shop_min_delivery', '0');
INSERT INTO `eboard_settings`(`id`, `k`, `v`) VALUES ('141', 'shop_max_delivery', '0');
INSERT INTO `eboard_settings`(`id`, `k`, `v`) VALUES ('142', 'shop_min_payment', '50');
INSERT INTO `eboard_settings`(`id`, `k`, `v`) VALUES ('143', 'shop_max_payment', '1000');
INSERT INTO `eboard_settings`(`id`, `k`, `v`) VALUES ('144', 'shop_pay', '1');
INSERT INTO `eboard_settings`(`id`, `k`, `v`) VALUES ('145', 'shop_pay_types', 'a:1:{i:1;a:3:{s:4:\"name\";s:10:\"Месяц\";s:4:\"time\";i:2592000;s:5:\"price\";s:4:\"3000\";}}');
INSERT INTO `eboard_settings`(`id`, `k`, `v`) VALUES ('146', 'shop_status', '0');


DROP TABLE IF EXISTS `eboard_smscode`;
CREATE TABLE `eboard_smscode` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `num` varchar(15) NOT NULL,
  `ip` varchar(15) NOT NULL,
  `code` int(4) NOT NULL,
  `status` varchar(10) NOT NULL,
  `time` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

INSERT INTO `eboard_smscode`(`id`, `num`, `ip`, `code`, `status`, `time`) VALUES ('1', '79068441649', '145.255.21.33', '8502', '1', '1514286020');


DROP TABLE IF EXISTS `eboard_subscribe`;
CREATE TABLE `eboard_subscribe` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cat` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

INSERT INTO `eboard_subscribe`(`id`, `cat`, `user_id`) VALUES ('1', '760', '8');
INSERT INTO `eboard_subscribe`(`id`, `cat`, `user_id`) VALUES ('2', '760', '1');


DROP TABLE IF EXISTS `eboard_tags`;
CREATE TABLE `eboard_tags` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `counter` int(11) NOT NULL,
  `word` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS `eboard_timing`;
CREATE TABLE `eboard_timing` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `days` int(11) NOT NULL,
  `text` varchar(1000) NOT NULL,
  `sort` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

INSERT INTO `eboard_timing`(`id`, `days`, `text`, `sort`) VALUES ('9', '365', '1 год', '3');
INSERT INTO `eboard_timing`(`id`, `days`, `text`, `sort`) VALUES ('10', '30', '1 месяц', '2');
INSERT INTO `eboard_timing`(`id`, `days`, `text`, `sort`) VALUES ('11', '7', '1 неделя', '1');


DROP TABLE IF EXISTS `eboard_users`;
CREATE TABLE `eboard_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(100) NOT NULL,
  `pass` varchar(32) NOT NULL,
  `date` int(11) NOT NULL,
  `status` int(3) NOT NULL,
  `email_status` int(1) NOT NULL DEFAULT '0',
  `actions` text NOT NULL,
  `name` varchar(300) NOT NULL,
  `balance` float DEFAULT '0',
  `phone` varchar(15) NOT NULL,
  `identity` varchar(250) NOT NULL,
  `network` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;

INSERT INTO `eboard_users`(`id`, `email`, `pass`, `date`, `status`, `email_status`, `actions`, `name`, `balance`, `phone`, `identity`, `network`) VALUES ('1', 'ainur.karpiev@yandex.ru', 'f518613843ab362802a80fd557484961', '1514220459', '1', '1', '', 'Айнур', '27000', '', 'http://vk.com/id135578257', 'vkontakte');
INSERT INTO `eboard_users`(`id`, `email`, `pass`, `date`, `status`, `email_status`, `actions`, `name`, `balance`, `phone`, `identity`, `network`) VALUES ('7', 'ainur_karpiev@mail.ru', '8cf2ca9cbb299183156f0c221f20fd9d', '1518040769', '1', '1', '', 'Айнур', '0', '', 'https://www.facebook.com/app_scoped_user_id/911851185568906/', 'facebook');
INSERT INTO `eboard_users`(`id`, `email`, `pass`, `date`, `status`, `email_status`, `actions`, `name`, `balance`, `phone`, `identity`, `network`) VALUES ('8', 'developer@itgsystem.ru', 'c19a135c9d2ef812ce93a37d60199ca5', '1518287307', '1', '1', '', 'Ардана', '0', '', 'http://vk.com/id409155368', 'vkontakte');
INSERT INTO `eboard_users`(`id`, `email`, `pass`, `date`, `status`, `email_status`, `actions`, `name`, `balance`, `phone`, `identity`, `network`) VALUES ('27', 'fortuna332222@yandex.ru', 'b684f66be7bb368d70cf0e398944d544', '1519720742', '1', '1', '', 'Алексей Фёдорович', '0', '', '', '');


DROP TABLE IF EXISTS `eboard_users_group`;
CREATE TABLE `eboard_users_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) CHARACTER SET cp1251 NOT NULL,
  `type` varchar(1) CHARACTER SET cp1251 NOT NULL,
  `price` int(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS `eboard_users_shop`;
CREATE TABLE `eboard_users_shop` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL DEFAULT '',
  `description` text NOT NULL,
  `delivery` text NOT NULL,
  `payment` text NOT NULL,
  `phone1` varchar(20) NOT NULL DEFAULT '',
  `phone2` varchar(20) NOT NULL DEFAULT '',
  `addr` varchar(150) NOT NULL DEFAULT '',
  `map` varchar(150) NOT NULL DEFAULT '',
  `region` int(11) NOT NULL DEFAULT '0',
  `cat` int(11) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `status_pay` tinyint(1) NOT NULL DEFAULT '1',
  `next_pay` date NOT NULL DEFAULT '0000-00-00',
  `worktime` text NOT NULL,
  `site` varchar(200) NOT NULL,
  PRIMARY KEY (`id`),
  FULLTEXT KEY `alltext` (`name`,`description`,`delivery`,`payment`,`addr`,`site`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

INSERT INTO `eboard_users_shop`(`id`, `user_id`, `name`, `description`, `delivery`, `payment`, `phone1`, `phone2`, `addr`, `map`, `region`, `cat`, `status`, `status_pay`, `next_pay`, `worktime`, `site`) VALUES ('1', '1', 'ИП Карпиев Айнур Азатович', '<p>It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using &#39;Content here, content here&#39;, making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for &#39;lorem ipsum&#39; will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).</p>', '', '', '', '', '', '', '120', '124', '1', '1', '2018-01-25', '', '');


DROP TABLE IF EXISTS `eboard_version`;
CREATE TABLE `eboard_version` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `module` varchar(30) NOT NULL,
  `version` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

INSERT INTO `eboard_version`(`id`, `module`, `version`) VALUES ('1', '', '2.3');
#---------------------------------------------------------------------------------

