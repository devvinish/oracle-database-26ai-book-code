-- @setup begin dbms_scheduler.drop_job('NIGHTLY_STATUS_CLEANUP', force => true); exception when others then null; end;
-- @setup drop table if exists job_log purge
-- @setup create table job_log (logged_at timestamp default systimestamp, job_name varchar2(30), message varchar2(200))
begin
  dbms_scheduler.create_job(
    job_name        => 'NIGHTLY_STATUS_CLEANUP',
    job_type        => 'PLSQL_BLOCK',
    job_action      => q'[begin
                            insert into job_log (job_name, message)
                            select 'NIGHTLY_STATUS_CLEANUP',
                                   count(*) || ' flights scheduled'
                            from   flights where status = 'SCHEDULED';
                            commit;
                          end;]',
    start_date      => timestamp '2027-01-01 02:30:00 Asia/Dubai',
    repeat_interval => 'FREQ=DAILY; BYHOUR=2; BYMINUTE=30',
    enabled         => true,
    comments        => 'Counts the flights still scheduled, nightly');
end;
/
select job_name, state, next_run_date from user_scheduler_jobs;
