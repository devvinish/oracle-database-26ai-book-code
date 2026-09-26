select i, round(i, 'HH') as round_hour, trunc(i, 'HH') as trunc_hour,
       ceil(i, 'DD') as ceil_day
from   (select interval '1 07:45:30' day to second as i);
