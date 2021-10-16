START TRANSACTION;

-- ============================================================
--   Suppression et création de la base de données 
-- ============================================================
DROP DATABASE IF EXISTS catalogue_edirol;
CREATE DATABASE catalogue_edirol;
USE  catalogue_edirol;


-- ============================================================
--   Création des tables                                
-- ============================================================

CREATE TABLE produit (
	ref_produit             VARCHAR(20),
	libelle1_produit        VARCHAR(60) NOT NULL,
	libelle2_produit        VARCHAR(150),
	nouveaute_produit       VARCHAR(3),
	CONSTRAINT PK_produit PRIMARY KEY (ref_produit)
)	ENGINE=InnoDB DEFAULT CHARSET=latin1;
    
CREATE TABLE ville (
  num_ville               INT,
  libelle_ville           VARCHAR(20) NOT NULL,
  CONSTRAINT PK_ville PRIMARY KEY (num_ville),
	CONSTRAINT UK_libelle_ville UNIQUE KEY (libelle_ville)
)	ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE revendeur (
	num_revendeur           INT,
	libelle_revendeur       VARCHAR(30) NOT NULL,
	CA                      INT,
	date_ouverture_magasin  DATE NULL,
	num_ville               INT NOT NULL,
	CONSTRAINT PK_revendeur PRIMARY KEY (num_revendeur),
	CONSTRAINT FK_num_ville FOREIGN KEY (num_ville) REFERENCES ville (num_ville)
)	ENGINE=InnoDB DEFAULT CHARSET=latin1;
    
CREATE TABLE approvisionnement (
	produit                 VARCHAR(20),
	revendeur               INT,
	date_approvisionnement  DATE,
	quantite                INT NOT NULL,
	CONSTRAINT PK_approvisionner PRIMARY KEY (produit, revendeur, date_approvisionnement),
	CONSTRAINT FK_approvisionner_produit FOREIGN KEY (produit) REFERENCES produit (ref_produit),
	CONSTRAINT FK_approvisionner_revendeur FOREIGN KEY (revendeur) REFERENCES revendeur (num_revendeur)
)	ENGINE=InnoDB DEFAULT CHARSET=latin1;


-- ============================================================
--   Insertion des enregistrements
-- ============================================================

