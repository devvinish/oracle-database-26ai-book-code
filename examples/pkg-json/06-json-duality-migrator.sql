-- @setup drop view if exists crew_dv
-- @setup drop table if exists crew_dv_root purge
-- @setup drop table if exists crew_docs purge
-- documents as another system delivers them, in a JSON collection table
create json collection table crew_docs;
insert into crew_docs
  values (json('{"_id":1,"name":"Anil Rao","rank":"Captain","base":"DXB"}'));
insert into crew_docs
  values (json('{"_id":2,"name":"Mei Lin","rank":"First Officer","base":"SIN"}'));
insert into crew_docs
  values (json('{"_id":3,"name":"Omar Haddad","rank":"Captain","base":"DXB"}'));
commit;

declare
  v_ddl clob;
begin
  v_ddl := dbms_json_duality.infer_and_generate_schema(json('{
             "tableNames"   : ["CREW_DOCS"],
             "viewNames"    : ["CREW_DV"],
             "useFlexFields": false,
             "outputFormat" : "executable"}'));
  dbms_output.put_line(v_ddl);
  execute immediate v_ddl;                             -- create the table and the view
  dbms_json_duality.import_all(json('{"tableNames": ["CREW_DOCS"],
                                      "viewNames" : ["CREW_DV"]}'));
end;
/
select json_serialize(json_transform(data, remove '$._metadata')) as crew from crew_dv;
-- @cleanup drop view if exists crew_dv
-- @cleanup drop table if exists crew_dv_root purge
-- @cleanup drop table if exists crew_docs purge
