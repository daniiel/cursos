SELECT 		job_id, department_id, COUNT(*)
FROM 		employees
GROUP BY 	job_id, department_id
/
