-- Run code_04_22_as.sql and code_04_22_bs.sql before running this code example. 

SET SERVEROUTPUT ON
DECLARE
  v_employees  emp_pkg.emp_table_type;
BEGIN
  emp_pkg.get_employees(v_employees);
  DBMS_OUTPUT.PUT_LINE('Emp 5: '|| v_employees(4).last_name);
END;
/
