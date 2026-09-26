begin
  dbms_scheduler.create_program('LOAD_FUEL', 'PLSQL_BLOCK',
    q'[begin insert into job_log (job_name, message) values ('CHAIN', 'load fuel prices');
       end;]', enabled => true);
  dbms_scheduler.create_program('CHECK_FUEL', 'PLSQL_BLOCK',
    q'[begin insert into job_log (job_name, message) values ('CHAIN', 'check fuel prices');
       end;]', enabled => true);
  dbms_scheduler.create_program('REPORT_FUEL', 'PLSQL_BLOCK',
    q'[begin insert into job_log (job_name, message) values ('CHAIN', 'report fuel prices');
       end;]', enabled => true);

  dbms_scheduler.create_chain('FUEL_CHAIN');
  dbms_scheduler.define_chain_step('FUEL_CHAIN', 'LOAD_STEP',   'LOAD_FUEL');
  dbms_scheduler.define_chain_step('FUEL_CHAIN', 'CHECK_STEP',  'CHECK_FUEL');
  dbms_scheduler.define_chain_step('FUEL_CHAIN', 'REPORT_STEP', 'REPORT_FUEL');
  dbms_scheduler.define_chain_rule('FUEL_CHAIN', 'TRUE', 'START LOAD_STEP');
  dbms_scheduler.define_chain_rule('FUEL_CHAIN', 'LOAD_STEP SUCCEEDED', 'START CHECK_STEP');
  dbms_scheduler.define_chain_rule('FUEL_CHAIN', 'CHECK_STEP SUCCEEDED',
                                                'START REPORT_STEP');
  dbms_scheduler.define_chain_rule('FUEL_CHAIN', 'REPORT_STEP COMPLETED', 'END');
  dbms_scheduler.enable('FUEL_CHAIN');

  dbms_scheduler.create_job('FUEL_JOB', job_type => 'CHAIN', job_action => 'FUEL_CHAIN',
                            enabled => true);
end;
/
exec dbms_session.sleep(8)

select message from job_log where job_name = 'CHAIN' order by logged_at;

select job_subname as step, status, error#
from   user_scheduler_job_run_details
where  job_name = 'FUEL_JOB' and job_subname is not null
and    log_date > systimestamp - interval '1' minute
order  by log_id;
