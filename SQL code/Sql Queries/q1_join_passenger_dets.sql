SELECT
    p.passengerfirstname AS Passenger_FirstName,
    p.passengerlastname AS Passenger_LastName,
    p.passengergender AS S,
    p.passengerage AS Passenger_Age,
    a.airlinename AS Airline_Name,
    fc.flightid AS Flight_ID,
    fc.pilotid AS Pilot_ID,
    fc.headairhostessid AS HeadAirHostess_ID
FROM
    passengers p
JOIN
    passengersgoing pg ON p.passengersid = pg.passengerid
JOIN
    flightsgoing fg ON pg.flightid = fg.flightsgoingid
JOIN
    airlinesaeroplanes aa ON fg.airlinesaeroplanesid = aa.airlinesaeroplanesid
JOIN
    airlines a ON aa.airlineid = a.airlineid
JOIN
    flightcrew fc ON fg.flightsgoingid = fc.flightid;