create or replace procedure airline_data as
    cursor airline_cursor is select * from airlines;
begin
    for rec in airline_cursor loop
        dbms_output.put_line(rec.airlineid || ' ' || rec.airlinename);
    end loop;
end;
/

BEGIN
    airline_data;
end;