# --------------------------------------------------------
# Host:                         127.0.0.1
# Server version:               5.5.8-log - MySQL Community Server (GPL)
# Server OS:                    Win32
# HeidiSQL version:             6.0.0.3945
# Date/time:                    2012-02-21 16:18:19
# --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

USE `deb31080_cv`;


DROP TABLE IF EXISTS `$entity`;
CREATE TABLE IF NOT EXISTS `$entity` (
  `name` varchar(80) NOT NULL,
  `id_object_key_name` varchar(80) NOT NULL,
  `id_state_key_name` varchar(80) default NULL,
  `namespaceUri` varchar(1024) default NULL,
  PRIMARY KEY  (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `$entity` SELECT * FROM `_entity`;

DROP TABLE IF EXISTS `$relationship`;
CREATE TABLE IF NOT EXISTS `$relationship` (
  `fromEntity` varchar(80) NOT NULL,
  `toEntity` varchar(80) NOT NULL,
  `fkEntity` varchar(80) NOT NULL,
  `fkColumn` varchar(80) NOT NULL,
  `multiplicity` varchar(4) NOT NULL,
  KEY `$FK_relationships_from_entities` (`fromEntity`),
  KEY `$FK_relationships_to_entities` (`toEntity`),
  KEY `$FK_relationships_fk_entities` (`fkEntity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `$relationship` SELECT * FROM `_relationship`;

ALTER TABLE `$relationship`
  ADD CONSTRAINT `$FK_relationships_fk_entities` FOREIGN KEY (`fkEntity`) REFERENCES `$entity` (`name`),
  ADD CONSTRAINT `$FK_relationships_from_entities` FOREIGN KEY (`fromEntity`) REFERENCES `$entity` (`name`),
  ADD CONSTRAINT `$FK_relationships_to_entities` FOREIGN KEY (`toEntity`) REFERENCES `$entity` (`name`);


/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
