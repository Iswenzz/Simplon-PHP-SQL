START TRANSACTION;

-- ============================================================
--   Suppression et création de la base de données 
-- ============================================================

DROP DATABASE IF EXISTS musique_a_gogo;
CREATE DATABASE musique_a_gogo;
USE musique_a_gogo;


-- ============================================================
--   Création des tables                                
-- ============================================================

CREATE TABLE Artiste (
	Art_code		VARCHAR(3) NOT NULL,
	Art_nom			VARCHAR(20) NOT NULL,
	Art_prenom		VARCHAR(20) NULL,
	CONSTRAINT PK_produit PRIMARY KEY (Art_code)
)	ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE Salle (
	Sal_num		VARCHAR(3) NOT NULL,
	Sal_nom		VARCHAR(30) NOT NULL,
	CONSTRAINT PK_salle PRIMARY KEY (Sal_num)
)	ENGINE=InnoDB DEFAULT CHARSET=latin1;  

CREATE TABLE Concert (
	Con_num		INT NOT NULL,
	Con_jour	DATE NOT NULL,
	Art_code	VARCHAR(3) NOT NULL,
	Sal_num		VARCHAR(3) NULL,
	CONSTRAINT PK_concert PRIMARY KEY (Con_num),
	CONSTRAINT FK_Concert_Artiste FOREIGN KEY (Art_code) REFERENCES Artiste (Art_code),
	CONSTRAINT FK_Concert_Salle FOREIGN KEY (Sal_num) REFERENCES Salle (Sal_num)
)	ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE Disque (
	Dis_code	VARCHAR(10) NOT NULL,
	Dis_titre	VARCHAR(30) NOT NULL,
	Dis_sortie	DATE DEFAULT NULL,
	Dis_ventes	INTEGER DEFAULT 0,
	Art_code	VARCHAR(3) NOT NULL,
	CONSTRAINT PK_Disque PRIMARY KEY (Dis_code),
	CONSTRAINT FK_Disque_Artiste FOREIGN KEY (Art_code) REFERENCES Artiste (Art_code)
)	ENGINE=InnoDB DEFAULT CHARSET=latin1; 

CREATE TABLE Gala (
	Gala_num	INTEGER NOT NULL,
	Gala_jour	DATE NULL,
	Art_code	VARCHAR(3) NOT NULL DEFAULT '',
	Sal_num		VARCHAR(3) DEFAULT NULL,
	CONSTRAINT PK_Gala PRIMARY KEY (Gala_num),
	CONSTRAINT FK_Gala_Artiste FOREIGN KEY (Art_code) REFERENCES Artiste (Art_code),
	CONSTRAINT FK_Gala_Salle FOREIGN KEY (Sal_num) REFERENCES Salle (Sal_num)
)	ENGINE=InnoDB DEFAULT CHARSET=latin1; 


-- ============================================================
--   Insertion des enregistrements
-- ============================================================

INSERT INTO Artiste VALUES ('A01','Hallyday','Johnny');
INSERT INTO Artiste VALUES ('A02','Hallyday','david');
INSERT INTO Artiste VALUES ('B18','Jagger','Mick');
INSERT INTO Artiste VALUES ('B52','Chedid','Mathieu');
INSERT INTO Artiste VALUES ('C01','Mac Cartney','Paul');
INSERT INTO Artiste VALUES ('H19','Springsteen','Bruce');
INSERT INTO Artiste VALUES ('J24','Chedid','Louis');
INSERT INTO Artiste VALUES ('K05','Les enfoires',NULL);
INSERT INTO Artiste VALUES ('R63','De Palmas','Gerald');
INSERT INTO Artiste VALUES ('T56','Aubert','Jean-Louis');
INSERT INTO Artiste VALUES ('Y19','Star Academy',NULL);
INSERT INTO Artiste VALUES ('Z54','Goldman','Jean-Jacques');

INSERT INTO Salle VALUES ('S01','Olympia');
INSERT INTO Salle VALUES ('S02','Zenith de Lille');
INSERT INTO Salle VALUES ('S03','Stade couvert de Lievin');
INSERT INTO Salle VALUES ('S04','Bercy');
INSERT INTO Salle VALUES ('S05','Theatre de Bethune');

