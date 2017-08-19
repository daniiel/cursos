--grant the query privileges
--This can be executed only by teach_b account.
GRANT update(department_name,location_id) ON departments TO demo, manager;