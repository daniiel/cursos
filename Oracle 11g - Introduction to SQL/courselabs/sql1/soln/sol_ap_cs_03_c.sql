SELECT  sequence_name, increment_by, last_number
FROM    user_sequences 
WHERE   sequence_name IN ('MEMBER_ID_SEQ', 'TITLE_ID_SEQ');
