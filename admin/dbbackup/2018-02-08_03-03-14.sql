# Dumped by EliteBoard v2
# Home page: http://illusionweb.ru
#
# MySQL version: (5.5.56-MariaDB) running on 188.120.231.77 (board.ural56.ru)
# Date: 08.02.2018 03:03:14
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
INSERT INTO `eboard_billing`(`id`, `uri`, `status`, `key1`, `key2`, `key3`, `key4`, `key5`, `text1`, `text2`) VALUES ('10', 'robokassa', '0', '', '', '', '', '', '', '');
INSERT INTO `eboard_billing`(`id`, `uri`, `status`, `key1`, `key2`, `key3`, `key4`, `key5`, `text1`, `text2`) VALUES ('11', 'smscoin', '0', '', '', '', '', '', '', '');
INSERT INTO `eboard_billing`(`id`, `uri`, `status`, `key1`, `key2`, `key3`, `key4`, `key5`, `text1`, `text2`) VALUES ('12', 'wm', '0', '', '', '', '', '', '', '');
INSERT INTO `eboard_billing`(`id`, `uri`, `status`, `key1`, `key2`, `key3`, `key4`, `key5`, `text1`, `text2`) VALUES ('13', 'yandex', '0', '', '', '', '', '', '', '');
INSERT INTO `eboard_billing`(`id`, `uri`, `status`, `key1`, `key2`, `key3`, `key4`, `key5`, `text1`, `text2`) VALUES ('14', 'unitpay', '0', '', '', '', '', '', '', '');
INSERT INTO `eboard_billing`(`id`, `uri`, `status`, `key1`, `key2`, `key3`, `key4`, `key5`, `text1`, `text2`) VALUES ('15', 'paypal', '0', '', '', '', '', '', '', '');
INSERT INTO `eboard_billing`(`id`, `uri`, `status`, `key1`, `key2`, `key3`, `key4`, `key5`, `text1`, `text2`) VALUES ('16', 'debug', '0', '', '', '', '', '', '', '');
INSERT INTO `eboard_billing`(`id`, `uri`, `status`, `key1`, `key2`, `key3`, `key4`, `key5`, `text1`, `text2`) VALUES ('17', 'interkassa20', '0', '', '', '', '', '', '', '');


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
) ENGINE=MyISAM AUTO_INCREMENT=38 DEFAULT CHARSET=utf8;

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
INSERT INTO `eboard_blocks_db`(`id`, `name`, `html`, `parent`) VALUES ('36', 'Рекламные блоки', '%block_promo%', 'html');
INSERT INTO `eboard_blocks_db`(`id`, `name`, `html`, `parent`) VALUES ('37', 'Поиск объявлений', '%block_search%', 'html');


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
) ENGINE=MyISAM AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;

INSERT INTO `eboard_blocks_places`(`id`, `place`, `status`, `from`, `to`, `link`, `reg`, `cat`, `region`, `sort`) VALUES ('1', 'r', '1', '0', '0', '7', '1', '0', '0', '1');
INSERT INTO `eboard_blocks_places`(`id`, `place`, `status`, `from`, `to`, `link`, `reg`, `cat`, `region`, `sort`) VALUES ('2', 'r', '0', '0', '0', '9', '1', '0', '0', '3');
INSERT INTO `eboard_blocks_places`(`id`, `place`, `status`, `from`, `to`, `link`, `reg`, `cat`, `region`, `sort`) VALUES ('3', 'r', '0', '0', '0', '10', '1', '0', '0', '4');
INSERT INTO `eboard_blocks_places`(`id`, `place`, `status`, `from`, `to`, `link`, `reg`, `cat`, `region`, `sort`) VALUES ('5', 'r', '1', '0', '0', '4', '1', 'users', '0', '1');
INSERT INTO `eboard_blocks_places`(`id`, `place`, `status`, `from`, `to`, `link`, `reg`, `cat`, `region`, `sort`) VALUES ('20', 'r', '0', '0', '0', '30', '1', '0', '0', '2');
INSERT INTO `eboard_blocks_places`(`id`, `place`, `status`, `from`, `to`, `link`, `reg`, `cat`, `region`, `sort`) VALUES ('24', 'l', '0', '0', '0', '33', '1', '0', '0', '3');
INSERT INTO `eboard_blocks_places`(`id`, `place`, `status`, `from`, `to`, `link`, `reg`, `cat`, `region`, `sort`) VALUES ('25', 'l', '0', '0', '0', '34', '1', '0', '0', '4');
INSERT INTO `eboard_blocks_places`(`id`, `place`, `status`, `from`, `to`, `link`, `reg`, `cat`, `region`, `sort`) VALUES ('27', 'r', '1', '0', '0', '36', '1', '0', '0', '20');
INSERT INTO `eboard_blocks_places`(`id`, `place`, `status`, `from`, `to`, `link`, `reg`, `cat`, `region`, `sort`) VALUES ('28', 'l', '0', '0', '0', '37', '1', '0', '0', '2');


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
INSERT INTO `eboard_cat`(`id`, `uri`, `name`, `img`, `parent`, `sort`, `description`) VALUES ('764', '5-kv', '5+ ком квартира', '', '769', '6', '');
INSERT INTO `eboard_cat`(`id`, `uri`, `name`, `img`, `parent`, `sort`, `description`) VALUES ('763', '4-kv', '4-ком квартира', '', '769', '5', '');
INSERT INTO `eboard_cat`(`id`, `uri`, `name`, `img`, `parent`, `sort`, `description`) VALUES ('767', 'jilaya-arenda', 'Жилая аренда', '', '769', '13', '');
INSERT INTO `eboard_cat`(`id`, `uri`, `name`, `img`, `parent`, `sort`, `description`) VALUES ('766', 'Sad', 'Сад', '', '769', '8', '');
INSERT INTO `eboard_cat`(`id`, `uri`, `name`, `img`, `parent`, `sort`, `description`) VALUES ('769', 'Vsya-nedvizhimost', 'Вся недвижимость', '', '0', '0', '');
INSERT INTO `eboard_cat`(`id`, `uri`, `name`, `img`, `parent`, `sort`, `description`) VALUES ('768', 'Prodaja', 'Продажа помещений', '', '769', '14', '');
INSERT INTO `eboard_cat`(`id`, `uri`, `name`, `img`, `parent`, `sort`, `description`) VALUES ('761', '2-kv', '2-ком квартира', '', '769', '3', '');
INSERT INTO `eboard_cat`(`id`, `uri`, `name`, `img`, `parent`, `sort`, `description`) VALUES ('760', '1-kv', '1-ком квартира', '', '769', '2', '');
INSERT INTO `eboard_cat`(`id`, `uri`, `name`, `img`, `parent`, `sort`, `description`) VALUES ('179', 'Garazhi-i-mashinomesta', 'Гараж', '', '769', '10', '');
INSERT INTO `eboard_cat`(`id`, `uri`, `name`, `img`, `parent`, `sort`, `description`) VALUES ('762', '3-kv', '3-ком квартира', '', '769', '4', '');
INSERT INTO `eboard_cat`(`id`, `uri`, `name`, `img`, `parent`, `sort`, `description`) VALUES ('178', 'Doma', 'Дом', '', '769', '7', '');
INSERT INTO `eboard_cat`(`id`, `uri`, `name`, `img`, `parent`, `sort`, `description`) VALUES ('177', 'Zemelnye-uchastki', 'Земельный участок', '', '769', '9', '');
INSERT INTO `eboard_cat`(`id`, `uri`, `name`, `img`, `parent`, `sort`, `description`) VALUES ('176', 'Kommercheskaya-nedvizhimost', 'Коммерческая аренда', '', '769', '12', '');
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

INSERT INTO `eboard_counter_ip`(`id`, `ip`, `forvard`, `referer`, `time`, `page_id`) VALUES ('1', '94.41.138.100', '', '', '', '');


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

INSERT INTO `eboard_counter_vars`(`id`, `var`, `value`) VALUES ('1', 'hits_all', '972');
INSERT INTO `eboard_counter_vars`(`id`, `var`, `value`) VALUES ('2', 'hosts_all', '125');
INSERT INTO `eboard_counter_vars`(`id`, `var`, `value`) VALUES ('3', 'day', '08022018');
INSERT INTO `eboard_counter_vars`(`id`, `var`, `value`) VALUES ('4', 'hits_today', '53');


DROP TABLE IF EXISTS `eboard_cron`;
CREATE TABLE `eboard_cron` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(10) NOT NULL,
  `period` int(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

INSERT INTO `eboard_cron`(`id`, `name`, `period`) VALUES ('1', 'cron_del', '1518039113');
INSERT INTO `eboard_cron`(`id`, `name`, `period`) VALUES ('2', 'cron_mail', '1518040526');
INSERT INTO `eboard_cron`(`id`, `name`, `period`) VALUES ('3', 'cron_order', '1518040526');
INSERT INTO `eboard_cron`(`id`, `name`, `period`) VALUES ('12', 'cron_cssjs', '1518040734');
INSERT INTO `eboard_cron`(`id`, `name`, `period`) VALUES ('13', 'cron_upd', '1518040653');


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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



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
) ENGINE=MyISAM AUTO_INCREMENT=493 DEFAULT CHARSET=utf8;

INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('72', '228', 'Модель', '', 'Arnage
Azure
Brooklands
Continental
Continental Flying Spur
Continental GT
Continental GTC
Continental Supersports
Mulsanne
Turbo R
Другая', '100', 's', '', '1', '0', '1', '8');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('79', '235', 'Модель', '', 'Allante
ATS
BLS
Brougham
Catera
CTS
CTS-V
DE Ville
DTS
Eldorado
Escalade
Evoq
Fleetwood
LSE
Seville
SRX
STS
Victoria
XLR
Другая', '100', 's', '', '1', '0', '1', '7');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('78', '234', 'Модель', '', 'ET
F0
F2
F3
F6
Flyer
S8
Другая', '100', 's', '', '1', '0', '1', '6');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('77', '233', 'Модель', '', 'Allure
Century
Electra
Enclave
Excelle
GL8
HRV
LaCrosse
LeSabre
Lucerne
Park Avenue
Rainer
Reatta
Regal
Rendezvous
Riviera
Roadmaster
Royaum
Sedan
Skylark
Terraza
Другая', '100', 's', '', '1', '0', '1', '5');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('76', '232', 'Модель', '', 'EB
Galibier
Veyron
Другая', '100', 's', '', '1', '0', '1', '4');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('75', '231', 'Модель', '', 'La Joya
Другая', '100', 's', '', '1', '0', '1', '3');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('74', '230', 'Модель', '', 'A1
BS2
BS4
BS6
H530
M1
M2
M3
V5
Другая', '100', 's', '', '1', '0', '1', '2');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('73', '229', 'Модель', '', '1
2
3
3 GT
4
5
5 GT
6
7
8
ActiveHybrid 7
i8
M3
M5
M6
X1
X3
X4
X5
X5M
X6
X6M
Z1
Z3
Z3M
Z4
Z4M
Z8
Другая', '100', 's', '', '1', '0', '1', '1');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('41', '564', 'Тип товара', '', 'Пылесосы
Стиральные машины
Утюги
Швейные машины', '100', 's', '', '1', '0', '1', '9');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('42', '188', 'Вид товара', '', 'Компьютерные столы и кресла
Кровати, диваны и кресла
Кухонные гарнитуры
Освещение
Подставки и тумбы
Предметы интерьера, 
искусство
Столы и стулья
Текстиль и ковры
Шкафы и комоды
Другое', '100', 's', '', '1', '0', '1', '10');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('43', '191', 'Вид товара', '', 'Посуда
Товары для кухни', '100', 's', '', '1', '0', '1', '11');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('61', '565', 'Тип товара', '', 'Бритвы и триммеры
Машинки для стрижки
Фены и приборы для укладки
Эпиляторы', '100', 's', '', '1', '0', '1', '12');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('62', '566', 'Тип товара', '', 'Вытяжки
Мелкая кухонная техника
Микроволновые печи
Плиты
Посудомоечные машины
Холодильники и морозильные камеры', '100', 's', '', '1', '0', '1', '13');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('45', '540', 'Предмет одежды', '', 'Брюки
Верхняя одежда
Джинсы
Купальники
Нижнее бельё
Пиджаки и костюмы
Платья и юбки
Рубашки и блузки
Свадебные платья
Топы и футболки
Трикотаж
Другое', '100', 's', '', '1', '0', '1', '14');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('46', '541', 'Предмет одежды', '', 'Брюки
Верхняя одежда
Джинсы
Пиджаки и костюмы
Рубашки
Трикотаж и футболки
Другое', '100', 's', '', '1', '0', '1', '15');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('366', '540', 'Размер', '', '40–42 (XS)
42–44 (S)
44–46 (M)
46–48 (L)
48–50 (XL)
&gt; 50 (XXL)
Без размера', '100', 's', '', '1', '0', '1', '16');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('367', '541', 'Размер', '', '44–46 (S)
46–48 (M)
48–50 (L)
50–52 (XL)
52–54 (XXL)
&gt; 54 (XXXL)
Без размера', '100', 's', '', '1', '0', '1', '17');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('370', '732', 'Предмет одежды', '', 'Брюки
Верхняя одежда
Комбинезоны и боди
Пижамы
Трикотаж
Шапки, варежки, шарфы
Другое', '100', 's', '', '1', '0', '1', '18');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('50', '183', 'Вид товара', '', 'Автомобильные кресла
Велосипеды и самокаты
Детская мебель
Детские коляски
Игрушки
Постельные принадлежности
Товары для кормления
Товары для купания
Товары для школы', '100', 's', '', '1', '0', '1', '19');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('51', '185', 'Вид товара', '', 'Бижутерия
Часы
Ювелирные изделия', '100', 's', '', '1', '0', '1', '20');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('52', '184', 'Вид товара', '', 'Косметика
Парфюмерия
Приборы и аксессуары
Средства гигиены
Средства для волос
Средства для похудения', '100', 's', '', '1', '0', '1', '21');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('53', '196', 'Вид товара', '', 'MP3-плееры
Акустика, колонки, сабвуферы
Видео, DVD и Blu-ray плееры
Видеокамеры
Кабели и адаптеры
Микрофоны
Музыка и фильмы
Музыкальные центры, 
магнитолы
Наушники
Телевизоры и проекторы
Усилители и ресиверы
Аксессуары', '100', 's', '', '1', '0', '1', '22');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('54', '199', 'Вид товара', '', 'Игры для приставок
Игровые приставки
Компьютерные игры
Программы', '100', 's', '', '1', '0', '1', '23');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('55', '617', 'Вид товара', '', 'Блоки питания и батареи
Болванки
Бумага
Кабели и адаптеры
Картриджи', '100', 's', '', '1', '0', '1', '24');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('56', '643', 'Вид товара', '', 'Аккумуляторы
Гарнитуры и наушники
Зарядные устройства
Кабели и адаптеры
Модемы и роутеры
Запчасти
Чехлы и плёнки', '100', 's', '', '1', '0', '1', '25');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('57', '651', 'Тип товара', '', 'CD, DVD и Blu-ray приводы
Блоки питания
Видеокарты
Жёсткие диски
Звуковые карты
Контроллеры
Корпусы
Материнские платы
Оперативная память
Процессоры
Системы охлаждения', '100', 's', '', '1', '0', '1', '26');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('58', '198', 'Вид товара', '', 'Компактные фотоаппараты
Зеркальные фотоаппараты
Плёночные фотоаппараты
Бинокли и телескопы
Объективы
Оборудование и аксессуары', '100', 's', '', '1', '0', '1', '27');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('59', '219', 'Модель', '', 'Ace
Aceca
Cobra
Другая', '100', 's', '', '1', '0', '1', '28');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('60', '189', 'Вид товара', '', 'Двери
Инструменты
Камины и обогреватели
Окна и балконы
Потолки
Садовая техника
Сантехника и сауна
Стройматериалы', '100', 's', '', '1', '0', '1', '29');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('63', '567', 'Тип товара', '', 'Вентиляторы
Кондиционеры
Обогреватели
Очистители воздуха
Термометры и метеостанции', '100', 's', '', '1', '0', '1', '30');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('64', '220', 'Модель', '', 'CL
CSX
EL
Integra
MDX
NSX
RDX
RL
RSX
SLX
TL
TLX
TSX
ZDX
Другая', '100', 's', '', '1', '0', '1', '31');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('65', '221', 'Модель', '', '145
146
147
155
156
159
164
166
33
4C
75
8C
90
Arna
Brera
Giulietta
GT
GTV
MiTo
RZ
Spider
SZ
Другая', '100', 's', '', '1', '0', '1', '32');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('66', '222', 'Модель', '', 'A1
A2
A4
B10
B11
B12
B3
B5
B6
B7
B8
B9
C1
C2
D10
D3
D5
XD3
Другая', '100', 's', '', '1', '0', '1', '33');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('67', '223', 'Модель', '', '10
24
Spartana
Другая', '100', 's', '', '1', '0', '1', '34');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('68', '224', 'Модель', '', 'Hi-topic
Retona
Rocstra
Другая', '100', 's', '', '1', '0', '1', '35');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('69', '225', 'Модель', '', 'Cygnet
DB7
DB9
DBS
Lagonda
One-77
Rapide
Rapide S
V12 Vantage
V12 Vantage S
V8 Vantage
V8 Vantage S
Vanquish
Virage
Другая', '100', 's', '', '1', '0', '1', '36');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('70', '226', 'Модель', '', '100
200
50
60
80
90
A1
A2
A3
A4
A5
A6
A7
A8
Allroad
Cabriolet
Coupe
Q3
Q5
Q7
Quattro
R8
RS1
RS2
RS3
RS4
RS5
RS6
RS7
RS8
RS Q3
S1
S2
S3
S4
S5
S6
S7
S8
SQ5
TT
TT RS
TTS
V8
Другая', '100', 's', '', '1', '0', '1', '37');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('71', '227', 'Модель', '', 'Fenix
Tonik
Другая', '100', 's', '', '1', '0', '1', '38');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('80', '236', 'Модель', '', 'Academy
Classic
Roadsport
Superlight
Другая', '100', 's', '', '1', '0', '1', '39');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('81', '237', 'Модель', '', 'CS35
Eado
Raeton
SM-8
Z-Chine
Другая', '100', 's', '', '1', '0', '1', '40');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('82', '238', 'Модель', '', 'Flying PickUp
Flying SUV
Другая', '100', 's', '', '1', '0', '1', '41');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('83', '239', 'Модель', '', 'A3
A5
Amulet
Arizzo 3
Arizzo 7
Bonus
Bonus 3
CrossEastar
Fora
Indis
Kimo
M11
Oriental Son
QQ
QQ6
Tiggo
Tiggo 5
Very
Другая', '100', 's', '', '1', '0', '1', '42');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('84', '240', 'Модель', '', 'Alero
Astra
Astro
Avalanche
Aveo
Bel Air
Beretta
Blazer
C10
Camaro
Caprice
Captiva
Cavalier
Celebrity
Celta
Chevette
Classic
Cobalt
Colorado
Corsa
Corsica
Corvette
Cruze
Epica
Equinox
Evanda
Express
Geo Storm
HHR
Impala
Lacetti
Lanos
Lumina
LUV D-MAX
Malibu
Metro
Monte Carlo
Monza
MW
Niva
Nubira
Omega
Orlando
Prizm
Rezzo
S10
Sail
Silverado
Sonic
Spark
SSR
Starcraft
Suburban
Tahoe
Tavera
Tracker
TrailBlazer
Trans Sport
Traverse
Uplander
Van
Vectra
Venture
Viva
Volt
Zafira
Другая', '100', 's', '', '1', '0', '1', '43');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('85', '241', 'Модель', '', '200
300C
300M
Aspen
Cirrus
Concorde
Crossfire
Daytona Shelby
Dynasty
Fifth Avenue
Grand Voyager
Imperial
Intrepid
LeBaron
LHS
Nassau
Neon
New Yorker
Pacifica
Prowler
PT Cruiser
Saratoga
Sebring
Stratus
Town &amp;amp; Country
Viper
Vision
Voyager
Другая', '100', 's', '', '1', '0', '1', '44');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('86', '242', 'Модель', '', '2 CV
Acadiane
Ami
AX
Berlingo
BX
C1
C15
C2
C25
C3
C35
C3 Picasso
C4
C4 Aircross
C4 Picasso
C5
C6
C8
C-Crosser
C-Elysee
CX
C-Zero
DS2
DS3
DS4
DS5
DS9
Dyane
Evasion
Express
FAF
Grand C4 Picasso
GS
GSA
GT
Jumper
Jumpy
LN
LNA
Mehari
Nemo
Saxo
Synergie
Visa
Xantia
XM
Xsara
Xsara Picasso
ZX
Другая', '100', 's', '', '1', '0', '1', '45');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('87', '243', 'Модель', '', '1304
1310
1325
1410
Dokker
Duster
Lodgy
Logan
Nova
Sandero
Другая', '100', 's', '', '1', '0', '1', '46');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('88', '244', 'Модель', '', 'City Leading
Shuttle
Smoothing
Другая', '100', 's', '', '1', '0', '1', '47');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('89', '245', 'Модель', '', 'Arcadia
Brougham
Charman
Damas
Espero
Evanda
G2X
Gentra
Istana
Kalos
Korando
Labo
Lacetti
Lanos
Leganza
LeMans
Magnus
Matiz
Musso
Nexia
Nubira
Prince
Racer
Rezzo
Sens
Statesman
Super Salon
Tacuma
Tico
Tosca
Winstorm
Другая', '100', 's', '', '1', '0', '1', '48');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('90', '246', 'Модель', '', 'Altis
Applause
Atrai
Be-go
Boon
Ceria
Charade
Charmant
Coo
Copen
Cuore
Delta
Esse
Feroza
Hijet
Leeza
Materia
MAX
Mira
Move
Naked
Opti
Perodua Viva
Pyzar
Rocky
Sirion
Sonica
Storia
Taft
Tanto
Terios
Trevis
Wildcat
Xenia
YRV
Другая', '100', 's', '', '1', '0', '1', '49');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('91', '247', 'Модель', '', 'Coupe
Landaulette
Limousine
Super Eight
XJ
Другая', '100', 's', '', '1', '0', '1', '50');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('92', '248', 'Модель', '', 'mi-DO
on-DO
Другая', '100', 's', '', '1', '0', '1', '51');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('93', '249', 'Модель', '', 'Antelope
Aurora
Cowboy
Land Crown
Plutus
Saladin
Shuttle
Другая', '100', 's', '', '1', '0', '1', '52');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('94', '250', 'Модель', '', 'Avenger
Caliber
Caravan
Challenger
Charger
Dakota
Daytona
Durango
Dynasty
Grand Caravan
Intrepid
Journey
Magnum
Monaco
Neon
Nitro
Ram
Shadow
Spirit
Stealth
Stratus
Viper
Другая', '100', 's', '', '1', '0', '1', '53');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('95', '251', 'Модель', '', 'EQ 1030
H30 Cross
MPV
Oting
Rich
S30
ZND
Другая', '100', 's', '', '1', '0', '1', '54');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('96', '252', 'Модель', '', 'EQ 1030
H30 Cross
MPV
Oting
Rich
S30
ZND
Другая', '100', 's', '', '1', '0', '1', '55');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('97', '253', 'Модель', '', 'Premier
SS
Summit
Talon
Vision
Другая', '100', 's', '', '1', '0', '1', '56');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('98', '254', 'Модель', '', 'Estrima Biro
Другая', '100', 's', '', '1', '0', '1', '57');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('99', '255', 'Модель', '', 'Admiral
Besturn
Besturn B50
Besturn B70
Bora
City Golf
Jetta
Jinn
Landmark
V2
V5
Vela
Vita
Vizi
Другая', '100', 's', '', '1', '0', '1', '58');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('100', '256', 'Модель', '', '208
308
328
348
355
360 Modena
360 Spider
412
430
456 GT
458 Italia
458 Spider
512
550 Barchetta
550 Maranello
575 Maranello
599 GTB Fiorano
612 Scaglietti
California
Dino
Enzo
F12 berlinetta
F355
F40
F430
F430 Scuderia
F430 Spider
F50
FF
FXX
Mondial
Testarossa
Другая', '100', 's', '', '1', '0', '1', '59');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('101', '257', 'Модель', '', '124
126
127
131
500
600
Albea
Barchetta
Brava
Bravo
Cinquecento
Coupe
Croma
Doblo
Ducato
Duna
Fiorino
Freemont
Idea
Linea
Marea
Multipla
New 500
Palio
Panda
Punto
Regata
Ritmo
Scudo
Sedici
Seicento
Siena
Stilo
Strada
Tempra
Tipo
Ulysse
Uno
X1/9
Другая', '100', 's', '', '1', '0', '1', '60');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('102', '258', 'Модель', '', 'Aerostar
Aspire
Bronco
Capri
C-MAX
Consul
Contour
Cougar
Courier
Crown Victoria
Econoline
Econovan
EcoSport
Edge
Escape
Escort
Everest
Excursion
Expedition
Explorer
F150
F250
F350
Festiva
Fiesta
Five Hundred
Flex
Focus
Focus RS
Focus ST
Freestar
Freestyle
Fusion
Fusion Hybrid
Galaxy
Granada
Grand C-MAX
GT
Ka
Kuga
Laser
Maverick
Mondeo
Mustang
Orion
Probe
Puma
Ranger
Scorpio
Shelby
Sierra
S-MAX
Taunus
Taurus
Tempo
Thunderbird
Tourneo
Tourneo Connect
Transit
Windstar
Другая', '100', 's', '', '1', '0', '1', '61');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('103', '259', 'Модель', '', 'CK
Emgrand
Emgrand X7
GC6
Merrie
MK
MK Cross
Otaka
Vision
Другая', '100', 's', '', '1', '0', '1', '62');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('104', '260', 'Модель', '', 'Metro
Prizm
Spectrum
Storm
Tracker
Другая', '100', 's', '', '1', '0', '1', '63');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('105', '261', 'Модель', '', 'Acadia
Aventra
Berlina
Calais
Canyon
Caprice
Commodore
Cruze
Envoy
Jimmy
Safari
Savana
Sierra
Statesman
Suburban
Typhoon
Vandura
Yukon
Другая', '100', 's', '', '1', '0', '1', '64');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('106', '262', 'Модель', '', 'Coolbear
Cowry
Deer
Florid
Hover
Pegasus
Peri
Safe
Sailor
Sokol
Wingle
Другая', '100', 's', '', '1', '0', '1', '65');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('107', '263', 'Модель', '', 'Brio
Princip
Saibao
Sigma
Simbo
Другая', '100', 's', '', '1', '0', '1', '66');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('108', '264', 'Модель', '', '2
3
7
Другая', '100', 's', '', '1', '0', '1', '67');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('109', '265', 'Модель', '', 'H1
H2
H6
H7
H8
H9
Другая', '100', 's', '', '1', '0', '1', '68');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('110', '266', 'Модель', '', 'Boliger
Другая', '100', 's', '', '1', '0', '1', '69');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('111', '267', 'Модель', '', 'Accord
Airwave
Ascot
Avancier
Beat
Capa
City
Civic
Concerto
Crossroad
Crosstour
CR-V
CRX
CR-Z
Domani
Edix
Element
Elysion
FCX Clarity
Fit
Fit Aria
FR-V
HR-V
Insight
Inspire
Integra
Jazz
Lagreat
Legend
Life
Logo
MDX
Mobilio
NSX
Odyssey
Orthia
Partner
Passport
Pilot
Prelude
Quintet
Rafaga
Ridgeline
S2000
Saber
Shuttle
SM-X
Stepwgn
Stream
That S
Today
Torneo
Vamos
Vigor
Z
Zest
Другая', '100', 's', '', '1', '0', '1', '70');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('112', '268', 'Модель', '', 'Antelope
Landscape
Major
Plutus
Другая', '100', 's', '', '1', '0', '1', '71');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('113', '269', 'Модель', '', 'H1
H2
H3
Другая', '100', 's', '', '1', '0', '1', '72');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('114', '270', 'Модель', '', 'Albaycin
Grand Albaycin
Другая', '100', 's', '', '1', '0', '1', '73');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('115', '271', 'Модель', '', 'Accent
Atos
Avante
Centennial
Coupe
Dynasty
Elantra
Equus
Excel
Galloper
Genesis
Getz
Grandeur
H-1 (Grand Starex)
i10
i20
i30
i40
ix20
ix35
ix55
Lantra
Lavita
Marcia
Matrix
NF
Pony
Porter
Santa Fe
Santamo
S-Coupe
Solaris
Sonata
Starex
Stellar
Terracan
Tiburon
Trajet
Tucson
Tuscani
Veloster
Veracruz
Verna
XG
Другая', '100', 's', '', '1', '0', '1', '74');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('116', '272', 'Модель', '', 'EX25
EX35
EX37
FX30
FX35
FX37
FX45
FX50
FX56
G20
G25
G35
G37
I30
I35
J30
JX
M25
M30
M35
M37
M45
M56
Q45
Q50
Q60
Q70
QX4
QX50
QX56
QX60
QX70
QX80
Другая', '100', 's', '', '1', '0', '1', '75');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('117', '273', 'Модель', '', 'Pars
Samand
Soren
Другая', '100', 's', '', '1', '0', '1', '76');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('118', '274', 'Модель', '', 'Amigo
Ascender
Aska
Axiom
Bighorn
Campo
D-Max
Faster
Filly
Gemini
Giga
I-Mark
Impulse
MU
Piazza
Rodeo
Trooper
Vehi Cross
Wizard
Другая', '100', 's', '', '1', '0', '1', '77');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('119', '275', 'Модель', '', 'Daily
Другая', '100', 's', '', '1', '0', '1', '78');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('120', '276', 'Модель', '', 'Refine
Rein
Другая', '100', 's', '', '1', '0', '1', '79');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('121', '277', 'Модель', '', 'E-type
F-Type
S-type
XF
XFR
XJ
XJ220
XJR
XJS
XK
XKR
XKR-S
X-type
Другая', '100', 's', '', '1', '0', '1', '80');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('122', '278', 'Модель', '', 'Cherokee
Commander
Compass
Grand Cherokee
Liberty
Patriot
Wrangler
Другая', '100', 's', '', '1', '0', '1', '81');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('123', '279', 'Модель', '', 'Haise
Другая', '100', 's', '', '1', '0', '1', '82');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('124', '280', 'Модель', '', 'Baodian
Другая', '100', 's', '', '1', '0', '1', '83');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('125', '281', 'Модель', '', 'Avella
Besta
Cadenza
Capital
Carens
Carnival
cee\\\'d
Cerato
Clarus
Concord
Cosmos
Elan
Enterprise
GrandBird
Joice
K
Magentis
Mohave
Opirus
Optima
Picanto
Potentia
Pregio
Pride
Quoris
Retona
Rio
Sedona
Sephia
Shuma
Sorento
Soul
Spectra
Sportage
Venga
Visto
X-Trek
Другая', '100', 's', '', '1', '0', '1', '84');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('126', '282', 'Модель', '', 'Aventador
Countach
Diablo
Espada
Gallardo
Jalpa
LM002
Murcielago
Reventon
Другая', '100', 's', '', '1', '0', '1', '85');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('127', '283', 'Модель', '', 'Dedra
Delta
Fulvia
Kappa
Lybra
Musa
Phedra
Prisma
Thema
Thesis
Trevi
Ypsilon
Zeta
Другая', '100', 's', '', '1', '0', '1', '86');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('128', '284', 'Модель', '', 'Defender
Discovery
Freelander
Range Rover
Range Rover Evoque
Range Rover Sport
Series I
Другая', '100', 's', '', '1', '0', '1', '87');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('129', '285', 'Модель', '', 'SUV
X6
Другая', '100', 's', '', '1', '0', '1', '88');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('130', '286', 'Модель', '', 'Maxus
Другая', '100', 's', '', '1', '0', '1', '89');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('131', '287', 'Модель', '', 'CT
ES
GS
GX
HS
IS
IS F
LFA
LS
LX
NX
RX
SC
Другая', '100', 's', '', '1', '0', '1', '90');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('132', '405', 'Модель', '', 'Aviator
Blackwood
Continental
LS
Mark
Mark LT
MKX
MKZ
Navigator
Town Car
Zephyr
Другая', '100', 's', '', '1', '0', '1', '91');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('133', '290', 'Модель', '', 'Eclat
Elan
Elise
Elise S
Elite
Esprit
Europa
Evora
Evora S
Excel
Exige
Exige S
Другая', '100', 's', '', '1', '0', '1', '92');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('134', '291', 'Модель', '', '5 Sedan
7 MPV
7 SUV
Другая', '100', 's', '', '1', '0', '1', '93');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('135', '292', 'Модель', '', 'Armada
CJ
Commander
Marshal
Другая', '100', 's', '', '1', '0', '1', '94');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('136', '293', 'Модель', '', 'B1
B2
Другая', '100', 's', '', '1', '0', '1', '95');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('137', '294', 'Модель', '', '228
3200 GT
4300 GT Coupe
Barchetta Stradale
Biturbo
Bora
Chubasco
Coupe
Ghibli
GranCabrio
GranSport
GranTurismo
Indy
Karif
Khamsin
Kyalami
MC12
Merak
Mexico
Quattroporte
Royale
Shamal
Spyder
Другая', '100', 's', '', '1', '0', '1', '96');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('138', '295', 'Модель', '', '57
57S
62
62S
Другая', '100', 'v', '', '1', '0', '1', '97');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('139', '296', 'Модель', '', '1000
121
1300
2
3
323
3 MPS
5
6
616
626
6 MPS
818
929
Atenza
Axela
AZ-Wagon
Biante
Bongo
B-Series
BT-50
Business
Capella
Carol
Clef
Cronos
CX-5
CX-7
CX-9
Demio
Efini
Eunos
Eunos Cosmo
Familia
Lantis
Laputa
Levante
Luce
Millenia
MPV
MX-3
MX-5
MX-6
Navajo
Premacy
Proceed
Protege
Revue
Roadster
Rustler
RX-7
RX-8
Scrum
Sentia
Spiano
Tribute
Vantrend
Verisa
Xedos 6
Xedos 9
Другая', '100', 's', '', '1', '0', '1', '98');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('140', '297', 'Модель', '', 'A-класс
A-класс AMG
B-класс
Citan
CLA-класс
CLA-класс AMG
CLC-класс
CLK-класс
CLR-класс
CLS-класс
CLS-класс AMG
CL-класс
CL-класс AMG
C-класс
C-класс AMG
E-класс
E-класс AMG
GLA-класс
GLK-класс
GL-класс
GL-класс AMG
G-класс
G-класс AMG
ML-класс AMG
M-класс
Pullman
R-класс
R-класс AMG
SLK-класс
SLK-класс AMG
SLR McLaren
SLS-класс
SLS-класс AMG
SL-класс
SL-класс AMG
Sprinter
Sprinter Classic
S-класс
S-класс AMG
Vaneo
Vario
Viano
Vito
V-класс
W123
W124
Другая', '100', 's', '', '1', '0', '1', '99');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('141', '298', 'Модель', '', 'Capri
Cougar
Grand Marquis
Marauder
Mariner
Marquis
Milan
Montego
Monterey
Mountaineer
Mystique
Sable
Topaz
Tracer
Villager
Другая', '100', 's', '', '1', '0', '1', '100');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('142', '299', 'Модель', '', 'Taxi
Другая', '100', 's', '', '1', '0', '1', '101');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('143', '300', 'Модель', '', 'F
TF
XPower SV
ZR
ZS
ZT
Другая', '100', 's', '', '1', '0', '1', '102');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('144', '301', 'Модель', '', 'Cooper
Cooper Clubman
Cooper Clubvan
Cooper Countryman
Cooper Paceman
Cooper S
Cooper S Clubman
Cooper S Countryman
Cooper S Paceman
John Cooper Works
John Cooper Works Clubman
John Cooper Works Countryman
John Cooper Works Paceman
One
One Clubman
One Clubvan
One Countryman
Другая', '100', 's', '', '1', '0', '1', '103');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('145', '302', 'Модель', '', '3000 GT
Airtrek
Aspire
ASX
Carisma
Celeste
Challenger
Chariot
Colt
Cordia
Debonair
Delica
Diamante
Dingo
Dion
Eclipse
EK Wagon
Emeraude
Endeavor
Eterna
Expo LRV
FTO
Fuso Canter
Galant
Grandis
GTO
i-MiEV
Jeep
L200
Lancer
Lancer Evolution
Legnum
Libero
Minica
Mirage
Montero
Outlander
Pajero
Pajero Mini
Pajero Sport
Pistachio
Proudia
Raider
RVR
Santamo
Sapporo
Sigma
Space Gear
Space Runner
Space Star
Space Wagon
Starion
Toppo
Town BOX
Tredia
Другая', '100', 's', '', '1', '0', '1', '104');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('146', '303', 'Модель', '', 'Galue
Le-Seyde
Nouera
Ryoga
Другая', '100', 's', '', '1', '0', '1', '105');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('147', '304', 'Модель', '', 'Aero
Plus 4
Plus 8
V6
Другая', '100', 's', '', '1', '0', '1', '106');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('148', '305', 'Модель', '', 'Marina
Другая', '100', 's', '', '1', '0', '1', '107');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('149', '306', 'Модель', '', '100NX
180SX
200SX
240SX
280 ZX
300ZX
350Z
370Z
AD
Almera
Almera Classic
Altima
Armada
Avenir
Bassara
Bluebird
Cedric
Cefiro
Cherry
Cima
Clipper
Crew
Cube
Datsun
Elgrand
Expert
Fairlady
Figaro
Frontier
Fuga
Gloria
GT-R
Juke
King Cab
Kix
Lafesta
Langley
Largo
Laurel
Leaf
Leopard
Liberty
Lucino
March
Maxima
Micra
Mistral
Moco
Murano
Navara
Note
NP300
NX Coupe
Otti
Pathfinder
Patrol
Pick UP
Prairie
Presage
Presea
President
Primera
Pulsar
Qashqai
Qashqai+2
Quest
Rasheen
R Nessa
Rogue
Safari
Sentra
Serena
Silvia
Skyline
Stagea
Stanza
Sunny
Teana
Terrano
Tiida
Tino
Titan
Vanette
Versa
Wingroad
X-Terra
X-Trail
Другая', '100', 's', '', '1', '0', '1', '108');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('150', '307', 'Модель', '', 'M10
M12
M14
M15
M400
M600
Другая', '100', 's', '', '1', '0', '1', '109');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('151', '308', 'Модель', '', 'Achieva
Alero
Aurora
Bravada
Cutlass
Eighty-Eight
Intrigue
Ninety-Eight
Silhouette
Другая', '100', 's', '', '1', '0', '1', '110');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('152', '309', 'Модель', '', 'Admiral
Agila
Antara
Ascona
Astra
Astra GTC
Astra OPC
Calibra
Campo
Combo
Commodore
Corsa
Corsa OPC
Diplomat
Frontera
GT
Insignia
Insignia OPC
Kadett
Manta
Meriva
Mokka
Monterey
Monza
Movano
Omega
Rekord
Senator
Signum
Sintra
Speedster
Tigra
Vectra
Vita
Vivaro
Zafira
Другая', '100', 's', '', '1', '0', '1', '111');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('153', '310', 'Модель', '', 'Huayra
Zonda
Другая', '100', 's', '', '1', '0', '1', '112');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('154', '311', 'Модель', '', '1007
104
106
107
2008
204
205
206
207
208
3008
301
304
305
306
307
308
309
4007
4008
405
406
407
408
5008
504
505
508
604
605
607
806
807
Bipper
Boxer
Expert
Partner
RCZ
Другая', '100', 's', '', '1', '0', '1', '113');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('155', '312', 'Модель', '', 'Acclaim
Breeze
Caravelle
Grand Voyager
Laser
Neon
Prowler
Sundance
Voyager
Другая', '100', 's', '', '1', '0', '1', '114');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('156', '313', 'Модель', '', '6000
Aztec
Bonneville
Fiero
Firebird
G4
G5
G6
G8
Grand AM
Grand Prix
GTO
LeMans
Montana
Parisienne
Phoenix
Solstice
Sunbird
Sunfire
Tempest
Torrent
Trans Sport
Vibe
Другая', '100', 's', '', '1', '0', '1', '115');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('157', '314', 'Модель', '', '356
911 Carrera
911 Carrera 4
911 Carrera 4S
911 Carrera S
911 GT2
911 GT2 RS
911 GT3
911 GT3 RS
911 GT3 RS 4.0
911 Targa 4
911 Targa 4S
911 Turbo
911 Turbo S
918 Spyder
924
928
944
959
968
Boxster
Boxster S
Boxster Spyder
Carrera GT
Cayenne
Cayenne GTS
Cayenne S
Cayenne Turbo
Cayenne Turbo S
Cayman
Cayman S
Macan S
Macan Turbo
Panamera
Panamera 4
Panamera 4S
Panamera GTS
Panamera S
Panamera Turbo
Другая', '100', 's', '', '1', '0', '1', '116');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('158', '315', 'Модель', '', 'Juara
Perdana
Persona
Saga
Saloon
Waja
Другая', '100', 's', '', '1', '0', '1', '117');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('159', '316', 'Модель', '', '11
12
14
15
16
17
18
19
20
21
25
30
4
5
6
9
Avantime
Clio
Clio RS
Duster
Espace
Estafette
Fluence
Fuego
Grand Scenic
Kangoo
Koleos
Laguna
Latitude
Logan
Master
Medallion
Megane
Megane RS
Modus
Rapid
Rodeo
Safrane
Sandero
Sandero Stepway
Scenic
Sport Spider
Super 5
Symbol
Trafic
Twingo
Twizy
Vel Satis
Wind
Другая', '100', 's', '', '1', '0', '1', '118');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('160', '317', 'Модель', '', 'Corniche Cabrio
Ghost
Park Ward
Phantom
Silver Seraph
Silver Spur
Wraith
Другая', '100', 's', '', '1', '0', '1', '119');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('161', '318', 'Модель', '', 'Lightning
Другая', '100', 's', '', '1', '0', '1', '120');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('162', '319', 'Модель', '', '100
200
25
400
45
600
75
800
Maestro
MGF
Mini MK
Montego
Streetwise
Другая', '100', 's', '', '1', '0', '1', '121');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('163', '320', 'Модель', '', '90
900
9000
9-2X
9-3
9-4
95
9-5
96
9-7X
99
Другая', '100', 's', '', '1', '0', '1', '123');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('164', '321', 'Модель', '', 'S7
Другая', '100', 's', '', '1', '0', '1', '124');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('165', '322', 'Модель', '', 'Astra
Aura
ION
LS
LW
Outlook
Relay
SC
Sky
SL
SW
VUE
Другая', '100', 's', '', '1', '0', '1', '125');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('166', '323', 'Модель', '', 'tC
xA
xB
xD
Другая', '100', 's', '', '1', '0', '1', '126');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('167', '324', 'Модель', '', 'Alhambra
Altea
Altea Freetrack
Altea XL
Arosa
Cordoba
Exeo
Fura
Ibiza
Ibiza FR
Leon
Leon FR
Malaga
Marbella
Mii
Ronda
Terra
Toledo
Другая', '100', 's', '', '1', '0', '1', '127');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('168', '325', 'Модель', '', 'Sceo
Другая', '100', 's', '', '1', '0', '1', '128');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('169', '326', 'Модель', '', 'Citigo
Fabia
Fabia RS
Fabia Scout
Favorit
Felicia
Octavia
Octavia RS
Praktik
Rapid
Roomster
Superb
Yeti
Другая', '100', 's', '', '1', '0', '1', '129');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('170', '327', 'Модель', '', 'C32
C51
C52
C61
C81
Другая', '100', 's', '', '1', '0', '1', '130');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('171', '328', 'Модель', '', 'Crossblade
Forfour
Fortwo
Roadster
Другая', '100', 'v', '', '1', '0', '1', '131');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('172', '329', 'Модель', '', 'C8
Другая', '100', 's', '', '1', '0', '1', '132');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('173', '330', 'Модель', '', 'Actyon
Chairman
Family
Istana
Kallista
Korando
Kyron
Musso
Rexton
Rodius
Stavic
Tager
Другая', '100', 's', '', '1', '0', '1', '133');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('174', '331', 'Модель', '', 'Alcyone
Baja
Bistro
BRZ
Dex
Dias
Domingo
Exiga
Forester
Impreza
Justy
Legacy
Leone
Libero
Lucra
Outback
Pleo
R1
R2
Sambar
Stella
SVX
Traviq
Trezia
Tribeca
Vivio
WRX
WRX STI
XT
XV
Другая', '100', 's', '', '1', '0', '1', '134');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('175', '332', 'Модель', '', 'Aerio
Alto
Baleno
Cappuccino
Cervo
Cultus Wagon
Escudo
Every
Every Landy
Forenza
Grand Escudo
Grand Vitara
Ignis
Jimny
Kei
Kizashi
Liana
MR Wagon
Reno
Samurai
Sidekick
Splash
Swift
SX4
Verona
Vitara
Wagon R
X-90
XL7
Другая', '100', 's', '', '1', '0', '1', '135');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('176', '333', 'Модель', '', 'Alpine
Avenger
Express
Horizon
Matra Bagheera
Minx
Murena
Rancho
Rapier
Samba
Simca
Solara
Tagora
Другая', '100', 's', '', '1', '0', '1', '136');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('177', '334', 'Модель', '', 'Aria
Estate
Indica
Indigo
Mint
Safari
Sierra
Sumo
Другая', '100', 's', '', '1', '0', '1', '137');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('178', '335', 'Модель', '', 'Model S
Model X
Roadster
Другая', '100', 's', '', '1', '0', '1', '138');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('179', '336', 'Модель', '', 'Century
Другая', '100', 's', '', '1', '0', '1', '139');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('180', '337', 'Модель', '', 'Admiral
Другая', '100', 's', '', '1', '0', '1', '140');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('181', '338', 'Модель', '', '4runner
Allex
Allion
Alphard
Altezza
Aristo
Aurion
Auris
Avalon
Avensis
Aygo
BB
Belta
Blade
Blizzard
Brevis
Caldina
Cami
Camry
Carib
Carina
Cavalier
Celica
Celsior
Century
Chaser
Corolla
Corona
Corsa
Cressida
Cresta
Crown
Curren
Cynos
Duet
Echo
Estima
FJ Cruiser
Fortuner
Funcargo
Gaia
Grand Hiace
Granvia
GT 86
Harrier
Hiace
Highlander
Hilux
Innova
Ipsum
iQ
Isis
Ist
Kluger
Land Cruiser
Land Cruiser Prado
Lite Ace
Mark II
Mark X
MasterAce
Matrix
Mega Cruiser
MR 2
MR-S
Nadia
Noah
Opa
Origin
Paseo
Passo
Passo Sette
Picnic
Platz
Porte
Premio
Previa
Prius
Probox
Progres
Pronard
Ractis
Raum
RAV4
Regius
Rush
Scepter
Sequoia
Sera
Sienna
Sienta
Soarer
Solara
Soluna
Sparky
Sprinter
Starlet
Succeed
Supra
Tacoma
Tercel
Town Ace
Tundra
Urban Cruiser
Vellfire
Venza
Verossa
Verso
Vios
Vista
Vitz
Voltz
Voxy
Will
Windom
Wish
Yaris
Другая', '100', 's', '', '1', '0', '1', '141');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('182', '339', 'Модель', '', '1.1
P601
Другая', '100', 's', '', '1', '0', '1', '142');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('183', '340', 'Модель', '', 'Amarok
Beetle
Bora
Caddy
California
Caravelle
Corrado
Crafter
CrossPolo
Derby
Eos
Fox
Golf
Golf GTI
Golf Plus
Golf R
Iltis
Jetta
Kaefer
Lupo
Multivan
New Beetle
Passat
Passat CC
Phaeton
Pointer
Polo
Routan
Santana
Scirocco
Sharan
Taro
Tiguan
Touareg
Touran
Transporter
Up
Vento
W12
Другая', '100', 's', '', '1', '0', '1', '143');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('184', '341', 'Модель', '', '140
164
240
260
340
360
440
460
480
66
740
760
780
850
940
960
C30
C70
Laplander
S40
S60
S70
S80
S90
V40
V40 Cross Country
V50
V60
V70
V90
XC60
XC70
XC90
Другая', '100', 's', '', '1', '0', '1', '144');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('185', '342', 'Модель', '', 'Corda
Estina
Tingo
Другая', '100', 's', '', '1', '0', '1', '145');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('186', '343', 'Модель', '', '353
Другая', '100', 's', '', '1', '0', '1', '146');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('187', '344', 'Модель', '', 'GT
Roadster
Другая', '100', 's', '', '1', '0', '1', '147');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('188', '345', 'Модель', '', 'Pickup X3
SR-V X3
SUV X3
Другая', '100', 's', '', '1', '0', '1', '148');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('189', '346', 'Модель', '', 'Admiral
GrandTiger
Landmark
Другая', '100', 's', '', '1', '0', '1', '149');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('190', '347', 'Модель', '', '1111 Ока
2101
2102
2103
2104
2105
2106
2107
2108
2109
21099
2110
2111
2112
2113 Samara
2114 Samara
2115 Samara
2120 Надежда
2123
2129
2328
2329
4x4 (Нива)
Granta
Kalina
Largus
Priora
Другая', '100', 's', '', '1', '0', '1', '150');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('191', '348', 'Модель', '', '1705
1706
2345
2346
2347
2349
Другая', '100', 's', '', '1', '0', '1', '151');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('192', '349', 'Модель', '', '12 ЗИМ
13 Чайка
14 Чайка
20 Победа
21 Волга
22
24 Волга
3101 Волга
310221 Волга
31029 Волга
3102 Волга
31105 Волга
3110 Волга
3111 Волга
Volga Siber
ГАЗель
ГАЗель 2705
ГАЗель 3221
ГАЗель 3302
ГАЗель 33023
ГАЗель 33025
ГАЗель Next
ГАЗель Бизнес
Другая
Соболь
Соболь 2217
Соболь 2310
Соболь 2752', '100', 's', '', '1', '0', '1', '152');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('193', '351', 'Модель', '', '1102 Таврия
1103 Славута
1105 Дана
1125
1140
965
966 Запорожец
968 Запорожец
Chance
Forza
Sens
Vida
Другая', '100', 's', '', '1', '0', '1', '153');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('194', '352', 'Модель', '', '101
110
111
114
117
4104
4105
4107
Другая', '100', 's', '', '1', '0', '1', '154');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('195', '353', 'Модель', '', '2125
2126
2715
2717
Другая', '100', 's', '', '1', '0', '1', '155');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('196', '354', 'Модель', '', '967
969
Другая', '100', 's', '', '1', '0', '1', '156');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('197', '355', 'Модель', '', '2136
2137
2138
2140
2141
2335
2733
2734
400
401
402
403
407
408
410
411
412
420
422
423
424
426
427
430
432
433
434
Дуэт
Иван Калита
Князь Владимир
Святогор
Юрий Долгорукий
Другая', '100', 's', '', '1', '0', '1', '157');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('198', '356', 'Модель', '', '2203
977
Другая', '100', 's', '', '1', '0', '1', '158');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('199', '357', 'Модель', '', 'Aquila
C10
C190
Hyundai Accent
Hyundai Santa Fe Classic
Hyundai Sonata
Road Partner
Tager
Tiggo
Vega
Vortex Corda
Vortex Estina
Vortex Tingo
С10
С30
Другая', '100', 's', '', '1', '0', '1', '159');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('200', '358', 'Модель', '', '2206
3151
31512
31514
31519
3153
3159
3160
452 Буханка
469
Hunter
Patriot
Pickup
Симбир
Другая', '100', 's', '', '1', '0', '1', '160');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('201', '168', 'Год выпуска', '', '2015
2014
2013
2012
2011
2010
2009
2008
2007
2006
2005
2004
2003
2002
2001
2000
1999
1998
1997
1996
1995
1994
1993
1992
1991
1990
1989
1988
1987
1986
1985
1984
1983
1982
1981
1980
1979
1978
1977
1976
1975
1974
1973
1972
1971
1970
1969
1968
1967
1966
1965
1964
1963
1962
1961
1960
до 1960', '100', 's', '', '1', '0', '1', '161');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('202', '168', 'Пробег, км', '', '0 - 4 999
5 000 - 9 999
10 000 - 14 999
15 000 - 19 999
20 000 - 24 999
25 000 - 29 999
30 000 - 34 999
35 000 - 39 999
40 000 - 44 999
45 000 - 49 999
50 000 - 54 999
55 000 - 59 999
60 000 - 64 999
65 000 - 69 999
70 000 - 74 999
75 000 - 79 999
80 000 - 84 999
85 000 - 89 999
90 000 - 94 999
95 000 - 99 999
100 000 - 109 999
110 000 - 119 999
120 000 - 129 999
130 000 - 139 999
140 000 - 149 999
150 000 - 159 999
160 000 - 169 999
170 000 - 179 999
180 000 - 189 999
190 000 - 199 999
200 000 - 209 999
210 000 - 219 999
220 000 - 229 999
230 000 - 239 999
240 000 - 249 999
250 000 - 259 999
260 000 - 269 999
270 000 - 279 999
280 000 - 289 999
290 000 - 299 999
300 000 - 309 999
310 000 - 319 999
320 000 - 329 999
330 000 - 339 999
340 000 - 349 999
350 000 - 359 999
360 000 - 369 999
370 000 - 379 999
380 000 - 389 999
390 000 - 399 999
400 000 - 409 999
410 000 - 419 999
420 000 - 429 999
430 000 - 439 999
440 000 - 449 999
450 000 - 459 999
460 000 - 469 999
470 000 - 479 999
480 000 - 489 999
490 000 - 499 999
&gt; 500 000', '100', 's', '', '1', '0', '1', '162');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('203', '168', 'Тип кузова', '', 'Седан
Хетчбэк
Универсал
Внедорожник
Кабриолет
Кроссовер
Купе
Лимузин
Минивэн
Пикап
Фургон
Микроавтобус', '100', 's', '', '1', '0', '1', '163');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('204', '168', 'Цвет', '', 'Бежевый
Белый
Голубой
Жёлтый
Зелёный
Золотой
Коричневый
Красный
Оранжевый
Пурпурный
Розовый
Серебряный
Серый
Синий
Фиолетовый
Чёрный', '100', 's', '', '1', '0', '1', '164');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('205', '168', 'Объём двигателя, л', '', '0.6
0.7
0.8
0.9
1.0
1.1
1.2
1.3
1.4
1.5
1.6
1.7
1.8
1.9
2.0
2.1
2.2
2.3
2.4
2.5
2.6
2.7
2.8
2.9
3.0
3.1
3.2
3.3
3.4
3.5
3.6
3.7
3.8
3.9
4.0
4.1
4.2
4.3
4.4
4.5
4.6
4.7
4.8
4.9
5.0
5.1
5.2
5.3
5.4
5.5
5.6
5.7
5.8
5.9
6.0
6.0+', '100', 's', '', '1', '0', '1', '165');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('206', '168', 'Коробка передач', '', 'Автоматическая
Механическая', '100', 's', '', '1', '0', '1', '166');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('207', '168', 'Тип двигателя', '', 'Бензиновый
Дизельный
Гибридный', '100', 's', '', '1', '0', '1', '167');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('208', '168', 'Привод', '', 'Передний
Задний
Полный', '100', 's', '', '1', '0', '1', '168');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('209', '168', 'Руль', '', 'Левый
Правый', '100', 's', '', '1', '0', '1', '169');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('210', '168', 'Состояние', '', 'Не битый
Битый', '100', 's', '', '1', '0', '1', '170');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('490', '0', 'Фото 8', 'Вы можете загрузить <br />фотографию', '', '1000', 'i', '', '2', '0', '1', '400');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('491', '0', 'Фото 9', 'Вы можете загрузить <br />фотографию', 'jpg
GIF
gif
JPG
PNG
png', '1000', 'i', '', '2', '0', '1', '401');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('489', '0', 'Фото 7', 'Вы можете загрузить <br />фотографию', '', '1000', 'i', '', '2', '0', '1', '399');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('487', '0', 'Фото 5', 'Вы можете загрузить <br />фотографию', '', '1000', 'i', '', '2', '0', '1', '397');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('488', '0', 'Фото 6', 'Вы можете загрузить <br />фотографию', '', '1000', 'i', '', '2', '0', '1', '398');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('213', '721', 'Вид запчасти', '', 'Автосвет
Аккумуляторы
Двигатель
Запчасти для ТО
Кузов
Подвеска
Рулевое управление
Салон
Стекла
Топливная и выхлопная 
системы
Тормозная система
Трансмиссия и привод
Электрооборудование', '100', 's', '', '1', '0', '1', '171');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('214', '472', 'Вид устройства', '', 'Автосигнализации
Иммобилайзеры
Механические блокираторы
Спутниковые системы', '100', 's', '', '1', '0', '1', '172');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('215', '725', 'Диаметр, дюймов', '', '12
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
30', '100', 's', '', '1', '0', '1', '173');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('216', '725', 'Сезонность', '', 'Всесезонные
Зимние нешипованные
Зимние шипованные
Летние', '100', 's', '', '1', '0', '1', '174');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('217', '725', 'Ширина профиля, мм', '', '125
135
145
155
165
175
185
195
205
215
225
235
245
255
265
275
285
295
305
315
325
335
345
355
365
375
385
395', '100', 's', '', '1', '0', '1', '175');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('218', '725', 'Высота профиля', '', '25
30
35
40
45
50
55
60
65
70
75
80
85
90
95', '100', 's', '', '1', '0', '1', '176');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('219', '726', 'Ширина профиля, мм', '', '60
70
80
90
100
110
120
130
140
150
160
170
180
190
200
210
220
230
240
250
260
270
280
290
300
310
320
330
340
350
360
370
380
390', '100', 's', '', '1', '0', '1', '177');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('220', '726', 'Высота профиля', '', '25
30
35
40
45
50
55
60
65
70
75
80
85
90
95
100
105
110', '100', 's', '', '1', '0', '1', '178');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('221', '726', 'Диаметр, дюймов', '', '7
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
24', '100', 's', '', '1', '0', '1', '179');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('222', '726', 'Ось', '', 'Задняя
Любая
Передняя', '100', 's', '', '1', '0', '1', '180');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('223', '727', 'Тип диска', '', 'Кованые
Литые
Штампованные
Спицованные
Сборные', '100', 's', '', '1', '0', '1', '181');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('224', '727', 'Диаметр, дюймов', '', '7
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
30', '100', 's', '', '1', '0', '1', '182');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('225', '727', 'Ширина обода, дюймов', '', '4
4.5
5
5.5
6
6.5
7
7.5
8
8.5
9
9.5
10
10.5
11
11.5
12
13', '100', 's', '', '1', '0', '1', '183');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('226', '727', 'Количество отверстий', '', '3
4
5
6
8
9
10', '100', 's', '', '1', '0', '1', '184');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('227', '727', 'Диаметр расположения отверстий, мм', '', '98
100
105
108
110
112
114.3
115
118
120
125
127
130
135
139
139.7
140
150
160
165
165.1
170
180
200
205
256', '100', 's', '', '1', '0', '1', '185');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('228', '727', 'Вылет (ET), мм', '', '-65
-50
-44
-40
-36
-35
-32
-30
-28
-25
-24
-22
-20
-16
-15
-14
-13
-12
-10
-8
-7
-6
-5
-2
0
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
23.5
24
25
26
27
28
29
30
31
31.5
32
33
34
35
36
36.5
37
37.5
38
39
39.5
40
40.5
41
41.3
41.5
42
43
43.5
43.8
44
45
45.5
46
47
47.5
48
49
49.5
50
50.5
50.8
51
52
52.2
52.5
53
54
55
56
57
58
59
60
62
63
65
66
67
68
70
75
83
100
102
105
105.5
106
107
108
110
111
115
116
118
120
123
124
125
126
127
128
129
130
132
133
134
135
136
138
140
142
143
144
145
147
148
152
156
157
161
163
165
167
168
172
175
185', '100', 's', '', '1', '0', '1', '186');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('229', '728', 'Диаметр, дюймов', '', 'Запчасти
Аксессуары
GPS-навигаторы
Автокосметика и автохимия
Аудио- и видеотехника
Багажники и фаркопы
Инструменты
Прицепы
Противоугонные устройства
Тюнинг
Шины, диски и колёса
Экипировка', '100', 's', '', '1', '0', '1', '187');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('230', '728', 'Тип диска', '', 'Кованые
Литые
Штампованные', '100', 's', '', '1', '0', '1', '188');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('231', '728', 'Сезонность', '', 'Всесезонные
Летние
Зимние шипованные
Зимние нешипованные', '100', 's', '', '1', '0', '1', '189');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('232', '728', 'Ширина профиля, мм', '', '125
135
145
155
165
175
185
195
205
215
225
235
245
255
265
275
285
295
305
315
325
335
345
355
365
375
385
395', '100', 's', '', '1', '0', '1', '190');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('233', '728', 'Высота профиля', '', '25
30
35
40
45
50
55
60
65
70
75
80
85
90
95', '100', 's', '', '1', '0', '1', '191');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('234', '728', 'Ширина обода, дюймов', '', '4
4.5
5
5.5
6
6.5
7
7.5
8
8.5
9
9.5
10
10.5
11
11.5
12
13', '100', 's', '', '1', '0', '1', '192');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('235', '728', 'Количество отверстий', '', '3
4
5
6
8
9
10', '100', 's', '', '1', '0', '1', '193');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('236', '728', 'Диаметр расположения отверстий, мм', '', '98
100
105
108
110
112
114.3
115
118
120
125
127
130
135
139
139.7
140
150
160
165
165.1
170
180
200
205
256', '100', 's', '', '1', '0', '1', '194');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('237', '728', 'Вылет (ET), мм', '', '-65
-50
-44
-40
-36
-35
-32
-30
-28
-25
-24
-22
-20
-16
-15
-14
-13
-12
-10
-8
-7
-6
-5
-2
0
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
23.5
24
25
26
27
28
29
30
31
31.5
32
33
34
35
36
36.5
37
37.5
38
39
39.5
40
40.5
41
41.3
41.5
42
43
43.5
43.8
44
45
45.5
46
47
47.5
48
49
49.5
50
50.5
50.8
51
52
52.2
52.5
53
54
55
56
57
58
59
60
62
63
65
66
67
68
70
75
83
100
102
105
105.5
106
107
108
110
111
115
116
118
120
123
124
125
126
127
128
129
130
132
133
134
135
136
138
140
142
143
144
145
147
148
152
156
157
161
163
165
167
168
172
175
185', '100', 's', '', '1', '0', '1', '195');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('238', '729', 'Диаметр, дюймов', '', '12
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
30', '100', 's', '', '2', '0', '1', '196');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('239', '442', 'Вид мотоцикла', '', 'Дорожные
Кастом-байки
Кросс и эндуро
Спортивные
Чопперы', '100', 's', '', '1', '0', '1', '197');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('240', '359', 'Модель', '', 'MDX
RDX
RL
TL
TLX
TSX
ZDX
Другая', '100', 's', '', '1', '0', '1', '198');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('241', '360', 'Модель', '', '159
4C
Giulietta
MiTo
Другая', '100', 's', '', '1', '0', '1', '199');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('242', '361', 'Модель', '', 'B3
B5
B6
B7
D5
XD3
Другая', '100', 's', '', '1', '0', '1', '200');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('243', '362', 'Модель', '', 'DB9
DBS
Rapide
Rapide S
V12 Vantage
V12 Vantage S
V8 Vantage
V8 Vantage S
Vanquish
Virage
Другая', '100', 's', '', '1', '0', '1', '201');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('244', '363', 'Модель', '', 'A1
A3
A4
A5
A6
A7
A8
Q3
Q5
Q7
R8
RS3
RS4
RS5
RS6
RS7
RS8
RS Q3
S3
S4
S5
S6
S7
S8
SQ5
TT
TT RS
TTS
Другая', '100', 's', '', '1', '0', '1', '202');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('245', '364', 'Модель', '', 'Fenix
Tonik
Другая', '100', 's', '', '1', '0', '1', '203');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('246', '365', 'Модель', '', 'Continental Flying Spur
Continental GT
Continental GTC
Continental Supersports
Mulsanne
Другая', '100', 's', '', '1', '0', '1', '204');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('247', '366', 'Модель', '', '1
2
3
3 GT
4
5
5 GT
6
7
ActiveHybrid 7
i3
i8
M3
M5
M6
X1
X3
X4
X5
X5M
X6
X6M
Z4
Другая', '100', 's', '', '1', '0', '1', '205');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('248', '367', 'Модель', '', 'H530
M2
V5
Другая', '100', 's', '', '1', '0', '1', '206');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('249', '368', 'Модель', '', 'Veyron
Другая', '100', 's', '', '1', '0', '1', '207');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('250', '369', 'Модель', '', 'F3
Другая', '100', 's', '', '1', '0', '1', '208');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('251', '370', 'Модель', '', 'ATS
CTS
CTS-V
Escalade
SRX
Другая', '100', 's', '', '1', '0', '1', '209');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('252', '371', 'Модель', '', 'CS35
Eado
Raeton
SM-8
Z-Chine
Другая', '100', 's', '', '1', '0', '1', '210');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('253', '372', 'Модель', '', 'Arizzo 7
Bonus
Bonus 3
CrossEastar
Indis
Kimo
M11
Tiggo
Tiggo 5
Very
Другая', '100', 's', '', '1', '0', '1', '211');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('254', '373', 'Модель', '', 'Avalanche
Aveo
Camaro
Captiva
Cobalt
Colorado
Corvette
Cruze
Epica
Equinox
Express
Impala
Lacetti
Malibu
Niva
Orlando
Silverado
Sonic
Spark
Suburban
Tahoe
Tracker
TrailBlazer
Traverse
Volt
Другая', '100', 's', '', '1', '0', '1', '212');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('255', '374', 'Модель', '', '200
300C
Grand Voyager
Другая', '100', 's', '', '1', '0', '1', '213');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('256', '375', 'Модель', '', 'Berlingo
C1
C3
C3 Picasso
C4
C4 Aircross
C4 Picasso
C5
C6
C-Crosser
C-Elysee
DS3
DS4
DS5
Grand C4 Picasso
Jumper
Другая', '100', 's', '', '1', '0', '1', '214');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('257', '376', 'Модель', '', 'Dokker
Duster
Lodgy
Logan
Sandero
Другая', '100', 's', '', '1', '0', '1', '215');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('258', '377', 'Модель', '', 'Gentra
Matiz
Nexia
Другая', '100', 's', '', '1', '0', '1', '216');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('259', '378', 'Модель', '', 'mi-DO
on-DO
Другая', '100', 's', '', '1', '0', '1', '217');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('260', '379', 'Модель', '', 'Avenger
Caliber
Challenger
Charger
Durango
Grand Caravan
Journey
RAM
Другая', '100', 's', '', '1', '0', '1', '218');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('261', '380', 'Модель', '', 'H30 Cross
S30
Другая', '100', 's', '', '1', '0', '1', '219');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('262', '381', 'Модель', '', 'Estrima Biro
Другая', '100', 's', '', '1', '0', '1', '220');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('263', '382', 'Модель', '', 'Besturn B50
Besturn B70
V2
V5
Другая', '100', 's', '', '1', '0', '1', '221');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('264', '383', 'Модель', '', '458 Italia
458 Spider
599 GTB Fiorano
California
F12 berlinetta
FF
Другая', '100', 's', '', '1', '0', '1', '222');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('265', '384', 'Модель', '', '500
Albea
Bravo
Croma
Doblo
Ducato
Freemont
Linea
Panda
Punto
Scudo
Sedici
Другая', '100', 's', '', '1', '0', '1', '223');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('266', '385', 'Модель', '', 'C-MAX
EcoSport
Edge
Escape
Expedition
Explorer
Fiesta
Flex
Focus
Focus RS
Focus ST
Fusion
Fusion Hybrid
Galaxy
Grand C-MAX
Kuga
Mondeo
Mustang
Ranger
S-MAX
Taurus
Tourneo
Tourneo Connect
Transit
Другая', '100', 's', '', '1', '0', '1', '224');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('267', '386', 'Модель', '', 'Emgrand
Emgrand X7
GC6
MK
MK Cross
Vision
Другая', '100', 's', '', '1', '0', '1', '225');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('268', '387', 'Модель', '', 'Savana
Другая', '100', 's', '', '1', '0', '1', '226');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('269', '388', 'Модель', '', 'CoolBear
Hover
Peri
Wingle
Другая', '100', 's', '', '1', '0', '1', '227');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('270', '389', 'Модель', '', '3
7
Другая', '100', 's', '', '1', '0', '1', '228');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('271', '390', 'Модель', '', 'H6
H8
Другая', '100', 's', '', '1', '0', '1', '229');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('272', '391', 'Модель', '', 'Boliger
Другая', '100', 's', '', '1', '0', '1', '230');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('273', '392', 'Модель', '', 'Accord
Civic
Crosstour
CR-V
Jazz
Odyssey
Pilot
Ridgeline
Другая', '100', 's', '', '1', '0', '1', '231');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('274', '393', 'Модель', '', 'Accent
Elantra
Equus
Genesis
Grandeur
H-1 (Grand Starex)
i10
i30
i40
ix20
ix35
ix55
Porter
Santa Fe
Solaris
Sonata
Veloster
Другая', '100', 's', '', '1', '0', '1', '232');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('275', '394', 'Модель', '', 'EX
FX
G
JX
M
Q50
Q60
Q70
QX
QX50
QX60
QX70
Другая', '100', 's', '', '1', '0', '1', '233');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('276', '395', 'Модель', '', 'Daily
Другая', '100', 's', '', '1', '0', '1', '234');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('277', '396', 'Модель', '', 'Rein
Другая', '100', 's', '', '1', '0', '1', '235');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('278', '397', 'Модель', '', 'F-Type
XF
XFR
XJ
XK
XKR
XKR-S
Другая', '100', 's', '', '1', '0', '1', '236');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('279', '398', 'Модель', '', 'Cherokee
Compass
Grand Cherokee
Liberty
Wrangler
Другая', '100', 's', '', '1', '0', '1', '237');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('280', '399', 'Модель', '', 'Carens
cee\\\'d
Cerato
Mohave
Optima
Picanto
Quoris
Rio
Sorento
Soul
Sportage
Venga
Другая', '100', 's', '', '1', '0', '1', '238');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('281', '400', 'Модель', '', '2104
2107
4x4
Granta
Kalina
Largus
Priora
Samara (2113)
Samara (2114)
Samara (2115)
Богдан
Другая', '100', 's', '', '1', '0', '1', '239');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('282', '401', 'Модель', '', 'Aventador
Gallardo
Другая', '100', 's', '', '1', '0', '1', '240');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('283', '402', 'Модель', '', 'Defender
Discovery
Freelander
Range Rover
Range Rover Evoque
Range Rover Sport
Другая', '100', 's', '', '1', '0', '1', '241');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('284', '403', 'Модель', '', 'CT
ES
GS
GX
IS
IS F
LS
LX
NX
RX
Другая', '100', 's', '', '1', '0', '1', '242');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('285', '404', 'Модель', '', 'Breez
Cebrium
Celliya
Smily
Solano
X60
Другая', '100', 's', '', '1', '0', '1', '243');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('286', '405', 'Модель', '', 'Navigator
Другая', '100', 's', '', '1', '0', '1', '244');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('287', '406', 'Модель', '', 'Elise
Elise S
Evora
Evora S
Exige
Exige S
Другая', '100', 's', '', '1', '0', '1', '245');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('288', '407', 'Модель', '', '5 Sedan
7 MPV
7 SUV
Другая', '100', 's', '', '1', '0', '1', '246');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('289', '408', 'Модель', '', 'B1
B2
Другая', '100', 's', '', '1', '0', '1', '247');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('290', '409', 'Модель', '', 'Ghibli
GranCabrio
GranTurismo
Quattroporte
Другая', '100', 's', '', '1', '0', '1', '248');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('291', '410', 'Модель', '', '2
3
3 MPS
5
6
BT-50
CX-5
CX-7
CX-9
MX-5
RX-8
Другая', '100', 's', '', '1', '0', '1', '249');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('292', '411', 'Модель', '', 'A-класс
A-класс AMG
B-класс
Citan
CLA-класс
CLA-класс AMG
CLS-класс
CLS-класс AMG
CL-класс
CL-класс AMG
C-класс
C-класс AMG
E-класс
E-класс AMG
GLA-класс
GLK-класс
GL-класс
GL-класс AMG
G-класс
G-класс AMG
M-класс
M-класс AMG
R-класс
SLK-класс
SLK-класс AMG
SLS-класс AMG
SL-класс
SL-класс AMG
Sprinter
Sprinter Classic
S-класс
S-класс AMG
Viano
Vito
V-класс
Другая', '100', 's', '', '1', '0', '1', '250');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('293', '412', 'Модель', '', 'Cooper
Cooper Clubman
Cooper Clubvan
Cooper Countryman
Cooper Paceman
Cooper S
Cooper S Clubman
Cooper S Countryman
Cooper S Paceman
John Cooper Works
John Cooper Works Clubman
John Cooper Works Countryman
John Cooper Works Paceman
One
One Clubman
One Clubvan
One Countryman
Другая', '100', 's', '', '1', '0', '1', '251');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('294', '413', 'Модель', '', 'ASX
Colt
Eclipse
i-MiEV
L200
Lancer
Lancer Evolution
Outlander
Pajero
Pajero Sport
Другая', '100', 's', '', '1', '0', '1', '252');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('295', '414', 'Модель', '', 'Almera
Almera Classic
GT-R
Juke
Murano
Navara
Note
NP300
Pathfinder
Patrol
Qashqai
Qashqai+2
Sentra
Teana
Terrano
Tiida
X-Trail
Другая', '100', 's', '', '1', '0', '1', '253');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('296', '415', 'Модель', '', 'Antara
Astra
Astra GTC
Astra OPC
Corsa
Corsa OPC
Insignia
Insignia OPC
Meriva
Mokka
Zafira
Другая', '100', 's', '', '1', '0', '1', '254');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('297', '416', 'Модель', '', '107
2008
207
208
3008
301
308
4007
4008
408
508
Bipper
Boxer
Expert
Partner
RCZ
Другая', '100', 's', '', '1', '0', '1', '255');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('298', '417', 'Модель', '', '911 Carrera
911 Carrera 4
911 Carrera 4S
911 Carrera S
911 GT3
911 Turbo
911 Turbo S
918 Spyder
Boxster
Boxster S
Cayenne
Cayenne GTS
Cayenne S
Cayenne Turbo
Cayenne Turbo S
Cayman
Cayman S
Macan S
Macan Turbo
Panamera
Panamera 4
Panamera 4S
Panamera GTS
Panamera S
Panamera Turbo
Другая', '100', 's', '', '1', '0', '1', '256');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('299', '418', 'Модель', '', 'Clio
Clio RS
Duster
Fluence
Kangoo
Koleos
Laguna
Latitude
Logan
Master
Megane
Megane RS
Sandero
Sandero Stepway
Scenic
Symbol
Trafic
Другая', '100', 's', '', '1', '0', '1', '257');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('300', '419', 'Модель', '', 'Ghost
Phantom
Wraith
Другая', '100', 's', '', '1', '0', '1', '258');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('301', '324', 'Модель', '', 'Alhambra
Altea
Altea Freetrack
Altea XL
Exeo
Ibiza
Ibiza FR
Leon
Leon FR
Mii
Toledo
Другая', '100', 's', '', '1', '0', '1', '259');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('302', '421', 'Модель', '', 'Citigo
Fabia
Fabia RS
Fabia Scout
Octavia
Octavia RS
Praktik
Rapid
Roomster
Superb
Yeti
Другая', '100', 's', '', '1', '0', '1', '260');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('303', '422', 'Модель', '', 'Fortwo
Другая', '100', 's', '', '1', '0', '1', '261');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('304', '423', 'Модель', '', 'Actyon
Kyron
Rexton
Stavic
Другая', '100', 's', '', '1', '0', '1', '262');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('305', '424', 'Модель', '', 'BRZ
Forester
Impreza
Legacy
Outback
Sambar
Tribeca
WRX
WRX STI
XV
Другая', '100', 's', '', '1', '0', '1', '263');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('306', '425', 'Модель', '', 'Grand Vitara
Ignis
Jimny
Kizashi
Splash
Swift
SX4
Другая', '100', 's', '', '1', '0', '1', '264');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('307', '426', 'Модель', '', 'Model S
Model X
Другая', '100', 's', '', '1', '0', '1', '265');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('308', '427', 'Модель', '', '4runner
Allex
Allion
Alphard
Altezza
Aristo
Aurion
Auris
Avalon
Avensis
Aygo
BB
Belta
Blade
Blizzard
Brevis
Caldina
Cami
Camry
Carib
Carina
Cavalier
Celica
Celsior
Century
Chaser
Corolla
Corona
Corsa
Cressida
Cresta
Crown
Curren
Cynos
Duet
Echo
Estima
FJ Cruiser
Fortuner
Funcargo
Gaia
Grand Hiace
Granvia
GT 86
Harrier
Hiace
Highlander
Hilux
Innova
Ipsum
iQ
Isis
Ist
Kluger
Land Cruiser
Land Cruiser Prado
Lite Ace
Mark II
Mark X
MasterAce
Matrix
Mega Cruiser
MR 2
MR-S
Nadia
Noah
Opa
Origin
Paseo
Passo
Passo Sette
Picnic
Platz
Porte
Premio
Previa
Prius
Probox
Progres
Pronard
Ractis
Raum
RAV4
Regius
Rush
Scepter
Sequoia
Sera
Sienna
Sienta
Soarer
Solara
Soluna
Sparky
Sprinter
Starlet
Succeed
Supra
Tacoma
Tercel
Town Ace
Toyota SAI
Tundra
Urban Cruiser
Vellfire
Venza
Verossa
Verso
Vios
Vista
Vitz
Voltz
Voxy
Will
Windom
Wish
Yaris
Другая', '100', 's', '', '1', '0', '1', '266');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('309', '428', 'Модель', '', 'Amarok
Beetle
Caddy
California
Caravelle
Crafter
CrossPolo
Golf
Golf GTI
Golf Plus
Golf R
Jetta
Multivan
Passat
Passat CC
Phaeton
Polo
Scirocco
Tiguan
Touareg
Touran
Transporter
Up
Другая', '100', 's', '', '1', '0', '1', '267');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('310', '429', 'Модель', '', 'C30
C70
S40
S60
S80
V40 Cross Country
V60
XC60
XC70
XC90
Другая', '100', 's', '', '1', '0', '1', '268');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('311', '430', 'Модель', '', 'Corda
Estina
Tingo
Другая', '100', 's', '', '1', '0', '1', '269');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('312', '431', 'Модель', '', '1705
1706
2345
2346
2347
2349
Другая', '100', 's', '', '1', '0', '1', '270');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('313', '432', 'Модель', '', 'Валдай 3310
Валдай 331063
ГАЗель
ГАЗель 2705
ГАЗель 3221
ГАЗель 3302
ГАЗель 33023
ГАЗель 33025
ГАЗель Next
ГАЗель Бизнес
Соболь 2217
Соболь 2310
Соболь 2752
Другая', '100', 's', '', '1', '0', '1', '271');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('314', '434', 'Модель', '', 'Chance
Vida
Другая', '100', 's', '', '1', '0', '1', '272');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('315', '435', 'Модель', '', 'Aquila
C190
Hyundai Accent
Hyundai Santa Fe Classic
Hyundai Sonata
Road Partner
Tager
Tiggo
Vega
Vortex Corda
Vortex Estina
Vortex Tingo
С10
С30
Другая', '100', 's', '', '1', '0', '1', '273');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('316', '436', 'Модель', '', '452 Буханка
469
Hunter
Patriot
Pickup
Другая', '100', 's', '', '1', '0', '1', '274');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('317', '173', 'Тип кузова', '', 'Седан
Хетчбэк
Универсал
Внедорожник
Кабриолет
Кроссовер
Купе
Лимузин
Минивэн
Пикап
Фургон
Микроавтобус', '100', 's', '', '1', '0', '1', '275');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('318', '173', 'Объём двигателя, л', '', '0.6
0.7
0.8
0.9
1.0
1.1
1.2
1.3
1.4
1.5
1.6
1.7
1.8
1.9
2.0
2.1
2.2
2.3
2.4
2.5
2.6
2.7
2.8
2.9
3.0
3.1
3.2
3.3
3.4
3.5
3.6
3.7
3.8
3.9
4.0
4.1
4.2
4.3
4.4
4.5
4.6
4.7
4.8
4.9
5.0
5.1
5.2
5.3
5.4
5.5
5.6
5.7
5.8
5.9
6.0
6.0+', '100', 's', '', '1', '0', '1', '276');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('319', '173', 'Коробка передач', '', 'Автоматическая
Механическая', '100', 's', '', '1', '0', '1', '277');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('320', '173', 'Тип двигателя', '', 'Бензиновый
Дизельный
Гибридный', '100', 's', '', '1', '0', '1', '278');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('321', '173', 'Привод', '', 'Передний
Задний
Полный', '100', 's', '', '1', '0', '1', '279');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('322', '476', 'Количество комнат', '', '1
2
3
4
5
6
7
8
9
&gt;9', '100', 's', '', '1', '0', '1', '280');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('323', '476', 'Вид объекта', '', 'Вторичка
Новостройка', '100', 's', '', '1', '0', '1', '281');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('324', '476', 'Этаж', '', '1
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
99', '100', 's', '', '1', '0', '1', '282');
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
99', '100', 's', '', '1', '0', '1', '283');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('326', '476', 'Тип дома', '', 'Кирпичный
Панельный
Блочный
Монолитный
Деревянный', '100', 's', '', '1', '0', '1', '284');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('327', '477', 'Количество комнат', '', '1
2
3
4
5
6
7
8
9
&gt;9', '100', 's', '', '1', '0', '1', '285');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('328', '477', 'Срок аренды', '', 'На длительный срок
Месяц
Сутки
Час', '100', 's', '', '1', '0', '1', '286');
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
99', '100', 's', '', '1', '0', '1', '287');
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
99', '100', 's', '', '1', '0', '1', '288');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('331', '477', 'Тип дома', '', 'Кирпичный
Панельный
Блочный
Монолитный
Деревянный', '100', 's', '', '1', '0', '1', '289');
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
&gt;9', '100', 's', '', '1', '0', '1', '290');
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
&gt;9', '100', 's', '', '1', '0', '1', '291');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('334', '479', 'Срок аренды', '', 'На длительный срок
Месяц
Сутки
Час', '100', 's', '', '1', '0', '1', '292');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('335', '492', 'Вид объекта', '', 'Дом
Дача
Коттедж
Таунхаус', '100', 's', '', '1', '0', '1', '293');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('336', '492', 'Этажей в доме', '', '1
2
3
4
&gt;4', '100', 's', '', '1', '0', '1', '294');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('337', '492', 'Материал стен', '', 'Кирпич
Брус
Бревно
Металл
Пеноблоки
Сэндвич-панели
Ж/б панели
Экспериментальные материалы', '100', 's', '', '1', '0', '1', '295');
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
160', '100', 's', '', '1', '0', '1', '296');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('339', '493', 'Вид объекта', '', 'Дом
Дача
Коттедж
Таунхаус', '100', 's', '', '1', '0', '1', '297');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('340', '493', 'Этажей в доме', '', '1
2
3
4
&gt;4', '100', 's', '', '1', '0', '1', '298');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('341', '493', 'Материал стен', '', 'Кирпич
Брус
Бревно
Металл
Пеноблоки
Сэндвич-панели
Ж/б панели
Экспериментальные материалы', '100', 's', '', '1', '0', '1', '299');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('342', '493', 'Срок аренды', '', 'На длительный срок
Месяц
Сутки
Час', '100', 's', '', '1', '0', '1', '300');
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
160', '100', 's', '', '1', '0', '1', '301');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('344', '494', 'Вид объекта', '', 'Дом
Дача
Коттедж
Таунхаус', '100', 's', '', '1', '0', '1', '302');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('345', '494', 'Местонахождение', '', 'В черте города
За городом', '100', 's', '', '1', '0', '1', '303');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('346', '495', 'Вид объекта', '', 'Дом
Дача
Коттедж
Таунхаус', '100', 's', '', '1', '0', '1', '304');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('347', '495', 'Срок аренды', '', 'На длительный срок
Месяц
Сутки
Час', '100', 's', '', '1', '0', '1', '305');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('348', '495', 'Местонахождение', '', 'В черте города
За городом', '100', 's', '', '1', '0', '1', '306');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('349', '177', 'Категория земель', '', 'Поселений (ИЖС)
Сельхозназначения (СНТ, ДНП)
Промназначения', '100', 's', '', '1', '0', '1', '307');
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
160', '100', 's', '', '1', '0', '1', '308');
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
160', '100', 's', '', '1', '0', '1', '309');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('352', '490', 'Местонахождение', '', 'В черте города
За городом', '100', 's', '', '1', '0', '1', '310');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('353', '491', 'Местонахождение', '', 'В черте города
За городом', '100', 's', '', '1', '0', '1', '311');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('354', '179', 'Вид объекта', '', 'Гараж
Машиноместо', '100', 's', '', '1', '0', '1', '312');
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
&gt;30', '100', 's', '', '1', '0', '1', '313');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('356', '496', 'Охрана', '', 'Да
Нет', '100', 's', '', '1', '0', '1', '314');
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
&gt;30', '100', 's', '', '1', '0', '1', '315');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('358', '497', 'Охрана', '', 'Да
Нет', '100', 's', '', '1', '0', '1', '316');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('361', '176', 'Вид объекта', '', 'Гостиница
Офисное помещение
Помещение свободного назначения
Производственное помещение
Складское помещение
Торговое помещение', '100', 's', '', '1', '0', '1', '317');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('362', '180', 'Вид объекта', '', 'Квартира, апартаменты
Дом, вилла
Земельный участок
Гараж, машиноместо
Коммерческая недвижимость', '100', 's', '', '1', '0', '1', '318');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('363', '180', 'Страна', '', 'Абхазия
Австралия
Австрия
Азербайджан
Албания
Андорра
Армения
Белоруссия
Бельгия
Болгария
Босния и Герцеговина
Бразилия
Великобритания
Венгрия
Венесуэла
Германия
Гоа
Греция
Грузия
Дания
Доминикана
Другая страна
Египет
Израиль
Ирландия
Испания
Италия
Кабо-Верде
Казахстан
Камбоджа
Канада
Кипр
Киргизия
Китай
Латвия
Литва
Люксембург
Македония
Мальдивы
Мальта
Мексика
Молдова
Монако
Монголия
Нидерланды
Новая Зеландия
Норвегия
ОАЭ
Панама
Польша
Португалия
Румыния
Сейшелы
Сербия
Словакия
Словения
США
Таджикистан
Тайланд
Тунис
Туркменистан
Турция
Узбекистан
Украина
Уругвай
Финляндия
Франция
Хорватия
Черногория
Чехия
Швейцария
Швеция
Эстония
Южная Корея
Южная Осетия
Япония', '100', 's', '', '1', '0', '1', '319');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('364', '501', 'Срок аренды', '', 'На длительный срок
Посуточно', '100', 's', '', '1', '0', '1', '320');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('365', '503', 'Срок аренды', '', 'На длительный срок
Посуточно', '100', 's', '', '1', '0', '1', '321');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('368', '730', 'Вид одежды', '', 'Женская
Мужская', '100', 's', '', '1', '0', '1', '322');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('369', '730', 'Размер', '', '34
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
&gt;46', '100', 's', '', '1', '0', '1', '323');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('371', '731', 'Предмет одежды', '', 'Брюки
Верхняя одежда
Комбинезоны и боди
Пижамы
Трикотаж
Шапки, варежки, шарфы
Другое', '100', 's', '', '1', '0', '1', '324');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('372', '733', 'Размер', '', 'меньше 19
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
&gt;36
Без размера', '100', 's', '', '1', '0', '1', '325');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('373', '732', 'Размер', '', '50-56 cм (0-2 мес)
62-68 см (2-6 мес)
74-80 см (7-12 мес)
86-92 см (1-2 года)
98-104 см (2-4 года)
110-116 см (4-6 лет)
122-128 см (6-8 лет)
134-140 см (8-10 лет)
146-152 см (10-12 лет)
Без размера', '100', 's', '', '1', '0', '1', '326');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('374', '731', 'Размер', '', '50-56 cм (0-2 мес)
62-68 см (2-6 мес)
74-80 см (7-12 мес)
86-92 см (1-2 года)
98-104 см (2-4 года)
110-116 см (4-6 лет)
122-128 см (6-8 лет)
134-140 см (8-10 лет)
146-152 см (10-12 лет)
Без размера', '100', 's', '', '1', '0', '1', '327');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('375', '197', 'Тип товара', '', 'Планшеты
Электронные книги
Аккумуляторы
Гарнитуры и наушники
Док-станции
Зарядные устройства
Кабели и адаптеры
Модемы и роутеры
Стилусы
Чехлы и плёнки
Другое', '100', 's', '', '1', '0', '1', '328');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('376', '210', 'Вид товара', '', 'Карты, купоны
Концерты
Путешествия
Спорт
Театр, опера, балет
Цирк, кино
Шоу, мюзикл
Другое', '100', 's', '', '1', '0', '1', '329');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('377', '206', 'Вид велосипеда', '', 'Горные
Дорожные
ВМХ
Детские
Запчасти и аксессуары', '100', 's', '', '1', '0', '1', '330');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('378', '204', 'Вид товара', '', 'Журналы, газеты, брошюры
Книги
Учебная литература
Другое', '100', 's', '', '1', '0', '1', '331');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('379', '205', 'Вид товара', '', 'Банкноты
Билеты
Вещи знаменитостей, автографы
Военные вещи
Грампластинки
Документы
Жетоны, медали, значки
Игры
Календари
Картины
Киндер-сюрприз
Конверты и почтовые карточки
Макеты оружия
Марки
Модели
Монеты
Открытки
Пепельницы, зажигалки
Пластиковые карточки
Спортивные карточки
Фотографии, письма
Этикетки, бутылки, пробки
Другое', '100', 's', '', '1', '0', '1', '332');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('380', '207', 'Вид товара', '', 'Аккордеоны, гармони, баяны
Гитары и другие струнные
Духовые
Пианино и другие клавишные
Скрипки и другие смычковые
Ударные
Для студии и концертов
Аксессуары
Другое', '100', 's', '', '1', '0', '1', '333');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('381', '203', 'Вид товара', '', 'Бильярд и боулинг
Дайвинг и водный спорт
Единоборства
Зимние виды спорта
Игры с мячом
Настольные игры
Пейнтбол и страйкбол
Ролики и скейтбординг
Теннис, бадминтон, пинг-понг
Туризм
Фитнес и тренажёры
Другое', '100', 's', '', '1', '0', '1', '334');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('382', '209', 'Возраст', '', '18
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
99', '100', 's', '', '1', '0', '1', '335');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('383', '209', 'С кем хотите познакомиться', '', 'Парень ищет девушку
Девушка ищет парня', '100', 's', '', '1', '0', '1', '336');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('384', '209', 'Цель знакомства', '', 'Любовь и отношения
Дружба и общение', '100', 's', '', '1', '0', '1', '337');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('385', '214', 'Порода', '', 'Акита
Аляскинский маламут
Американский бульдог
Английский бульдог
Басенджи
Бассет
Бельгийская овчарка
Бельгийский гриффон
Бернский зенненхунд
Бивер
Бигль
Бишон фризе
Бобтейл
Боксер
Болонки
Бриар
Брюссельский гриффон
Бульмастиф
Бультерьер
Бурбуль
Вельштерьер
Вест хайленд вайт терьер
Восточноевропейская овчарка
Далматин
Джек Рассел терьер
Доберман
Дог
Ирландский терьер
Йоркширский терьер
Кавказская овчарка
Кане Корсо
Керн терьер
Китайская хохлатая
Кокер спаниель
Колли
Курцхаар
Лабрадор
Лайка
Левретка
Леонбергер
Лхаса Апсо
Мастиф
Миттельшнауцер
Мопс
Московская сторожевая
Немецкая овчарка
Норвич терьер
Ньюфаундленд
Овчарка
Папийон
Пекинес
Петербургская орхидея
Питбуль
Пойнтер
Пти брабансон
Пудель
Ретривер
Ризеншнауцер
Родезийский риджбек
Ротвейлер
Русская борзая
Самоедская лайка
Сенбернар
Сеттер
Сибирская хаски
Скотч-терьер
Спаниель
Среднеазиатская овчарка
Стаффордширский терьер
Такса
Той-пудель
Той-терьер
Фландрский бувье
Фокстерьер
Французская овчарка
Французский бульдог
Цвергпинчер
Цвергшнауцер
Чау-чау
Чихуахуа
Шар-пей
Швейцарская овчарка
Шелти
Ши-тцу
Шпиц
Эрдельтерьер
Ягдтерьер
Японский хин
Другая', '100', 's', '', '1', '0', '1', '338');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('386', '213', 'Порода', '', 'Абиссинская
Американский кёрл
Балинез
Бенгальская
Британская
Бурманская
Девон-рекс
Донской сфинкс
Европейская
Канадский сфинкс
Корниш-рекс
Курильский бобтейл
Ла-перм лаперм
Манчкин
Мейн-кун
Меконгский бобтейл
Невская маскарадная
Норвежская лесная
Ориентальная
Оцикет
Персидская
Петерболд
Русская голубая
Селкирк-рекс
Сиамская
Сибирская
Сингапурская
Сомалийская
Тайская
Турецкая ангора
Уральский рекс
Шотландская
Экзотическая
Японский бобтейл
Другая', '100', 's', '', '1', '0', '1', '339');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('387', '217', 'Вид животного', '', 'Амфибии
Грызуны
Кролики
Лошади
Рептилии
С/х животные
Хорьки
Другое', '100', 's', '', '1', '0', '1', '340');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('388', '154', 'Сфера деятельности', '', 'IT, интернет, телеком
Автомобильный бизнес
Административная работа
Банки, инвестиции
Бухгалтерия, финансы
Высший менеджмент
Госслужба, НКО
ЖКХ, эксплуатация
Искусство, развлечения
Консультирование
Маркетинг, реклама, PR
Медицина, фармацевтика
Образование, наука
Охрана, безопасность
Продажи
Производство, сырьё, с/х
Страхование
Строительство
Транспорт, логистика
Туризм, рестораны
Управление персоналом
Фитнес, салоны красоты
Юриспруденция
Без опыта, студенты', '100', 's', '', '1', '0', '1', '341');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('389', '154', 'График работы', '', 'Полный день
Неполный день
Сменный график
Удалённая работа
Любой', '100', 's', '', '1', '0', '1', '342');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('390', '154', 'Опыт работы, лет', '', '0
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
50', '100', 's', '', '1', '0', '1', '343');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('391', '154', 'Образование', '', 'Высшее
Незаконченное высшее
Среднее
Среднее специальное
Другое', '100', 's', '', '1', '0', '1', '344');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('392', '154', 'Пол', '', 'Мужской
Женский', '100', 's', '', '1', '0', '1', '345');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('393', '154', 'Возраст', '', '18
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
99', '100', 's', '', '1', '0', '1', '346');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('414', '481', 'Тип дома', '', 'Кирпичный
Панельный
Блочный
Монолитный
Деревянный', '100', 's', '', '1', '0', '1', '347');
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
99', '100', 's', '', '1', '0', '1', '348');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('410', '481', 'Срок аренды', '', 'На длительный срок
Месяц
Сутки
Час', '100', 's', '', '1', '0', '1', '349');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('411', '481', 'Комнат в квартире', '', '1
2
3
4
5
6
7
8
9
&gt;9', '100', 's', '', '1', '0', '1', '350');
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
99', '100', 's', '', '1', '0', '1', '351');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('415', '483', 'Срок аренды', '', 'На длительный срок
Месяц
Сутки
Час', '100', 's', '', '1', '0', '1', '352');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('406', '480', 'Комнат в квартире', '', '1
2
3
4
5
6
7
8
9
&gt;9', '100', 's', '', '1', '0', '1', '353');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('407', '480', 'Тип дома', '', 'Кирпичный
Панельный
Блочный
Монолитный
Деревянный', '100', 's', '', '1', '0', '1', '354');
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
99', '100', 's', '', '1', '0', '1', '355');
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
99', '100', 's', '', '1', '0', '1', '356');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('416', '523', 'Тип услуги', '', 'Изготовление ключей
Мелкий бытовой ремонт
Пошив и ремонт одежды
Ремонт и обслуживание 
техники
Ремонт часов
Сборка и ремонт мебели
Уборка, клининг
Установка техники
Химчистка, стирка
Ювелирные услуги
Другое', '100', 's', '', '1', '0', '1', '357');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('417', '524', 'Тип услуги', '', 'Бухгалтерия, финансы
Консультирование
Курьерские услуги
Набор и коррекция текста
Перевод
Юридические услуги', '100', 's', '', '1', '0', '1', '358');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('418', '528', 'Тип услуги', '', 'Аренда оборудования
Монтаж и обслуживание оборудования
Производство, обработка', '100', 's', '', '1', '0', '1', '359');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('419', '533', 'Тип услуги', '', 'Маркетинг, реклама, PR
Полиграфия, дизайн', '100', 's', '', '1', '0', '1', '360');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('420', '536', 'Тип услуги', '', 'Авто на заказ
Автосервис
Аренда спецтехники
Грузоперевозки
Прокат авто
Складские услуги
Такси', '100', 's', '', '1', '0', '1', '361');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('421', '505', 'Тип услуги', '', 'Изготовление ключей
Мелкий бытовой ремонт
Пошив и ремонт одежды
Ремонт и обслуживание 
техники
Ремонт часов
Сборка и ремонт мебели
Уборка, клининг
Установка техники
Химчистка, стирка
Ювелирные услуги
Другие', '100', 's', '', '1', '0', '1', '362');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('422', '506', 'Тип услуги', '', 'Бухгалтерия, финансы
Консультирование
Курьерские услуги
Набор и коррекция текста
Перевод
Юридические услуги
Другие', '100', 's', '', '1', '0', '1', '363');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('423', '510', 'Тип услуги', '', 'Аренда оборудования
Монтаж и обслуживание оборудования
Производство, обработка
Другое', '100', 's', '', '1', '0', '1', '364');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('424', '515', 'Тип услуги', '', 'Маркетинг, реклама, PR
Полиграфия, дизайн
Другое', '100', 's', '', '1', '0', '1', '365');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('425', '518', 'Тип услуги', '', 'Авто на заказ
Автосервис
Аренда спецтехники
Грузоперевозки
Прокат авто
Складские услуги
Такси
Другое', '100', 's', '', '1', '0', '1', '366');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('426', '212', 'Вид бизнеса', '', 'Интернет-магазин
Общественное питание
Производство
Развлечения
Сельское хозяйство
Строительство
Сфера услуг
Торговля
Другое', '100', 's', '', '1', '0', '1', '367');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('427', '211', 'Вид оборудования', '', 'Для магазина
Для офиса
Для ресторана
Для салона красоты
Промышленное
Другое', '100', 's', '', '1', '0', '1', '368');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('428', '173', 'Мощность, л.с.', '', '', '100', 'v', '', '1', '0', '1', '369');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('429', '476', 'Площадь, м²', '', '', '100', 'v', '', '1', '0', '1', '370');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('430', '477', 'Площадь, м²', '', '', '100', 'v', '', '1', '0', '1', '371');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('431', '480', 'Площадь, м²', '', '', '100', 'v', '', '1', '0', '1', '372');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('432', '481', 'Площадь, м²', '', '', '100', 'v', '', '1', '0', '1', '373');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('433', '492', 'Площадь дома, м²', '', '', '100', 'v', '', '1', '0', '1', '374');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('434', '492', 'Площадь участка, соток', '', '', '100', 'v', '', '1', '0', '1', '375');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('435', '493', 'Площадь дома, м²', '', '', '100', 'v', '', '1', '0', '1', '376');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('436', '493', 'Площадь участка, соток', '', '', '100', 'v', '', '1', '0', '1', '377');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('437', '488', 'Площадь, соток', '', '', '100', 'v', '', '1', '0', '1', '378');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('438', '489', 'Площадь, соток', '', '', '100', 'v', '', '1', '0', '1', '379');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('439', '484', 'Площадь, м²', '', '', '100', 'v', '', '1', '0', '1', '380');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('440', '485', 'Площадь, м²', '', '', '100', 'v', '', '1', '0', '1', '381');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('441', '167', 'Желаемая должность', '', '', '500', 'v', '', '2', '0', '1', '382');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('486', '0', 'Фото 4', 'Вы можете загрузить <br />фотографию', '', '1000', 'i', '', '2', '0', '1', '396');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('485', '0', 'Фото 3', 'Вы можете загрузить <br />фотографию', '', '1000', 'i', '', '2', '0', '1', '395');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('484', '0', 'Фото 2', 'Вы можете загрузить <br />фотографию', '', '1000', 'i', '', '2', '0', '1', '394');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('475', '0', 'Телефон', '', '', '100', 'v', 't', '2', '1', '0', '385');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('477', '158', 'Адрес', '', '', '200', 'v', '', '2', '0', '0', '387');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('478', '0', 'Адрес сайта', '', '', '100', 'v', 'u', '2', '0', '0', '388');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('480', '0', 'Видео с YouTube', '', '', '100', 'y', '', '2', '0', '1', '390');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('481', '0', 'Цена', '', '', '0', 'p', '', '2', '0', '1', '391');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('482', '0', 'Торг', '', 'торг', '100', 'c', '', '2', '0', '0', '392');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('483', '0', 'Фото 1', 'jpg, png, gif', 'jpg
GIF
gif
JPG
PNG
png', '1000', 'i', '', '2', '0', '1', '393');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('454', '168', 'Мощность, л.с.', '', '', '100', 'v', '', '1', '0', '1', '383');
INSERT INTO `eboard_fields`(`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES ('492', '0', 'Фото 10', 'Только изображения <br />jpg, png, gif<br />и не более чем 1мб', 'jpg
GIF
gif
JPG
PNG
png', '1000', 'i', '', '2', '0', '1', '402');


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



DROP TABLE IF EXISTS `eboard_ind_region`;
CREATE TABLE `eboard_ind_region` (
  `message` int(11) NOT NULL,
  `cat` int(11) NOT NULL,
  PRIMARY KEY (`message`,`cat`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS `eboard_packages`;
CREATE TABLE `eboard_packages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `days` int(11) NOT NULL,
  `text` varchar(200) NOT NULL,
  `service` int(11) NOT NULL,
  `sort` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

INSERT INTO `eboard_packages`(`id`, `days`, `text`, `service`, `sort`) VALUES ('1', '30', 'Абонемент', '4', '0');


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
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

INSERT INTO `eboard_payments`(`id`, `amount`, `currency`, `user_id`, `message_id`, `service_type`, `time`, `status`) VALUES ('1', '2900', 'rur', '1', '1', 's', '1514223071', '0');


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
) ENGINE=MyISAM AUTO_INCREMENT=122 DEFAULT CHARSET=utf8;

INSERT INTO `eboard_regions`(`id`, `uri`, `name`, `parent`, `ipgeo_field`, `ipgeo_value`, `sort`) VALUES ('121', 'novotroizk', 'Новотроицк', '0', '', '', '2');
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

INSERT INTO `eboard_services`(`id`, `type`, `price`, `min`, `max`, `name`, `field`, `tip`) VALUES ('1', 'm', '0.25', '2', '100', 'Выделение объявления', 'marked', 'Объявление будет выделено цветом');
INSERT INTO `eboard_services`(`id`, `type`, `price`, `min`, `max`, `name`, `field`, `tip`) VALUES ('2', 'r', '0.25', '2', '100', 'Поднятие объявление', 'raised', 'Объявление будет выводится в списке самым первым');
INSERT INTO `eboard_services`(`id`, `type`, `price`, `min`, `max`, `name`, `field`, `tip`) VALUES ('3', 'b', '0.25', '2', '150', 'Вывод в рекламный блок', 'block', 'Объявление будет отображаться в рекламном блоке слева или справа на страницах соответсвующих рубрик');
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
INSERT INTO `eboard_settings`(`id`, `k`, `v`) VALUES ('3', 'title', 'объявления');
INSERT INTO `eboard_settings`(`id`, `k`, `v`) VALUES ('4', 'email', 'developer@itgsystem.ru');
INSERT INTO `eboard_settings`(`id`, `k`, `v`) VALUES ('5', 'autor', '');
INSERT INTO `eboard_settings`(`id`, `k`, `v`) VALUES ('6', 'keywords', '');
INSERT INTO `eboard_settings`(`id`, `k`, `v`) VALUES ('7', 'copyright', '');
INSERT INTO `eboard_settings`(`id`, `k`, `v`) VALUES ('8', 'description', '');
INSERT INTO `eboard_settings`(`id`, `k`, `v`) VALUES ('9', 'onpage', '10');
INSERT INTO `eboard_settings`(`id`, `k`, `v`) VALUES ('10', 'stlb', '2');
INSERT INTO `eboard_settings`(`id`, `k`, `v`) VALUES ('11', 'ind_type', '2');
INSERT INTO `eboard_settings`(`id`, `k`, `v`) VALUES ('12', 'messages_on_ind', '10');
INSERT INTO `eboard_settings`(`id`, `k`, `v`) VALUES ('13', 'raised_on_ind', '0');
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
INSERT INTO `eboard_settings`(`id`, `k`, `v`) VALUES ('30', 'default_message_status', '0');
INSERT INTO `eboard_settings`(`id`, `k`, `v`) VALUES ('31', 'default_order_status', '0');
INSERT INTO `eboard_settings`(`id`, `k`, `v`) VALUES ('32', 'captcha', '1');
INSERT INTO `eboard_settings`(`id`, `k`, `v`) VALUES ('33', 'unreg', '0');
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
INSERT INTO `eboard_settings`(`id`, `k`, `v`) VALUES ('45', 'theme_admin', 'geo');
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
INSERT INTO `eboard_settings`(`id`, `k`, `v`) VALUES ('70', 'prevent_indexing_sort', '0');
INSERT INTO `eboard_settings`(`id`, `k`, `v`) VALUES ('71', 'sms_username', 'developer@itgsystem.ru');
INSERT INTO `eboard_settings`(`id`, `k`, `v`) VALUES ('72', 'sms_password', 'v7C9m4R9p5Fb');
INSERT INTO `eboard_settings`(`id`, `k`, `v`) VALUES ('73', 'sms_sender', 'test');
INSERT INTO `eboard_settings`(`id`, `k`, `v`) VALUES ('74', 'sms_text', 'Код подтверждения: %code%');
INSERT INTO `eboard_settings`(`id`, `k`, `v`) VALUES ('75', 'sms', '1');
INSERT INTO `eboard_settings`(`id`, `k`, `v`) VALUES ('76', 'num_limit', '3');
INSERT INTO `eboard_settings`(`id`, `k`, `v`) VALUES ('77', 'num_limit_on', '0');
INSERT INTO `eboard_settings`(`id`, `k`, `v`) VALUES ('78', 'comment_on', '1');
INSERT INTO `eboard_settings`(`id`, `k`, `v`) VALUES ('79', 'comment_unreg', '1');
INSERT INTO `eboard_settings`(`id`, `k`, `v`) VALUES ('80', 'smtp', '0');
INSERT INTO `eboard_settings`(`id`, `k`, `v`) VALUES ('81', 'smtp_from', 'info@illusionweb.ru');
INSERT INTO `eboard_settings`(`id`, `k`, `v`) VALUES ('82', 'smtp_host', 'smtp.gmail.com');
INSERT INTO `eboard_settings`(`id`, `k`, `v`) VALUES ('83', 'smtp_port', '465');
INSERT INTO `eboard_settings`(`id`, `k`, `v`) VALUES ('84', 'smtp_crypt', 'ssl');
INSERT INTO `eboard_settings`(`id`, `k`, `v`) VALUES ('85', 'smtp_login', '');
INSERT INTO `eboard_settings`(`id`, `k`, `v`) VALUES ('86', 'smtp_password', '');
INSERT INTO `eboard_settings`(`id`, `k`, `v`) VALUES ('87', 'smtp_pop', '');
INSERT INTO `eboard_settings`(`id`, `k`, `v`) VALUES ('90', 'post_filter', '');
INSERT INTO `eboard_settings`(`id`, `k`, `v`) VALUES ('88', 'ipgeo', '0');
INSERT INTO `eboard_settings`(`id`, `k`, `v`) VALUES ('89', 'cron_cssjs', '60');
INSERT INTO `eboard_settings`(`id`, `k`, `v`) VALUES ('91', 'login', '');
INSERT INTO `eboard_settings`(`id`, `k`, `v`) VALUES ('92', 'password', '');
INSERT INTO `eboard_settings`(`id`, `k`, `v`) VALUES ('93', 'pay_funct', '1');
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
INSERT INTO `eboard_settings`(`id`, `k`, `v`) VALUES ('107', 'max_title', '100');
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
INSERT INTO `eboard_settings`(`id`, `k`, `v`) VALUES ('129', 'shop_onpage', '10');
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
INSERT INTO `eboard_settings`(`id`, `k`, `v`) VALUES ('140', 'shop_min_delivery', '50');
INSERT INTO `eboard_settings`(`id`, `k`, `v`) VALUES ('141', 'shop_max_delivery', '1000');
INSERT INTO `eboard_settings`(`id`, `k`, `v`) VALUES ('142', 'shop_min_payment', '50');
INSERT INTO `eboard_settings`(`id`, `k`, `v`) VALUES ('143', 'shop_max_payment', '1000');
INSERT INTO `eboard_settings`(`id`, `k`, `v`) VALUES ('144', 'shop_pay', '1');
INSERT INTO `eboard_settings`(`id`, `k`, `v`) VALUES ('145', 'shop_pay_types', 'a:1:{i:1;a:3:{s:4:\"name\";s:10:\"Месяц\";s:4:\"time\";i:2592000;s:5:\"price\";s:4:\"3000\";}}');
INSERT INTO `eboard_settings`(`id`, `k`, `v`) VALUES ('146', 'shop_status', '1');


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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



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
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

INSERT INTO `eboard_users`(`id`, `email`, `pass`, `date`, `status`, `email_status`, `actions`, `name`, `balance`, `phone`, `identity`, `network`) VALUES ('1', 'ainur.karpiev@yandex.ru', 'f518613843ab362802a80fd557484961', '1514220459', '1', '1', '', 'Айнур', '27000', '', 'http://vk.com/id135578257', 'vkontakte');
INSERT INTO `eboard_users`(`id`, `email`, `pass`, `date`, `status`, `email_status`, `actions`, `name`, `balance`, `phone`, `identity`, `network`) VALUES ('7', 'ainur_karpiev@mail.ru', '8cf2ca9cbb299183156f0c221f20fd9d', '1518040769', '1', '1', '', 'Айнур', '0', '', 'https://www.facebook.com/app_scoped_user_id/911851185568906/', 'facebook');


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

