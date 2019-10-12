
CREATE TABLE `referentie` (
	`id_object` INT(10) UNSIGNED NOT NULL,
	`id_state` INT(10) UNSIGNED NOT NULL,
	`id_cv` INT(10) UNSIGNED NOT NULL,
	`naam_referent` VARCHAR(80) NULL DEFAULT NULL COLLATE 'utf8_bin',
	`functie_referent_nl_NL` VARCHAR(80) NULL DEFAULT NULL COLLATE 'utf8_bin',
	`functie_referent_uk_UK` VARCHAR(80) NULL DEFAULT NULL COLLATE 'utf8_bin',
	`omschrijving_nl_NL` TEXT NULL DEFAULT NULL COLLATE 'utf8_bin',
	`omschrijving_uk_UK` TEXT NULL DEFAULT NULL COLLATE 'utf8_bin',
	`opnemen_in_cv` TINYINT(1) UNSIGNED NULL DEFAULT 1,
	PRIMARY KEY (`id_object`, `id_state`),
	INDEX `FK_referenties_state` (`id_state`),
	INDEX `FK_referenties_cv` (`id_cv`),
	CONSTRAINT `FK_referenties_cv` FOREIGN KEY (`id_cv`) REFERENCES `cv` (`id_object`),
	CONSTRAINT `FK_referenties_state` FOREIGN KEY (`id_state`) REFERENCES `_state` (`id`)
)
COLLATE='utf8_bin'
ENGINE=InnoDB
;

INSERT INTO `_entity`
(`id`, `name`, `id_object_column_name`, `id_state_column_name`)
VALUES(16, 'referentie', 'id_object', 'id_state');

INSERT INTO `_relationship`
(`id_fk_entity`, `fk_column_name`, `id_referred_entity`, `id_owner_entity`)
VALUES(16, 'id_cv', 4, 4);

ALTER TABLE `persoonsgegevens` ADD COLUMN `functie_titel` VARCHAR(80) NULL DEFAULT NULL;
ALTER TABLE `profiel` ADD COLUMN `interesses` TEXT NULL DEFAULT NULL;
ALTER TABLE `werkervaring` ADD COLUMN `resultaat` VARCHAR(80) NULL DEFAULT NULL;

UPDATE `vaardigheid` SET categorie = 'Methodes' WHERE categorie = 'Methoden en technieken';
UPDATE `vaardigheid` SET categorie = 'Programmeren' WHERE categorie = 'Programmeertalen';
UPDATE `vaardigheid` SET categorie = 'Applicaties' WHERE categorie = 'Software';
UPDATE `vaardigheid` SET categorie = 'OS en Netwerken' WHERE categorie IN('Hardware', 'Netwerken', 'Operating systems');