REM  Script:   r_dis_trigger.sql
REM  Purpose:  To disable trigger code from the hr sample schema
REM  Created:  By Nancy Greenberg on 05-FEB-2004
REM            for the Oracle Database 10g: SQL Fundamentals II, 
REM            Oracle Database 10g: PL/SQL Fundamentals, and
REM            Oracle Database 10g: PL/SQL Program Units courses
REM  Updated by: Chaitanya Koratamaddi on 02-May-2006


ALTER TRIGGER secure_employees DISABLE;

ALTER TRIGGER update_job_history DISABLE;

