SELECT e.last_name ename, e.salary salary, 
e.department_id deptno, AVG(a.salary) dept_avg
FROM    employees e, employees a
WHERE   e.department_id = a.department_id
AND     e.salary > (SELECT AVG(salary)
      	            FROM   employees
	            WHERE  department_id = e.department_id)
GROUP BY e.last_name, e.salary, e.department_id
ORDER BY AVG(a.salary);
