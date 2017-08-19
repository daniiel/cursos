CREATE OR REPLACE TRIGGER secure_emp
BEFORE INSERT ON employees
BEGIN
 IF (TO_CHAR(SYSDATE,'DY') IN ('SAT','SUN')) OR
     (TO_CHAR(SYSDATE,'HH24:MI') NOT BETWEEN '08:00' AND '18:00') THEN
  RAISE_APPLICATION_ERROR(-20500,
    'You may insert into EMPLOYEES table only during normal business hours.');
  END IF;
END;
/
