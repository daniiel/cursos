SET SERVEROUTPUT ON
SET VERIFY OFF
SET ECHO OFF
DECLARE
  v_deptno NUMBER := 10;
  CURSOR  c_emp_cursor IS
	SELECT		last_name, salary,manager_id
	FROM		employees
	WHERE		department_id = v_deptno;
BEGIN
 FOR emp_record IN c_emp_cursor
  LOOP
   IF emp_record.salary < 5000 AND (emp_record.manager_id=101 OR emp_record.manager_id=124) THEN
      DBMS_OUTPUT.PUT_LINE (emp_record.last_name || ' Due for a raise');
   ELSE
      DBMS_OUTPUT.PUT_LINE (emp_record.last_name || ' Not Due for a raise');
   END IF;
  END LOOP;
END;





