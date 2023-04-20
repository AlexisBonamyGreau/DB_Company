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
INSERT INTO EMPLOYE VALUES (3, 'Martin', 'Paul', to_date('2000-01-01', 'YYYY-MM-DD'), '2 rue de la Paix', '0606060606', 'paul.martin@company.com', 'pass', 'Directeur de service', 1, 1);
INSERT INTO EMPLOYE VALUES (4, 'Bernard', 'Jacques', to_date('2000-01-01', 'YYYY-MM-DD'), '2 rue de la Paix', '0606060606', 'bernard.jacques@company.com', 'pass', 'Ingenieur conception', 1, 0);

-- Insertion des données dans la table TELETRAVAIL
INSERT INTO TELETRAVAIL VALUES (1, 2, 1, to_date('2023-04-19', 'YYYY-MM-DD'), to_date('2023-04-19', 'YYYY-MM-DD'), 1);

-- Insertion des données dans la table CONGES
INSERT INTO CONGES VALUES (1, 2, 1, to_date('2023-04-24', 'YYYY-MM-DD'), to_date('2023-04-28', 'YYYY-MM-DD'), 1);

-- Insertion des données dans la table ABSENCE
INSERT INTO ABSENCE VALUES (1, 2, to_date('2023-04-20', 'YYYY-MM-DD'), to_date('2023-04-20', 'YYYY-MM-DD'));

-- Insertion des données dans la table HEURESUPP
INSERT INTO HEURESUPP VALUES (1, 2, 1, 16, to_date('2023-04-21 17:00:00', 'YYYY-MM-DD HH24:MI:SS'), to_date('2023-04-21 19:00:00', 'YYYY-MM-DD HH24:MI:SS'));

-- Insertion des données dans la table NOTIFICATION
INSERT INTO NOTIFICATION VALUES (1, 1, to_date('2023-04-19', 'YYYY-MM-DD'), 'Vous avez une demande de télétravail à valider', 0);

-- Insertion des données dans la table HORAIRE
INSERT INTO HORAIRE VALUES (1, 2, 16, to_date('2023-04-21 08:00:00', 'YYYY-MM-DD HH24:MI:SS'), to_date('2023-04-21 12:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO HORAIRE VALUES (2, 2, 16, to_date('2023-04-21 13:00:00', 'YYYY-MM-DD HH24:MI:SS'), to_date('2023-04-21 17:00:00', 'YYYY-MM-DD HH24:MI:SS'));