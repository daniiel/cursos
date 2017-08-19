SELECT 	job_id, last_name
FROM		employees
WHERE		UPPER(job_id) like UPPER('%&job_title%')
ORDER BY	job_id, last_name

