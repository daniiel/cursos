SET SERVEROUTPUT ON

DECLARE
  v_fname VARCHAR2(25);
BEGIN
  SELECT first_name INTO v_fname 
  FROM employees WHERE employee_id=200;
  DBMS_OUTPUT.PUT_LINE(' First Name is : '||v_fname);
END;
/