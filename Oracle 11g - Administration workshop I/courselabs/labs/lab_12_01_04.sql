-- Oracle Database 11g: Administration Workshop I
-- Oracle Server Technologies - Curriculum Development
--
-- ***Training purposes only***
-- ***Not appropriate for production use***
--
--   This script supports the ADDM practice 


declare
t number;
begin
for t in 1..20000 loop
insert into spct values (Null,'a');
commit;
end loop;
end;
/
exit
