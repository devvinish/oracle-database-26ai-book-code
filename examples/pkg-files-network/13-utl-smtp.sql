declare
  c       utl_smtp.connection;
  v_reply utl_smtp.reply;
  v_rs    utl_smtp.replies;
begin
  v_reply := utl_smtp.open_connection('host.docker.internal', 2525, c);
  dbms_output.put_line(v_reply.code || ' ' || v_reply.text);
  v_rs := utl_smtp.ehlo(c, 'nimbus.example');
  for i in 1 .. v_rs.count loop
    dbms_output.put_line(v_rs(i).code || ' ' || v_rs(i).text);
  end loop;
  utl_smtp.mail(c, 'ops@nimbus.example');
  utl_smtp.rcpt(c, 'crew.dxb@nimbus.example');
  utl_smtp.open_data(c);
  utl_smtp.write_data(c, 'From: Nimbus Operations <ops@nimbus.example>' || utl_tcp.crlf);
  utl_smtp.write_data(c, 'To: crew.dxb@nimbus.example' || utl_tcp.crlf);
  utl_smtp.write_data(c, 'Subject: NM150 gate change' || utl_tcp.crlf || utl_tcp.crlf);
  utl_smtp.write_data(c, 'NM150 now departs from gate B12.' || utl_tcp.crlf);
  v_reply := utl_smtp.close_data(c);
  dbms_output.put_line(v_reply.code || ' ' || v_reply.text);
  utl_smtp.quit(c);
end;
/
