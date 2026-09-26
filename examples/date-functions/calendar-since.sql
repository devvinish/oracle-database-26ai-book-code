select d, calendar_since(d) as long_form, calendar_since(d, 'SHORT') as short_form
from   (values (sysdate - 3), (sysdate - 45), (sysdate - 400), (sysdate + 2/24)) t (d);
