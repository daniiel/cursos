BEGIN
   UPDATE departments SET location_id=3000 WHERE 
   department_id=280;
END;
/
SELECT * FROM departments WHERE department_id=280;
DELETE FROM departments WHERE department_id=280;
