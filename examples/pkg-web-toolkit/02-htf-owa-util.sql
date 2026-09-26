declare
  v_names  owa.vc_arr;
  v_values owa.vc_arr;
begin
  v_names(1) := 'QUERY_STRING'; v_values(1) := 'flight=NM150&lang=en';
  v_names(2) := 'HTTP_USER_AGENT'; v_values(2) := 'Mozilla/5.0';
  owa.init_cgi_env(v_names.count, v_names, v_values);

  dbms_output.put_line(htf.anchor('https://nimbus.example/flights/NM150', 'NM150'));
  dbms_output.put_line(htf.escape_sc('Fares < $500 & "no fees"'));
  dbms_output.put_line('query string: ' || owa_util.get_cgi_env('QUERY_STRING'));
  dbms_output.put_line('user agent:   ' || owa_util.get_cgi_env('HTTP_USER_AGENT'));
  dbms_output.put_line('unescaped:    ' || utl_url.unescape('NM150%20delayed'));
end;
/
-- @cleanup drop procedure if exists hub_page
