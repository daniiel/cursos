SELECT last_name, TO_CHAR(hire_date, 'Month DD') BIRTHDAY 
FROM   employees
ORDER BY TO_CHAR(hire_date, 'DDD');
