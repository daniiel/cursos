SET SERVEROUTPUT ON

DECLARE 
  v_fname VARCHAR(20);
BEGIN
  SELECT first_name
  INTO v_fname
  FROM employees
  WHERE employee_id = 100;
  DBMS_OUTPUT.PUT_LINE(' The First Name of the Employee is ' || v_fname);
END;
/