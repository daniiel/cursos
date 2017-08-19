SET VERIFY OFF
DECLARE
  v_ename	employees.last_name%TYPE;
  v_emp_sal	employees.salary%TYPE := 6000;
BEGIN
  SELECT	last_name
  INTO 		v_ename
  FROM		employees
  WHERE		salary = v_emp_sal;
  
  INSERT INTO messages (results)
  VALUES (v_ename || ' - ' || v_emp_sal);

EXCEPTION
  WHEN no_data_found THEN
    INSERT INTO messages (results)
    VALUES ('No employee with a salary of '|| TO_CHAR(v_emp_sal));
  WHEN too_many_rows THEN
    INSERT INTO messages (results)
    VALUES ('More than one employee with a salary of '||
             TO_CHAR(v_emp_sal));
  WHEN others THEN
    INSERT INTO messages (results)
    VALUES ('Some other error occurred.');
END;
/
SELECT * FROM messages;


