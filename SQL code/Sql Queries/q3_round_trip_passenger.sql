SELECT 
    p.PASSENGERSID,
    p.PASSENGERFIRSTNAME || ' ' || p.PASSENGERLASTNAME AS PASSENGERNAME,
    a1.AIRPORTNAME AS OUTBOUND_FROM,
    a2.AIRPORTNAME AS OUTBOUND_TO,
    a3.AIRPORTNAME AS RETURN_FROM,
    a4.AIRPORTNAME AS RETURN_TO
FROM Passengers p
JOIN PassengersGoing pg1 ON p.PASSENGERSID = pg1.PASSENGERID
JOIN FlightsGoing fg1 ON pg1.FLIGHTID = fg1.FLIGHTSGOINGID
JOIN PassengersGoing pg2 ON p.PASSENGERSID = pg2.PASSENGERID
JOIN FlightsGoing fg2 ON pg2.FLIGHTID = fg2.FLIGHTSGOINGID
JOIN Airports a1 ON fg1.DEPARTUREAIRPORTID = a1.AIRPORTID
JOIN Airports a2 ON fg1.ARRIVALAIRPORTID = a2.AIRPORTID
JOIN Airports a3 ON fg2.DEPARTUREAIRPORTID = a3.AIRPORTID
JOIN Airports a4 ON fg2.ARRIVALAIRPORTID = a4.AIRPORTID
WHERE fg1.DEPARTUREAIRPORTID = fg2.ARRIVALAIRPORTID
  AND fg1.ARRIVALAIRPORTID = fg2.DEPARTUREAIRPORTID
  AND fg1.DEPARTUREDATETIME < fg2.DEPARTUREDATETIME;