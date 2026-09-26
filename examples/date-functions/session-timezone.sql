select dbtimezone, sessiontimezone from dual;

alter session set time_zone = 'Asia/Kolkata';

select sessiontimezone, current_timestamp, localtimestamp,
       to_char(sysdate, 'HH24:MI') as sysdate_time
from   dual;
