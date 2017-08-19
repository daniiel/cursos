/* Before running this script, run the demo_09_cretest.sql script (in the /home/oracle/labs/sql1/demo folder)*/
/* to create the test table */
/* and insert rows in the table */

DELETE FROM test;

ROLLBACK;

DELETE FROM test WHERE  id = 100;

SELECT * FROM   test WHERE  id = 100;

COMMIT;