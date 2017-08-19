SELECT 		department_id, job_id, COUNT(*)
FROM 		employees
GROUP BY 	department_id, job_id
/
