-- @setup drop table if exists policies purge
-- @setup create table policies (id number primary key, body clob)
insert into policies values (1, empty_clob());

declare
  v_body clob;
begin
  -- lock the row and get a locator to write to
  select body into v_body from policies where id = 1 for update;
  dbms_lob.open(v_body, dbms_lob.lob_readwrite);
  for i in 1 .. 3 loop
    dbms_lob.writeappend(v_body, 19, 'Rule ' || i || ': max 23 kg. ');
  end loop;
  dbms_lob.close(v_body);
  commit;
end;
/
select id, dbms_lob.getlength(body) as chars, body from policies;
