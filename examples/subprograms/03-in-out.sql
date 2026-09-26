create or replace procedure split_name (
  p_full  in out varchar2,
  p_first out    varchar2
) is
begin
  p_first := substr(p_full, 1, instr(p_full, ' ') - 1);
  p_full  := substr(p_full, instr(p_full, ' ') + 1);
end;
/
declare
  v_name  varchar2(60) := 'Layla Haddad';
  v_first varchar2(30);
begin
  split_name(v_name, v_first);
  dbms_output.put_line('first: ' || v_first || ', rest: ' || v_name);
end;
/
