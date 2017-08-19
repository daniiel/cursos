SET SERVEROUTPUT ON

DECLARE
  CURSOR c_emp_cursor (deptno NUMBER)
  IS
     SELECT employee_id, last_name FROM employees WHERE department_id = deptno;
  
  v_empno employees.employee_id%TYPE;
  v_lname employees.last_name%TYPE;
BEGIN
  OPEN c_emp_cursor (10);
  LOOP
    FETCH c_emp_cursor INTO v_empno, v_lname;
    EXIT  WHEN c_emp_cursor%NOTFOUND;
    DBMS_OUTPUT.PUT_LINE( v_empno ||' '||v_lname);
  END LOOP;
  CLOSE c_emp_cursor;
  OPEN c_emp_cursor (20);
  LOOP
    FETCH c_emp_cursor INTO v_empno, v_lname;
    EXIT  WHEN c_emp_cursor%NOTFOUND;
    DBMS_OUTPUT.PUT_LINE( v_empno ||' '||v_lname);
  END LOOP;
END;
/