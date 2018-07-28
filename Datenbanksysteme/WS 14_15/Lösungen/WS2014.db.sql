BEGIN TRANSACTION;
CREATE TABLE IF NOT EXISTS `Kunde` (
	`id`	integer NOT NULL,
	`name`	varchar ( 20 ) NOT NULL,
	`age`	integer NOT NULL,
	`geschlecht`	char NOT NULL,
	`email`	varchar ( 25 ),
	PRIMARY KEY(`id`)
);
INSERT INTO `Kunde` VALUES (1,'Arnold Pancino',25,'M',NULL);
INSERT INTO `Kunde` VALUES (2,'Kat Woman',22,'F',NULL);
INSERT INTO `Kunde` VALUES (3,'Jack Chan',55,'M',NULL);
INSERT INTO `Kunde` VALUES (4,'Bat Mödelsen',50,'F',NULL);
INSERT INTO `Kunde` VALUES (5,'Arnie b',20,'M','');
CREATE TABLE IF NOT EXISTS `Fitnesskurse` (
	`id`	integer NOT NULL,
	`name`	varchar ( 20 ) NOT NULL,
	`preis`	integer NOT NULL,
	`dauer`	integer NOT NULL,
	CONSTRAINT `kurse_pg` PRIMARY KEY(`id`)
);
INSERT INTO `Fitnesskurse` VALUES (1,'Tanz-Aerobic',50,10);
INSERT INTO `Fitnesskurse` VALUES (2,'Aquafitness',100,15);
INSERT INTO `Fitnesskurse` VALUES (3,'Muskelaufbau',70,20);
INSERT INTO `Fitnesskurse` VALUES (4,'Yoga',50,15);
CREATE TABLE IF NOT EXISTS `Abo` (
	`k_id`	integer NOT NULL,
	`f_id`	integer NOT NULL,
	FOREIGN KEY(`f_id`) REFERENCES `Fitnesskurse`(`id`),
	FOREIGN KEY(`k_id`) REFERENCES `Kunde`(`id`)
);
INSERT INTO `Abo` VALUES (1,1);
INSERT INTO `Abo` VALUES (1,2);
INSERT INTO `Abo` VALUES (1,2);
INSERT INTO `Abo` VALUES (2,2);
INSERT INTO `Abo` VALUES (2,3);
INSERT INTO `Abo` VALUES (3,3);
INSERT INTO `Abo` VALUES (1,4);
INSERT INTO `Abo` VALUES (5,4);
CREATE VIEW 'Teilnehmerzahl' as
Select name, count(name) from Fitnesskurse, Abo
where f_id = id
group by name
union
Select name,0 from Fitnesskurse where id not in (Select k_id from Abo);
COMMIT;
