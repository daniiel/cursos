drop table emp_test cascade constraints;
CREATE TABLE emp_test AS SELECT * FROM employees;
CREATE INDEX LNAME_IDX ON emp_test(Last_Name);