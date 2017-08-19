SELECT last_name,salary, 
(CASE WHEN salary<5000 THEN 'Low' 
      WHEN salary<10000 THEN 'Medium' 
      WHEN salary<20000 THEN 'Good' 
      ELSE 'Excellent' 
END) qualified_salary 
FROM employees;