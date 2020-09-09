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


-- Partie 2