SELECT e.last_name, e.salary, j.grade_level
FROM   employees e JOIN job_grades j
ON     e.salary 
       BETWEEN j.lowest_sal AND j.highest_sal;
