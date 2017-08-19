SET SERVEROUTPUT ON

DECLARE
   v_dept_name departments.department_name%TYPE:= 'Education';
   v_dept_id NUMBER;
   v_max_deptno	NUMBER;
BEGIN
   SELECT MAX(department_id)  INTO v_max_deptno  FROM departments;
   DBMS_OUTPUT.PUT_LINE('The maximum department_id is : ' ||       
   v_max_deptno);
   v_dept_id := 10 + v_max_deptno;
   INSERT INTO departments (department_id, department_name, location_id) 
   VALUES (v_dept_id,v_dept_name, NULL);
   DBMS_OUTPUT.PUT_LINE (' SQL%ROWCOUNT gives ' || SQL%ROWCOUNT);
 END;
/
SELECT * FROM  departments  WHERE  department_id=280;


