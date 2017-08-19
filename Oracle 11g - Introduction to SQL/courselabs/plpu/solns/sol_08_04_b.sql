DELETE FROM employees
  WHERE job_id = 'SA_REP'
  AND   department_id IS NULL;
