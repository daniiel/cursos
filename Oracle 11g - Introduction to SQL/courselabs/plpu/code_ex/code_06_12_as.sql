-- Run code_06_11_bs.sql before running this code example which creates the EMPLOYEE_NAMES table.

SET SERVEROUTPUT ON

CREATE FUNCTION del_rows(p_table_name VARCHAR2)
RETURN NUMBER IS
BEGIN
  EXECUTE IMMEDIATE 'DELETE FROM '|| p_table_name;
  RETURN SQL%ROWCOUNT;
END;
/
BEGIN
  DBMS_OUTPUT.PUT_LINE(del_rows('EMPLOYEE_NAMES')|| ' rows deleted.');
END;
/
