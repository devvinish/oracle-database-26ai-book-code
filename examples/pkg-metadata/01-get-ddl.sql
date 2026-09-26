begin
  -- start from the defaults (SQLcl sets its own for its DDL command), then:
  dbms_metadata.set_transform_param(dbms_metadata.session_transform, 'DEFAULT');
  -- no storage details, and a terminator after each statement
  dbms_metadata.set_transform_param(dbms_metadata.session_transform,
                                    'SEGMENT_ATTRIBUTES', false);
  dbms_metadata.set_transform_param(dbms_metadata.session_transform, 'SQLTERMINATOR', true);
end;
/
select dbms_metadata.get_ddl('TABLE', 'COUNTRIES') as ddl from dual;

select dbms_metadata.get_dependent_ddl('INDEX', 'TICKETS') as indexes from dual;
