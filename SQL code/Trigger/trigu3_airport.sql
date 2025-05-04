CREATE OR REPLACE TRIGGER airport_trigger
BEFORE INSERT OR UPDATE ON airports
FOR EACH ROW
BEGIN
    -- Check if the total number of terminals and runways is positive
    IF :NEW.totalterminals < 0 OR :NEW.totalrunways < 0 THEN
        RAISE_APPLICATION_ERROR(-20001, 'Total terminals and runways must be non-negative');
    END IF;
END;
/