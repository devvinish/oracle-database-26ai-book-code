-- @setup create or replace procedure two_results is c1 sys_refcursor; c2 sys_refcursor; begin open c1 for select count(*) as airports from airports; dbms_sql.return_result(c1); open c2 for select count(*) as routes from routes; dbms_sql.return_result(c2); end;
declare
  c      integer := dbms_sql.open_cursor(treat_as_client_for_results => true);
  rc     sys_refcursor;
  v_n    number;
  v_rows integer;
begin
  dbms_sql.parse(c, 'begin two_results; end;', dbms_sql.native);
  v_rows := dbms_sql.execute(c);
  loop
    begin
      dbms_sql.get_next_result(c, rc);                    -- read the implicit results
    exception
      when no_data_found then exit;
    end;
    fetch rc into v_n;
    dbms_output.put_line('result: ' || v_n);
    close rc;
  end loop;
  dbms_sql.close_cursor(c);
end;
/
-- @cleanup drop procedure if exists two_results
-- @cleanup drop procedure if exists print_query
