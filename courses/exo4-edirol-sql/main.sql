USE catalogue_edirol;

-- Partie 1
INSERT INTO produit
VALUES ("PCR-M30" , "32-key MIDI Keyboard", "8 Rotary knobs,8 sliders, 9 switches all fully-assignable, 16 User Memory, USB", "NEW"),
("Ma-7A", "7W+7W powered monitor speakers","wooden cabinet", "NEW"),
("SD-90","128-voice new generation sound module GM2/GS/XGLite", "1050 sounds, 30 drumsets, USB Audio + 2X2 MIDI interface, audio DSP, S/PDIF", "NEW");

INSERT INTO approvisionnement 
VALUES ("MA-7A", 1, "2005-03-10", 10),
("MA-7A", 12, "2007-03-26", 10),
("MA-7A", 8, "2005-08-20", 10),
("MA-7A", 10, "2006-08-21", 20),
("MA-7A", 7, "2007-05-25", 40);

-- no.2
CREATE TABLE type_produit (
	num_type_produit INT AUTO_INCREMENT NOT NULL,
	libelle_type_produit VARCHAR(255) NOT NULL,
	CONSTRAINT type_produit_pk PRIMARY KEY (num_type_produit)
	CONSTRAINT libelle_type_produit_uk UNIQUE KEY(libelle_type_produit)
);

INSERT INTO type_produit (libelle_type_produit)
VALUES ("Audio interface"),
("Audio Mixers"),
("Keyboards"),
("MIDI interfaces"),
("Software Synths"),
("Sound Modules"),
("Speakers")

-- no.3
ALTER TABLE produit 
ADD COLUMN num_type_produit INT NOT NULL;

ALTER TABLE produit
ADD CONSTRAINT num_type_produit_fk
	FOREIGN KEY (num_type_produit)
	REFERENCES type_produit(num_type_produit);

-- no.4
INSERT INTO revendeur VALUES (13, "Music Lab", 2200500, "2004-10-23", 5);

-- no.5
INSERT INTO approvisionnement VALUES ("M-10E", 13, "2004-08-22", 25);

-- no.6
ALTER TABLE approvisionnement RENAME TO approvisionner;

-- no.7
UPDATE revendeur
SET date_ouverture_magasin = "2000-07-01"
WHERE num_revendeur = 4;

-- no.8
ALTER TABLE approvisionner
DROP CONSTRAINT fk_approvisionner_revendeur;

ALTER TABLE approvisionner
ADD CONSTRAINT fk_approvisionner_revendeur
	FOREIGN KEY (revendeur)
	REFERENCES revendeur(num_revendeur)
	ON DELETE CASCADE;

ALTER TABLE ville
ADD COLUMN population INT;

-- no.9
UPDATE ville
SET population = 1200000
WHERE num_ville = 1;

-- no.10
DELETE FROM produit
WHERE ref_produit LIKE "SD%";

-- no.10.1
DELETE FROM produit
WHERE ref_produit IN ("SD-20", "SD-80", "SD-90");
