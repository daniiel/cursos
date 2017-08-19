--This code should be executed using the teach_b account
--Replace the elipses with the path of emp_dir
CREATE OR REPLACE DIRECTORY emp_dir 
AS '/.../emp_dir'; 
GRANT READ ON DIRECTORY emp_dir TO ora21;
