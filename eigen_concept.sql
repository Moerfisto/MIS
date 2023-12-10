-- ***************************************************************
-- * File Name:                  eigen_concept.sql               *
-- * File Creator:               <Yannic>                      *
-- * CreationDate:               <10.12.2023>                         *
-- ***************************************************************
--
-- *** Bitte verwenden Sie als Zeichenkodierung immer UTF-8    ***
--
-- ***************************************************************
-- * Datenbanksysteme WS 2023
-- * Übung 5
--
-- ***************************************************************
-- * SQL*plus Job Control Section
--
-- <sqlplus>

set echo on
set linesize 80
set pagesize 50
spool ./eigen_concept.log

-- Kommentieren Sie die folgende Zeile ein, falls Sie möchten, dass der SQL-Developer beim ersten Fehler abbricht:
whenever sqlerror exit sql.sqlcode

-- </sqlplus>

-- ***************************************************************
-- * Clear Database Section
--
-- <clear>

DROP TABLE mis_tab_Adresse CASCADE CONSTRAINTS;
DROP TABLE mis_tab_hat_adresse CASCADE CONSTRAINTS;
DROP TABLE mis_tab_Personen CASCADE CONSTRAINTS;
DROP TABLE mis_tab_Vorname CASCADE CONSTRAINTS;
DROP TABLE mis_tab_Kuratoren CASCADE CONSTRAINTS;
DROP TABLE mis_tab_gestalten CASCADE CONSTRAINTS;
DROP TABLE mis_tab_Ausstellungen CASCADE CONSTRAINTS;
DROP TABLE mis_tab_Gebaeude CASCADE CONSTRAINTS;
DROP TABLE mis_tab_Raeume CASCADE CONSTRAINTS;
DROP TABLE mis_tab_Stellplaetze CASCADE CONSTRAINTS;
DROP TABLE mis_tab_Exponate CASCADE CONSTRAINTS;
DROP TABLE mis_tab_praesentieren CASCADE CONSTRAINTS;
DROP TABLE mis_tab_einplanen CASCADE CONSTRAINTS;
DROP TABLE mis_tab_Leihpartner CASCADE CONSTRAINTS;
DROP TABLE mis_tab_leihen CASCADE CONSTRAINTS;
DROP TABLE mis_tab_Kategorien CASCADE CONSTRAINTS;
DROP TABLE mis_tab_hat CASCADE CONSTRAINTS;
DROP TABLE mis_tab_enthaelt CASCADE CONSTRAINTS;
DROP TABLE mis_tab_hat_nachbar CASCADE CONSTRAINTS;

-- </clear>

-- ***************************************************************
-- * Table Section
--
-- <table>

CREATE TABLE mis_tab_Adresse(
    ID_Adresse numeric(6),
    Ort varchar(32),
    PLZ char(5),
    Strasse varchar(64),
    Hausnummer varchar(10)
);

CREATE TABLE mis_tab_hat_adresse(
    ID_Adresse numeric(6),
    ID_Personen numeric(5)
);

CREATE TABLE mis_tab_Personen(
    ID_Personen numeric(5),
    Nachname varchar(20),
    Geburtsdatum date,
    Telefon varchar(32),
    Mail varchar(64)
);

CREATE TABLE mis_tab_Vorname(
    ID_Personen numeric(5),
    lfd_nr numeric(1),
    Vorname varchar(20)
);

CREATE TABLE mis_tab_Kuratoren(
    ID_Kuratoren numeric(3),
    ID_Personen numeric(5),
    Gehalt numeric(8,2)
);

CREATE TABLE mis_tab_gestalten(
    ID_Kuratoren numeric(3),
    ID_Ausstellungen numeric(3)
);

CREATE TABLE mis_tab_Ausstellungen(
    ID_Ausstellungen numeric(3),
    Name varchar(64),
    Beschreibung varchar(1000),
    Startdatum date,
    Enddatum date
);

CREATE TABLE mis_tab_Gebaeude(
    ID_Gebaeude numeric(2),
    Name varchar(20),
    ID_Adresse numeric(6)
);

