SELECT t.CATEGORY, t.TITLE 
FROM TITLE t, RENTAL r 
WHERE t.TITLE_ID = r.TITLE_ID AND
      r. BOOK_DATE > (SYSDATE - 30) AND
      rownum < 10
order by category