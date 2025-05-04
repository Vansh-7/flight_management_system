CREATE OR REPLACE PROCEDURE get_airline_aeroplane_info IS
BEGIN
    FOR airline_info IN (
        SELECT
            a.airlineid,
            a.airlinename,
            aa.aeroplaneid
        FROM
            airlines a
        JOIN
            airlinesaeroplanes aa ON a.airlineid = aa.airlineid
    ) LOOP
        DBMS_OUTPUT.PUT_LINE('Airline ID: ' || airline_info.airlineid);
        DBMS_OUTPUT.PUT_LINE('Airline Name: ' || airline_info.airlinename);
        DBMS_OUTPUT.PUT_LINE('Aeroplane ID: ' || airline_info.aeroplaneid);
        DBMS_OUTPUT.PUT_LINE('---------------------------------------------');
    END LOOP;
END;
/

begin 
    get_airline_aeroplane_info;
end;