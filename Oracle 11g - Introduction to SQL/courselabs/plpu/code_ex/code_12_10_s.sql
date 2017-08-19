ALTER TABLE employees MODIFY email VARCHAR2(50);
/
SELECT object_name, status 
FROM user_objects 
WHERE object_type = 'VIEW';
