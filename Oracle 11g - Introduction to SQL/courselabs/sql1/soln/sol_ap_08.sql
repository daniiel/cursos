SELECT COUNT(*)
FROM   employees
WHERE  last_name LIKE '%n';
--or 
SELECT COUNT(*)
FROM   employees 
WHERE  SUBSTR(last_name, -1) = 'n';
