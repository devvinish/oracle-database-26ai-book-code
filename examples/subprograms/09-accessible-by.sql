-- @expect-error
create or replace procedure audit_write (p_text varchar2)
  accessible by (procedure raise_salary)
is
begin
  null;
end;
/
begin
  audit_write('called from an anonymous block');
end;
/
-- @cleanup drop procedure if exists audit_write
