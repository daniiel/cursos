REM Make sure that both secure_emp and secure_employees triggers are disabled as follows:

ALTER TRIGGER secure_emp DISABLE
/
ALTER TRIGGER secure_employees DISABLE
/
CREATE OR REPLACE TRIGGER restrict_salary
BEFORE INSERT OR UPDATE OF salary ON employees
FOR EACH ROW
BEGIN
  IF NOT (:NEW.job_id IN ('AD_PRES', 'AD_VP'))
     AND :NEW.salary > 15000 THEN
    RAISE_APPLICATION_ERROR (-20202,
      'Employee cannot earn more than $15,000.');
  END IF;
END;
/
