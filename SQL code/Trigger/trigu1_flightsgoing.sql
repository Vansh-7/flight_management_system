CREATE OR REPLACE TRIGGER flightsgoing_trigger  
BEFORE INSERT OR UPDATE ON flightsgoing  
FOR EACH ROW  
BEGIN  
    -- Terminal check  
    IF :NEW.departureterminalid = :NEW.arrivalterminalid THEN  
        RAISE_APPLICATION_ERROR(-20001, 'Departure and arrival terminals cannot be the same');  
    END IF;  
    -- DateTime check  
    IF :NEW.departuredatetime >= :NEW.arrivaldatetime THEN  
        RAISE_APPLICATION_ERROR(-20002, 'Departure datetime must be before arrival datetime');  
    END IF;  
END;  
/