declare
  h      number;
  th     number;
  v_ddl  clob;
begin
  h := dbms_metadata.open('TABLE');
  dbms_metadata.set_filter(h, 'NAME_EXPR', q'[like 'A%']');   -- every table starting with A
  th := dbms_metadata.add_transform(h, 'DDL');
  dbms_metadata.set_transform_param(th, 'SEGMENT_ATTRIBUTES', false);
  dbms_metadata.set_transform_param(th, 'CONSTRAINTS', false);
  dbms_metadata.set_transform_param(th, 'REF_CONSTRAINTS', false);
  loop
    v_ddl := dbms_metadata.fetch_clob(h);
    exit when v_ddl is null;
    dbms_output.put_line(regexp_substr(v_ddl, 'CREATE TABLE [^ ]+') || ': '
                         || regexp_count(v_ddl, chr(10) || '\s+"') || ' columns');
  end loop;
  dbms_metadata.close(h);
end;
/
