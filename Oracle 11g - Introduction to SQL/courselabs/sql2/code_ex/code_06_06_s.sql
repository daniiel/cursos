--Execute demo_06_ex_06 before executing this code
SELECT employee_id,
  manager_id,
  department_id
FROM empl_demo
WHERE (manager_id, department_id) IN
  ( SELECT manager_id, department_id FROM empl_demo WHERE first_name = 'John'
  )
AND first_name <> 'John';