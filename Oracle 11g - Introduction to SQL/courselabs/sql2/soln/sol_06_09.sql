SELECT  last_name
FROM    employees outer
WHERE EXISTS
      (SELECT 'X'
       FROM employees inner
       WHERE inner.department_id = outer.department_id
       AND inner.hire_date > outer.hire_date
       AND inner.salary > outer.salary);
