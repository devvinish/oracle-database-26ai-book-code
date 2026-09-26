declare
  v_req  utl_http.req;
  v_resp utl_http.resp;
  v_body varchar2(200) := json_object('flight' value 'NM150', 'passengers' value 2);
  v_text varchar2(32767);
begin
  v_req := utl_http.begin_request('http://host.docker.internal:8099/bookings', 'POST');
  utl_http.set_header(v_req, 'Content-Type', 'application/json');
  utl_http.set_header(v_req, 'Content-Length', lengthb(v_body));
  utl_http.write_text(v_req, v_body);
  v_resp := utl_http.get_response(v_req);
  utl_http.read_text(v_resp, v_text);
  utl_http.end_response(v_resp);
  dbms_output.put_line(v_resp.status_code || ': ' || v_text);
  dbms_output.put_line('booking reference: ' || json_value(v_text, '$.booking_ref'));
end;
/
