SELECT 'The salary of '||last_name||' after a 10% raise is ' 
          || ROUND(salary*1.10) "New salary"
FROM   employees
WHERE  commission_pct IS NULL;
