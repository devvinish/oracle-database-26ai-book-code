-- @setup create or replace procedure log_route_count (p_origin varchar2) is begin insert into job_log (job_name, message) select 'ROUTES_' || p_origin, count(*) || ' routes from ' || p_origin from routes where origin = p_origin; commit; end;
begin
  dbms_scheduler.create_program(
    program_name        => 'ROUTE_COUNT',
    program_type        => 'STORED_PROCEDURE',
    program_action      => 'LOG_ROUTE_COUNT',
    number_of_arguments => 1);
  dbms_scheduler.define_program_argument('ROUTE_COUNT', 1, 'P_ORIGIN', 'VARCHAR2');
  dbms_scheduler.enable('ROUTE_COUNT');

  dbms_scheduler.create_schedule(
    schedule_name   => 'EVERY_MONDAY_6AM',
    start_date      => timestamp '2027-01-01 00:00:00 Asia/Dubai',
    repeat_interval => 'FREQ=WEEKLY; BYDAY=MON; BYHOUR=6; BYMINUTE=0');

  dbms_scheduler.create_job('ROUTES_DXB', program_name => 'ROUTE_COUNT',
                            schedule_name => 'EVERY_MONDAY_6AM');
  dbms_scheduler.set_job_argument_value('ROUTES_DXB', 'P_ORIGIN', 'DXB');
  dbms_scheduler.enable('ROUTES_DXB');
  dbms_scheduler.run_job('ROUTES_DXB');
end;
/
select message from job_log where job_name = 'ROUTES_DXB';

select job_name, program_name, schedule_name, state, next_run_date
from   user_scheduler_jobs
where  job_name = 'ROUTES_DXB';
