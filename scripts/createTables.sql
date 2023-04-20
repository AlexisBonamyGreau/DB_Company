DROP TABLE EMPLOYE CASCADE CONSTRAINTS;
DROP TABLE TELETRAVAIL CASCADE CONSTRAINTS;
DROP TABLE CONGES CASCADE CONSTRAINTS;
DROP TABLE ABSENCE CASCADE CONSTRAINTS;
DROP TABLE HEURESUPP CASCADE CONSTRAINTS;
DROP TABLE NOTIFICATION CASCADE CONSTRAINTS;
DROP TABLE HORAIRE CASCADE CONSTRAINTS;
DROP TABLE RAPPORTHEBDO CASCADE CONSTRAINTS;

CREATE TABLE EMPLOYE
  (
    id_emp INT NOT NULL,
    nom VARCHAR2(20) NOT NULL,
    prenom VARCHAR2(20) NOT NULL,
    date_naissance DATE NOT NULL,
    adresse VARCHAR2(50) NOT NULL,
    telephone VARCHAR2(10) NOT NULL,
    mail VARCHAR2(50) NOT NULL,
    mdp VARCHAR2(20) NOT NULL,
    poste VARCHAR2(20) NOT NULL,
    tt_possible INT NOT NULL,
    est_responsable INT NOT NULL,
    PRIMARY KEY (id_emp)
  );

CREATE TABLE TELETRAVAIL
  (
    id_tt INT NOT NULL,
    id_employe INT NOT NULL,
    id_responsable_validant INT NOT NULL,
    date_debut DATE NOT NULL,
    date_fin DATE NOT NULL,
    est_valide INT NOT NULL,
    PRIMARY KEY (id_tt),
    FOREIGN KEY (id_employe) REFERENCES EMPLOYE(id_emp),
    FOREIGN KEY (id_responsable_validant) REFERENCES EMPLOYE(id_emp) ON DELETE CASCADE
  );

CREATE TABLE CONGES
  (
    id_conges INT NOT NULL,
    id_employe INT NOT NULL,
    id_responsable_validant INT NOT NULL,
    date_debut DATE NOT NULL,
    date_fin DATE NOT NULL,
    est_valide INT NOT NULL,
    PRIMARY KEY (id_conges),
    FOREIGN KEY (id_employe) REFERENCES EMPLOYE(id_emp),
    FOREIGN KEY (id_responsable_validant) REFERENCES EMPLOYE(id_emp) ON DELETE CASCADE
  );

CREATE TABLE ABSENCE
  (
    id_abs INT NOT NULL,
    id_employe INT NOT NULL,
    date_debut DATE NOT NULL,
    date_fin DATE NOT NULL,
    PRIMARY KEY (id_abs),
    FOREIGN KEY (id_employe) REFERENCES EMPLOYE(id_emp) ON DELETE CASCADE
  );

CREATE TABLE HEURESUPP
  (
    id_hsupp INT NOT NULL,
    id_employe INT NOT NULL,
    id_responsable_validant INT,
    numero_semaine INT NOT NULL,
    heure_debut DATE NOT NULL,
    heure_fin DATE NOT NULL,
    PRIMARY KEY (id_hsupp),
    FOREIGN KEY (id_employe) REFERENCES EMPLOYE(id_emp) ON DELETE CASCADE
  );

CREATE TABLE NOTIFICATION
  (
    id_notif INT NOT NULL,
    id_employe INT NOT NULL,
    date_notif DATE NOT NULL,
    message VARCHAR2(100) NOT NULL,
    est_lue INT NOT NULL,
    PRIMARY KEY (id_notif),
    FOREIGN KEY (id_employe) REFERENCES EMPLOYE(id_emp) ON DELETE CASCADE
  );

CREATE TABLE HORAIRE
  (
    id_horaire INT NOT NULL,
    id_employe INT NOT NULL,
    numero_semaine INT NOT NULL,
    heure_debut DATE NOT NULL,
    heure_fin DATE NOT NULL,
    PRIMARY KEY (id_horaire),
    FOREIGN KEY (id_employe) REFERENCES EMPLOYE(id_emp) ON DELETE CASCADE
  );

CREATE TABLE RAPPORTHEBDO
  (
    id_rapport INT NOT NULL,
    id_employe INT NOT NULL,
    numero_semaine INT NOT NULL,
    annee INT NOT NULL,
    tps_tt INT NOT NULL,
    tps_conges INT NOT NULL,
    tps_abs INT NOT NULL,
    tps_hsupp INT NOT NULL,
    tps_travail INT NOT NULL,
    PRIMARY KEY (id_rapport),
    FOREIGN KEY (id_employe) REFERENCES EMPLOYE(id_emp) ON DELETE CASCADE
  );