ALTER TABLE EMP2
      ADD commission NUMBER(2,2)
      CONSTRAINT my_emp_comm_ck CHECK (commission > 0);












