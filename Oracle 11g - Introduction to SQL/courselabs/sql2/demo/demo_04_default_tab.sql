DROP TABLE dept_demo4;
CREATE TABLE dept_demo4(deptno NUMBER(2),
         dname VARCHAR2(14),
         loc VARCHAR2(13),
         create_date DATE DEFAULT SYSDATE);