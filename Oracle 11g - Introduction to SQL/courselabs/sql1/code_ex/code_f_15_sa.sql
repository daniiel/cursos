SELECT e.last_name, e.salary, j.grade_level
FROM   employees e, job_grades j
WHERE  e.salary 
       BETWEEN j.lowest_sal AND j.highest_sal;
