-- Oracle Database 11g: Administration Workshop I
-- Oracle Server Technologies - Curriculum Development
--
-- ***Training purposes only***
-- ***Not appropriate for production use***
--
-- Delete a datafile but leave the database open
--set echo on
--set serveroutput on
set termout on
set feed on
--set feed off
set echo off
--set termout off

DECLARE
	v_cmd varchar2(300);

BEGIN
	execute immediate 'alter system switch logfile';
	execute immediate 'alter system switch logfile';	
	select '/bin/rm -f '||dfile into v_cmd from
	   (select rownum "NUM",a.name "DFILE", b.name "TBS"
	    from v$datafile a join v$tablespace b using (ts#)
	    where b.name='INVENTORY'
            and a.name not like '+%')
	    where num=1;
	 dbms_output.put_line(v_cmd);   
	 execcmd(v_cmd);
	 execute immediate 'alter system flush buffer_cache';
	 execute immediate 'alter system checkpoint';
 END;
 /

alter database datafile '/u01/app/oracle/oradata/orcl/inventory02.dbf' offline;

PROMPT "Data file deleted. Wait a couple minutes before proceeding."
PROMPT "Database should be open."

exit
