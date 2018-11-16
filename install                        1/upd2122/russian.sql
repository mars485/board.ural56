CREATE TABLE IF NOT EXISTS `%DB_PREF%articles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cat` int(11) NOT NULL,
  `uri` varchar(200) NOT NULL,
  `name` varchar(200) NOT NULL,
  `content` text NOT NULL,
  `keywords` text NOT NULL,
  `index` int(11) NOT NULL DEFAULT '0',
  `pubdate` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;



CREATE TABLE IF NOT EXISTS `%DB_PREF%articles_cat` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `uri` varchar(100) NOT NULL,
  `description` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;



CREATE TABLE IF NOT EXISTS `%DB_PREF%db_fields` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `message` int(11) NOT NULL,
  `field` int(11) NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;


CREATE TABLE IF NOT EXISTS `%DB_PREF%db_tags` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `message` int(11) NOT NULL,
  `tag` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

ALTER TABLE `%DB_PREF%blocks_places` CHANGE `cat` `cat` VARCHAR( 100 ) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' ;

ALTER TABLE `%DB_PREF%seo` ADD `nonstrict` INT( 1 ) NOT NULL ;

ALTER TABLE `%DB_PREF%db_tags` ADD INDEX `ind` ( `message` , `tag` ) ;
ALTER TABLE `%DB_PREF%db_fields` ADD INDEX `ind` ( `message` , `field` ) ;
ALTER TABLE `%DB_PREF%db_fields` ADD FULLTEXT `txt` (
`value`
);
ALTER TABLE `%DB_PREF%cat` ADD `description` TEXT NOT NULL ;