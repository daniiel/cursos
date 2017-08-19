SELECT	last_name, TO_CHAR(hire_date, 'fmddth "of" Month YYYY fmHH:MI:SS AM')
FROM	employees
WHERE department_id IN (10, 80)
/
