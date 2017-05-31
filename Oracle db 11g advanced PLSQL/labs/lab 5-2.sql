--05_01

  --a
drop table product_descriptions purge;
create table product_descriptions (
  product_id number
);

  -- b as SYS
  create tablespace lob_tbs2
  datafile 'lob_tbs2.dbf' size 1500M REUSE
  autoextend on next 200M
  maxsize 3000M
  segment space management auto;
  
  -- c as SYS
  create or replace directory porduct_files as 'C:\app\PRODUCT_PIC';
  grant read on directory product_files to oe;
  
  -- d as OE 
  alter table product_descriptions add (detailed_product_info blob) 
  LOB (detailed_product_info) store as basicfile (tablespace lob_tbs2);
  
  -- e
create or replace procedure loadLOBFromBFILE_proc (
  p_dest_loc IN OUT BLOB, p_file_name IN VARCHAR2) 
is
  v_src_loc BFILE := BFILENAME('PRODUCT_FILES', p_file_name);
  v_amount  INTEGER := 4000;
begin
  dbms_lob.OPEN(v_src_loc, DBMS_LOB.LOB_READONLY);
  v_amount := dbms_lob.GETLENGTH(v_src_loc);
  dbms_lob.LOADFROMFILE(p_dest_loc, v_src_loc, v_amount);
  dbms_lob.CLOSE(v_src_loc);
end loadLOBFromBFILE_proc;
/

  -- f
create or replace procedure write_lob (p_file IN VARCHAR2)
is
  i number;
  v_id number;
  v_b LOB;
begin
  dbms_output.ENABLE;
  dbms_output.put_line ('BEgin inserting rows...');
  FOR i IN 1..5 LOOP
    v_id := SUBSTR(p_file, 1, 4);
    INSERT INTO product_descriptions VALUES (v_id, EMPTY_BLOB())
    RETURNING detailed_product_info INTO v_b;
    loadLOBFromBFile_proc(v_b, p_file);
    dbms_output.put_line('Row ' || i || ' inserted.');
  end loop;
  commit;
end write_lob;
/

 --g
 set serveroutput on
 set verify on
 set term on
 
 timing start load_data
 execute write_lob('1726_LCD.doc');
 execute write_lob('1734_RS232.doc');
 execute write_lob('1739_SDRAM.doc');
 timing stop
 
 -- h
 select segment_name, segment_type, segment_subtype
 from dba_segments
 where tablespace_name = 'LOB_TBS2' and segment_type = 'LOBSEGMENT';
 
 -- i
 create table product_descriptions_interim (
  product_id number,
  detailed_product_info blob
 ) LOB(detailed_product_info) STORE AS securefile (TABLESPACE lob_tbs2);
 
 -- j as SYS
 DECLARE
   error_count PLS_INTEGER := 0;
 BEGIN
   dbms_redefinition.start_redef_table (
     'OE', 'product_descriptions', 'product_descriptions_interim',
     'product_id product_id, detailed_product_info detailed_product_info',
     OPTIONS_FLAG => DBMS_REDEFINITION.CONS_USE_ROWID);
   dbms_redefinition.COPY_TABLE_DEPENDENTS ('OE', 'product_descriptions',
     'product_descriptions_interim',1, true, true, true, false, error_count);
   dbms_output.put_line('Errors := ' || to_char(error_count)); 
   dbms_redefinition.FINISH_REDEF_TABLE('OE', 'product_descriptions',
     'product_descriptions_interim');
 END;
 /
 
 -- k as OE
 DROP TABLE product_descriptions_interim;
 
 -- l as SYS
 select segment_name, segment_type, segment_subtype
 from dba_segments
 where tablespace_name = 'LOB_TBS2' and segment_type = 'LOBSEGMENT';
 
 
 
 
 
 
 
 