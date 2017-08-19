CREATE TABLE sales_reps AS
SELECT employee_id id,
  last_name name,
  salary,
  commission_pct
FROM employees
WHERE 1=2;

INSERT INTO sales_reps
  (id, name, salary, commission_pct
  )
SELECT employee_id,
  last_name,
  salary,
  commission_pct
FROM employees
WHERE job_id LIKE '%REP%';