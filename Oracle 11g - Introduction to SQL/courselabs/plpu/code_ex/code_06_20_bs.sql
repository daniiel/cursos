-- Run code_06-20_as.sql before running this code example. 

SET SERVEROUTPUT ON

CREATE TABLE temp_emp AS SELECT * FROM employees;
BEGIN
  DBMS_OUTPUT.PUT_LINE('Rows Deleted: ' || delete_all_rows('temp_emp')); 
END;
/
DROP TABLE temp_emp;

