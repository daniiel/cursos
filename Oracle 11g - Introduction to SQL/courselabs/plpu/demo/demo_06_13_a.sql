SET SERVEROUTPUT ON

CREATE OR REPLACE PROCEDURE list_employees(p_deptid NUMBER) IS
  TYPE emp_refcsr_type IS REF CURSOR;
  cur_emp  emp_refcsr_type;
  rec_emp  employees%ROWTYPE;
  v_stmt varchar2(200) := 'SELECT * FROM employees';

BEGIN
  IF p_deptid IS NULL THEN 
    OPEN cur_emp FOR v_stmt;
  ELSE
    v_stmt := v_stmt || ' WHERE department_id = :id';
    OPEN cur_emp FOR v_stmt USING p_deptid;
  END IF;
  LOOP
    FETCH cur_emp INTO rec_emp;
    EXIT WHEN cur_emp%NOTFOUND;
    DBMS_OUTPUT.PUT_LINE(rec_emp.department_id ||
                    ' ' || rec_emp.last_name);
  END LOOP;
  CLOSE cur_emp;
END;
/
