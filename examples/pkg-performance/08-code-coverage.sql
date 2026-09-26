-- @setup create or replace function fare_band (p_fare number) return varchar2 is begin if p_fare < 300 then return 'LOW'; elsif p_fare < 800 then return 'MID'; elsif p_fare < 2000 then return 'HIGH'; else return 'PREMIUM'; end if; end;
declare
  v_run  number;
  v_band varchar2(10);
begin
  dbms_plsql_code_coverage.create_coverage_tables(force_it => true);
  v_run := dbms_plsql_code_coverage.start_coverage(run_comment => 'fare bands');
  v_band := fare_band(150);
  v_band := fare_band(650);                           -- the other branches never run
  dbms_plsql_code_coverage.stop_coverage;
end;
/
select u.name, count(*) as blocks, sum(b.covered) as covered,
       round(100 * sum(b.covered) / count(*)) as pct
from   dbmspcc_units u join dbmspcc_blocks b
       on b.run_id = u.run_id and b.object_id = u.object_id
where  u.run_id = (select max(run_id) from dbmspcc_runs)
group  by u.name;
-- @cleanup drop function if exists fare_band
-- @cleanup begin for t in (select table_name from user_tables where table_name like 'DBMSHP%' or table_name like 'DBMSPCC%') loop execute immediate 'drop table ' || t.table_name || ' cascade constraints purge'; end loop; for q in (select sequence_name from user_sequences where sequence_name like 'DBMSHP%' or sequence_name like 'DBMSPCC%') loop execute immediate 'drop sequence ' || q.sequence_name; end loop; end;
