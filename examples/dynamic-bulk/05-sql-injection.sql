-- @expect-error
declare
  v_input  varchar2(100) := 'DXB'' or ''1''=''1';     -- a malicious value from a form
  v_count  number;
begin
  -- concatenated: the input becomes part of the SQL text
  execute immediate 'select count(*) from routes where origin = ''' || v_input || ''''
    into v_count;
  dbms_output.put_line('concatenated: ' || v_count || ' routes');
  -- bound: the input is only ever a value
  execute immediate 'select count(*) from routes where origin = :o'
    into v_count using v_input;
  dbms_output.put_line('bound: ' || v_count || ' routes');
  -- names can't be bound: check them
  execute immediate 'select count(*) from ' || dbms_assert.simple_sql_name('routes; drop')
    into v_count;
end;
/
