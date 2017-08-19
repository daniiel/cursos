SET VERIFY OFF
DELETE FROM top_salaries;
DECLARE
  v_num         NUMBER(3) := 5;
  v_sal         employees.salary%TYPE;
  CURSOR        c_emp_cursor IS
    SELECT      salary
    FROM        employees
    ORDER BY    salary DESC;
BEGIN
  OPEN c_emp_cursor;
  FETCH c_emp_cursor INTO  v_sal;
  WHILE c_emp_cursor%ROWCOUNT <= v_num AND c_emp_cursor%FOUND LOOP
   		INSERT INTO top_salaries (salary)
    		VALUES (v_sal);	
    FETCH c_emp_cursor INTO v_sal;
  END LOOP;
  CLOSE c_emp_cursor;  
END;
/
SELECT * FROM top_salaries;
