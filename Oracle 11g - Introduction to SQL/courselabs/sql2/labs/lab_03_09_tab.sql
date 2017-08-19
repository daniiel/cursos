--drops tables so that they cannot be restored
DROP TABLE EMP2 PURGE;
DROP TABLE dept2 PURGE;
--creates tables and adds constraints
CREATE TABLE dept2
       (id NUMBER(7),
        name VARCHAR2(25));
INSERT INTO dept2
      SELECT  department_id, department_name
      FROM    departments;
CREATE TABLE  emp2
  (id           NUMBER(7),
   last_name     VARCHAR2(25),
   first_name    VARCHAR2(25),
   dept_id       NUMBER(7));
ALTER TABLE emp2
      MODIFY (last_name   VARCHAR2(50));
ALTER TABLE    emp2
      ADD CONSTRAINT my_emp_id_pk PRIMARY KEY (id);
ALTER TABLE    dept2
     ADD CONSTRAINT my_dept_id_pk PRIMARY KEY(id);
ALTER TABLE emp2
      ADD CONSTRAINT my_emp_dept_id_fk
      FOREIGN KEY (dept_id) REFERENCES dept2(id);














