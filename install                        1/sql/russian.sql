DROP TABLE IF EXISTS `%DB_PREF%articles`;
CREATE TABLE `%DB_PREF%articles` (
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


DROP TABLE IF EXISTS `%DB_PREF%articles_cat`;
CREATE TABLE `%DB_PREF%articles_cat` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `uri` varchar(100) NOT NULL,
  `description` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `%DB_PREF%billing`;
CREATE TABLE `%DB_PREF%billing` (
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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO `%DB_PREF%billing` (`id`, `uri`, `status`, `key1`, `key2`, `key3`, `key4`, `key5`, `text1`, `text2`) VALUES
(8,	'onpay',	'0',	'',	'',	'',	'',	'',	'',	''),
(7,	'sprypay',	'0',	'',	'',	'',	'',	'',	'',	''),
(10,	'robokassa',	'0',	'',	'',	'',	'',	'',	'',	''),
(11,	'smscoin',	'0',	'',	'',	'',	'',	'',	'',	''),
(12,	'wm',	'0',	'',	'',	'',	'',	'',	'',	''),
(13,	'yandex',	'0',	'',	'',	'',	'',	'',	'',	''),
(14,	'unitpay',	'0',	'',	'',	'',	'',	'',	'',	''),
(15,	'paypal',	'0',	'',	'',	'',	'',	'',	'',	''),
(16,	'debug',	'0',	'',	'',	'',	'',	'',	'',	''),
(17,	'interkassa20',	'0',	'',	'',	'',	'',	'',	'',	'');

DROP TABLE IF EXISTS `%DB_PREF%blacklist`;
CREATE TABLE `%DB_PREF%blacklist` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `k` varchar(1) NOT NULL,
  `v` varchar(150) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `%DB_PREF%blocks_db`;
CREATE TABLE `%DB_PREF%blocks_db` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` text,
  `html` text,
  `parent` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO `%DB_PREF%blocks_db` (`id`, `name`, `html`, `parent`) VALUES
(30,	'XML feeds',	'echo \"\n<center>\n<a href=\'\".PATH.\"rss.xml\'><img src=\'\".PATH.\"images/rss20.gif\' width=\'88\' height=\'15\' alt=\'Лента RSS\' border=\'0\'></a>\n<br /><br />\n<a href=\'\".PATH.\"sitemap.xml\'><img src=\'\".PATH.\"images/sitemap.gif\' width=\'88\' height=\'15\' alt=\'Лента RSS\' border=\'0\'></a>\n</center>\n\";',	'php'),
(4,	'Личный кабинет',	'%block_user%',	'html'),
(7,	'Навигация',	'%block_nav%',	''),
(9,	'Облако тегов',	'%block_tags%',	''),
(10,	'Статистика',	'%block_counter%',	''),
(33,	'Изменить оформление',	'%block_templates%',	'html'),
(34,	'Change language',	'%block_language%',	'html'),
(36,	'Рекламные блоки',	'%block_promo%',	'html'),
(37,	'Поиск объявлений',	'%block_search%',	'html');

DROP TABLE IF EXISTS `%DB_PREF%blocks_places`;
CREATE TABLE `%DB_PREF%blocks_places` (
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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO `%DB_PREF%blocks_places` (`id`, `place`, `status`, `from`, `to`, `link`, `reg`, `cat`, `region`, `sort`) VALUES
(1,	'l',	1,	0,	0,	7,	1,	'0',	0,	1),
(2,	'r',	1,	0,	0,	9,	1,	'0',	0,	3),
(3,	'r',	1,	0,	0,	10,	1,	'0',	0,	4),
(5,	'r',	1,	0,	0,	4,	1,	'0',	0,	1),
(20,	'r',	1,	0,	0,	30,	1,	'0',	0,	2),
(24,	'l',	1,	0,	0,	33,	1,	'0',	0,	3),
(25,	'l',	1,	0,	0,	34,	1,	'0',	0,	4),
(27,	'r',	1,	0,	0,	36,	1,	'0',	0,	20),
(28,	'l',	1,	0,	0,	37,	1,	'0',	0,	2);

DROP TABLE IF EXISTS `%DB_PREF%cat`;
CREATE TABLE `%DB_PREF%cat` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uri` varchar(50) NOT NULL,
  `name` varchar(200) NOT NULL,
  `img` varchar(500) NOT NULL,
  `parent` int(10) NOT NULL,
  `sort` int(10) DEFAULT '10000000',
  `description` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO `%DB_PREF%cat` (`id`, `uri`, `name`, `img`, `parent`, `sort`, `description`) VALUES
(1,	'Avtotransport',	'Автотранспорт',	'car.png',	0,	0,	''),
(2,	'Biznes',	'Бизнес',	'cash.png',	0,	14,	''),
(3,	'Zhivotnye-i-rasteniya',	'Животные и растения',	'dog.png',	0,	20,	''),
(4,	'Rabota-i-obrazovanie',	'Работа и образование',	'reunion.png',	0,	101,	''),
(5,	'Nedvizhimost',	'Недвижимость',	'door.png',	0,	50,	''),
(6,	'Odezhda-obuv-aksessuary',	'Одежда, обувь, аксессуары',	'fashion.png',	0,	71,	''),
(7,	'Mobilnye-telefony',	'Мобильные телефоны',	'smartphone.png',	0,	34,	''),
(8,	'Orgtehnika',	'Оргтехника',	'printer.png',	0,	80,	''),
(9,	'Elektronika-i-bytovaya-tehnika',	'Электроника и бытовая техника',	'tv.png',	0,	130,	''),
(10,	'Oborudovanie',	'Оборудование',	'saw.png',	0,	63,	''),
(11,	'Uslugi',	'Услуги',	'telemarketer.png',	0,	119,	''),
(12,	'Stroi-materialy',	'Строй материалы',	'paintcan.png',	0,	106,	''),
(13,	'Mebel-interer-obihod',	'Мебель, интерьер, обиход',	'desk-chair.png',	0,	29,	''),
(14,	'Muzyka-iskusstvo-kollekcii',	'Музыка, искусство, коллекции',	'art.png',	0,	43,	''),
(15,	'Tovary',	'Товары',	'dolly.png',	0,	110,	''),
(16,	'Znakomstva',	'Знакомства',	'heart.png',	0,	25,	''),
(17,	'Drugoe',	'Другое',	'folder.png',	0,	141,	''),
(18,	'inoautos',	'Иномарки',	'ino_avto.jpg',	151,	3,	''),
(19,	'domestic_autos',	'Отечественные Авто',	'',	151,	2,	''),
(153,	'othet_moto',	'Другое',	'',	24,	9,	''),
(21,	'autoservis',	'Автосервис и услуги',	'',	1,	11,	''),
(152,	'buy',	'Покупка авто',	'',	1,	10,	''),
(23,	'autozap',	'Автозапчасти и принадлежности',	'',	1,	12,	''),
(24,	'mototeh',	'Мототехника и другие средства',	'',	151,	4,	''),
(25,	'other_avto',	'Другое',	'',	1,	13,	''),
(26,	'credits',	'Кредиты',	'',	2,	16,	''),
(27,	'partners_search',	'Поиск Партнеров',	'',	2,	18,	''),
(28,	'offers',	'Предложения',	'',	2,	15,	''),
(29,	'sale_and_buying',	'Продажа и Покупка Бизнеса',	'',	2,	19,	''),
(30,	'tenders',	'Тендеры',	'',	2,	17,	''),
(31,	'other',	'Другие животные',	'',	3,	24,	''),
(32,	'plant',	'Комнатные Растения',	'',	3,	23,	''),
(33,	'cats',	'Кошки',	'',	3,	21,	''),
(34,	'dogs',	'Собаки',	'',	3,	22,	''),
(35,	'vakansii',	'Вакансии: поиск сотрудников',	'',	4,	102,	''),
(36,	'rezume',	'Резюме: поиск работы',	'',	4,	104,	''),
(37,	'obrazovanie',	'Образование',	'',	4,	103,	''),
(38,	'drugoe',	'Другое',	'',	4,	105,	''),
(39,	'datcha',	'Дачи, Коттеджи ',	'',	5,	52,	''),
(40,	'lands',	'Земельный участок ',	'',	5,	54,	''),
(41,	'apartmen',	'Комнаты, Квартиры',	'',	5,	56,	''),
(42,	'office',	'Офисы',	'',	5,	61,	''),
(43,	'komnedvig',	'Комерческая недвижимость',	'',	5,	55,	''),
(44,	'zarubeg',	'Зарубежная недвижимость',	'',	5,	53,	''),
(45,	'garag',	'Гаражи и Стоянки',	'',	5,	51,	''),
(46,	'other',	'Прочее',	'',	5,	62,	''),
(47,	'deti',	'Всё для детей ',	'',	6,	74,	''),
(48,	'women',	'Для женщин',	'',	6,	72,	''),
(49,	'men',	'Для мужчин',	'',	6,	73,	''),
(50,	'remont',	'Ремонт и изготовление одежды и обуви',	'',	6,	75,	''),
(51,	'yuvelir',	'Ювелирные изделия',	'',	6,	77,	''),
(52,	'clock',	'Часы',	'',	6,	76,	''),
(53,	'aksesuari',	'Аксессуары',	'',	6,	78,	''),
(54,	'other',	'Другое',	'',	6,	79,	''),
(55,	'accessory',	'Аксессуары',	'',	7,	38,	''),
(56,	'content',	'Контент',	'',	7,	39,	''),
(57,	'telephone',	'Телефоны',	'',	7,	35,	''),
(58,	'racii',	'Рации и переговорные устройства',	'',	7,	40,	''),
(59,	'remont',	'Ремонт и сервис',	'',	7,	41,	''),
(60,	'drugoe',	'Другое',	'',	7,	42,	''),
(61,	'computers',	'Компьютеры',	'',	8,	87,	''),
(62,	'komplekt',	'Комплектующие',	'',	8,	81,	''),
(63,	'printers',	'Принтеры, сканеры, копиры',	'',	8,	94,	''),
(64,	'other',	'Другое',	'',	8,	100,	''),
(65,	'audio',	'Аудио, Видео',	'',	9,	131,	''),
(66,	'pilesosi',	'Пылесосы',	'',	9,	134,	''),
(67,	'kuhonnaya',	'Кухонная техника',	'',	9,	136,	''),
(68,	'stiralnie',	'Стиральные машины',	'',	9,	135,	''),
(69,	'remont',	'Ремонт и сервис',	'',	9,	139,	''),
(70,	'klimat',	'Климатическая техника',	'',	9,	138,	''),
(72,	'glagka',	'Гладильное и швейное оборудование',	'',	9,	137,	''),
(73,	'games',	'Игры, игровые приставки',	'',	9,	132,	''),
(74,	'gps',	'GPS-навигаторы',	'',	9,	133,	''),
(75,	'other',	'Другое',	'',	9,	140,	''),
(76,	'printing_house',	'Для Типографий',	'',	10,	68,	''),
(77,	'office',	'Для офиса',	'',	10,	64,	''),
(78,	'playing',	'Игровые автоматы',	'',	10,	69,	''),
(79,	'industry',	'Промышленного назначения',	'',	10,	65,	''),
(80,	'safety',	'Средство безопасности',	'',	10,	66,	''),
(81,	'sale',	'Торговое об-е',	'',	10,	67,	''),
(82,	'other',	'Другое',	'',	10,	70,	''),
(83,	'webdesign',	'Web дизайн',	'',	11,	120,	''),
(84,	'accounting',	'Бухгалтерские',	'',	11,	121,	''),
(85,	'medical',	'Медицинские',	'',	11,	122,	''),
(86,	'nursemaids',	'Няни, Сиделки',	'',	11,	123,	''),
(87,	'translation',	'Перевод текстов',	'',	11,	124,	''),
(88,	'printing',	'Полиграфия',	'',	11,	125,	''),
(89,	'advancement_site',	'Продвижение сайта',	'',	11,	126,	''),
(90,	'advertisment',	'Реклама',	'',	11,	127,	''),
(91,	'travel',	'Туризм, Путешествия, Отдых',	'',	11,	128,	''),
(92,	'other',	'Другое',	'',	11,	129,	''),
(93,	'varnish',	'Лаки, Краски',	'',	12,	107,	''),
(94,	'saw',	'Пиломатериалы',	'',	12,	108,	''),
(95,	'other',	'Другое',	'',	12,	109,	''),
(96,	'interer',	'Мебель и интерьер',	'',	13,	30,	''),
(97,	'obihod',	'Предметы обихода',	'',	13,	31,	''),
(98,	'remont',	'Ремонт и сервис',	'',	13,	32,	''),
(99,	'other',	'Другое',	'',	13,	33,	''),
(100,	'instrumenti',	'Музыкальные инструменты',	'',	14,	46,	''),
(101,	'proizvedeniya',	'Произведения искусства и антиквариат',	'',	14,	47,	''),
(102,	'audio',	'Аудио-, видеозаписи',	'',	14,	44,	''),
(103,	'kollekciya',	'Коллекционирование',	'',	14,	45,	''),
(104,	'restavraciya',	'Реставрация и сервис',	'',	14,	48,	''),
(105,	'other',	'Другое',	'',	14,	49,	''),
(106,	'cd_dvd',	'CD, DVD Диски',	'',	15,	111,	''),
(107,	'children',	'Детские товары',	'',	15,	112,	''),
(108,	'office',	'Канцелярские товары',	'',	15,	113,	''),
(109,	'beauty',	'Красота и Здоровье',	'',	15,	114,	''),
(110,	'furniture',	'Мебель',	'',	15,	115,	''),
(111,	'oil',	'Нефтепродукты и ГСМ',	'',	15,	116,	''),
(112,	'sport_stock',	'Спорт инвентарь',	'',	15,	117,	''),
(113,	'other',	'Прочее',	'',	15,	118,	''),
(114,	'girls',	'Девушки',	'',	16,	26,	''),
(115,	'men',	'Мужчины',	'',	16,	27,	''),
(116,	'family',	'Семейные пары ',	'',	16,	28,	''),
(151,	'sale',	'Продажа авто',	'',	1,	1,	''),
(119,	'motocikli',	'Мотоциклы и мопеды',	'',	24,	7,	''),
(120,	'kvadro',	'Снегоходы и квадроциклы',	'',	24,	8,	''),
(121,	'vodnii',	'Водный транспорт',	'',	24,	6,	''),
(122,	'avtodoma',	'Автодома, фургоны и легковые прицепы',	'',	24,	5,	''),
(123,	'buying',	'Куплю',	'',	41,	57,	''),
(124,	'sale',	'Продам',	'',	41,	58,	''),
(125,	'sdam',	'Сдам',	'',	41,	59,	''),
(126,	'snimu',	'Сниму',	'',	41,	60,	''),
(127,	'new',	'Новые',	'',	57,	36,	''),
(128,	'used',	'б.у.',	'',	57,	37,	''),
(129,	'noutbook',	'Ноутбуки',	'',	61,	89,	''),
(130,	'netbook',	'Нетбуки',	'',	61,	90,	''),
(131,	'stacionarnie',	'Стационарные',	'',	61,	88,	''),
(132,	'kpk',	'КПК и коммуникаторы',	'',	61,	91,	''),
(133,	'server',	'Серверы',	'',	61,	92,	''),
(134,	'other',	'Другое',	'',	61,	93,	''),
(135,	'monitori',	'Мониторы',	'',	62,	84,	''),
(136,	'videokarts',	'Видео карты, материнские платы',	'',	62,	82,	''),
(137,	'modemi',	'Модемы',	'',	62,	83,	''),
(138,	'setustr',	'Сетевые устройства',	'',	62,	86,	''),
(139,	'other',	'Прочее',	'',	62,	85,	''),
(140,	'print',	'Принтеры',	'',	63,	97,	''),
(141,	'skan',	'Сканеры',	'',	63,	98,	''),
(142,	'kopiri',	'Копиры',	'',	63,	95,	''),
(143,	'faks',	'Факсы',	'',	63,	99,	''),
(144,	'mnofunkcionalnie',	'Многофункциональные устройства',	'',	63,	96,	'');

DROP TABLE IF EXISTS `%DB_PREF%comments`;
CREATE TABLE `%DB_PREF%comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` int(11) NOT NULL,
  `message_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `user_name` varchar(30) NOT NULL,
  `user_email` varchar(30) NOT NULL,
  `text` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `%DB_PREF%counter_cat`;
CREATE TABLE `%DB_PREF%counter_cat` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cat` int(11) NOT NULL,
  `val` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `%DB_PREF%counter_cr`;
CREATE TABLE `%DB_PREF%counter_cr` (
  `region` int(11) DEFAULT '0',
  `cat` int(11) DEFAULT '0',
  `counter` int(11) DEFAULT '0',
  KEY `region_cat` (`region`,`cat`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `%DB_PREF%counter_ip`;
CREATE TABLE `%DB_PREF%counter_ip` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ip` varchar(20) DEFAULT NULL,
  `forvard` varchar(20) NOT NULL,
  `referer` varchar(500) NOT NULL,
  `time` int(11) DEFAULT NULL,
  `page_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO `%DB_PREF%counter_ip` (`id`, `ip`, `forvard`, `referer`, `time`, `page_id`) VALUES
(1,	'84.17.10.130',	'',	'',	NULL,	NULL),
(2,	'66.102.9.59',	'',	'',	NULL,	NULL),
(3,	'66.102.9.61',	'',	'',	NULL,	NULL),
(4,	'95.55.147.226',	'',	'',	NULL,	NULL),
(5,	'66.102.9.63',	'',	'',	NULL,	NULL),
(6,	'66.102.9.45',	'',	'',	NULL,	NULL),
(7,	'66.102.9.47',	'',	'',	NULL,	NULL),
(8,	'66.102.9.43',	'',	'',	NULL,	NULL);

DROP TABLE IF EXISTS `%DB_PREF%counter_pages`;
CREATE TABLE `%DB_PREF%counter_pages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `page` varchar(300) DEFAULT NULL,
  `counter` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `%DB_PREF%counter_vars`;
CREATE TABLE `%DB_PREF%counter_vars` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `var` varchar(10) DEFAULT NULL,
  `value` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO `%DB_PREF%counter_vars` (`id`, `var`, `value`) VALUES
(1,	'hits_all',	'201'),
(2,	'hosts_all',	'11'),
(3,	'day',	'28042017'),
(4,	'hits_today',	'201');

DROP TABLE IF EXISTS `%DB_PREF%cron`;
CREATE TABLE `%DB_PREF%cron` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(10) NOT NULL,
  `period` int(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO `%DB_PREF%cron` (`id`, `name`, `period`) VALUES
(1,	'cron_del',	1493407823),
(2,	'cron_mail',	1493409043),
(3,	'cron_order',	1493409043),
(12,	'cron_cssjs',	1493409043),
(13,	'cron_upd',	1493384452);

DROP TABLE IF EXISTS `%DB_PREF%cron_files`;
CREATE TABLE `%DB_PREF%cron_files` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `file` varchar(20) NOT NULL,
  `mtime` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO `%DB_PREF%cron_files` (`id`, `file`, `mtime`) VALUES
(1,	'lightbox.js',	1260130298),
(2,	'dynamic.js',	1328602266),
(10,	'dynamic_eco.js',	1490356082),
(11,	'dynamic_expresso.js',	1493367401),
(12,	'dynamic_geo.js',	1490172650),
(13,	'dynamic_flame.js',	1492522027),
(14,	'dynamic_aqua.js',	1492514521);

DROP TABLE IF EXISTS `%DB_PREF%db`;
CREATE TABLE `%DB_PREF%db` (
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


DROP TABLE IF EXISTS `%DB_PREF%db_disabled`;
CREATE TABLE `%DB_PREF%db_disabled` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user` int(11) NOT NULL,
  `message` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `%DB_PREF%db_fields`;
CREATE TABLE `%DB_PREF%db_fields` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `message` int(11) NOT NULL,
  `field` int(11) NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ind` (`message`,`field`),
  FULLTEXT KEY `txt` (`value`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `%DB_PREF%db_tags`;
CREATE TABLE `%DB_PREF%db_tags` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `message` int(11) NOT NULL,
  `tag` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ind` (`message`,`tag`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `%DB_PREF%fields`;
CREATE TABLE `%DB_PREF%fields` (
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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO `%DB_PREF%fields` (`id`, `cat`, `name`, `comment`, `values`, `max`, `type`, `type_string`, `req`, `hide`, `block`, `sort`) VALUES
(3,	0,	'Адрес',	'Контактная информация - почтовый адрес',	'',	200,	'v',	'',	2,	0,	1,	3),
(5,	0,	'Прайс-Лист',	'Вы можете прикрепить прайс-лист Вашей организации',	'doc\ndocx\nxls\nxlsx\ntxt\nrtf',	500,	'f',	'',	2,	1,	1,	12),
(6,	0,	'Фото 1',	'Вы можете загрузить фотографию',	'',	500,	'i',	'',	2,	0,	1,	8),
(7,	0,	'Фото 2',	'Вы можете загрузить фотографию',	'',	500,	'i',	'',	2,	0,	1,	9),
(8,	0,	'Фото 3',	'Вы можете загрузить фотографию',	'',	500,	'i',	'',	2,	0,	1,	10),
(16,	0,	'Адрес сайта',	'Укажите адрес Вашего сайта',	'',	100,	'v',	'u',	2,	0,	1,	7),
(14,	0,	'Телефон',	'Контактная информация - номер телефона',	'',	100,	'v',	't',	2,	1,	1,	4),
(17,	0,	'Характер объявления',	'Спрос или предложение?',	'спрос\nпредложение',	0,	'r',	'',	2,	0,	1,	1),
(18,	0,	'Фото 4',	'Вы можете загрузить фотографию',	'',	500,	'i',	'',	2,	0,	1,	11),
(30,	0,	'Демонстрационное видео с YouTube',	'Укажите ссылку на Ваш видео-ролик с YouTube',	'',	100,	'y',	'',	2,	0,	1,	13),
(39,	0,	'Цена',	'Укажите стоимость товара или услуги',	'',	0,	'p',	'',	2,	0,	1,	2);

DROP TABLE IF EXISTS `%DB_PREF%images`;
CREATE TABLE `%DB_PREF%images` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent` int(5) NOT NULL,
  `file` varchar(256) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `%DB_PREF%mailing_db`;
CREATE TABLE `%DB_PREF%mailing_db` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `time` int(11) NOT NULL,
  `title` varchar(200) NOT NULL,
  `text` text NOT NULL,
  `single` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO `%DB_PREF%mailing_db` (`id`, `time`, `title`, `text`, `single`) VALUES
(1,	3,	'Ваше объявление на сайте %title%',	'<p>Здравствуйте, %user%,</p>\r\n<p>Вы добавили объявление %message_title% на сайт %title%,</p>\r\n<p>спасибо, что воспользовались нашими услугами. Ссылка на Ваше объявление:</p>\r\n<p>%link%</p>\r\n<p>Со временем, объявление уходит вниз в общем списке, поэтому Вы можете воспользоваться дополнительными услугами, чтобы увеличить количество просмотров объявления.</p>',	0),
(2,	7,	'Уже неделю у нас размещено объявление &quot;%message_title%&quot;',	'<p>Здравствуйте, %user%,</p>\r\n<p>спасибо, что добавили объявление на сайт %title%.</p>\r\n<p>Если объявление ещё актуально&nbsp; Вы можете  воспользоваться дополнительными услугами, чтобы увеличить количество  просмотров объявления: поднять объявление в общем списке, выделить цветом или вынести в отдельный рекламны блок.</p>\r\n<p>Ссылка на Ваше объявление:</p>\r\n<p>%link%</p>',	0),
(3,	14,	'Прошло 2 недели с момента публикации',	'<p>Здравствуйте, %user%,</p>\r\n<p>уже прошло две денели с момента публикации объявления %message_title% на сайт %title%.</p>\r\n<p>Если объявление ещё актуально&nbsp; Вы можете  воспользоваться дополнительными услугами, чтобы увеличить количество  просмотров объявления: поднять объявление в общем списке, выделить цветом или вынести в отдельный рекламны блок.</p>\r\n<p>Ссылка на Ваше объявление:</p>\r\n<p>%link%</p>',	0),
(4,	30,	'Прошёл месяц с момента публикации &quot;%message_title%&quot;',	'<p>Здравствуйте, %user%,</p>\r\n<p>месяц тому назад Вы опубликовали объявление %message_title% на сайте %title%</p>\r\n<p>Если объявление ещё актуально&nbsp; Вы можете  воспользоваться дополнительными услугами, чтобы увеличить количество  просмотров объявления: поднять объявление в общем списке, выделить цветом или вынести в отдельный рекламны блок.</p>\r\n<p>Ссылка на Ваше объявление:</p>\r\n<p>%link%</p>',	0),
(5,	0,	'Вы зарегистрированы на сайте %title%',	'<p>Здравствуйте, %user%,</p>\r\n<p>Вы зарегистрированы на сайте %title%. Позвольте напомнить, что Вы всё ещё можете воспользоваться услугами нашего сервиса.</p>',	1);

DROP TABLE IF EXISTS `%DB_PREF%mailing_queue`;
CREATE TABLE `%DB_PREF%mailing_queue` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `db` int(11) NOT NULL,
  `message` int(11) NOT NULL,
  `email` varchar(100) NOT NULL,
  `title` varchar(200) NOT NULL,
  `text` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `%DB_PREF%mailing_sended`;
CREATE TABLE `%DB_PREF%mailing_sended` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `db` int(11) NOT NULL,
  `message` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `db` (`db`,`message`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `%DB_PREF%mailing_unsubscribe`;
CREATE TABLE `%DB_PREF%mailing_unsubscribe` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `%DB_PREF%modules`;
CREATE TABLE `%DB_PREF%modules` (
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


DROP TABLE IF EXISTS `%DB_PREF%msg`;
CREATE TABLE `%DB_PREF%msg` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `text` text,
  `type` varchar(100) DEFAULT NULL,
  `comments` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO `%DB_PREF%msg` (`id`, `text`, `type`, `comments`) VALUES
(4,	'<p align=\"left\">Здравствуйте, %user%!</p>\r\n<p align=\"left\">Кто-то, возможно Вы, сделал запрос на смену пароля Вашего аккаунта на сайте %title%.</p>\r\n<p align=\"left\"><em>Для смены пароля пройдите по ссылке:</em></p>\r\n<p align=\"left\">%link%</p>',	'password_recovery',	'376'),
(2,	'<p align=\"left\">Здравствуйте, %user%! <br />\r\nДобро пожаловать на сайт %title%!</p>\r\n<p align=\"left\">Чтобы активировать аккаунт и подтвердить свой адрес электронной почты, нажмите на эту ссылку:</p>\r\n<p align=\"left\">%link%</p>',	'reg_check',	'377'),
(5,	'<p align=\"left\">Здравствуйте, %user%!</p>\r\n<p align=\"left\">Истекает срок публикации Вашего объявления %message_title% на сайте %title%.</p>\r\n<p align=\"left\">Объявление будет удалено через %days% дней.</p>\r\n<p align=\"left\">Для смены продления срока публикации пройдите по ссылке:</p>\r\n<p align=\"left\">%link%</p>',	'del_mess',	'378'),
(6,	'<p align=\"left\">Здравствуйте,</p>\r\n<p align=\"left\">ставим Вас в известность, что на Ваше сообщение &laquo;<a href=\"%message_link%\">%message_title%</a>&raquo; на сайте %title% пришёл ответ.</p>\r\n<p>&nbsp;</p>\r\n<p align=\"left\">Отправитель: <b>%name%</b></p>\r\n<p align=\"left\">E-mail: <b>%email%</b></p>\r\n<p align=\"center\"><strong>Текст сообщения</strong></p>\r\n<hr />\r\n<p>%message%</p>',	'reply',	'379'),
(7,	'<p align=\"left\">Здравствуйте, %user%,</p>\r\n<p align=\"left\">ставим Вас в известность, что на Вам пришло сообщение с cайта %title%.</p>\r\n<p>&nbsp;</p>\r\n<p align=\"left\">Отправитель: <b>%name%</b></p>\r\n<p align=\"left\">E-mail: <b>%email%</b></p>\r\n<p align=\"center\"><strong>Текст сообщения</strong></p>\r\n<hr />\r\n<p>%message%</p>',	'message2user',	'774'),
(8,	'<p align=\"left\">Здравствуйте, %user%,</p>\r\n<p align=\"left\">ставим Вас в известность, что на Ваше объявление %message% на сайте %title% одобрено модератором и опубликовано</p>',	'message_allowed',	'923'),
(9,	'<p align=\"left\">Здравствуйте, %user%,</p>\r\n<p align=\"left\">ставим Вас в известность, что на Ваше объявление %message% на сайте %title% отклонено модератором</p>',	'message_denied',	'924'),
(10,	'<p style=\"text-align: center;\">Автоматическая система биллинга отключена.</p>\r\n<p style=\"text-align: center;\">Вы можете пополнить баланс личного счёта, уточнив реквизиты у администратора.</p>',	'pay_none',	'630'),
(11,	'\r\n<p>Здравствуйте, %user%!</p>\r\n\r\n<p>Истек срок действия услуги %service% для объявления %message_title% на сайте %title%:</p>\r\n<p>Для повторного заказа услуги пройдите по ссылке:</p>\r\n\r\n<p>%link%</p>\r\n\r\n<p>--</p>\r\n\r\n<p>%unsubscribe%</p>\r\n',	'email_update',	'1102'),
(12,	'\r\n<p>Здравствуйте, %user%!</p>\r\n\r\n<p>Истекает срок публикации Ваших объявлений на сайте %title%:</p>\r\n%messages%\r\n<p>Для продления срока публикации объявлений пройдите по ссылке:</p>\r\n\r\n<p>%link%</p>\r\n\r\n<p>--</p>\r\n\r\n<p>%unsubscribe%</p>\r\n',	'del_mess_all',	'1090');

DROP TABLE IF EXISTS `%DB_PREF%nav`;
CREATE TABLE `%DB_PREF%nav` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `status` int(1) DEFAULT '0',
  `name` varchar(300) NOT NULL,
  `url` varchar(300) NOT NULL,
  `sort` int(11) NOT NULL DEFAULT '1000000',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO `%DB_PREF%nav` (`id`, `status`, `name`, `url`, `sort`) VALUES
(6,	9,	'Регистрация',	'%_PATH_%users/register/',	4),
(7,	8,	'Личный кабинет',	'%_PATH_%users/',	5),
(9,	2,	'Панель администрирования',	'%_PATH_%admin/',	7),
(10,	0,	'Добавить объявление',	'%_PATH_%add/',	6),
(37,	0,	'Магазины',	'%_PATH_%shops/',	3),
(36,	0,	'Статьи',	'%_PATH_%articles/',	2),
(34,	0,	'На главную',	'%_PATH_%',	1);

DROP TABLE IF EXISTS `%DB_PREF%news`;
CREATE TABLE `%DB_PREF%news` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `md` varchar(20) DEFAULT NULL,
  `time` int(11) NOT NULL,
  `cat` int(11) NOT NULL,
  `name` varchar(200) DEFAULT NULL,
  `ann` text,
  `text` text,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `%DB_PREF%news_cat`;
CREATE TABLE `%DB_PREF%news_cat` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `md` varchar(20) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `uri` varchar(50) DEFAULT NULL,
  `sort` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `%DB_PREF%orders`;
CREATE TABLE `%DB_PREF%orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `time_end` int(11) NOT NULL,
  `days` int(11) NOT NULL,
  `type` varchar(1) NOT NULL,
  `message_id` int(11) NOT NULL,
  `status` int(1) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `%DB_PREF%packages`;
CREATE TABLE `%DB_PREF%packages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `days` int(11) NOT NULL,
  `text` varchar(200) CHARACTER SET utf8 NOT NULL,
  `service` int(11) NOT NULL,
  `sort` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `%DB_PREF%pay`;
CREATE TABLE `%DB_PREF%pay` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` varchar(100) NOT NULL,
  `user_id` int(11) NOT NULL,
  `time` int(11) NOT NULL,
  `type` varchar(1) NOT NULL,
  `pay` float DEFAULT NULL,
  `rest` float DEFAULT NULL,
  `comments` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `%DB_PREF%payments`;
CREATE TABLE `%DB_PREF%payments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `amount` float DEFAULT NULL,
  `currency` varchar(5) NOT NULL,
  `user_id` int(11) NOT NULL,
  `message_id` int(11) NOT NULL,
  `service_type` varchar(1) NOT NULL,
  `time` int(11) NOT NULL,
  `status` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `%DB_PREF%rates`;
CREATE TABLE `%DB_PREF%rates` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `numcode` int(11) NOT NULL,
  `charcode` varchar(10) NOT NULL,
  `name` varchar(20) NOT NULL,
  `text` varchar(150) NOT NULL,
  `def` int(1) NOT NULL,
  `value` float NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO `%DB_PREF%rates` (`id`, `numcode`, `charcode`, `name`, `text`, `def`, `value`) VALUES
(1,	0,	'rur',	'рубли',	'рубль,рубля,рублей',	1,	1),
(2,	0,	'usd',	'доллары США',	'доллар,доллара,долларов',	0,	56.5),
(3,	0,	'eur',	'евро',	'евро,евро,евро',	0,	62);

DROP TABLE IF EXISTS `%DB_PREF%regions`;
CREATE TABLE `%DB_PREF%regions` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `uri` varchar(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `parent` int(5) DEFAULT NULL,
  `ipgeo_field` varchar(1) NOT NULL,
  `ipgeo_value` varchar(100) NOT NULL,
  `sort` int(10) NOT NULL DEFAULT '10000000',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO `%DB_PREF%regions` (`id`, `uri`, `name`, `parent`, `ipgeo_field`, `ipgeo_value`, `sort`) VALUES
(1,	'Russia',	'Россия',	0,	's',	'RU',	0),
(2,	'spb',	'Санкт-Петербург',	1,	'c',	'Северо-Западный федеральный округ/Санкт-Петербург/Санкт-Петербург',	2),
(3,	'Moscow',	'Москва',	1,	'c',	'Центральный федеральный округ/Москва/Москва',	1),
(22,	'Kabardino-Balkariya',	'Кабардино-Балкария',	1,	'r',	'Северо-Кавказский федеральный округ/Республика Кабардино-Балкария',	9),
(16,	'Adygeya',	'Адыгея',	1,	'r',	'Южный федеральный округ/Республика Адыгея',	3),
(17,	'Bashkortostan',	'Башкортостан',	1,	'r',	'Приволжский федеральный округ/Республика Башкортостан',	4),
(20,	'Dagestan',	'Дагестан',	1,	'r',	'Северо-Кавказский федеральный округ/Республика Дагестан',	7),
(18,	'Buryatiya',	'Бурятия',	1,	'r',	'Сибирский федеральный округ/Республика Бурятия',	5),
(19,	'Altai',	'Алтай',	1,	'r',	'Сибирский федеральный округ/Алтайский край',	6),
(21,	'Ingushetiya',	'Ингушетия',	1,	'r',	'Северо-Кавказский федеральный округ/Республика Ингушетия',	8),
(23,	'Kalmykiya',	'Калмыкия',	1,	'r',	'Южный федеральный округ/Республика Калмыкия',	10),
(24,	'Karachaevo-Cherkesiya',	'Карачаево-Черкесия',	1,	'r',	'Северо-Кавказский федеральный округ/Республика Карачаево-Черкессия',	11),
(25,	'Kareliya',	'Карелия',	1,	'r',	'Северо-Западный федеральный округ/Республика Карелия',	12),
(26,	'Komi',	'Коми',	1,	'r',	'Северо-Западный федеральный округ/Республика Коми',	13),
(27,	'Marii_El',	'Марий Эл',	1,	'r',	'Приволжский федеральный округ/Республика Марий-Эл',	14),
(28,	'Mordoviya',	'Мордовия',	1,	'r',	'Приволжский федеральный округ/Республика Мордовия',	15),
(29,	'Saha_(Yakutiya)',	'Саха (Якутия)',	1,	'r',	'Дальневосточный федеральный округ/Республика Саха (Якутия)',	16),
(30,	'Severnaya_Osetiya',	'Северная Осетия',	1,	'r',	'Северо-Кавказский федеральный округ/Республика Северная Осетия (Алания)',	17),
(31,	'Tyva_(Tuva)',	'Тыва (Тува)',	1,	'r',	'Сибирский федеральный округ/Республика Тыва (Тува)',	18),
(32,	'Udmurtskaya_Respublika',	'Удмуртская Республика',	1,	'r',	'Приволжский федеральный округ/Республика Удмуртия',	19),
(33,	'Hakasiya',	'Хакасия',	1,	'r',	'Сибирский федеральный округ/Республика Хакасия',	20),
(34,	'Chechenskaya_Respublika',	'Чеченская Республика',	1,	'r',	'Северо-Кавказский федеральный округ/Республика Чечня',	21),
(35,	'Chuvashskaya_Respublika',	'Чувашская Республика',	1,	'r',	'Приволжский федеральный округ/Республика Чувашия',	22),
(36,	'Altaiskii_krai',	'Алтайский край',	1,	'r',	'Сибирский федеральный округ/Алтайский край',	23),
(37,	'Krasnodarskii_krai',	'Краснодарский край',	1,	'r',	'Южный федеральный округ/Краснодарский край',	24),
(38,	'Krasnoyarskii_krai',	'Красноярский край',	1,	'r',	'Сибирский федеральный округ/Красноярский край',	25),
(39,	'Primorskii_krai',	'Приморский край',	1,	'r',	'Дальневосточный федеральный округ/Приморский край',	26),
(40,	'Stavropolskii_krai',	'Ставропольский край',	1,	'r',	'Северо-Кавказский федеральный округ/Ставропольский край',	27),
(41,	'Habarovskii_krai',	'Хабаровский край',	1,	'r',	'Дальневосточный федеральный округ/Хабаровский край',	28),
(42,	'Amurskaya_oblast',	'Амурская область',	1,	'r',	'Дальневосточный федеральный округ/Амурская область',	29),
(43,	'Arhangelskaya_oblast',	'Архангельская область',	1,	'r',	'Северо-Западный федеральный округ/Архангельская область',	30),
(44,	'Astrahanskaya_oblast',	'Астраханская область',	1,	'r',	'Южный федеральный округ/Астраханская область',	31),
(45,	'Belgorodskaya_oblast',	'Белгородская область',	1,	'r',	'Центральный федеральный округ/Белгородская область',	32),
(46,	'Bryanskaya_oblast',	'Брянская область',	1,	'r',	'Центральный федеральный округ/Брянская область',	33),
(47,	'Vladimirskaya_oblast',	'Владимирская область',	1,	'r',	'Центральный федеральный округ/Владимирская область',	34),
(48,	'Volgogradskaya_oblast',	'Волгоградская область',	1,	'r',	'Южный федеральный округ/Волгоградская область',	35),
(49,	'Vologodskaya_oblast',	'Вологодская область',	1,	'r',	'Северо-Западный федеральный округ/Вологодская область',	36),
(50,	'Voronezhskaya_oblast',	'Воронежская область',	1,	'r',	'Центральный федеральный округ/Воронежская область',	37),
(51,	'Ivanovskaya_oblast',	'Ивановская область',	1,	'r',	'Центральный федеральный округ/Ивановская область',	38),
(52,	'Irkutskaya_oblast',	'Иркутская область',	1,	'r',	'Сибирский федеральный округ/Иркутская область',	39),
(53,	'Kaliningradskaya_oblast',	'Калининградская область',	1,	'r',	'Северо-Западный федеральный округ/Калининградская область',	40),
(54,	'Kaluzhskaya_oblast',	'Калужская область',	1,	'r',	'Центральный федеральный округ/Калужская область',	41),
(55,	'Kamchatskaya_oblast',	'Камчатская область',	1,	'r',	'Дальневосточный федеральный округ/Камчатский край',	43),
(56,	'Kemerovskaya_oblast',	'Кемеровская область',	1,	'r',	'Сибирский федеральный округ/Кемеровская область',	42),
(57,	'Kirovskaya_oblast',	'Кировская область',	1,	'r',	'Приволжский федеральный округ/Кировская область',	44),
(58,	'Kostromskaya_oblast',	'Костромская область',	1,	'r',	'Центральный федеральный округ/Костромская область',	45),
(59,	'Kurganskaya_oblast',	'Курганская область',	1,	'r',	'Уральский федеральный округ/Курганская область',	46),
(60,	'Kurskaya_oblast',	'Курская область',	1,	'r',	'Центральный федеральный округ/Курская область',	47),
(61,	'Leningradskaya_oblast',	'Ленинградская область',	1,	'r',	'Северо-Западный федеральный округ/Ленинградская область',	48),
(62,	'Lipeckaya_oblast',	'Липецкая область',	1,	'r',	'Центральный федеральный округ/Липецкая область',	49),
(63,	'Magadanskaya_oblast',	'Магаданская область',	1,	'r',	'Дальневосточный федеральный округ/Магаданская область',	50),
(64,	'Moskovskaya_oblast',	'Московская область',	1,	'r',	'Центральный федеральный округ/Московская область',	51),
(65,	'Murmanskaya_oblast',	'Мурманская область',	1,	'r',	'Северо-Западный федеральный округ/Мурманская область',	52),
(66,	'Nizhegorodskaya_oblast',	'Нижегородская область',	1,	'r',	'Приволжский федеральный округ/Нижегородская область',	53),
(67,	'Novgorodskaya_oblast',	'Новгородская область',	1,	'r',	'Северо-Западный федеральный округ/Новгородская область',	54),
(68,	'Novosibirskaya_oblast',	'Новосибирская область',	1,	'r',	'Сибирский федеральный округ/Новосибирская область',	55),
(69,	'Omskaya_oblast',	'Омская область',	1,	'r',	'Сибирский федеральный округ/Омская область',	56),
(70,	'Orenburgskaya_oblast',	'Оренбургская область',	1,	'r',	'Приволжский федеральный округ/Оренбургская область',	57),
(71,	'Orlovskaya_oblast',	'Орловская область',	1,	'r',	'Центральный федеральный округ/Орловская область',	58),
(72,	'Penzenskaya_oblast',	'Пензенская область',	1,	'r',	'Приволжский федеральный округ/Пензенская область',	59),
(73,	'Permskii_krai',	'Пермский край',	1,	'r',	'Приволжский федеральный округ/Пермский край',	60),
(74,	'Pskovskaya_oblast',	'Псковская область',	1,	'r',	'Приволжский федеральный округ/Пермский край',	61),
(75,	'Rostovskaya_oblast',	'Ростовская область',	1,	'r',	'Южный федеральный округ/Ростовская область',	62),
(76,	'Ryazanskaya_oblast',	'Рязанская область',	1,	'r',	'Центральный федеральный округ/Рязанская область',	63),
(77,	'Samarskaya_oblast',	'Самарская область',	1,	'r',	'Приволжский федеральный округ/Самарская область',	64),
(78,	'Saratovskaya_oblast',	'Саратовская область',	1,	'r',	'Приволжский федеральный округ/Саратовская область',	65),
(79,	'Sahalinskaya_oblast',	'Сахалинская область',	1,	'r',	'Дальневосточный федеральный округ/Сахалинская область',	66),
(80,	'Sverdlovskaya_oblast',	'Свердловская область',	1,	'r',	'Уральский федеральный округ/Свердловская область',	67),
(81,	'Smolenskaya_oblast',	'Смоленская область',	1,	'r',	'Центральный федеральный округ/Смоленская область',	68),
(82,	'Tambovskaya_oblast',	'Тамбовская область',	1,	'r',	'Центральный федеральный округ/Тамбовская область',	69),
(83,	'Tverskaya_oblast',	'Тверская область',	1,	'r',	'Центральный федеральный округ/Тверская область',	70),
(84,	'Tomskaya_oblast',	'Томская область',	1,	'r',	'Сибирский федеральный округ/Томская область',	71),
(85,	'Tulskaya_oblast',	'Тульская область',	1,	'r',	'Центральный федеральный округ/Тульская область',	72),
(86,	'Tyumenskaya_oblast',	'Тюменская область',	1,	'r',	'Уральский федеральный округ/Тюменская область',	73),
(87,	'Ulyanovskaya_oblast',	'Ульяновская область',	1,	'r',	'Приволжский федеральный округ/Ульяновская область',	74),
(88,	'Chelyabinskaya_oblast',	'Челябинская область',	1,	'r',	'Уральский федеральный округ/Челябинская область',	75),
(118,	'Zabaikalskii-krai',	'Забайкальский край',	1,	'r',	'Сибирский федеральный округ/Забайкальский край',	82),
(90,	'Yaroslavskaya_oblast',	'Ярославская область',	1,	'r',	'Центральный федеральный округ/Ярославская область',	76),
(93,	'Evreiskaya_avtonomnaya_oblast',	'Еврейская автономная область',	1,	'r',	'Дальневосточный федеральный округ/Еврейская автономная область',	77),
(97,	'Neneckii_AO',	'Ненецкий АО',	1,	'r',	'Северо-Западный федеральный округ/Ненецкий автономный округ',	78),
(100,	'Hanty-Mansiiskii_AO',	'Ханты-Мансийский АО',	1,	'r',	'Уральский федеральный округ/Ханты-Мансийский автономный округ',	79),
(101,	'Chukotskii_AO',	'Чукотский АО',	1,	'r',	'Дальневосточный федеральный округ/Чукотский автономный округ',	80),
(103,	'Yamalo-Neneckii_AO',	'Ямало-Ненецкий АО',	1,	'r',	'Уральский федеральный округ/Ямало-Ненецкий автономный округ',	81),
(104,	'Ukraina',	'Украина',	0,	's',	'UA',	83),
(105,	'Belorussiya',	'Белоруссия',	0,	's',	'BY',	84),
(106,	'Azerbaidzhan',	'Азербайджан',	0,	's',	'AZ',	93),
(107,	'Armeniya',	'Армения',	0,	's',	'AM',	92),
(108,	'Kazahstan',	'Казахстан',	0,	's',	'KZ',	91),
(109,	'Kirgiziya',	'Киргизия',	0,	's',	'KG',	90),
(110,	'Moldaviya',	'Молдавия',	0,	's',	'MD',	89),
(111,	'Tadzhikistan',	'Таджикистан',	0,	's',	'TJ',	88),
(112,	'Uzbekistan',	'Узбекистан',	0,	's',	'UZ',	87),
(113,	'Turkmeniya',	'Туркмения',	0,	's',	'TM',	86),
(114,	'Gruziya',	'Грузия',	0,	's',	'GE',	85),
(115,	'other_region',	'Другое',	0,	'',	'',	94);

DROP TABLE IF EXISTS `%DB_PREF%seo`;
CREATE TABLE `%DB_PREF%seo` (
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


DROP TABLE IF EXISTS `%DB_PREF%services`;
CREATE TABLE `%DB_PREF%services` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(1) NOT NULL,
  `price` float DEFAULT NULL,
  `min` int(11) NOT NULL,
  `max` int(11) NOT NULL,
  `name` varchar(200) NOT NULL,
  `field` varchar(100) NOT NULL,
  `tip` varchar(300) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO `%DB_PREF%services` (`id`, `type`, `price`, `min`, `max`, `name`, `field`, `tip`) VALUES
(1,	'm',	0.25,	2,	100,	'Выделение объявления',	'marked',	'Объявление будет выделено цветом'),
(2,	'r',	0.25,	2,	100,	'Поднятие объявление',	'raised',	'Объявление будет выводится в списке самым первым'),
(3,	'b',	0.25,	2,	150,	'Вывод в рекламный блок',	'block',	'Объявление будет отображаться в рекламном блоке слева или справа на страницах соответсвующих рубрик'),
(4,	'a',	0.25,	3,	1000,	'Публикация объявления',	'active',	'Объявление будет опубликовано в течении заданного срока');

DROP TABLE IF EXISTS `%DB_PREF%settings`;
CREATE TABLE `%DB_PREF%settings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `k` varchar(100) NOT NULL,
  `v` text,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO `%DB_PREF%settings` (`id`, `k`, `v`) VALUES
(50,	'',	''),
(2,	'locale',	'russian'),
(3,	'title',	'Elite-Board 2.3'),
(4,	'email',	'info@illusionweb.ru'),
(5,	'autor',	'Illusionweb'),
(6,	'keywords',	'скрипт доски объявлений, доска объявлений'),
(7,	'copyright',	'Скрипт коммерческой доски объявлений Elite-Board 2'),
(8,	'description',	'illusionweb.ru'),
(9,	'onpage',	'10'),
(10,	'stlb',	'2'),
(11,	'ind_type',	'3'),
(12,	'messages_on_ind',	'10'),
(13,	'raised_on_ind',	'1'),
(14,	'subscribe',	'1'),
(15,	'max_subscribe',	'3'),
(16,	'randtime',	'0'),
(17,	'max_text',	'2000'),
(18,	'sendmail_days',	'5'),
(19,	'del_files',	'1'),
(20,	'theme',	'eco'),
(21,	'site_address',	'illusionweb.org'),
(22,	'patch',	''),
(44,	'admin_password',	'c4ca4238a0b923820dcc509a6f75849b'),
(24,	'charset',	'utf-8'),
(25,	'logo',	'eliteboard.png'),
(26,	'middle_block',	'5'),
(27,	'message_block_position',	'lb'),
(28,	'rand',	'Elite Board 2.0'),
(29,	'default_user_status',	'0'),
(30,	'default_message_status',	'0'),
(31,	'default_order_status',	'0'),
(32,	'captcha',	'1'),
(33,	'unreg',	'1'),
(34,	'make_meta',	'1'),
(35,	'fckeditor',	'1'),
(36,	'img_big_width',	'800'),
(37,	'img_big_height',	'600'),
(38,	'img_small_width',	'400'),
(39,	'img_small_height',	'300'),
(40,	'merchant',	'none'),
(41,	'mrh_pass1',	''),
(42,	'mrh_pass2',	''),
(43,	'admin_login',	'admin'),
(45,	'theme_admin',	'geo'),
(46,	'error_reporting',	'E_ALL'),
(47,	'caching',	'0'),
(48,	'deleted_keywords',	''),
(49,	'cortime',	'0'),
(51,	'license_key',	'%license_key%'),
(52,	'default_user_balance',	'100'),
(53,	'spshopid',	''),
(54,	'spsecretkey',	''),
(55,	'currency',	'rur'),
(56,	'block_all',	'1'),
(57,	'default_block_status',	'0'),
(58,	'yaapi',	''),
(59,	'randtime2',	'100'),
(60,	'cron_del',	'3600'),
(61,	'cron_mail',	'300'),
(62,	'cron_order',	'300'),
(63,	'orders_fill',	'ON'),
(64,	'onpage_users',	'20'),
(65,	'rand_block',	'10'),
(66,	'message_block_type',	'2'),
(67,	'active_service',	'0'),
(68,	'prevent_indexing_cat',	'0'),
(69,	'prevent_indexing_region',	'0'),
(70,	'prevent_indexing_sort',	'0'),
(71,	'sms_username',	'test'),
(72,	'sms_password',	'test'),
(73,	'sms_sender',	'test'),
(74,	'sms_text',	'Код подтверждения: %code%'),
(75,	'sms',	'0'),
(76,	'num_limit',	'3'),
(77,	'num_limit_on',	'0'),
(78,	'comment_on',	'1'),
(79,	'comment_unreg',	'1'),
(80,	'smtp',	'0'),
(81,	'smtp_from',	'info@illusionweb.ru'),
(82,	'smtp_host',	'smtp.gmail.com'),
(83,	'smtp_port',	'465'),
(84,	'smtp_crypt',	'ssl'),
(85,	'smtp_login',	''),
(86,	'smtp_password',	''),
(87,	'smtp_pop',	''),
(90,	'post_filter',	''),
(88,	'ipgeo',	'1'),
(89,	'cron_cssjs',	'60'),
(91,	'login',	''),
(92,	'password',	''),
(93,	'pay_funct',	'1'),
(94,	'uploadtype',	'1'),
(95,	'approve_text',	'НЕ ПРОВЕРЕНО! Это объявление ещё не проверено модератором сайта. Администрация не несет ответственности за содержание, достоверность и точность материалов, опубликованных пользователями.'),
(96,	'160526',	'1'),
(97,	'closed_info',	'Сайт закрыт на обслуживание. Приносим извинения за временные неудобства!'),
(98,	'closed_time',	'2017/05/01 00:00:00'),
(99,	'captcha_type',	'2'),
(100,	'captcha_complexity',	'4'),
(101,	'license_text',	'Все материалы, добавляемые на сайт, становятся собственностью сайта и администрация сайта имеет право использовать все тексты и медиа материалы в своих нуждах. Вся ответственность за содержание объявлений в полном объёме возлагается на авторов объявлений. Администрация сайта оставляет за собой право удалять и редактировать объявление без уведомления автора объявления и без объяснения причин.\r\nВы согласны получать смс и/или email сообщения от администрации сайта. \r\nВы подтверждаете свое согласие на обработку персональных данных: сбор, систематизацию, накопление, хранение, уточнение (обновление, изменение), использование, передачу, блокирование, обезличивание, уничтожение. Срок действия Вашего согласия является неограниченным.\r\n\r\nК публикации запрещается:\r\n- информация, нарушающая законы Российской Федерации;\r\n- одинаковые объявления;\r\n- объявления содержащие заведомо ложную информацию.'),
(102,	'license_tpl',	''),
(103,	'cache',	'0'),
(104,	'memcache_host',	'127.0.0.1'),
(105,	'memcache_port',	'11211'),
(106,	'update_days',	'7'),
(107,	'max_title',	'100'),
(108,	'ulogin',	'0'),
(109,	'default_comment_status',	'0'),
(110,	'cache_region_tree',	'0'),
(111,	'optimized_query',	'0'),
(112,	'cache_query',	'0'),
(113,	'update_allow',	'0'),
(114,	'email_orders',	'0'),
(115,	'shop',	'1'),
(116,	'sharing',	'1'),
(117,	'closed',	'0'),
(118,	'importcsv',	'a:8:{s:8:\"def_user\";i:0;s:7:\"def_cat\";i:24;s:10:\"def_region\";i:2;s:3:\"pub\";i:365;s:4:\"html\";i:1;s:2:\"br\";i:1;s:8:\"encoding\";s:6:\"CP1251\";s:3:\"sep\";s:1:\";\";}'),
(119,	'indexing',	'0');

DROP TABLE IF EXISTS `%DB_PREF%smscode`;
CREATE TABLE `%DB_PREF%smscode` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `num` varchar(15) NOT NULL,
  `ip` varchar(15) NOT NULL,
  `code` int(4) NOT NULL,
  `status` varchar(10) NOT NULL,
  `time` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `%DB_PREF%subscribe`;
CREATE TABLE `%DB_PREF%subscribe` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cat` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `%DB_PREF%tags`;
CREATE TABLE `%DB_PREF%tags` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `counter` int(11) NOT NULL,
  `word` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `%DB_PREF%timing`;
CREATE TABLE `%DB_PREF%timing` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `days` int(11) NOT NULL,
  `text` varchar(1000) NOT NULL,
  `sort` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO `%DB_PREF%timing` (`id`, `days`, `text`, `sort`) VALUES
(9,	365,	'1 год',	3),
(10,	30,	'1 месяц',	2),
(11,	7,	'1 неделя',	1);

DROP TABLE IF EXISTS `%DB_PREF%users`;
CREATE TABLE `%DB_PREF%users` (
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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `%DB_PREF%users_group`;
CREATE TABLE `%DB_PREF%users_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) CHARACTER SET cp1251 NOT NULL,
  `type` varchar(1) CHARACTER SET cp1251 NOT NULL,
  `price` int(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `%DB_PREF%users_shop`;
CREATE TABLE `%DB_PREF%users_shop` (
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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `%DB_PREF%version`;
CREATE TABLE `%DB_PREF%version` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `module` varchar(30) NOT NULL,
  `version` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO `%DB_PREF%version` (`id`, `module`, `version`) VALUES
(1,	'',	'2.3');

DROP TABLE IF EXISTS `%DB_PREF%ind_cat`;
CREATE TABLE `%DB_PREF%ind_cat` (
  `message` int(11) NOT NULL,
  `cat` int(11) NOT NULL,
  PRIMARY KEY (`message`,`cat`),
  KEY `cat` (`cat`),
  KEY `message` (`message`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `%DB_PREF%ind_region`;
CREATE TABLE `%DB_PREF%ind_region` (
  `message` int(11) NOT NULL,
  `cat` int(11) NOT NULL,
  PRIMARY KEY (`message`,`cat`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


