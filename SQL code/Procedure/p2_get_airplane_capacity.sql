CREATE OR REPLACE PROCEDURE get_airplane_capacity AS
BEGIN
    FOR rec IN (
        SELECT a.aeroplanesid,
               a.aeroplanetype,
               ac.totalcapacity,
               ac.economyclasscapacity,
               ac.premiumeconomyclasscapacity,
               ac.businessclasscapacity,
               ac.firstclasscapacity
        FROM aeroplanes a
        JOIN aeroplanecapacity ac ON a.aeroplanecapacityid = ac.aeroplanecapacityid
        ORDER BY ac.totalcapacity, a.aeroplanesid
    ) LOOP
        DBMS_OUTPUT.PUT_LINE(
            'Aeroplane ID: ' || rec.aeroplanesid ||
            ', Type: ' || rec.aeroplanetype ||
            ', Total Capacity: ' || rec.totalcapacity ||
            ', Economy Class Capacity: ' || rec.economyclasscapacity ||
            ', Premium Economy Class Capacity: ' || rec.premiumeconomyclasscapacity ||
            ', Business Class Capacity: ' || rec.businessclasscapacity ||
            ', First Class Capacity: ' || rec.firstclasscapacity
        );
    END LOOP;
END;
/

begin
    get_airplane_capacity;
end;