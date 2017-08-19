SET SERVEROUTPUT ON

DECLARE
   TYPE dept_table_type is table of departments%ROWTYPE 
   INDEX BY PLS_INTEGER;
   my_dept_table	dept_table_type;
   f_loop_count	   NUMBER (2):=10;
   v_deptno          NUMBER (4):=0;
BEGIN
  FOR i IN 1..f_loop_count
  LOOP	
	v_deptno := v_deptno + 10;           
	SELECT *
	INTO my_dept_table(i)
	FROM departments
	WHERE department_id = v_deptno;
  END LOOP;
 FOR i IN 1..f_loop_count
  LOOP
    DBMS_OUTPUT.PUT_LINE ('Department Number: ' || my_dept_table(i).department_id
     || ' Department Name: ' || my_dept_table(i).department_name 
     || ' Manager Id: '||  my_dept_table(i).manager_id
     || ' Location Id: ' || my_dept_table(i).location_id);
  END LOOP;
END;