-- You must run code_02_08_as.sql before running this code example. 

SET SERVEROUTPUT ON

DECLARE
  sal employees.salary%type;
BEGIN
  sal := get_sal(100);
  DBMS_OUTPUT.PUT_LINE('The salary is: '|| sal);
END;
/
