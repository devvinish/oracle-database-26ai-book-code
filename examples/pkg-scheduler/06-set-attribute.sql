begin
  dbms_scheduler.disable('NIGHTLY_STATUS_CLEANUP');
  dbms_scheduler.set_attribute('NIGHTLY_STATUS_CLEANUP', 'repeat_interval',
                               'FREQ=DAILY; BYHOUR=3; BYMINUTE=15');
  dbms_scheduler.set_attribute('NIGHTLY_STATUS_CLEANUP', 'max_failures', 3);
  dbms_scheduler.set_attribute('NIGHTLY_STATUS_CLEANUP', 'max_run_duration',
                               interval '10' minute);
  dbms_scheduler.set_attribute('NIGHTLY_STATUS_CLEANUP', 'logging_level',
                               dbms_scheduler.logging_full);
  dbms_scheduler.enable('NIGHTLY_STATUS_CLEANUP');
end;
/
select repeat_interval, max_failures, max_run_duration, logging_level
from   user_scheduler_jobs
where  job_name = 'NIGHTLY_STATUS_CLEANUP';
