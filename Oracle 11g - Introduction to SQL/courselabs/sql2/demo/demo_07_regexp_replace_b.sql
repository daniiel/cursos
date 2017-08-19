SELECT names "names",
REGEXP_REPLACE(names,
'^(\S+)\s(\S+)\s(\S+)$',
'\3, \1 \2')
AS "names after regexp"
FROM emp_volunteers;
