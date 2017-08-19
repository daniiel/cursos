CREATE TABLE employees2 AS
  SELECT  employee_id id, first_name, last_name, salary,   
          department_id dept_id
  FROM    employees;
