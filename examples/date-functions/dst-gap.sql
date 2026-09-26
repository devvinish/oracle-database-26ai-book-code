-- @expect-error
-- clocks in New York jump from 02:00 to 03:00 on 8 March 2026
select timestamp '2026-03-08 01:30:00 America/New_York' + interval '1' hour
         as elapsed_hour
from   dual;

select timestamp '2026-03-08 02:30:00 America/New_York' as in_the_gap from dual;