INSERT INTO produit VALUES ("UA-1000","USB 2.0 Recording interface 10x10","24bits/96Khz full duplex, 4x high quality MIC pre-amps, Phantom, ADAT","");
INSERT INTO produit VALUES ("UA-25","USB Recording interface","24/96Khz, Phantom, Limiter, Guitar Hi-z, S/PDIF, MIDI, PC/Mac","");
INSERT INTO produit VALUES ("UA-20X","USB interface","Guitar & Mic inputs, MIDI In/Out, ASIA, WDM, PC/Mac","");
INSERT INTO produit VALUES ("UA-101","USB 2.0 Recording interface 10x10","24bits/96Khz full duplex, 2x MIC pre-amps, Phantom","NEW");
INSERT INTO produit VALUES ("PCR-M80","61-key MIDI Keyboard","8 Rotary knobs, 8 sliders, 9 Switches all fully-assignable, 16 User Memory, USB, PC/Mac","NEW");
INSERT INTO produit VALUES ("PCR-M50","49-key MIDI Keyboard","8 Rotary knobs, 8 sliders, 9 Switches all fully-assignable, 16 User Memory, USB, PC/Mac","NEW");
INSERT INTO produit VALUES ("PCR-1","Ultra thin (30mm) 25-key MIDI keyboard","USB Audio 24-bit/96kHz, 25 controllers, 16 patch memories, PC/Mac","");
INSERT INTO produit VALUES ("PCR-M1","Ultra thin (30mm) 25-key USB MIDI keyboard","25 controllers, 16 patch memories, PC/Mac","NEW");
INSERT INTO produit VALUES ("PCR-A30","32-key MIDI keyboard","USB Audio 24-bit/96kHz, 8 Rotary knobs, 8 sliders, 9 Switches all fully-assignable, 16 User Memory, built-in monitor speakers, PC/Mac","NEW");
INSERT INTO produit VALUES ("UM-880","8x8 USB MIDI interface (1U rack)","hardware MIDI Patcher, memory, activity LEDs and controls on front panel, PC/Mac","");
INSERT INTO produit VALUES ("UM-550","5x5 USB MIDI interface (adapter for 1U rack)","hardware MIDI Patcher, memory, LEDs/controls on front panel, PC/Mac","");
INSERT INTO produit VALUES ("UM-2C","2x2 USB MIDI interface","activity LEDs, PC/Mac","");
INSERT INTO produit VALUES ("UM-1X","1x1 USB MIDI interface-cable","USB and MIDI leads, Signal indicators, Enhanced Driver, PC/Mac","");
INSERT INTO produit VALUES ("UM-1SX","1x1 USB MIDI interface-cable","USB lead only, Signal indicators, Enhanced Driver, PC/Mac","");
INSERT INTO produit VALUES ("SD-20","64-voice new generation sound module GM2/GS/XGLite","660 sounds, 23 drumsets, USB MIDI Interface, Serial, PC/Mac","");
INSERT INTO produit VALUES ("SD-80","128-voice new generation sound module GM2/GS/XGLite","1050 sounds, 30 drumsets, 2x2 USB MIDI interface, 4 Mono Outputs, rack-mountable, PC/Mac","");
INSERT INTO produit VALUES ("M-100FX","10-Channel Mixer","USB Audio and onboard Voice/Sound effects, S/PDIF out, PC/Mac","");
INSERT INTO produit VALUES ("M-10E","10-Channel Mixer in a notepad format","battery or AC adaptor powered","");
INSERT INTO produit VALUES ("HQ-OR Orchestral","high-Quality Orchestral Soft Synth","141 Sounds & 3 Drumsets, Tone Sound Editing, VSTi and DXi, PC/Mac","");
INSERT INTO produit VALUES ("HQ-QT Super Quartet","high-Quality Acoustic Band Soft Synth","60 Sounds & 3 Drumsets, Tone Sound Editing, VSTi and DXi, PC/Mac","");
INSERT INTO produit VALUES ("HQ-GM2 HyperCanvas","high-Quality GM2 Soft Synth","256 Sounds & 9 Drumsets, Tone Sound Editing, VSTi and DXi, PC/Mac","");
INSERT INTO produit VALUES ("VSC-MP1","Virtual Sound Module","902 sounds & 26 Drumsets (VSTi and DXi), MIDI to WAV & AIFF file converter, PC/Mac","");
INSERT INTO produit VALUES ("MA-15D","15W+15W powered monitor speakers","wooden cabinet, S/PDIF input (24/192)","NEW");

INSERT INTO ville VALUES (1,"Lille");
INSERT INTO ville VALUES (2,"Paris");
INSERT INTO ville VALUES (3,"Marseille");
INSERT INTO ville VALUES (4,"Toulouse");
INSERT INTO ville VALUES (5,"Bordeaux");

INSERT INTO revendeur VALUES (1,"Direct Music", 4500000, "2002-10-01", 2);
INSERT INTO revendeur VALUES (2,"Direct Music", 3000000, "2003-11-15", 3);
INSERT INTO revendeur VALUES (3,"Direct Music", 2450000, "2001-05-01", 5);
INSERT INTO revendeur VALUES (4,"Music Center", 4210000, "2000-08-01", 2);
INSERT INTO revendeur VALUES (5,"Music center", 1950000, "1999-04-01", 4);
INSERT INTO revendeur VALUES (6,"Jericho", 2000000, "1998-10-01", 1);
INSERT INTO revendeur VALUES (7,"Jericho", 2300000, "2000-02-01", 5);
INSERT INTO revendeur VALUES (8,"MusicShow", 3450000, "2003-08-01", 2);
INSERT INTO revendeur VALUES (9,"Destroy Decibel", 940000, "2001-07-01", 2);
INSERT INTO revendeur VALUES (10,"Massena Musique", 2150000, "2000-08-01", 1);
INSERT INTO revendeur VALUES (11,"MusicLab", 1540000, "2000-11-01", 3);
INSERT INTO revendeur VALUES (12,"MusicLab", 1800000, "1998-10-01", 4);

