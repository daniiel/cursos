# Oracle Database 10g: Administration Workshop I
# Oracle Server Technologies - Curriculum Development
#
# ***Training purposes only***
#***Not appropriate for production use***
#
# Start this script as OS user: oracle
#   This script creates DML on HR.JOBS as 2 different users

cd ~/labs

. set_db.sh

sqlplus / as sysdba << EOF

drop user audit_user cascade;

create user audit_user identified by oracle_4U;

grant connect to audit_user;
grant all on hr.jobs to audit_user;

connect audit_user/oracle_4U

PROMPT As Audit_user
select * from hr.jobs;

update hr.jobs
set max_salary = max_salary * 10;
commit;

select * from hr.jobs;

connect hr/oracle_4U

PROMPT as HR user

update hr.jobs
set max_salary = max_salary / 10;
commit;

select * from hr.jobs;

connect / as sysdba

drop user audit_user cascade;

exit;
EOF
