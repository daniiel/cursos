--lab 5

--05_01
create table personnel(
  id number(6) constraint personnel_id_pk PRIMARY KEY,
  last_name varchar2(35),
  review CLOB,
  picture BLOB
);

--05_02
insert into personnel values (2034,'Allen',empty_clob(), null);
insert into personnel values (2035,'Bond',empty_clob(), null);
commit;

--05_03
create table review_table (
  employee_id number,
  ann_review varchar2(2000)
);
insert into review_table values (2034,'Very good performance this year. ' || 'Recommended to increase salary by $500');
insert into review_table values (2035,'Excellent performance this year. ' || 'Recommended to increase salary by $1000');
commit;

--05_04 a
select ann_review from review_table where employee_id = 2034;

update personnel set review = (select ann_review from review_table where employee_id = 2034)
where last_name = 'Allen';
--05_04 b
update personnel set review = (select ann_review from review_table where employee_id = 2035)
where last_name = 'Bond';
commit;

--05_05 a como SYS
create directory product_pic as 'C:\app\PRODUCT_PIC';

--05_05 b como OE
alter table product_information add (picture bfile);

--05_05 c como OE
CREATE OR REPLACE PROCEDURE load_product_image (p_dir IN VARCHAR2)
IS
  v_file    BFILE;
  v_filename varchar2(40);
  v_rec_number number;
  v_file_exists boolean;
  CURSOR product_csr IS
    select product_id from product_information
    where category_id = 12 FOR UPDATE;
BEGIN
  dbms_output.put_line('loading locators to image...');
  FOR rec IN product_csr LOOP
    v_filename := rec.product_id || '.gif';
    v_file := BFILENAME(p_dir, v_filename);
    v_file_exists := (DBMS_LOB.FILEEXISTS(v_file) = 1);
    
    IF v_file_exists THEN
      dbms_lob.fileopen(v_file);
      
      update product_information set picture = v_file 
      where current of product_csr;
      
      dbms_output.put_line('Set locator to file: '|| v_filename
        || ' size: ' || dbms_lob.getlength(v_file));
      dbms_lob.fileclose(v_file);
      v_rec_number := product_csr%ROWCOUNT;
    ELSE
      dbms_output.put_line('File ' || v_filename || ' does not exist');
    END IF;
  END LOOP;
  dbms_output.put_line('Total files updated: ' || v_rec_number);
EXCEPTION
  WHEN OTHERS THEN
    dbms_lob.fileclose(v_file);
    dbms_output.put_line('Error ' || to_char(SQLCODE) || sqlerrm);
END load_product_image;
/

--05_05 d como OE
execute load_product_image (PRODUCT_PIC);

--05_05 e como OE
CREATE OR REPLACE PROCEDURE check_space IS
  l_fs1_bytes number;
  l_fs2_bytes number;
  l_fs3_bytes number;
  l_fs4_bytes number;
  l_fs1_blocks number;
  l_fs2_blocks number;
  l_fs3_blocks number;
  l_fs4_blocks number;
  l_full_bytes number;
  l_full_blocks number;
  l_unformatted_bytes number;
  l_unformatted_blocks number;
BEGIN
  dbms_space.space_usage (
    segment_owner   => 'OE',
    segment_name    => 'PRODUCT_INFORMATION',
    segment_type    => 'TABLE',
    fs1_bytes       => l_fs1_bytes,
    fs1_blocks      => l_fs1_blocks,
    fs2_bytes       => l_fs2_bytes,
    fs2_blocks      => l_fs2_blocks,
    fs3_bytes       => l_fs3_bytes,
    fs3_blocks      => l_fs3_blocks,
    fs4_bytes       => l_fs4_bytes,
    fs4_blocks      => l_fs4_blocks,
    full_bytes      => l_full_bytes,
    full_blocks     => l_full_blocks,
    unformatted_blocks => l_unformatted_blocks,
    unformatted_bytes => l_unformatted_bytes
  );
  dbms_ouput.ENABLE;
  dbms_output.put_line(' FS1 Blocks = ' || l_fs1_blocks || 'Bytes = ' || l_fs1_bytes);
  dbms_output.put_line(' FS2 Blocks = ' || l_fs2_blocks || 'Bytes = ' || l_fs2_bytes);
  dbms_output.put_line(' FS3 Blocks = ' || l_fs3_blocks || 'Bytes = ' || l_fs3_bytes);
  dbms_output.put_line(' FS4 Blocks = ' || l_fs4_blocks || 'Bytes = ' || l_fs4_bytes);
  
  dbms_output.put_line(' FULL Blocks = ' || l_full_blocks || 'Bytes = ' || l_full_bytes);
  dbms_output.put_line('===============================================');
  dbms_output.put_line('Total Blocks = ' || to_char(l_fs1_blocks + l_fs2_blocks
    + l_fs3_blocks + l_fs4_blocks + l_full_blocks) || ' Total Bytes = ' || 
    to_char(l_fs1_bytes + l_fs2_bytes + l_fs3_bytes + l_fs4_bytes + l_full_bytes)  );
  
END;
/

execute check_space;
  
