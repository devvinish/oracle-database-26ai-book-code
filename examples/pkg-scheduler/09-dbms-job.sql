declare
  v_job binary_integer;
begin
  dbms_job.submit(v_job, what => 'log_route_count(''LHR'');',
                  next_date => sysdate + 1, interval => 'trunc(sysdate) + 1 + 2/24');
  commit;
end;
/
select what, interval, broken from user_jobs;

select job_style, job_action, repeat_interval from user_scheduler_jobs
where  job_name like 'DBMS_JOB$%';

begin
  for j in (select job from user_jobs) loop
    dbms_job.remove(j.job);
  end loop;
  commit;
end;
/
-- @cleanup begin for j in (select job_name from user_scheduler_jobs where job_name in ('NIGHTLY_STATUS_CLEANUP', 'ROUTES_DXB', 'FUEL_JOB')) loop dbms_scheduler.drop_job(j.job_name, force => true); end loop; end;
-- @cleanup begin dbms_scheduler.drop_chain('FUEL_CHAIN', force => true); end;
-- @cleanup begin for p in (select program_name from user_scheduler_programs) loop dbms_scheduler.drop_program(p.program_name, force => true); end loop; end;
-- @cleanup begin dbms_scheduler.drop_schedule('EVERY_MONDAY_6AM', force => true); end;
-- @cleanup drop procedure if exists log_route_count
-- @cleanup drop table if exists job_log purge
