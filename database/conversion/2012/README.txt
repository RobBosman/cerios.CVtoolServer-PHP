config.ini:
	namespace toevoegen

copy database
	export cvtool, import cv

patch_1.sql:
	tabel $entity:
		aanmaken
		copy _entity
	tabel $relationship:
		aanmaken en copy table _relationship
		alter foreign key constraints to refer to $entity
		copy table _relationship
	tabel rol:
		aanmaken
	tabel link_account_businessunit:
		aanmaken
	tabel link_account_rol:
		aanmaken
	tabel _entity:
		verwijderen en opnieuw aanmaken
	tabel _relationship:
		verwijderen en opnieuw aanmaken
	view _relationship_vw:
		aanmaken

patch_2.sql:
	tabel link_account_businessunit:
		vullen met data uit _account.id_businessunit
	tabel link_account_rol:
		vullen met data uit _account.role

patch_3.sql:
	tabel _account:
		fk-constraint op id_businessunit verwijderen
		id_businessunit verwijderen
		roles verwijderen

Flex client:
	...

cv.php:
	fetch cv- and businessunit-data from REST server

Alfresco publish.php:
	fetch cv-data and businessunit-name