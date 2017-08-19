REM  Script:  create_tables.sql
REM  Created: By Chaitanya Koratamaddi on 02/05/06
REM  Modified By Salome Clement on 16/01/09
REM  Modified By Nancy Greenberg on 29-Apr-09
REM  This script creates tables for users ora1, ora21, ora22, ora23,ora41, ora61, ora62, ora81
--Please modify the path according to the location of hr_main1

set echo on
spool ora1.log
connect ora1/ora1
set echo off
@@hr_main1.sql
@@del_data.sql
spool off

set echo on
spool ora21.log
connect ora21/ora21
set echo off
@@hr_main1.sql
spool off

set echo on
spool ora22.log
connect ora22/ora22
set echo off
@@hr_main1.sql
spool off

set echo on
spool ora23.log
connect ora23/ora23
set echo off
@@hr_main1.sql
spool off
         
set echo on
spool ora41.log
connect ora41/ora41
set echo off
@@hr_main1.sql
spool off

set echo on
spool ora61.log
connect ora61/ora61 
set echo off
@@hr_main1.sql
spool off

set echo on
spool ora62.log
connect ora62/ora62 
set echo off
@@hr_main1.sql
spool off

set echo on
spool ora81.log
connect ora81/ora81 
set echo off
@@hr_main1.sql
spool off

