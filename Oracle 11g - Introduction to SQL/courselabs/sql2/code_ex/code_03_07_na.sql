SELECT table_name
FROM dictionary
WHERE LOWER(comments) LIKE '%columns%';
