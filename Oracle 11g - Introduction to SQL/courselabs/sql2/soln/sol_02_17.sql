
       CREATE TABLE DEPT_NAMED_INDEX 
       (deptno NUMBER(4)
       PRIMARY KEY USING INDEX
       (CREATE INDEX dept_pk_idx ON
        DEPT_NAMED_INDEX(deptno)),
        dname VARCHAR2(30));














