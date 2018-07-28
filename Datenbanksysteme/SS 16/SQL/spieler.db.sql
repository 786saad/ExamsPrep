BEGIN TRANSACTION;
CREATE TABLE IF NOT EXISTS `spieler` (
	`id`	integer,
	`vorname`	varchar ( 30 ),
	`name`	varchar ( 30 ),
	`mannschaft`	integer,
	`tore`	integer,
	`position`	integer,
	`position_id`	integer,
	FOREIGN KEY(`mannschaft`) REFERENCES `mannschaften`(`id`),
	PRIMARY KEY(`id`)
);
INSERT INTO `spieler` VALUES (1,'Erik','Salzberg',1,0,'Torwart',1);
INSERT INTO `spieler` VALUES (2,'Georg','Mueller',1,0,'Verteidiger',2);
INSERT INTO `spieler` VALUES (3,'Pavel','Merier',1,4,'Angriff',3);
INSERT INTO `spieler` VALUES (4,'Christine','Müller',1,2,'Mittelffeld',4);
INSERT INTO `spieler` VALUES (5,'Alfons','Saake',5,2,'offensives Mittelfeld',5);
INSERT INTO `spieler` VALUES (6,'Gunter','Kemper',6,1,'Verteidiger',2);
CREATE TABLE IF NOT EXISTS `spiel` (
	`id`	integer,
	`heim`	integer,
	`gast`	integer,
	`tore_heim`	integer,
	`tore_gast`	integer,
	FOREIGN KEY(`heim`) REFERENCES `mannschaften`(`id`),
	PRIMARY KEY(`id`),
	FOREIGN KEY(`gast`) REFERENCES `mannschaften`(`id`)
);
INSERT INTO `spiel` VALUES (1,1,2,3,1);
INSERT INTO `spiel` VALUES (2,3,4,0,4);
INSERT INTO `spiel` VALUES (3,5,6,0,0);
INSERT INTO `spiel` VALUES (4,1,3,5,4);
INSERT INTO `spiel` VALUES (5,2,4,2,2);
CREATE TABLE IF NOT EXISTS `position` (
	`id`	integer PRIMARY KEY AUTOINCREMENT,
	`name`	varchar ( 30 )
);
INSERT INTO `position` VALUES (1,'Torwart');
INSERT INTO `position` VALUES (2,'Verteidiger');
INSERT INTO `position` VALUES (3,'Angriff');
INSERT INTO `position` VALUES (4,'Mittelffeld');
INSERT INTO `position` VALUES (5,'offensives Mittelfeld');
CREATE TABLE IF NOT EXISTS `mannschaften` (
	`id`	integer,
	`hochschule`	varchar ( 30 ),
	`ort`	varchar ( 29 ),
	`name`	varchar ( 30 ),
	PRIMARY KEY(`id`)
);
INSERT INTO `mannschaften` VALUES (1,'KIT FC','KIT','Karlsruhe');
INSERT INTO `mannschaften` VALUES (2,'TUM FC','TU München','München');
INSERT INTO `mannschaften` VALUES (3,'Berliner Einheit','TU Berlin','Berlin');
INSERT INTO `mannschaften` VALUES (4,'Borussia HU','HU Berlin','Berlin');
INSERT INTO `mannschaften` VALUES (5,'Concordia TU','HU Dortmund','Dortmund');
INSERT INTO `mannschaften` VALUES (6,'Magdeburg 05','OVGU Magdeburg','Magdeburg');
COMMIT;
