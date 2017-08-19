SELECT last_name, hire_date
FROM   employees
WHERE  hire_date = TO_DATE('May    24, 1999', 'fxMonth DD, YYYY');
