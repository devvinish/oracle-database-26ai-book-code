begin
  dbms_scheduler.run_job('NIGHTLY_STATUS_CLEANUP', use_current_session => true);
end;
/
select job_name, message from job_log;

select job_name, status, error#, run_duration
from   user_scheduler_job_run_details
where  job_name = 'NIGHTLY_STATUS_CLEANUP'
and    log_date > systimestamp - interval '1' minute;           -- this run
