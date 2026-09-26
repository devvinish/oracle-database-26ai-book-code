-- @expect-error
begin
  dbms_scheduler.create_job(
    job_name   => 'FAILING_JOB',
    job_type   => 'PLSQL_BLOCK',
    job_action => q'[begin
                       raise_application_error(-20001, 'fuel price feed missing');
                     end;]',
    enabled    => true);                         -- no schedule: runs once, at once
end;
/
exec dbms_session.sleep(5)

select job_name, status, error#, substr(errors, 1, instr(errors, chr(10)) - 1) as error
from   user_scheduler_job_run_details
where  job_name = 'FAILING_JOB'
and    log_date > systimestamp - interval '1' minute;
