WITH 
MAX_SAL_CALC AS (
  SELECT job_title, MAX(salary) AS job_total
  FROM employees, jobs
  WHERE employees.job_id = jobs.job_id
  GROUP BY job_title)
SELECT job_title, job_total
FROM MAX_SAL_CALC
WHERE job_total > (
                    SELECT MAX(job_total) * 1/2
                    FROM MAX_SAL_CALC)
ORDER BY job_total DESC;