CREATE TABLE mis_tab_Raeume(
    ID_Raeume numeric(3),
    Bezeichnung varchar(32),
    Beschreibung varchar(1000),
    Groesse varchar(8),
    ID_Gebaeude numeric(2)
);

CREATE TABLE mis_tab_Stellplaetze(
    ID_Stellplaetze numeric(6),
    ID_Raeume numeric(3),
    LBH_Laenge varchar(16),
    LBH_Breite varchar(16),
    LBH_Hoehe varchar(16),
    Temperatur varchar(10),
    Luftfeuchte varchar(10),
    Beleuchtung varchar(10)
);

CREATE TABLE mis_tab_Exponate(
    ID_Exponate numeric(6),
    ID_Kuratoren numeric(3),
    Bezeichnung varchar(32),
    Beschreibung varchar(1000),
    Herkunft varchar(64),
    ex_Alter varchar(32),
    Akquisitionsdatum date,
    Zustand varchar(128)
);

CREATE TABLE mis_tab_praesentieren(
    ID_Exponate numeric(6),
    ID_Ausstellungen numeric(3)
);

CREATE TABLE mis_tab_einplanen(
    ID_Raeume numeric(3),
    ID_Ausstellungen numeric(3)
);

CREATE TABLE mis_tab_Leihpartner(
    ID_Leihpartner numeric(4),
    ID_Personen numeric(5),
    Organisation varchar(128)
);

CREATE TABLE mis_tab_leihen(
    ID_Leihpartner numeric(4),
    ID_Exponate numeric(6),
    lfd_nr numeric(1),
    ist_Leihgabe char(8),
    Startdatum date,
    Enddatum date
);

CREATE TABLE mis_tab_Kategorien(
    ID_Kategorien numeric(3),
    Bezeichnung varchar(32),
    Beschreibung varchar(1000)
);

CREATE TABLE mis_tab_hat(
    ID_Kategorien numeric(3),
    ID_Exponate numeric(6)
);

CREATE TABLE mis_tab_enthaelt(
    ID_Stellplaetze numeric(6),
    ID_Exponate numeric(6)
);

CREATE TABLE mis_tab_hat_nachbar(
    ID_Stellplaetze numeric(6),
    ID_Nachbar numeric(6)
);
-- </table>

-- ***************************************************************
-- * NOT NULL Constraint Section
--
-- <notnull>

ALTER TABLE mis_tab_Adresse
    ADD CONSTRAINT mis_nn_Adresse_ID_Adresse
    CHECK (ID_Adresse IS NOT NULL);

ALTER TABLE mis_tab_Adresse
    ADD CONSTRAINT mis_nn_Adresse_Ort
    CHECK (Ort IS NOT NULL);
    
ALTER TABLE mis_tab_Adresse
    ADD CONSTRAINT mis_nn_Adresse_PLZ
    CHECK (PLZ IS NOT NULL);

ALTER TABLE mis_tab_Adresse
    ADD CONSTRAINT mis_nn_Adresse_Strasse
    CHECK (Strasse IS NOT NULL);

ALTER TABLE mis_tab_Adresse
    ADD CONSTRAINT mis_nn_Adresse_Hausnummer
    CHECK (Hausnummer IS NOT NULL);
    
    
ALTER TABLE mis_tab_hat_adresse
    ADD CONSTRAINT mis_nn_hat_adresse_ID_Adresse
    CHECK (ID_Adresse IS NOT NULL);

ALTER TABLE mis_tab_hat_adresse
    ADD CONSTRAINT mis_nn_hat_adresse_ID_Personen
    CHECK (ID_Personen IS NOT NULL);
    
ALTER TABLE mis_tab_personen
    ADD CONSTRAINT mis_nn_personen_ID_Personen
    CHECK (ID_Personen IS NOT NULL);
    
    
ALTER TABLE mis_tab_personen
    ADD CONSTRAINT mis_nn_personen_Nachname
    CHECK (Nachname IS NOT NULL);

ALTER TABLE mis_tab_personen
    ADD CONSTRAINT mis_nn_personen_Geburtsdatum
    CHECK (Geburtsdatum IS NOT NULL);
    
ALTER TABLE mis_tab_personen
    ADD CONSTRAINT mis_nn_personen_Mail
    CHECK (Mail IS NOT NULL);
    
