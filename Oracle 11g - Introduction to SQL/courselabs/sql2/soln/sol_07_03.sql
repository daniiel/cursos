select regexp_replace (street_address, 'St$', 'Street') from locations where regexp_like (street_address, 'St');















