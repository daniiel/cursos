SELECT last_name,  salary, commission_pct,
       NVL2(commission_pct, 
       'SAL+COMM', 'SAL') income
FROM   employees WHERE department_id IN (50, 80);
