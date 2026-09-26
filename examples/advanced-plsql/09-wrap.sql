begin
  dbms_ddl.create_wrapped(
    'create or replace function secret_discount (p_fare number) return number is
     begin return round(p_fare * 0.87, 2); end;');
end;
/
select secret_discount(100) as discounted from dual;

select line, substr(text, 1, 60) as source from user_source
where  name = 'SECRET_DISCOUNT' and line <= 2;
-- @cleanup drop function if exists secret_discount
