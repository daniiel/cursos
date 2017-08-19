drop table emp2 cascade constraints;

create table emp2 as select * from employees;

ALTER TABLE emp2
modify employee_id Primary Key;