INSERT INTO Concert VALUES (12,'2002-05-06','A01','S05');
INSERT INTO Concert VALUES (21,'2001-02-02','T56','S03');
INSERT INTO Concert VALUES (25,'2000-06-05','A01','S01');
INSERT INTO Concert VALUES (42,'2000-11-12','R63','S02');
INSERT INTO Concert VALUES (45,'2002-03-03','R63','S04');
INSERT INTO Concert VALUES (47,'1996-12-10','R63','S02');
INSERT INTO Concert VALUES (56,'1985-05-12','A01','S03');
INSERT INTO Concert VALUES (58,'2000-12-14','A01','S02');
INSERT INTO Concert VALUES (63,'2000-11-12','R63','S02');
INSERT INTO Concert VALUES (64,'2000-11-12','R63','S03');
INSERT INTO Concert VALUES (65,'2002-02-03','T56','S03');
INSERT INTO Concert VALUES (71,'2001-04-30','J24','S03');
INSERT INTO Concert VALUES (73,'2002-04-27','J24','S05');
INSERT INTO Concert VALUES (78,'2000-06-05','A02','S04');
INSERT INTO Concert VALUES (89,'2001-11-05','B52','S02');
INSERT INTO Concert VALUES (90,'2001-11-05','T56','S02');
INSERT INTO Concert VALUES (102,'1998-04-05','A01','S04');
INSERT INTO Concert VALUES (103,'2001-05-10','Z54','S03');
INSERT INTO Concert VALUES (104,'2002-09-28','Z54','S02');
INSERT INTO Concert VALUES (105,'2001-05-30','T56','S04');

INSERT INTO Disque VALUES ('A0101','Allumer le feu','1998-09-01',1500000,'A01');
INSERT INTO Disque VALUES ('A0102','Tennessee','1985-09-01',1500000,'A01');
INSERT INTO Disque VALUES ('A0201','Bidulechouette','1990-05-01',600000,'A02');
INSERT INTO Disque VALUES ('B5201','Bapteme','1990-06-02',500000,'B52');
INSERT INTO Disque VALUES ('B5202','Je dis aime','1999-02-01',1000000,'B52');
INSERT INTO Disque VALUES ('C0101','Ram','1993-09-01',250000,'C01');
INSERT INTO Disque VALUES ('C0102','Chaos and creation in the back','2005-09-01',1850000,'C01');
INSERT INTO Disque VALUES ('H1901','The essential Bruce Springstee','2003-11-03',2850000,'H19');
INSERT INTO Disque VALUES ('H1902','Devils and dust','2005-04-01',1520000,'H19');
INSERT INTO Disque VALUES ('J2401','Machin','2001-11-01',500000,'J24');
INSERT INTO Disque VALUES ('K0501','Compil vol1','2000-11-01',1000000,'K05');
INSERT INTO Disque VALUES ('K0502','Compil vol2','2001-11-01',1000000,'K05');
INSERT INTO Disque VALUES ('R6301','Sur la route','1991-03-05',1000000,'R63');
INSERT INTO Disque VALUES ('R6302','Marcher dans le sable','1999-06-06',1500000,'R63');
INSERT INTO Disque VALUES ('T5601','H','1993-06-02',1000000,'T56');
INSERT INTO Disque VALUES ('T5602','Ideal standard','2005-11-01',1500000,'T56');
INSERT INTO Disque VALUES ('Z5401','Rouge','1993-12-18',500000,'Z54');
INSERT INTO Disque VALUES ('Z5402','Chansons pour les pieds','2002-08-07',300000,'Z54');
INSERT INTO Disque VALUES ('Z5403','1 fille et 4 types','2004-02-04',210000,'Z54');

INSERT INTO Gala VALUES (10,'2002-07-10','T56','S01');
INSERT INTO Gala VALUES (20,'2003-08-11','Z54','S04');
INSERT INTO Gala VALUES (30,'2004-06-09','B18','S04');
INSERT INTO Gala VALUES (40,'2005-08-10','Z54','S02');


-- ============================================================
--   Validation de la transaction
-- ============================================================

COMMIT;
