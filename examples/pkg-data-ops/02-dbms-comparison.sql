-- @setup begin dbms_comparison.drop_comparison('ROUTES_CMP'); exception when others then null; end;
-- @setup drop table if exists routes_copy purge
create table routes_copy as select * from routes;
alter table routes_copy add primary key (route_id);
update routes_copy set block_minutes = block_minutes + 5 where route_id in (3, 7);
delete from routes_copy where route_id = 12;
commit;

declare
  v_scan dbms_comparison.comparison_type;
  v_same boolean;
begin
  dbms_comparison.create_comparison(
    comparison_name    => 'ROUTES_CMP',
    schema_name        => user,  object_name        => 'ROUTES',
    dblink_name        => null,                   -- the other table is local too
    remote_schema_name => user,  remote_object_name => 'ROUTES_COPY');
  v_same := dbms_comparison.compare('ROUTES_CMP', v_scan, perform_row_dif => true);
  dbms_output.put_line('identical? ' || case when v_same then 'yes' else 'no' end);
end;
/
select index_value as route_id, local_rowid is not null as in_routes,
       remote_rowid is not null as in_copy, status
from   user_comparison_row_dif
where  comparison_name = 'ROUTES_CMP'
order  by to_number(index_value);
