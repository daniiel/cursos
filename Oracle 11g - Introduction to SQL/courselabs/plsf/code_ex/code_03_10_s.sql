create sequence my_seq;
DECLARE
v_new_id NUMBER;
BEGIN
v_new_id := my_seq.NEXTVAL;
END;
/