ALTER TABLE mis_tab_Vorname
    ADD CONSTRAINT mis_nn_Vorname_ID_Personen
    CHECK (ID_Personen IS NOT NULL);

ALTER TABLE mis_tab_Vorname
    ADD CONSTRAINT mis_nn_Vorname_lfd_nr
    CHECK (lfd_nr IS NOT NULL);
    
ALTER TABLE mis_tab_Vorname
    ADD CONSTRAINT mis_nn_Vorname_Vorname
    CHECK (Vorname IS NOT NULL);
    
ALTER TABLE mis_tab_Kuratoren
    ADD CONSTRAINT mis_nn_Kuratoren_ID_Kuratoren
    CHECK (ID_Kuratoren IS NOT NULL);
    
ALTER TABLE mis_tab_Kuratoren
    ADD CONSTRAINT mis_nn_Kuratoren_Gehalt
    CHECK (Gehalt IS NOT NULL);
    
ALTER TABLE mis_tab_Kuratoren
    ADD CONSTRAINT mis_nn_Kuratoren_ID_Personen
    CHECK (ID_Personen IS NOT NULL);
    
ALTER TABLE mis_tab_gestalten
    ADD CONSTRAINT mis_nn_gestalten_ID_Kuratoren
    CHECK (ID_Kuratoren IS NOT NULL);
    
ALTER TABLE mis_tab_gestalten
    ADD CONSTRAINT mis_nn_gestalten_ID_Aus
    CHECK (ID_Ausstellungen IS NOT NULL);   
    
ALTER TABLE mis_tab_Ausstellungen
    ADD CONSTRAINT mis_nn_Ausstellungen_ID_Aus
    CHECK (ID_Ausstellungen IS NOT NULL);    
    
ALTER TABLE mis_tab_Ausstellungen
    ADD CONSTRAINT mis_nn_Ausstellungen_Name
    CHECK (Name IS NOT NULL);

ALTER TABLE mis_tab_Ausstellungen
    ADD CONSTRAINT mis_nn_Ausstellungen_Startd
    CHECK (Startdatum IS NOT NULL);
    
ALTER TABLE mis_tab_Ausstellungen
    ADD CONSTRAINT mis_nn_Ausstellungen_Endd
    CHECK (Enddatum IS NOT NULL);        
    
ALTER TABLE mis_tab_Gebaeude
    ADD CONSTRAINT mis_nn_Gebaeude_ID_Gebaeude
    CHECK (ID_Gebaeude IS NOT NULL);          
    
ALTER TABLE mis_tab_Gebaeude
    ADD CONSTRAINT mis_nn_Gebaeude_Name
    CHECK (Name IS NOT NULL);            
    
ALTER TABLE mis_tab_Gebaeude
    ADD CONSTRAINT mis_nn_Gebaeude_ID_Adresse
    CHECK (ID_Adresse IS NOT NULL);     
    
ALTER TABLE mis_tab_Raeume
    ADD CONSTRAINT mis_nn_Raeume_ID_Raeume
    CHECK (ID_Raeume IS NOT NULL);    
    
ALTER TABLE mis_tab_Raeume
    ADD CONSTRAINT mis_nn_Raeume_Bezeichnung
    CHECK (Bezeichnung IS NOT NULL);
    
ALTER TABLE mis_tab_Raeume
    ADD CONSTRAINT mis_nn_Raeume_Groesse
    CHECK (Groesse IS NOT NULL);

ALTER TABLE mis_tab_Raeume
    ADD CONSTRAINT mis_nn_Raeume_ID_Gebaeude
    CHECK (ID_Gebaeude IS NOT NULL);
    
ALTER TABLE mis_tab_Stellplaetze
    ADD CONSTRAINT mis_nn_Stell_ID_Stell
    CHECK (ID_Stellplaetze IS NOT NULL);
    
ALTER TABLE mis_tab_Stellplaetze
    ADD CONSTRAINT mis_nn_Stell_LBH_Laenge
    CHECK (LBH_Laenge IS NOT NULL);
    
ALTER TABLE mis_tab_Stellplaetze
    ADD CONSTRAINT mis_nn_Stell_LBH_Breite
    CHECK (LBH_Breite IS NOT NULL);
    
