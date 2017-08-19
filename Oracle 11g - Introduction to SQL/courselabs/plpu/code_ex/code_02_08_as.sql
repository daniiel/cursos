CREATE OR REPLACE FUNCTION get_sal
 (p_id  employees.employee_id%TYPE) RETURN NUMBER IS

v_sal employees.salary%TYPE := 0;

BEGIN
  SELECT salary
  INTO   v_sal
  FROM   employees         
  WHERE  employee_id = p_id;
  RETURN v_sal;
END get_sal;
/
