CREATE OR REPLACE TRIGGER secure_emp
BEFORE INSERT OR UPDATE OR DELETE ON employees
BEGIN
 IF (TO_CHAR(SYSDATE,'DY') IN ('SAT','SUN')) OR
    (TO_CHAR(SYSDATE,'HH24') NOT BETWEEN '08' AND '18') THEN
   IF DELETING THEN
     RAISE_APPLICATION_ERROR(-20502,
       'You may delete from EMPLOYEES table only during normal business hours.');
   ELSIF INSERTING THEN
     RAISE_APPLICATION_ERROR(-20500,
       'You may insert into EMPLOYEES table only during normal business hours.');
   ELSIF UPDATING('SALARY') THEN
     RAISE_APPLICATION_ERROR(-20503,
       'You may update SALARY only during normal business hours.');
   ELSE
     RAISE_APPLICATION_ERROR(-20504,
       'You may update EMPLOYEES table only during normal business hours.');
   END IF;
 END IF;
END;
/
