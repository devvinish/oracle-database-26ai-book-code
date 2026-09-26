-- @expect-error
-- || and + have the same precedence and are evaluated left to right: ('NM' || 100) + 1
select 'NM' || 100 + 1 as flight_no from dual;
