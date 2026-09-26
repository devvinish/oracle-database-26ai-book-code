declare
  v_body clob;
begin
  select body into v_body from policies where id = 1;
  dbms_output.put_line('SecureFile? '
                       || case when dbms_lob.issecurefile(v_body) then 'yes' end);
  dbms_output.put_line('chunk size: ' || dbms_lob.getchunksize(v_body));
  dbms_output.put_line('storage limit: ' || dbms_lob.get_storage_limit(v_body));
  dbms_output.put_line('content type: ' || nvl(dbms_lob.getcontenttype(v_body), 'not set'));
end;
/
-- @cleanup drop table if exists policies purge
