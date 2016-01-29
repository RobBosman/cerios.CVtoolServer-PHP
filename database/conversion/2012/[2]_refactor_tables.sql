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


# Dumping structure for table deb31080_cv.rol
DROP TABLE IF EXISTS `rol`;
CREATE TABLE IF NOT EXISTS `rol` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `naam` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `naam` (`naam`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

# Dumping data for table deb31080_cv.rol: ~2 rows (approximately)
DELETE FROM `rol`;
/*!40000 ALTER TABLE `rol` DISABLE KEYS */;
INSERT INTO `rol` (`id`, `naam`) VALUES
	(1, 'edit eigen CV'),
	(2, 'view alle CVs');
/*!40000 ALTER TABLE `rol` ENABLE KEYS */;


# Dumping structure for table deb31080_cv.link_account_businessunit
DROP TABLE IF EXISTS `link_account_businessunit`;
CREATE TABLE IF NOT EXISTS `link_account_businessunit` (
  `id_account` int(10) unsigned NOT NULL,
  `id_businessunit` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id_account`,`id_businessunit`),
  KEY `FK_link_ab_businessunit` (`id_businessunit`),
  CONSTRAINT `FK_link_ab_account` FOREIGN KEY (`id_account`) REFERENCES `_account` (`id`),
  CONSTRAINT `FK_link_ab_businessunit` FOREIGN KEY (`id_businessunit`) REFERENCES `businessunit` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*!40000 ALTER TABLE `link_account_businessunit` DISABLE KEYS */;
/*!40000 ALTER TABLE `link_account_businessunit` ENABLE KEYS */;


# Dumping structure for table deb31080_cv.link_account_rol
DROP TABLE IF EXISTS `link_account_rol`;
CREATE TABLE IF NOT EXISTS `link_account_rol` (
  `id_account` int(10) unsigned NOT NULL,
  `id_rol` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id_account`,`id_rol`),
  KEY `FK_link_ar_rol` (`id_rol`),
  CONSTRAINT `FK_link_ar_account` FOREIGN KEY (`id_account`) REFERENCES `_account` (`id`),
  CONSTRAINT `FK_link_ar_rol` FOREIGN KEY (`id_rol`) REFERENCES `rol` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*!40000 ALTER TABLE `link_account_rol` ENABLE KEYS */;


# Dumping structure for table deb31080_cv._entity
DROP TABLE IF EXISTS `_entity`;
CREATE TABLE IF NOT EXISTS `_entity` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  `id_object_column_name` varchar(80) DEFAULT NULL,
  `id_state_column_name` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

# Dumping data for table deb31080_cv._entity: ~14 rows (approximately)
DELETE FROM `_entity`;
/*!40000 ALTER TABLE `_entity` DISABLE KEYS */;
INSERT INTO `_entity` (`id`, `name`, `id_object_column_name`, `id_state_column_name`) VALUES
	(1, '_account', 'id', NULL),
	(2, 'branchekennis', 'id_object', 'id_state'),
	(3, 'businessunit', 'id', NULL),
	(4, 'cv', 'id_object', 'id_state'),
	(5, 'opleiding', 'id_object', 'id_state'),
	(6, 'persoonsgegevens', 'id_object', 'id_state'),
	(7, 'profiel', 'id_object', 'id_state'),
	(8, 'talenkennis', 'id_object', 'id_state'),
	(9, 'vaardigheid', 'id_object', 'id_state'),
	(10, 'werkervaring', 'id_object', 'id_state'),
	(11, 'werkopdracht', 'id_object', 'id_state'),
	(12, 'rol', 'id', NULL),
	(13, 'link_account_rol', NULL, NULL),
	(14, 'link_account_businessunit', NULL, NULL);
/*!40000 ALTER TABLE `_entity` ENABLE KEYS */;


# Dumping structure for table deb31080_cv._relationship
DROP TABLE IF EXISTS `_relationship`;
CREATE TABLE IF NOT EXISTS `_relationship` (
  `id_fk_entity` int(10) unsigned NOT NULL,
  `fk_column_name` varchar(80) NOT NULL,
  `id_referred_entity` int(10) unsigned DEFAULT NULL,
  `id_owner_entity` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id_fk_entity`,`fk_column_name`),
  KEY `FK_relationship_referred_entity` (`id_referred_entity`),
  KEY `FK_relationship_owner_entity` (`id_owner_entity`),
  CONSTRAINT `FK_relationship_fk_entity` FOREIGN KEY (`id_fk_entity`) REFERENCES `_entity` (`id`),
  CONSTRAINT `FK_relationship_owner_entity` FOREIGN KEY (`id_owner_entity`) REFERENCES `_entity` (`id`),
  CONSTRAINT `FK_relationship_referred_entity` FOREIGN KEY (`id_referred_entity`) REFERENCES `_entity` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

# Dumping data for table deb31080_cv._relationship: ~13 rows (approximately)
DELETE FROM `_relationship`;
/*!40000 ALTER TABLE `_relationship` DISABLE KEYS */;
INSERT INTO `_relationship` (`id_fk_entity`, `fk_column_name`, `id_referred_entity`, `id_owner_entity`) VALUES
	(2, 'id_cv', 4, 4),
	(4, 'id_account', 1, 1),
	(5, 'id_cv', 4, 4),
	(6, 'id_cv', 4, 4),
	(7, 'id_cv', 4, 4),
	(8, 'id_cv', 4, 4),
	(9, 'id_cv', 4, 4),
	(10, 'id_werkopdracht', 11, 11),
	(11, 'id_cv', 4, 4),
	(13, 'id_account', 1, 1),
	(13, 'id_rol', 12, 12),
	(14, 'id_account', 1, 1),
	(14, 'id_businessunit', 3, 3);
/*!40000 ALTER TABLE `_relationship` ENABLE KEYS */;


/*
# Dumping structure for view deb31080_cv._relationship_vw
DROP VIEW IF EXISTS `_relationship_vw`;
# Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `_relationship_vw` (
	fk_entity VARCHAR(80) NOT NULL COLLATE 'utf8_general_ci',
	fk_column_name VARCHAR(80) NOT NULL COLLATE 'utf8_general_ci',
	referred_entity VARCHAR(80) NOT NULL COLLATE 'utf8_general_ci',
	owner_entity VARCHAR(80) NULL DEFAULT NULL COLLATE 'utf8_general_ci'
) ENGINE=InnoDB;

# Dumping structure for view deb31080_cv._relationship_vw
DROP VIEW IF EXISTS `_relationship_vw`;
# Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `_relationship_vw`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `_relationship_vw` AS select `e_fk`.`name` AS `fk_entity`,`r`.`fk_column_name` AS `fk_column_name`,`e_referred`.`name` AS `referred_entity`,`e_owner`.`name` AS `owner_entity` from (((`_relationship` `r` join `_entity` `e_fk` on((`e_fk`.`id` = `r`.`id_fk_entity`))) join `_entity` `e_referred` on((`e_referred`.`id` = `r`.`id_referred_entity`))) left join `_entity` `e_owner` on((`e_owner`.`id` = `r`.`id_owner_entity`)));
*/

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
