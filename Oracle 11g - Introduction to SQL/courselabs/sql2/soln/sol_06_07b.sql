SELECT outer.last_name
	 FROM   employees outer
	 WHERE  outer.employee_id NOT IN (SELECT inner.manager_id
			  	   FROM   employees inner);
