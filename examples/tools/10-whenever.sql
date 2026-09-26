-- @exits
-- @expect-error
whenever sqlerror continue
select * from no_such_table;
prompt still running after the error
whenever sqlerror exit sql.sqlcode rollback
select * from no_such_table;
prompt never printed
