-- Oracle Database 11g: Administration Workshop I
-- Oracle Server Technologies - Curriculum Development
--
-- ***Training purposes only***
-- ***Not appropriate for production use***
--

set echo on

create table x (a char(1000)) tablespace inventory

/

insert into x values('a')

/

insert into x select * from x
/
insert into x select * from x
/
insert into x select * from x
/
insert into x select * from x
/
insert into x select * from x
/
insert into x select * from x
/
insert into x select * from x
/
insert into x select * from x
/
insert into x select * from x
/
insert into x select * from x
/
insert into x select * from x
/
insert into x select * from x
/
commit
/
quit
