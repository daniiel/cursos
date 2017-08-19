-- This script is for the code located on pages 4-19 and 4-20.

CREATE OR REPLACE PACKAGE curs_pkg IS
  PROCEDURE open;
  FUNCTION next(p_n NUMBER := 1) RETURN BOOLEAN;
  PROCEDURE close;
END curs_pkg;
/

CREATE OR REPLACE PACKAGE BODY curs_pkg IS
  CURSOR cur_c IS 
    SELECT employee_id FROM employees;
  PROCEDURE open IS  
  BEGIN  
    IF NOT cur_c%ISOPEN THEN   
      OPEN cur_c;  
    END IF;
  END open;
  
  FUNCTION next(p_n NUMBER := 1) RETURN BOOLEAN IS
    v_emp_id employees.employee_id%TYPE;
  BEGIN
    FOR count IN 1 .. p_n LOOP
      FETCH cur_c INTO v_emp_id; 
      EXIT WHEN cur_c%NOTFOUND;
      DBMS_OUTPUT.PUT_LINE('Id: ' ||(v_emp_id));
    END LOOP;
    RETURN cur_c%FOUND;
  END next;
  
  PROCEDURE close IS 
    BEGIN
      IF cur_c%ISOPEN THEN  
        CLOSE cur_c;  
      END IF;
    END close;
END curs_pkg;
/
