-- @setup create or replace type t_codes as table of varchar2(10)
-- @setup create or replace type t_code_sets as table of t_codes
select * from table(powermultiset(t_codes('LHR', 'SIN', 'SYD')));

select * from table(powermultiset_by_cardinality(t_codes('LHR', 'SIN', 'SYD'), 2));
-- @cleanup drop type if exists t_code_sets force
-- @cleanup drop type if exists t_codes force
