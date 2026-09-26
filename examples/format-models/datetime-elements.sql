select element,
       to_char(timestamp '2026-03-15 16:05:09.123456 Asia/Kolkata', element) as result
from   (values ('YYYY'), ('YY'), ('RRRR'), ('YEAR'), ('Q'), ('MM'), ('MON'), ('Month'),
               ('WW'), ('IW'), ('W'), ('DDD'), ('DD'), ('D'), ('DY'), ('Day'), ('J'),
               ('HH'), ('HH24'), ('MI'), ('SS'), ('SSSSS'), ('FF3'), ('AM'),
               ('TZR'), ('TZH:TZM'), ('TZD'), ('DL'), ('TS')) t (element);
