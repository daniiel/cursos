CREATE OR REPLACE FUNCTION emp_hire_date (p_emp_id NUMBER, fmt VARCHAR) RETURN VARCHAR
 RESULT_CACHE RELIES_ON (employees) IS
 v_date_hired DATE;
BEGIN
  SELECT hire_date INTO v_date_hired
  FROM employees
  WHERE employee_id = p_emp_id;
  RETURN to_char(v_date_hired, fmt);
END;
/