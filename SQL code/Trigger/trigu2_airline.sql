CREATE OR REPLACE TRIGGER airline_trigger
BEFORE INSERT OR UPDATE ON airlines
FOR EACH ROW
DECLARE
    airline_count NUMBER;
BEGIN
    -- Check if the airline name is unique
    IF INSERTING THEN
        SELECT COUNT(*)
        INTO airline_count
        FROM airlines
        WHERE airlinename = :NEW.airlinename;
        
        IF airline_count > 0 THEN
            RAISE_APPLICATION_ERROR(-20001, 'Airline name must be unique');
        END IF;
    END IF;
END;
/