ALTER TABLE mis_tab_Stellplaetze
    ADD CONSTRAINT mis_nn_Stell_LBH_Hoehe
    CHECK (LBH_Hoehe IS NOT NULL);
    
ALTER TABLE mis_tab_Stellplaetze
    ADD CONSTRAINT mis_nn_Stell_Temperatur
    CHECK (Temperatur IS NOT NULL);
    
ALTER TABLE mis_tab_Stellplaetze
    ADD CONSTRAINT mis_nn_Stell_Luftfeuchte
    CHECK (Luftfeuchte IS NOT NULL);
    
ALTER TABLE mis_tab_Stellplaetze
    ADD CONSTRAINT mis_nn_Stell_Beleuchtung
    CHECK (Beleuchtung IS NOT NULL);
    
ALTER TABLE mis_tab_Stellplaetze
    ADD CONSTRAINT mis_nn_Stell_ID_Raeume
    CHECK (ID_Raeume IS NOT NULL);
    
ALTER TABLE mis_tab_Exponate
    ADD CONSTRAINT mis_nn_Exponate_ID_Exponate
    CHECK (ID_Exponate IS NOT NULL);
    
ALTER TABLE mis_tab_Exponate
    ADD CONSTRAINT mis_nn_Exponate_Bezeichnung
    CHECK (Bezeichnung IS NOT NULL);
    
ALTER TABLE mis_tab_Exponate
    ADD CONSTRAINT mis_nn_Exponate_Herkunft
    CHECK (Herkunft IS NOT NULL);
    
ALTER TABLE mis_tab_Exponate
    ADD CONSTRAINT mis_nn_Exponate_Alter
    CHECK (ex_Alter IS NOT NULL);
    
ALTER TABLE mis_tab_Exponate
    ADD CONSTRAINT mis_nn_Exponate_Akqui
    CHECK (Akquisitionsdatum IS NOT NULL);
    
ALTER TABLE mis_tab_Exponate
    ADD CONSTRAINT mis_nn_Exponate_Zustand
    CHECK (Zustand IS NOT NULL);
    
ALTER TABLE mis_tab_praesentieren
    ADD CONSTRAINT mis_nn_prae_ID_Exponate
    CHECK (ID_Exponate IS NOT NULL);
    
ALTER TABLE mis_tab_praesentieren
    ADD CONSTRAINT mis_nn_prae_ID_Aus
    CHECK (ID_Ausstellungen IS NOT NULL);
    
ALTER TABLE mis_tab_einplanen
    ADD CONSTRAINT mis_nn_einplanen_ID_Aus
    CHECK (ID_Ausstellungen IS NOT NULL);
    
ALTER TABLE mis_tab_einplanen
    ADD CONSTRAINT mis_nn_einplanen_ID_Raeume
    CHECK (ID_Raeume IS NOT NULL);
    
ALTER TABLE mis_tab_Leihpartner
    ADD CONSTRAINT mis_nn_Leihp_ID_Leihp
    CHECK (ID_Leihpartner IS NOT NULL);
    
ALTER TABLE mis_tab_Leihpartner
    ADD CONSTRAINT mis_nn_Leihp_ID_Personen
    CHECK (ID_Personen IS NOT NULL);
    
ALTER TABLE mis_tab_Leihpartner
    ADD CONSTRAINT mis_nn_Leihp_Org
    CHECK (Organisation IS NOT NULL);
    
ALTER TABLE mis_tab_leihen
    ADD CONSTRAINT mis_nn_leihen_ID_Leihp
    CHECK (ID_Leihpartner IS NOT NULL);
    
ALTER TABLE mis_tab_leihen
    ADD CONSTRAINT mis_nn_leihen_ID_Exponate
    CHECK (ID_Exponate IS NOT NULL);
    
ALTER TABLE mis_tab_leihen
    ADD CONSTRAINT mis_nn_leihen_lfd_nr
    CHECK (lfd_nr IS NOT NULL);
    
ALTER TABLE mis_tab_leihen
    ADD CONSTRAINT mis_nn_leihen_ist_Leihgabe
    CHECK (ist_Leihgabe IS NOT NULL);
    
