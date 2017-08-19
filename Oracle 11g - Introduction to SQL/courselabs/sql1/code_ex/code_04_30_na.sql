SELECT last_name, salary, commission_pct,
      (salary*12) + (salary*12*commission_pct) AN_SAL
FROM   employees;
