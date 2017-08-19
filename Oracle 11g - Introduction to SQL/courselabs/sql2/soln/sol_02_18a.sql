--If you have not executed code_02_41_s.sql, execute it
--before executing this code.

drop table library_items_ext;

create table library_items_ext
( category_id   number(12)
, book_id number(6)
, book_price number(8,2)
, quantity   number(8)
)
ORGANIZATION EXTERNAL
 (TYPE ORACLE_LOADER 
  DEFAULT DIRECTORY emp_dir
  ACCESS PARAMETERS (RECORDS DELIMITED BY NEWLINE
                     FIELDS TERMINATED BY ',')
  LOCATION ('library_items.dat')
 )
REJECT LIMIT UNLIMITED;