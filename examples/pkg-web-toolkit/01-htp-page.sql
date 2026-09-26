create or replace procedure hub_page is
begin
  owa_util.mime_header('text/html', true, 'utf-8');
  htp.htmlopen;
  htp.headopen;
  htp.title('Nimbus Air hubs');
  htp.headclose;
  htp.bodyopen;
  htp.header(1, 'Our hubs');
  htp.tableopen(cattributes => 'class="hubs"');
  htp.tablerowopen;
  htp.tableheader('Code');
  htp.tableheader('City');
  htp.tablerowclose;
  for a in (select airport_code, city from airports where is_hub order by 1) loop
    htp.tablerowopen;
    htp.tabledata(a.airport_code);                    -- element text is escaped
    htp.tabledata(a.city);
    htp.tablerowclose;
  end loop;
  htp.tableclose;
  htp.p('<p>' || htf.bold('Lounges') || ' at every hub</p>');   -- P writes as is
  htp.bodyclose;
  htp.htmlclose;
end;
/
-- outside a web server: set up the gateway's environment, run, and print the page
declare
  v_names  owa.vc_arr;
  v_values owa.vc_arr;
begin
  v_names(1) := 'REQUEST_METHOD'; v_values(1) := 'GET';
  owa.init_cgi_env(v_names.count, v_names, v_values);
  hub_page;
  owa_util.showpage;                                 -- the buffer, to DBMS_OUTPUT
end;
/
