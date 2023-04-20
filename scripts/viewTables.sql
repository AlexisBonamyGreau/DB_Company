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

-- Notification not read
