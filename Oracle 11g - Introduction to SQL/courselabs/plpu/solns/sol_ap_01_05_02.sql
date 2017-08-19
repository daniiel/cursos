ALTER TABLE employees
  ADD (exceed_avgsal VARCHAR2(3) DEFAULT 'NO'
    CONSTRAINT employees_exceed_avgsal_ck
    CHECK (exceed_avgsal IN ('YES', 'NO')));
