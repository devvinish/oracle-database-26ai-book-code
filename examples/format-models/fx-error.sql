-- @expect-error
select to_date('5/3/2026', 'fxDD/MM/YYYY') as exact from dual;
