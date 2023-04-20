 -- Create a view with all the absences of the responsible
CREATE OR REPLACE VIEW V_RESPONSABLE_ABSENCE AS
SELECT * FROM ABSENCE
WHERE id_employe IN (SELECT id_emp FROM EMPLOYE WHERE est_responsable = 1);
-- Test
SELECT * FROM V_RESPONSABLE_ABSENCE;
SELECT * FROM ABSENCE;

-- Vacation demands waiting for approval
CREATE OR REPLACE VIEW V_DEMANDE_CONGES AS
SELECT * FROM CONGES
WHERE est_valide = 0;
-- Test
SELECT * FROM V_DEMANDE_CONGES;
SELECT * FROM CONGES;

-- Support hours realized during a week
CREATE VIEW HEURESUPP_SEMAINE AS
SELECT e.nom, e.prenom, hs.numero_semaine, SUM((hs.heure_fin - hs.heure_debut) * 24) AS heures_supplementaires
FROM EMPLOYE e
JOIN HEURESUPP hs ON e.id_emp = hs.id_employe
GROUP BY e.nom, e.prenom, hs.numero_semaine;

-- Notification not read
CREATE VIEW NOTIFICATIONS_NON_LUES AS
SELECT id_emp, COUNT(*) AS nb_notifications_non_lues
FROM EMPLOYE e JOIN NOTIFICATION n ON e.id_emp = n.id_employe
WHERE n.est_lue = 0
GROUP BY id_emp;