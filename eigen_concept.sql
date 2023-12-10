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

-- </pk>

-- ***************************************************************
-- * Unique Key Constraint Section
--
-- <unique>

ALTER TABLE mis_tab_Personen
    ADD CONSTRAINT mis_uk_Personen_Mail
    UNIQUE (Mail);

    
-- </unique>

-- ***************************************************************
-- * Foreign Key Constraint Section
--
-- <fk>
ALTER TABLE mis_tab_hat_adresse
    ADD CONSTRAINT mis_fk_hat_adresse_adresse
    FOREIGN KEY (ID_Adresse)
    REFERENCES mis_tab_Adresse;

ALTER TABLE mis_tab_hat_adresse
    ADD CONSTRAINT mis_fk_hat_adresse_personen
    FOREIGN KEY (ID_Personen)
    REFERENCES mis_tab_Personen;

-- </fk>

-- ***************************************************************
-- * SQL*plus Job Control Section
--
-- <sqlplus>

spool off

-- </sqlplus>
