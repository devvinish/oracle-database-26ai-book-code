-- @expect-error
select cast('2026-03-15' as date) as iso_text from dual;
