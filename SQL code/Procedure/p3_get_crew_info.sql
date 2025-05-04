CREATE OR REPLACE PROCEDURE get_crew_info IS
BEGIN
    FOR crew_info IN (
        SELECT
            fc.flightcrewid,
            fc.flightid,
            ac.crewfirstname AS airline_crew_firstname,
            ac.crewlastname AS airline_crew_lastname,
            ac.crewgender AS airline_crew_gender,
            ac.crewcountry AS airline_crew_country,
            fh.airelinecrewid AS flight_hostess_crewid,
            fh.flightcrewhostessid AS flight_crew_hostess_id
        FROM
            flightcrew fc
        JOIN
            airlinecrew ac ON fc.pilotid = ac.crewid OR fc.copilotid = ac.crewid
        LEFT JOIN
            flightcrewhostess fh ON fc.flightcrewid = fh.flightcrewid
    ) LOOP
        DBMS_OUTPUT.PUT_LINE('Flight Crew ID: ' || crew_info.flightcrewid);
        DBMS_OUTPUT.PUT_LINE('Flight ID: ' || crew_info.flightid);
        DBMS_OUTPUT.PUT_LINE('Airline Crew Firstname: ' || crew_info.airline_crew_firstname);
        DBMS_OUTPUT.PUT_LINE('Airline Crew Lastname: ' || crew_info.airline_crew_lastname);
        DBMS_OUTPUT.PUT_LINE('Airline Crew Gender: ' || crew_info.airline_crew_gender);
        DBMS_OUTPUT.PUT_LINE('Airline Crew Country: ' || crew_info.airline_crew_country);
        DBMS_OUTPUT.PUT_LINE('Flight Hostess Crew ID: ' || crew_info.flight_hostess_crewid);
        DBMS_OUTPUT.PUT_LINE('Flight Crew Hostess ID: ' || crew_info.flight_crew_hostess_id);
        DBMS_OUTPUT.PUT_LINE('------------------------------------------------------');
    END LOOP;
END;
/

BEGIN
    get_crew_info;
END;
/