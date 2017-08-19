-- Disable the update_job_history trigger as follows (if not already disabled): 
-- ALTER TRIGGER update_job_history DISABLE;

CREATE OR REPLACE PROCEDURE raise_salary(p_percent NUMBER) IS
  TYPE numlist_type IS TABLE OF NUMBER INDEX BY BINARY_INTEGER;
  v_id  numlist_type;
BEGIN
 v_id(1) := 100; v_id(2) := 102; v_id(3) := 104; v_id(4) := 110;

 -- bulk-bind the PL/SQL table
  FORALL i IN v_id.FIRST .. v_id.LAST
    UPDATE employees
      SET salary = (1 + p_percent/100) * salary
      WHERE employee_id = v_id(i);
END;
/



