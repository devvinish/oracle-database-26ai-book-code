-- @setup begin dbms_parallel_execute.drop_task('RECALC_FARES'); exception when others then null; end;
-- @setup drop table if exists ticket_fares purge
-- @setup create table ticket_fares as select ticket_id, fare, cast(null as number) as fare_aed from tickets
begin
  dbms_parallel_execute.create_task('RECALC_FARES');
  -- split the rows into ranges of 200 ticket IDs
  dbms_parallel_execute.create_chunks_by_number_col('RECALC_FARES', user, 'TICKET_FARES',
                                                    table_column => 'TICKET_ID',
                                                    chunk_size   => 200);
  dbms_parallel_execute.run_task('RECALC_FARES',
    sql_stmt       => 'update ticket_fares
                       set    fare_aed = round(fare * 3.6725, 2)
                       where  ticket_id between :start_id and :end_id',
    language_flag  => dbms_sql.native,
    parallel_level => 2);                              -- two scheduler jobs
  dbms_output.put_line('status: ' || dbms_parallel_execute.task_status('RECALC_FARES')
                       || ' (' || dbms_parallel_execute.finished || ' = FINISHED)');
end;
/
select status, count(*) as chunks from user_parallel_execute_chunks
where  task_name = 'RECALC_FARES' group by status;

select count(*) as tickets, count(fare_aed) as recalculated from ticket_fares;

exec dbms_parallel_execute.drop_task('RECALC_FARES')
-- @cleanup drop table if exists ticket_fares purge
