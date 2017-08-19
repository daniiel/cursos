-- Oracle Database 11g: Administration Workshop I
-- Oracle Server Technologies - Curriculum Development
--
-- ***Training purposes only***
-- ***Not appropriate for production use***
--
set serveroutput on
prompt
-- This makes it possible to locate this session in
-- order to kill it later.
BEGIN
  dbms_output.put_line(' ');
  dbms_output.put_line('SID is ' || sys_context('USERENV','SID'));
END;
/

prompt Load is now being generated.
-- This drops the copy table if it exists, and supresses
-- the error if it does not exist.
DECLARE
  table_nonexistent EXCEPTION;
  PRAGMA EXCEPTION_INIT(table_nonexistent, -942);
BEGIN
  BEGIN
    execute immediate 'drop table sh.sales_copy';
    EXCEPTION
    WHEN table_nonexistent THEN
      NULL;
  END;
  execute immediate 'create table sh.sales_copy as select * from sh.sales';
  FOR i IN 1..25 LOOP
    execute immediate 'select * from sh.sales_copy';
    execute immediate 'delete from sh.sales_copy';
    execute immediate 'commit';
    execute immediate 'insert into sh.sales_copy select * from sh.sales';
    execute immediate 'commit';
  END LOOP;
END;
/
