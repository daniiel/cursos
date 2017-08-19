SELECT w.last_name "Employee", w.employee_id "EMP#", 
       m.last_name "Manager", m.employee_id  "Mgr#"
FROM   employees w, employees m
WHERE  w.manager_id = m.employee_id
