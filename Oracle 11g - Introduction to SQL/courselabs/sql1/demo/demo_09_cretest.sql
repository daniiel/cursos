/* Creating table Test and inserting data into the table */
/* This script can be used to demonstrate the concept of transactions */


Create Table test
(id number(4));
Insert into test
values (100);
Insert into test
values (101);
Insert into test
values (102);
Insert into test
values (103);
commit;
