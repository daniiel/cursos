REM  Script:  setup.sql
REM  Created: By Chaitanya Koratamaddi on 02/05/06
REM  Modified By Salome Clement on 16/01/09
REM  Modified By Nancy Greenberg on 28-Apr-09
REM  This script creates users ora1, ora21, ora22, ora23, ora41, ora61, ora62, ora81,
REM                            teach_a, teach_b, teach_c, teach_d
--Please repalce the password for 'SYS'if it is different.

connect system/oracle as sysdba
@@cre_dir.sql
@@create_users.sql
@@create_tables.sql  -- calls hr_main1.sql
@@creteach.sql
commit;