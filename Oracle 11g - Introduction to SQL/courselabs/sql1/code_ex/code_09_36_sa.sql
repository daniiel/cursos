INSERT INTO copy_emp 
SELECT * FROM employees;

DELETE FROM copy_emp;

ROLLBACK ;