-- Removes the Nimbus Air tables (and everything the examples of the book created in the schema).
begin
  for o in (select object_name, object_type from user_objects
            where object_type in ('TABLE', 'VIEW', 'MATERIALIZED VIEW', 'SEQUENCE', 'SYNONYM', 'PACKAGE', 'PROCEDURE',
                                  'FUNCTION', 'TYPE', 'PROPERTY GRAPH', 'DOMAIN', 'JSON COLLECTION TABLE', 'MLE MODULE')
            and object_name not like 'BIN$%') loop
    begin
      execute immediate 'drop ' || o.object_type || ' "' || o.object_name || '"'
        || case o.object_type when 'TABLE' then ' cascade constraints purge'
                              when 'TYPE' then ' force' when 'DOMAIN' then ' force' end;
    exception when others then null;   -- already dropped with its table
    end;
  end loop;
end;
/
purge recyclebin;
