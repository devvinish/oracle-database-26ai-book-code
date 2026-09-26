alter session set plsql_warnings = 'enable:all';

create or replace procedure warn_me (p_code varchar2) is
  v_unused number;
begin
  if 1 = 2 then
    dbms_output.put_line('never');
  end if;
end;
/
select line, attribute, message_number, substr(text, 1, 70) as text
from   user_errors
where  name = 'WARN_ME'
order  by sequence;
-- @cleanup drop procedure if exists warn_me
