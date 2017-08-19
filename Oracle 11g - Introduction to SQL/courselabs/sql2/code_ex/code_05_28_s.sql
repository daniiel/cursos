SELECT last_name, 
 TO_CHAR(hire_date, 'mm-dd-yy:hh:mi:ss') hire_date, 
  TO_CHAR(hire_date + 
   TO_DSINTERVAL('100 10:00:00'),
     'mm-dd-yy:hh:mi:ss') hiredate2
FROM employees;
