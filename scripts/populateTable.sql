TRUNCATE TABLE EMPLOYE CASCADE;
TRUNCATE TABLE TELETRAVAIL CASCADE;
TRUNCATE TABLE CONGES CASCADE;
TRUNCATE TABLE ABSENCE CASCADE;
TRUNCATE TABLE HEURESUPP CASCADE;
TRUNCATE TABLE NOTIFICATION CASCADE;
TRUNCATE TABLE HORAIRE CASCADE;

-- Insertion des données dans la table EMPLOYE
INSERT INTO EMPLOYE VALUES (1, 'Dupont', 'Jean', to_date('2000-01-01', 'YYYY-MM-DD'), '2 rue de la Paix', '0606060606', 'jean.dupont@company.com', 'pass', 'Directeur Général', 1, 1);
INSERT INTO EMPLOYE VALUES (2, 'Durand', 'Pierre', to_date('2000-01-01', 'YYYY-MM-DD'), '2 rue de la Paix', '0606060606', 'pierre.durand@company.com', 'pass', 'Directeur de service', 1, 1);

-- Insertion des données dans la table TELETRAVAIL
INSERT INTO TELETRAVAIL VALUES (1, 2, 1, to_date('2023-04-19', 'YYYY-MM-DD'), to_date('2023-04-19', 'YYYY-MM-DD'), 1);

-- Insertion des données dans la table CONGES
INSERT INTO CONGES VALUES (1, 2, 1, to_date('2023-04-24', 'YYYY-MM-DD'), to_date('2023-04-28', 'YYYY-MM-DD'), 1);

-- Insertion des données dans la table ABSENCE
INSERT INTO ABSENCE VALUES (1, 2, to_date('2023-04-20', 'YYYY-MM-DD'), to_date('2023-04-20', 'YYYY-MM-DD'));

-- Insertion des données dans la table HEURESUPP
INSERT INTO HEURESUPP VALUES (1, 2, to_date('2023-04-21', 'YYYY-MM-DD'), 16, TO_TIMESTAMP('21-APR-23 05.00.00.000000000 PM', 'DD-MON-YY HH.MI.SS.FF PM'), TO_TIMESTAMP('21-APR-23 07.00.00.000000000 PM', 'DD-MON-YY HH.MI.SS.FF PM'));

-- Insertion des données dans la table NOTIFICATION
INSERT INTO NOTIFICATION VALUES (1, 1, to_date('2023-04-19', 'YYYY-MM-DD'), 'Vous avez une demande de télétravail à valider', 0);

-- Insertion des données dans la table HORAIRE
INSERT INTO HORAIRE VALUES (1, 2, to_date('2023-04-21', 'YYYY-MM-DD'), 16, TO_TIMESTAMP('21-APR-23 08.00.00.000000000 AM', 'DD-MON-YY HH.MI.SS.FF AM'), TO_TIMESTAMP('21-APR-23 12.00.00.000000000 AM', 'DD-MON-YY HH.MI.SS.FF AM'));
INSERT INTO HORAIRE VALUES (2, 2, to_date('2023-04-21', 'YYYY-MM-DD'), 16, TO_TIMESTAMP('21-APR-23 01.00.00.000000000 PM', 'DD-MON-YY HH.MI.SS.FF PM'), TO_TIMESTAMP('21-APR-23 05.00.00.000000000 PM', 'DD-MON-YY HH.MI.SS.FF PM'));