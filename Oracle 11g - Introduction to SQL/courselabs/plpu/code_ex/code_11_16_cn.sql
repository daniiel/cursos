-- To set my_debug to TRUE, you can make this change only for procedure circle_area with 
-- the REUSE SETTINGS clause as follows

ALTER PROCEDURE circle_area COMPILE PLSQL_CCFLAGS = 'my_debug:TRUE' REUSE SETTINGS;
