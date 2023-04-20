SELECT * FROM EMPLOYE;
SELECT * FROM TELETRAVAIL;
SELECT * FROM CONGES;
SELECT * FROM ABSENCE;
SELECT * FROM HEURESUPP;
SELECT * FROM NOTIFICATION;
SELECT * FROM HORAIRE;
SELECT * FROM RAPPORTHEBDO;

-- Find the number of employees in each position
SELECT poste, COUNT(*) AS nb_employes
FROM EMPLOYE
GROUP BY poste;

-- Find the number of vacation days taken by each employee
SELECT nom, prenom, SUM(date_fin - date_debut) AS nb_jours_conges
FROM EMPLOYE
JOIN CONGES ON EMPLOYE.id_emp = CONGES.id_employe
GROUP BY nom, prenom;

-- Find the number of support hours worked by each employee
SELECT nom, prenom, EXTRACT(HOUR FROM NUMTODSINTERVAL(heure_fin - heure_debut, 'DAY')) AS nb_heures_supp
FROM EMPLOYE
JOIN HEURESUPP ON EMPLOYE.id_emp = HEURESUPP.id_employe;

-- Find the number of telework days taken by each employee separating validated and not validated

-- Find the positions with more than 5 employees