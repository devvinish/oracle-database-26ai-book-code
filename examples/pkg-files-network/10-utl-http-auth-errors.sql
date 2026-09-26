-- @expect-error
declare
  v_req  utl_http.req;
  v_resp utl_http.resp;
  v_text varchar2(4000);
begin
  v_req := utl_http.begin_request('http://host.docker.internal:8099/reports/daily');
  utl_http.set_authentication(v_req, 'ops', 'ops-demo');            -- basic authentication
  v_resp := utl_http.get_response(v_req);
  utl_http.read_text(v_resp, v_text);
  utl_http.end_response(v_resp);
  dbms_output.put_line(v_resp.status_code || ': ' || v_text);

  v_req := utl_http.begin_request('http://host.docker.internal:8099/old-status');
  v_resp := utl_http.get_response(v_req);                     -- follows the redirect
  utl_http.read_text(v_resp, v_text);
  utl_http.end_response(v_resp);
  dbms_output.put_line('after redirect: ' || v_text);

  utl_http.set_detailed_excp_support(true);
  v_text := utl_http.request('http://host.docker.internal:8099/reports/daily');  -- 401 body
  dbms_output.put_line('without credentials: ' || v_text);
  v_text := utl_http.request('http://host.docker.internal:8100/');   -- no ACL for port 8100
exception
  when others then
    dbms_output.put_line(sqlerrm);
end;
/