INSERT INTO approvisionnement VALUES ("SD-20",1,"2004-10-14",5);
INSERT INTO approvisionnement VALUES ("HQ-QT Super Quartet",1,"2004-10-14",8);
INSERT INTO approvisionnement VALUES ("MA-15D",1,"2004-10-14",10);
INSERT INTO approvisionnement VALUES ("SD-20",2,"2004-07-01",20);
INSERT INTO approvisionnement VALUES ("HQ-QT Super Quartet",2,"2004-07-01",20);
INSERT INTO approvisionnement VALUES ("UM-2C",2,"2004-09-18",40);
INSERT INTO approvisionnement VALUES ("UM-1X",2,"2004-09-18",40);
INSERT INTO approvisionnement VALUES ("UA-1000",3,"2005-03-24",40);
INSERT INTO approvisionnement VALUES ("PCR-M80",3,"2005-03-24",15);
INSERT INTO approvisionnement VALUES ("PCR-M50",3,"2005-05-12",10);
INSERT INTO approvisionnement VALUES ("HQ-QT Super Quartet",3,"2005-05-12",20);
INSERT INTO approvisionnement VALUES ("UM-880",4,"2004-08-21",30);
INSERT INTO approvisionnement VALUES ("UM-2C",4,"2004-08-21",30);
INSERT INTO approvisionnement VALUES ("M-10E",5,"2006-06-10",25);
INSERT INTO approvisionnement VALUES ("HQ-OR Orchestral",6,"2004-04-24",15);
INSERT INTO approvisionnement VALUES ("HQ-GM2 HyperCanvas",6,"2004-04-24",20);
INSERT INTO approvisionnement VALUES ("VSC-MP1",6,"2006-09-01",15);
INSERT INTO approvisionnement VALUES ("UM-1X",6,"2006-09-01",20);
INSERT INTO approvisionnement VALUES ("MA-15D",7,"2007-04-25",20);
INSERT INTO approvisionnement VALUES ("UA-25",7,"2007-05-16",30);
INSERT INTO approvisionnement VALUES ("UA-101",7,"2007-06-28",25);
INSERT INTO approvisionnement VALUES ("MA-15D",8,"2005-08-20",20);
INSERT INTO approvisionnement VALUES ("SD-20",8,"2005-09-24",15);
INSERT INTO approvisionnement VALUES ("SD-80",8,"2005-09-24",25);
INSERT INTO approvisionnement VALUES ("UA-25",9,"2004-03-24",25);
INSERT INTO approvisionnement VALUES ("UA-1000",9,"2004-03-24",35);
INSERT INTO approvisionnement VALUES ("PCR-M80",9,"2005-08-13",15);
INSERT INTO approvisionnement VALUES ("PCR-M50",9,"2004-08-13",15);
INSERT INTO approvisionnement VALUES ("HQ-GM2 HyperCanvas",10,"2006-08-21",20);
INSERT INTO approvisionnement VALUES ("MA-15D",10,"2006-08-21",40);
INSERT INTO approvisionnement VALUES ("M-100FX",11,"2004-02-24",10);
INSERT INTO approvisionnement VALUES ("M-10E",11,"2004-02-24",5);
INSERT INTO approvisionnement VALUES ("VSC-MP1",11,"2005-08-21",20);
INSERT INTO approvisionnement VALUES ("UA-1000",11,"2005-10-24",25);
INSERT INTO approvisionnement VALUES ("UM-1SX",11,"2005-11-29",150);
INSERT INTO approvisionnement VALUES ("UA-101",12,"2004-04-05",50);
INSERT INTO approvisionnement VALUES ("UM-880",12,"2004-08-05",25);
INSERT INTO approvisionnement VALUES ("PCR-M80",12,"2005-05-15",10);
INSERT INTO approvisionnement VALUES ("PCR-M50",12,"2006-03-15",5);
INSERT INTO approvisionnement VALUES ("HQ-GM2 HyperCanvas",12,"2006-08-20",25);

COMMIT;