CREATE INDEX upper_dept_name_idx
ON dept2(UPPER(department_name));

SELECT *
FROM   dept2
WHERE  UPPER(department_name) = 'SALES';