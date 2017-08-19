SELECT last_name, salary
FROM   employees e
WHERE  3  >  (SELECT COUNT(*)
	      FROM   employees
	      WHERE  e.salary < salary);
