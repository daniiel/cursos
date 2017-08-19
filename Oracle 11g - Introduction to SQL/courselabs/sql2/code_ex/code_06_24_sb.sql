UPDATE empl6 e
SET    department_name = 
              (SELECT department_name 
	       FROM   departments d
	       WHERE  e.department_id = d.department_id);