drop table empl;
create table empl( ename  VARCHAR2(25 BYTE),
hiredt date);

DECLARE
TYPE ename_table_type IS TABLE OF
  employees.last_name%TYPE INDEX BY PLS_INTEGER;
TYPE hiredate_table_type
IS
  TABLE OF DATE INDEX BY PLS_INTEGER;
  ename_table ename_table_type;
  hiredate_table hiredate_table_type;
BEGIN
  ename_table(1)    := 'CAMERON';
  hiredate_table(8) := SYSDATE + 7;
  IF ename_table.EXISTS(1) THEN
    insert into empl VALUES (ename_table(1), hiredate_table(8));
  END IF;
END;
/
select * from empl;
/
