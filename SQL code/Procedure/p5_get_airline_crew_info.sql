CREATE OR REPLACE PROCEDURE get_airline_crew_info IS
BEGIN
    FOR crew_info IN (
        SELECT
            ac.crewid,
            ac.crewfirstname,
            ac.crewlastname,
            ac.crewgender,
            ac.crewcountry,
            pn.phonenumber
        FROM
            airlinecrew ac
        LEFT JOIN
            airlinecrewphonenumber pn ON ac.crewid = pn.airlinecrewid
    ) LOOP
        DBMS_OUTPUT.PUT_LINE('Crew ID: ' || crew_info.crewid);
        DBMS_OUTPUT.PUT_LINE('Crew Firstname: ' || crew_info.crewfirstname);
        DBMS_OUTPUT.PUT_LINE('Crew Lastname: ' || crew_info.crewlastname);
        DBMS_OUTPUT.PUT_LINE('Crew Gender: ' || crew_info.crewgender);
        DBMS_OUTPUT.PUT_LINE('Crew Country: ' || crew_info.crewcountry);
        DBMS_OUTPUT.PUT_LINE('Phone Number: ' || crew_info.phonenumber);
        DBMS_OUTPUT.PUT_LINE('--------------------------------------');
    END LOOP;
END;
/

BEGIN
    get_airline_crew_info;
END;
/