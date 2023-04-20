-- Check if an employe can work from home before creating a word from home request
CREATE OR REPLACE TRIGGER TELETRAVAIL_TT_POSSIBLE_TRG
BEFORE INSERT ON TELETRAVAIL
FOR EACH ROW
DECLARE
    tt_possible INTEGER;
BEGIN
    SELECT tt_possible INTO tt_possible FROM EMPLOYE WHERE id_emp = :new.id_employe;
    IF tt_possible <> 1 THEN
        RAISE_APPLICATION_ERROR(-20001, 'Le télétrvail est impossibe pour cet employé');
    END IF;
END;
/
-- Test
INSERT INTO TELETRAVAIL VALUES (3, 3, 1, to_date('2023-04-24', 'YYYY-MM-DD'), to_date('2023-04-28', 'YYYY-MM-DD'), 0);


-- Send a notification to the responsibles when an employee asks for a vacation
CREATE SEQUENCE NOTIFICATION_SEQ;
CREATE OR REPLACE TRIGGER TRIGGER_VACATION
AFTER INSERT ON CONGES
FOR EACH ROW
DECLARE
BEGIN
    INSERT INTO NOTIFICATION (id_notif, id_employe, date_notif, message, est_lue)
    SELECT NOTIFICATION_SEQ.nextval, id_emp, SYSDATE, 'Un employe a depose une demande de conges', 0
    FROM EMPLOYE
    WHERE est_responsable = 1;
END;
/
-- Test
INSERT INTO CONGES VALUES (3, 3, 1, to_date('2023-04-24', 'YYYY-MM-DD'), to_date('2023-04-28', 'YYYY-MM-DD'), 0);

-- Send a notification to the employee when a vacation is validated
CREATE OR REPLACE TRIGGER TRIGGER_VACATION_VALIDATED
AFTER UPDATE ON CONGES
FOR EACH ROW
DECLARE
BEGIN
    IF :OLD.est_valide = 0 AND :NEW.est_valide = 1 THEN
        INSERT INTO NOTIFICATION (id_notif, id_employe, date_notif, message, est_lue)
        VALUES (NOTIFICATION_SEQ.nextval, :NEW.id_employe, SYSDATE, 'Votre demande de congés a été validée', 0);
    END IF;
END;
/
-- Test
UPDATE CONGES SET est_valide = 1 WHERE id_conges = 2;

-- Send a notification to the employee when a vacation is rejected
CREATE OR REPLACE TRIGGER TRIGGER_VACATION_REJECTED
AFTER DELETE ON CONGES
FOR EACH ROW
DECLARE
BEGIN
  -- Créer une notification pour l'employé
  INSERT INTO NOTIFICATION (id_notif, id_employe, date_notif, message, est_lue)
  VALUES (NOTIFICATION_SEQ.NEXTVAL, :OLD.id_employe, SYSDATE, 'Votre demande de congé a été supprimée.', 0);
END;
/
-- Test
DELETE FROM CONGES WHERE id_conges = 3;
-- Update weekly report when an employee asks for a vacation and the vacation is validated
CREATE OR REPLACE TRIGGER TRIGGER_VACATION_WEEKLY_REPORT
AFTER UPDATE ON CONGES
FOR EACH ROW
DECLARE
BEGIN
    IF :OLD.est_valide = 0 AND :NEW.est_valide = 1 THEN
        UPDATE RAPPORTHEBDO
        SET tps_conges = tps_conges + EXTRACT(DAY FROM NUMTODSINTERVAL(:NEW.date_fin - :NEW.date_debut, 'DAY')) + 1
        WHERE id_employe = :NEW.id_employe;
        UPDATE RAPPORTHEBDO
        SET tps_travail = tps_travail - EXTRACT(DAY FROM NUMTODSINTERVAL(:NEW.date_fin - :NEW.date_debut, 'DAY')) + 1
        WHERE id_employe = :NEW.id_employe;
    END IF;
END;
/
-- Test
UPDATE CONGES SET est_valide = 1 WHERE id_conges = 2;
