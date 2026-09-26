-- @expect-error
select to_date('31/02/2026', 'DD/MM/YYYY') as no_such_day from dual;
