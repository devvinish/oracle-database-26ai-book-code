declare
  c      utl_tcp.connection;
  v_n    pls_integer;
  v_line varchar2(1024);
begin
  c := utl_tcp.open_connection(remote_host => 'host.docker.internal', remote_port => 8099,
                               charset => 'AL32UTF8');
  v_n := utl_tcp.write_line(c, 'GET /notices HTTP/1.0');          -- HTTP, written by hand
  v_n := utl_tcp.write_line(c, 'Host: host.docker.internal');
  v_n := utl_tcp.write_line(c);
  utl_tcp.flush(c);
  begin
    loop
      v_line := utl_tcp.get_line(c, remove_crlf => true);
      if v_line is null or v_line not like 'Date:%' then    -- skip the changing date
        dbms_output.put_line(v_line);
      end if;
    end loop;
  exception
    when utl_tcp.end_of_input then                       -- the server closed the connection
      utl_tcp.close_connection(c);
  end;
end;
/
