-- @setup drop table if exists flight_attributes purge
create table flight_attributes (
  flight_no varchar2(6),
  name      varchar2(30),
  value     sys.anydata                         -- any type, and it remembers which
);
insert into flight_attributes values ('NM150', 'delay_minutes', anydata.convertnumber(45));
insert into flight_attributes values ('NM150', 'gate', anydata.convertvarchar2('B12'));
insert into flight_attributes values ('NM150', 'boarding',
  anydata.convertdate(to_date('2026-03-15 21:30', 'YYYY-MM-DD HH24:MI')));
commit;

select name, a.value.gettypename() as type_name,
       case a.value.gettypename()
         when 'SYS.NUMBER'   then to_char(anydata.accessnumber(a.value))
         when 'SYS.VARCHAR2' then anydata.accessvarchar2(a.value)
         when 'SYS.DATE'     then to_char(anydata.accessdate(a.value), 'DD-MON HH24:MI')
       end as value
from   flight_attributes a;

declare
  v_value sys.anydata;
  v_num   number;
begin
  select value into v_value from flight_attributes where name = 'delay_minutes';
  if v_value.getnumber(v_num) = dbms_types.success then   -- returns a status
    dbms_output.put_line('delay: ' || v_num || ' minutes');
  end if;
end;
/
-- @cleanup drop table if exists flight_attributes purge
