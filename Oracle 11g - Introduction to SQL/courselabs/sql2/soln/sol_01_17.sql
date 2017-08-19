--Team 1 executes the following statements
DELETE FROM  departments
WHERE department_id = 500;
COMMIT;


-- Team 2 executes the following statements;

DELETE FROM departments
WHERE department_id = 510;
COMMIT;

