-- @expect-error
begin
  dbms_scheduler.create_job(job_name   => 'LONG_JOB', job_type => 'PLSQL_BLOCK',
                            job_action => 'begin dbms_session.sleep(60); end;',
                            enabled    => true, auto_drop => false);
end;
/
exec dbms_session.sleep(3)

select job_name from user_scheduler_running_jobs;

begin
  dbms_scheduler.stop_job('LONG_JOB');
  dbms_scheduler.drop_job('LONG_JOB');
  dbms_scheduler.drop_job('NO_SUCH_JOB');
end;
/
select job_name, status from user_scheduler_job_run_details
where  job_name = 'LONG_JOB' and log_date > systimestamp - interval '1' minute;
