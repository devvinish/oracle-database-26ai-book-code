declare
  v_req  utl_http.req;
  v_resp utl_http.resp;
  v_text varchar2(32767);
begin
  utl_http.set_wallet('system:');              -- the operating system's certificate store
  v_req := utl_http.begin_request('https://example.com/');
  v_resp := utl_http.get_response(v_req);
  utl_http.read_text(v_resp, v_text);
  utl_http.end_response(v_resp);
  dbms_output.put_line(v_resp.status_code || ' ' || v_resp.reason_phrase || ', title: '
                       || regexp_substr(v_text, '<title>(.*)</title>', 1, 1, null, 1));
end;
/
