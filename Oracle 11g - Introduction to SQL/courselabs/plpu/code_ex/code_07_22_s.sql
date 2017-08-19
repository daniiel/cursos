CREATE OR REPLACE FUNCTION emp_hire_date (p_emp_id NUMBER) RETURN VARCHAR
 RESULT_CACHE RELIES_ON (employees) IS
  v_date_hired DATE;
BEGIN
  SELECT hire_date INTO v_date_hired
  FROM employees
  WHERE Employee_ID = p_emp_ID;
  RETURN to_char(v_date_hired);
END;
/