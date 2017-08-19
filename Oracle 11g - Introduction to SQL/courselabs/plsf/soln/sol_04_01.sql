SET SERVEROUTPUT ON

DECLARE
   v_max_deptno	NUMBER;
BEGIN
   SELECT MAX(department_id)  INTO v_max_deptno  FROM	departments;
   DBMS_OUTPUT.PUT_LINE('The maximum department_id is : ' || v_max_deptno);
END;
