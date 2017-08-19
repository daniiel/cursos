DELETE FROM job_history JH
WHERE employee_id =
	(SELECT employee_id 
	 FROM employees E
	 WHERE JH.employee_id = E.employee_id
         AND START_DATE = (SELECT MIN(start_date)  
	          FROM job_history JH
	 	  WHERE JH.employee_id = E.employee_id)
	 AND 3 >  (SELECT COUNT(*)  
	          FROM job_history JH
	 	  WHERE JH.employee_id = E.employee_id
		  GROUP BY EMPLOYEE_ID
		  HAVING COUNT(*) >= 2));