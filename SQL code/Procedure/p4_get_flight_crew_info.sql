CREATE OR REPLACE PROCEDURE get_flight_crew_info IS
BEGIN
    FOR crew_info IN (
        SELECT
            fg.flightsgoingid,
            fg.departureairportid,
            fg.arrivalairportid,
            fg.arrivaldatetime,
            fg.departuredatetime,
            fc.pilotid,
            fc.copilotid,
            fc.numberofairhostesses,
            fc.headairhostessid
        FROM
            flightsgoing fg
        JOIN
            flightcrew fc ON fg.flightsgoingid = fc.flightid
    ) LOOP
        DBMS_OUTPUT.PUT_LINE('Flight ID: ' || crew_info.flightsgoingid);
        DBMS_OUTPUT.PUT_LINE('Departure Airport ID: ' || crew_info.departureairportid);
        DBMS_OUTPUT.PUT_LINE('Arrival Airport ID: ' || crew_info.arrivalairportid);
        DBMS_OUTPUT.PUT_LINE('Arrival Datetime: ' || crew_info.arrivaldatetime);
        DBMS_OUTPUT.PUT_LINE('Departure Datetime: ' || crew_info.departuredatetime);
        DBMS_OUTPUT.PUT_LINE('Pilot ID: ' || crew_info.pilotid);
        DBMS_OUTPUT.PUT_LINE('CoPilot ID: ' || crew_info.copilotid);
        DBMS_OUTPUT.PUT_LINE('Number of Air Hostesses: ' || crew_info.numberofairhostesses);
        DBMS_OUTPUT.PUT_LINE('Head Air Hostess ID: ' || crew_info.headairhostessid);
        DBMS_OUTPUT.PUT_LINE('----------------------------------------');
    END LOOP;
END;
/

BEGIN
    get_flight_crew_info;
END;
/