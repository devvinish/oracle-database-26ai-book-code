create or replace function fare_with_tax (p_fare number) return number is
  pragma udf;                       -- optimized for calls from SQL
begin
  return round(p_fare * 1.05, 2);
end;
/
select ticket_id, fare, fare_with_tax(fare) as with_tax from tickets where ticket_id <= 3;
