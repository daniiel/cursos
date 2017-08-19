#!/bin/bash

cd ~/labs

. set_db.sh

sqlplus system/oracle_4U<<EOF!

set echo on

create tablespace tbsjmw datafile '+DATA' size 50M;

drop table jmw purge;

create table JMW(c varchar2(500)) tablespace tbsjmw;

insert into jmw values('aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa');

commit;

begin
 for i in 1..10 loop
  insert into jmw select * from jmw;
 end loop;
 commit;
end;
/

EOF!

