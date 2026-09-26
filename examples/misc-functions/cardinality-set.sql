-- @setup create or replace type t_codes as table of varchar2(10)
select cardinality(t_codes('DXB', 'LHR', 'DXB', 'SIN'))      as items,
       cardinality(set(t_codes('DXB', 'LHR', 'DXB', 'SIN'))) as distinct_items,
       set(t_codes('DXB', 'LHR', 'DXB', 'SIN'))              as set_result
from   dual;
