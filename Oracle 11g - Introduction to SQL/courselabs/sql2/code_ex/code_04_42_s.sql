SELECT versions_starttime "START_DATE", 
         versions_endtime "END_DATE",
         salary 
  FROM   employees3 
         VERSIONS BETWEEN scn minvalue and maxvalue
  WHERE  last_name = 'Lorentz';








