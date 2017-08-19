SELECT   job_id, AVG(salary)
   FROM     employees
   GROUP BY job_id
   HAVING   AVG(salary) = (SELECT   MIN(AVG(salary))
                           FROM     employees
                           GROUP BY job_id);
