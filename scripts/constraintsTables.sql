-- Check if the employee does not have a report for the week and the year
ALTER TABLE RAPPORTHEBDO
ADD CONSTRAINT unique_rapport_hebdo UNIQUE (id_employe, numero_semaine, annee);
-- Test the constraint
INSERT INTO RAPPORTHEBDO VALUES (2, 2, 16, 2023, 1, 5, 1, 2, 8); -- should not work
INSERT INTO RAPPORTHEBDO VALUES (2, 2, 17, 2023, 1, 5, 1, 2, 8); -- should work

-- Check if the start date is before the end date when a vacation is requested
ALTER TABLE CONGES
ADD CONSTRAINT conges_date CHECK (date_fin > date_debut);
-- Test the constraint
INSERT INTO CONGES VALUES (3, 3, 1, to_date('2023-04-24', 'YYYY-MM-DD'), to_date('2023-04-23', 'YYYY-MM-DD'), 0); -- should not work
INSERT INTO CONGES VALUES (3, 3, 1, to_date('2023-04-24', 'YYYY-MM-DD'), to_date('2023-04-28', 'YYYY-MM-DD'), 0); -- should work
