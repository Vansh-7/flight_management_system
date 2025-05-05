SELECT 
    fg.FLIGHTSGOINGID AS flight_id,
    fg.DEPARTUREAIRPORTID AS source_airport_code,
    fg.ARRIVALAIRPORTID AS destination_airport_code,
    a1.AIRPORTCOUNTRY AS source_country,
    a2.AIRPORTCOUNTRY AS destination_country,
    CASE 
        WHEN a1.AIRPORTCOUNTRY = a2.AIRPORTCOUNTRY THEN 'Domestic'
        ELSE 'International'
    END AS flight_type
FROM FLIGHTSGOING fg
JOIN Airports a1 ON fg.DEPARTUREAIRPORTID = a1.AIRPORTID
JOIN Airports a2 ON fg.ARRIVALAIRPORTID = a2.AIRPORTID;