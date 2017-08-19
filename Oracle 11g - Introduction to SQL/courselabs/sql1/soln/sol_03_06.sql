SELECT last_name, ROUND(MONTHS_BETWEEN (
       SYSDATE, hire_date)) MONTHS_WORKED
FROM   employees 
ORDER BY MONTHS_WORKED;
