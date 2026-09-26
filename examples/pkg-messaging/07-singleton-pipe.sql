-- the cache function fills the pipe when it is empty or its message is too old
create or replace function fx_rate_cache (pipename in varchar2) return integer is
begin
  dbms_output.put_line('  (cache function called)');
  dbms_pipe.pack_message(3.6725);                   -- in real life: read the rate somewhere
  return dbms_pipe.send_message(pipename, singleton => true, shelflife => 600);
end;
/
declare
  v_status integer;
  v_rate   number;
begin
  v_status := dbms_pipe.create_pipe('FX_USD_AED', singleton => true, shelflife => 600);
  for i in 1 .. 3 loop
    v_status := dbms_pipe.receive_message('FX_USD_AED', timeout => 0,
                                          cache_func => 'NIMBUS.FX_RATE_CACHE');
    dbms_pipe.unpack_message(v_rate);
    dbms_output.put_line('read ' || i || ': status ' || v_status || ', rate ' || v_rate);
  end loop;
  v_status := dbms_pipe.remove_pipe('FX_USD_AED');
end;
/
-- @cleanup drop function if exists fx_rate_cache
