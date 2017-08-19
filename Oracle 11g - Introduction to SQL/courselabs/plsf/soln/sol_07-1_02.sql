SET SERVEROUTPUT ON
DECLARE
  CURSOR c_dept_cursor IS
        SELECT department_id,department_name
        FROM	departments
        WHERE department_id < 100
        ORDER BY    department_id;

  CURSOR c_emp_cursor(v_deptno NUMBER) IS
        SELECT last_name,job_id,hire_date,salary
        FROM	employees
        WHERE	department_id = v_deptno
        AND employee_id < 120;
  v_current_deptno departments.department_id%TYPE;
  v_current_dname  departments.department_name%TYPE;
  v_ename employees.last_name%TYPE;
  v_job employees.job_id%TYPE;	
  v_hiredate employees.hire_date%TYPE;
  v_sal employees.salary%TYPE;
       
BEGIN
 	OPEN c_dept_cursor;
     LOOP
    		 FETCH c_dept_cursor INTO v_current_deptno, v_current_dname;
		 EXIT WHEN c_dept_cursor%NOTFOUND;
		 DBMS_OUTPUT.PUT_LINE ('Department Number : ' ||  v_current_deptno ||  '  Department Name : ' || v_current_dname);
  
    	IF c_emp_cursor%ISOPEN THEN
        CLOSE c_emp_cursor;
      END IF;
      OPEN c_emp_cursor (v_current_deptno);
        LOOP
           	FETCH c_emp_cursor INTO  v_ename,v_job,v_hiredate,v_sal;
        EXIT WHEN c_emp_cursor%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE (v_ename || '    ' ||  v_job || '   '  ||  v_hiredate || '   ' ||  v_sal);       	
        END LOOP;
        DBMS_OUTPUT.PUT_LINE('----------------------------------------------------------------------------------------');
        CLOSE c_emp_cursor;

   	 END LOOP;
  	 
  CLOSE c_dept_cursor;
END;

