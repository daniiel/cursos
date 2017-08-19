CREATE TABLE library_items_ext ( category_id   number(12)
                               , book_id number(6)
                               , book_price number(8,2)
                               , quantity   number(8)
                               )
<TODO1>
 (TYPE <TODO2>
  DEFAULT DIRECTORY <TODO3>
  ACCESS PARAMETERS (RECORDS DELIMITED BY NEWLINE
                     FIELDS TERMINATED BY ',')
 LOCATION <TODO4>
 )
REJECT LIMIT UNLIMITED; 
