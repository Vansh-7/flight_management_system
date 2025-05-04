DECLARE
  v_crew_id airlinecrew.crewid%TYPE;
  v_first_name airlinecrew.crewfirstname%TYPE;
  v_last_name airlinecrew.crewlastname%TYPE;
  v_gender airlinecrew.crewgender%TYPE;
  v_country airlinecrew.crewcountry%TYPE;
  v_airline_name airlines.airlinename%TYPE;
  
  CURSOR crew_cursor IS
    SELECT ac.crewid, ac.crewfirstname, ac.crewlastname, ac.crewgender, ac.crewcountry, al.airlinename
    FROM airlinecrew ac
    JOIN airlines al ON ac.airlineid = al.airlineid;
BEGIN
  OPEN crew_cursor;
  LOOP
    FETCH crew_cursor INTO v_crew_id, v_first_name, v_last_name, v_gender, v_country, v_airline_name;
    EXIT WHEN crew_cursor%NOTFOUND;
    DBMS_OUTPUT.PUT_LINE('Crew ID: ' || v_crew_id || ', Name: ' || v_first_name || ', Gender: ' || v_gender || ', Country: ' || v_country || ', Airline: ' || v_airline_name);
  END LOOP;
  CLOSE crew_cursor;
END;
/