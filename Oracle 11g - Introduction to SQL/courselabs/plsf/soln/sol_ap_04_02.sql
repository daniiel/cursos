SET SERVEROUTPUT ON

DECLARE
	V_HOWMANY NUMBER(3);
	V_DEPTNO DEPARTMENTS.department_id%TYPE  := &P_DEPTNO;
BEGIN
	SELECT COUNT(*) INTO V_HOWMANY FROM employees
	WHERE department_id = V_DEPTNO;
	DBMS_OUTPUT.PUT_LINE (V_HOWMANY  || ' employee(s) work for department number ' ||V_DEPTNO);
END;
/