ALTER TABLE mis_tab_leihen
    ADD CONSTRAINT mis_nn_leihen_Startdatum
    CHECK (Startdatum IS NOT NULL);
    
ALTER TABLE mis_tab_leihen
    ADD CONSTRAINT mis_nn_leihen_Enddatum
    CHECK (Enddatum IS NOT NULL);
    
ALTER TABLE mis_tab_Kategorien
    ADD CONSTRAINT mis_nn_Kat_ID_Kat
    CHECK (ID_Kategorien IS NOT NULL);
    
ALTER TABLE mis_tab_Kategorien
    ADD CONSTRAINT mis_nn_Kat_Bezeichnung
    CHECK (Bezeichnung IS NOT NULL);
    
ALTER TABLE mis_tab_hat
    ADD CONSTRAINT mis_nn_hat_ID_Kat
    CHECK (ID_Kategorien IS NOT NULL);
    
ALTER TABLE mis_tab_hat
    ADD CONSTRAINT mis_nn_hat_ID_Exponate
    CHECK (ID_Exponate IS NOT NULL);
    
ALTER TABLE mis_tab_enthaelt
    ADD CONSTRAINT mis_nn_enthaelt_ID_Exponate
    CHECK (ID_Exponate IS NOT NULL);
    
ALTER TABLE mis_tab_enthaelt
    ADD CONSTRAINT mis_nn_enthaelt_ID_Stellp
    CHECK (ID_Stellplaetze IS NOT NULL);
    
ALTER TABLE mis_tab_hat_nachbar
    ADD CONSTRAINT mis_nn_hat_nachbar_ID_Stellp
    CHECK (ID_Stellplaetze IS NOT NULL);
    
ALTER TABLE mis_tab_hat_nachbar
    ADD CONSTRAINT mis_nn_hat_nachbar_ID_Nachbar
    CHECK (ID_Nachbar IS NOT NULL);
    
    

-- </notnull>

-- ***************************************************************
-- * Primary Key Constraint Section
--
-- <pk>

ALTER TABLE mis_tab_Adresse
    ADD CONSTRAINT mis_pk_Adresse
    PRIMARY KEY (ID_Adresse);
    
ALTER TABLE mis_tab_hat_adresse
    ADD CONSTRAINT mis_pk_hat_adresse
    PRIMARY KEY (ID_Adresse, ID_Personen);
    
ALTER TABLE mis_tab_Personen
    ADD CONSTRAINT mis_pk_Personen
    PRIMARY KEY (ID_Personen);
    
ALTER TABLE mis_tab_Vorname
    ADD CONSTRAINT mis_pk_Vorname
    PRIMARY KEY (ID_Personen, lfd_nr);
    
ALTER TABLE mis_tab_Kuratoren
    ADD CONSTRAINT mis_pk_Kuratoren
    PRIMARY KEY (ID_Kuratoren);
    
ALTER TABLE mis_tab_gestalten
    ADD CONSTRAINT mis_pk_gestalten
    PRIMARY KEY (ID_Kuratoren, ID_Ausstellungen);
    
ALTER TABLE mis_tab_Ausstellungen
    ADD CONSTRAINT mis_pk_Ausstellungen
    PRIMARY KEY (ID_Ausstellungen);
    
ALTER TABLE mis_tab_Gebaeude
    ADD CONSTRAINT mis_pk_Gebaeude
    PRIMARY KEY (ID_Gebaeude);
    
ALTER TABLE mis_tab_Raeume
    ADD CONSTRAINT mis_pk_Raeume
    PRIMARY KEY (ID_Raeume);
    
ALTER TABLE mis_tab_Stellplaetze
    ADD CONSTRAINT mis_pk_Stellplaetze
    PRIMARY KEY (ID_Stellplaetze);
    
ALTER TABLE mis_tab_Exponate
    ADD CONSTRAINT mis_pk_Exponate
    PRIMARY KEY (ID_Exponate);
    
ALTER TABLE mis_tab_praesentieren
    ADD CONSTRAINT mis_pk_praesentieren
    PRIMARY KEY (ID_Ausstellungen, ID_Exponate);
    
