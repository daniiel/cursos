SELECT department_name || ' Department' || 
       q'['s Manager Id: ]' 
       || manager_id 
       AS "Department and Manager" 
FROM departments;
