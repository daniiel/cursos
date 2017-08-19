drop table dept2 cascade constraints;

create table dept2 as select * from departments;

ALTER TABLE dept2
ADD CONSTRAINT dept2_id_pk 
PRIMARY KEY (department_id)
DEFERRABLE INITIALLY DEFERRED;


