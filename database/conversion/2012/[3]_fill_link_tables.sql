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


DELETE FROM `link_account_rol`;
-- link rol 'staff'
INSERT INTO `link_account_rol` (`id_account`, `id_rol`)
	SELECT `a`.`id`, `r`.`id`
		FROM `_account` `a`, `rol` `r`
		WHERE `r`.`naam` LIKE 'edit eigen CV';
-- link rol 'manager'
INSERT INTO `link_account_rol` (`id_account`, `id_rol`)
	SELECT `a`.`id`, `r`.`id`
		FROM `_account` `a`, `rol` `r`
		WHERE `a`.`roles` LIKE 'manager'
			AND `r`.`naam` LIKE 'view alle CVs';

DELETE FROM `link_account_businessunit`;
INSERT INTO `link_account_businessunit` (`id_account`, `id_businessunit`)
	SELECT `a`.`id`, `b`.`id`
		FROM `_account` `a`
		JOIN `businessunit` `b` ON `b`.`id` = `a`.`id_businessunit`;


/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
