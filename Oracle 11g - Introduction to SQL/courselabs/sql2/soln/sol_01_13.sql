--Team 1 executes this statement
INSERT INTO departments (department_id, department_name)
VALUES (500, 'Education');
COMMIT;


-- Team 2 executes this statement:

INSERT INTO departments(department_id, department_name)
VALUES (510, 'Human Resources');
COMMIT;

