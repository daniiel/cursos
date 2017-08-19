-- updated by ng on 03-jun-09: changed case in pathing to lower case. changed utl_file name to reports_dir
-- updated by ng on 10-aug-09: removed country_pic and data_files directory objects.

DROP DIRECTORY emp_dir;
CREATE OR REPLACE DIRECTORY emp_dir as '/home/oracle/labs/plpu/plpu_dirs/emp_dir';
grant read on directory emp_dir to PUBLIC;

DROP DIRECTORY reports_dir;
CREATE DIRECTORY reports_dir as '/home/oracle/labs/plpu/reports'; 
GRANT READ, WRITE ON DIRECTORY reports_dir to PUBLIC;



