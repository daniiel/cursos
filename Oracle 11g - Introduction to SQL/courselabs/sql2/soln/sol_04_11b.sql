select versions_starttime "START_DATE",    versions_endtime   "END_DATE", 
       department_id  from emp3  versions between scn minvalue and maxvalue where last_name ='Kochhar';

