-- @expect-error
-- @setup drop assertion if exists no_crew_on_cancelled_flights
create assertion no_crew_on_cancelled_flights check (
  not exists (select null
              from   crew_assignments c, flights f
              where  f.flight_id = c.flight_id
              and    f.status = 'CANCELLED')
);

insert into crew_assignments (flight_id, employee_id, crew_role)
select flight_id, 112, 'CAPTAIN' from flights where status = 'CANCELLED'
fetch  first 1 row only;
-- @cleanup rollback
-- @cleanup drop assertion if exists no_crew_on_cancelled_flights
