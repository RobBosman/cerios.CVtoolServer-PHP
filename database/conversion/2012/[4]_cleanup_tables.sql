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


ALTER TABLE `_account` DROP FOREIGN KEY `FK_account_businessunit`;
ALTER TABLE `_account` DROP COLUMN `id_businessunit`;
ALTER TABLE `_account` DROP COLUMN `roles`;

DROP TABLE `$relationship`;
DROP TABLE `$entity`;


/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
