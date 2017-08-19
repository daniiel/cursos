select regexp_replace (street_address, ' ', '') AS "Street Address"
FROM locations;