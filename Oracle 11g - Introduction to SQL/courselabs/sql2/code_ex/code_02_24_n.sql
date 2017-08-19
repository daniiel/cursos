--First create a table marketing
DROP TABLE marketing cascade constraints;
CREATE TABLE marketing (
team_id  NUMBER(10), 
target  VARCHAR2(50), 
CONSTRAINT mktg_pk PRIMARY KEY(team_id));



