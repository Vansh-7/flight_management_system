CREATE OR REPLACE FUNCTION get_airport_details
RETURN SYS_REFCURSOR
IS
    result_cursor SYS_REFCURSOR;
BEGIN
    OPEN result_cursor FOR
    SELECT airportname, airportcity, totalterminals, totalrunways
    FROM airports;
    RETURN result_cursor;
END;
/


DECLARE
    result_cursor SYS_REFCURSOR;
    airport_name airports.airportname%TYPE;
    airport_city airports.airportcity%TYPE;
    num_terminals NUMBER;
    num_runways NUMBER;
BEGIN
    result_cursor := get_airport_details;
    LOOP
        FETCH result_cursor INTO airport_name, airport_city, num_terminals, num_runways;
        EXIT WHEN result_cursor%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE('Airport Name: ' || airport_name);
        DBMS_OUTPUT.PUT_LINE('Airport City: ' || airport_city);
        DBMS_OUTPUT.PUT_LINE('Number of Terminals: ' || num_terminals);
        DBMS_OUTPUT.PUT_LINE('Number of Runways: ' || num_runways);
        DBMS_OUTPUT.PUT_LINE('------------------------------');
    END LOOP;
    CLOSE result_cursor;
END;
/