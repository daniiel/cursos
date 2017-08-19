SELECT   department_id, count(last_name)
FROM     employees
GROUP BY department_id;