ALTER TABLE mis_tab_einplanen
    ADD CONSTRAINT mis_pk_einplanen
    PRIMARY KEY (ID_Ausstellungen, ID_Raeume);
    
ALTER TABLE mis_tab_Leihpartner
    ADD CONSTRAINT mis_pk_Leihpartner
    PRIMARY KEY (ID_Leihpartner);
    
ALTER TABLE mis_tab_leihen
    ADD CONSTRAINT mis_pk_leihen
    PRIMARY KEY (ID_Leihpartner, ID_Exponate, lfd_nr);
    
ALTER TABLE mis_tab_Kategorien
    ADD CONSTRAINT mis_pk_Kategorien
    PRIMARY KEY (ID_Kategorien);
    
ALTER TABLE mis_tab_hat
    ADD CONSTRAINT mis_pk_hat
    PRIMARY KEY (ID_Kategorien, ID_Exponate);
    
ALTER TABLE mis_tab_enthaelt
    ADD CONSTRAINT mis_pk_enthaelt
    PRIMARY KEY (ID_Stellplaetze, ID_Exponate);
    
ALTER TABLE mis_tab_hat_nachbar
    ADD CONSTRAINT mis_pk_hat_nachbar
    PRIMARY KEY (ID_Stellplaetze, ID_Nachbar);

-- </pk>

-- ***************************************************************
-- * Unique Key Constraint Section
--
-- <unique>

ALTER TABLE mis_tab_Personen
    ADD CONSTRAINT mis_uk_Personen_Mail
    UNIQUE (Mail);

ALTER TABLE mis_tab_Kuratoren
    ADD CONSTRAINT mis_uk_Kuratoren_ID_Personen
    UNIQUE (ID_Personen);
    
ALTER TABLE mis_tab_Ausstellungen
    ADD CONSTRAINT mis_uk_Name_Datum
    UNIQUE (Name, Startdatum, Enddatum);
    
ALTER TABLE mis_tab_Gebaeude
    ADD CONSTRAINT mis_uk_Gebaeude_ID_Adresse
    UNIQUE (ID_Adresse);
    
ALTER TABLE mis_tab_Raeume
    ADD CONSTRAINT mis_uk_Gebaeude_Bezeichnung
    UNIQUE (Bezeichnung);
    
ALTER TABLE mis_tab_Exponate
    ADD CONSTRAINT mis_uk_Exponate_Bezeichnung
    UNIQUE (Bezeichnung);
    
ALTER TABLE mis_tab_Leihpartner
    ADD CONSTRAINT mis_uk_Leihp_ID_Personen
    UNIQUE (ID_Personen);
    
ALTER TABLE mis_tab_Kategorien
    ADD CONSTRAINT mis_uk_Kat_Bezeichnung
    UNIQUE (Bezeichnung);
    
-- </unique>

-- ***************************************************************
-- * Foreign Key Constraint Section
--
-- <fk>
ALTER TABLE mis_tab_hat_adresse
    ADD CONSTRAINT mis_fk_hat_adresse_Adresse
    FOREIGN KEY (ID_Adresse)
    REFERENCES mis_tab_Adresse;

ALTER TABLE mis_tab_hat_adresse
    ADD CONSTRAINT mis_fk_hat_adresse_Personen
    FOREIGN KEY (ID_Personen)
    REFERENCES mis_tab_Personen;
    
ALTER TABLE mis_tab_Vorname
    ADD CONSTRAINT mis_fk_Vorname_Personen
    FOREIGN KEY (ID_Personen)
    REFERENCES mis_tab_Personen;    
    
ALTER TABLE mis_tab_Kuratoren
    ADD CONSTRAINT mis_fk_Kuratore_Personen
    FOREIGN KEY (ID_Personen)
    REFERENCES mis_tab_Personen;
    
ALTER TABLE mis_tab_gestalten
    ADD CONSTRAINT mis_fk_gestalten_Kuratoren
    FOREIGN KEY (ID_Kuratoren)
    REFERENCES mis_tab_Kuratoren;    
    
ALTER TABLE mis_tab_gestalten
    ADD CONSTRAINT mis_fk_gestalten_Ausstellungen
    FOREIGN KEY (ID_Ausstellungen)
    REFERENCES mis_tab_Ausstellungen;
    
