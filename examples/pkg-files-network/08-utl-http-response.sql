declare
  v_req   utl_http.req;
  v_resp  utl_http.resp;
  v_name  varchar2(256);
  v_value varchar2(1024);
  v_line  varchar2(1024);
begin
  v_req := utl_http.begin_request('http://host.docker.internal:8099/notices');
  utl_http.set_header(v_req, 'User-Agent', 'Nimbus-PLSQL/1.0');
  v_resp := utl_http.get_response(v_req);
  dbms_output.put_line('status: ' || v_resp.status_code || ' ' || v_resp.reason_phrase);
  for i in 1 .. utl_http.get_header_count(v_resp) loop
    utl_http.get_header(v_resp, i, v_name, v_value);
    if v_name like 'Content%' then
      dbms_output.put_line(v_name || ': ' || v_value);
    end if;
  end loop;
  begin
    loop
      utl_http.read_line(v_resp, v_line, remove_crlf => true);
      dbms_output.put_line('> ' || v_line);
    end loop;
  exception
    when utl_http.end_of_body then
      utl_http.end_response(v_resp);
  end;
end;
/
