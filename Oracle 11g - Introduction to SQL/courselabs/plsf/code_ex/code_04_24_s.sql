-- Because of the JHIST_EMP_FK constraint, you cannot delete the rows shown in the code example.
-- Using copy of the employees table, employees2, to successfully delete the rows
-- (employees2 table is created by code_04_17_s.sql)

SET SERVEROUTPUT ON

DECLARE
v_rows_deleted VARCHAR2(30);
v_empno employees2.employee_id%TYPE := 176;
BEGIN
DELETE FROM employees2
WHERE employee_id = v_empno;
v_rows_deleted := (SQL%ROWCOUNT ||
' row deleted.');
DBMS_OUTPUT.PUT_LINE (v_rows_deleted);
END;
/