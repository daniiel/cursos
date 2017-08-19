drop table emp_volunteers;
CREATE TABLE emp_volunteers
( names VARCHAR2(30) );
-- populate table with data
INSERT INTO emp_volunteers
VALUES ('Winston John Philip');
INSERT INTO emp_volunteers
VALUES ('Anish S. Gaurav');
INSERT INTO emp_volunteers
VALUES ('Winston Philip');
INSERT INTO emp_volunteers
VALUES (' Winston John Philip');
INSERT INTO emp_volunteers
VALUES ('Winston_John_Philip');
COMMIT;