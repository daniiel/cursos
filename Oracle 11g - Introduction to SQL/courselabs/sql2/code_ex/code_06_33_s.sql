Drop Table Flights;
CREATE TABLE flights
   (source varchar(20), destin varchar(20), flight_time number);
INSERT INTO flights VALUES ('San Jose', 'Los Angeles', 1.3);
INSERT INTO flights VALUES ('New York', 'Boston', 1.1);
INSERT INTO flights VALUES ('Los Angeles', 'New York', 5.8);
COMMIT;

SELECT Source, Destin, Flight_Time 
FROM flights;

WITH Reachable_From (Source, Destin, TotalFlightTime) AS
(
    SELECT Source, Destin, Flight_time
    FROM Flights
  UNION ALL
    SELECT incoming.Source, outgoing.Destin, 
	incoming.TotalFlightTime+outgoing.Flight_time
    FROM Reachable_From incoming, Flights outgoing
    WHERE incoming.Destin = outgoing.Source
)

SELECT Source, Destin, TotalFlightTime 
FROM Reachable_From;