ALTER TABLE mis_tab_Gebaeude
    ADD CONSTRAINT mis_fk_Gebaeude_Adresse
    FOREIGN KEY (ID_Adresse)
    REFERENCES mis_tab_Adresse;

ALTER TABLE mis_tab_Raeume
    ADD CONSTRAINT mis_fk_Raeume_Gebaeude
    FOREIGN KEY (ID_Gebaeude)
    REFERENCES mis_tab_Gebaeude;
    
ALTER TABLE mis_tab_Stellplaetze
    ADD CONSTRAINT mis_fk_Stellplaetze_Raeume
    FOREIGN KEY (ID_Raeume)
    REFERENCES mis_tab_Raeume;
    
ALTER TABLE mis_tab_Exponate
    ADD CONSTRAINT mis_fk_Exponate_Kuratoren
    FOREIGN KEY (ID_Kuratoren)
    REFERENCES mis_tab_Kuratoren;
    
ALTER TABLE mis_tab_praesentieren
    ADD CONSTRAINT mis_fk_praes_Exponate
    FOREIGN KEY (ID_Exponate)
    REFERENCES mis_tab_Exponate;
    
ALTER TABLE mis_tab_praesentieren
    ADD CONSTRAINT mis_fk_praes_Aus
    FOREIGN KEY (ID_Ausstellungen)
    REFERENCES mis_tab_Ausstellungen;
    
ALTER TABLE mis_tab_einplanen
    ADD CONSTRAINT mis_fk_einplanen_Ausstellungen
    FOREIGN KEY (ID_Ausstellungen)
    REFERENCES mis_tab_Ausstellungen;
    
ALTER TABLE mis_tab_einplanen
    ADD CONSTRAINT mis_fk_einplanen_Raeume
    FOREIGN KEY (ID_Raeume)
    REFERENCES mis_tab_Raeume;
    
ALTER TABLE mis_tab_Leihpartner
    ADD CONSTRAINT mis_fk_Leihp_Personen
    FOREIGN KEY (ID_Personen)
    REFERENCES mis_tab_Personen;
    
ALTER TABLE mis_tab_leihen
    ADD CONSTRAINT mis_fk_leihen_Leihp
    FOREIGN KEY (ID_Leihpartner)
    REFERENCES mis_tab_Leihpartner;
    
ALTER TABLE mis_tab_leihen
    ADD CONSTRAINT mis_fk_leihen_Exponate
    FOREIGN KEY (ID_Exponate)
    REFERENCES mis_tab_Exponate;
    
ALTER TABLE mis_tab_hat
    ADD CONSTRAINT mis_fk_hat_Exponate
    FOREIGN KEY (ID_Exponate)
    REFERENCES mis_tab_Exponate;
    
ALTER TABLE mis_tab_hat
    ADD CONSTRAINT mis_fk_hat_Kategorien
    FOREIGN KEY (ID_Kategorien)
    REFERENCES mis_tab_Kategorien;
    
ALTER TABLE mis_tab_enthaelt
    ADD CONSTRAINT mis_fk_enthaelt_Exponate
    FOREIGN KEY (ID_Exponate)
    REFERENCES mis_tab_Exponate;
    
ALTER TABLE mis_tab_enthaelt
    ADD CONSTRAINT mis_fk_enthaelt_Stellplaetze
    FOREIGN KEY (ID_Stellplaetze)
    REFERENCES mis_tab_Stellplaetze;
    
ALTER TABLE mis_tab_hat_nachbar
    ADD CONSTRAINT mis_fk_hat_nachbar_Stellp
    FOREIGN KEY (ID_Stellplaetze)
    REFERENCES mis_tab_Stellplaetze;
    
ALTER TABLE mis_tab_hat_nachbar
    ADD CONSTRAINT mis_fk_hat_nachbar_Nachb
    FOREIGN KEY (ID_Nachbar)
    REFERENCES mis_tab_Stellplaetze;

-- </fk>

-- ***************************************************************
-- * SQL*plus Job Control Section
--
-- <sqlplus>

spool off

-- </sqlplus>
