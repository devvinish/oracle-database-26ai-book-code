select timestamp_to_scn(systimestamp - interval '5' minute) as scn_5_min_ago,
       to_char(scn_to_timestamp(timestamp_to_scn(systimestamp - interval '5' minute)),
               'HH24:MI:SS') as back_to_time
from   dual;

select airport_code, ora_rowscn, to_char(scn_to_timestamp(ora_rowscn), 'DD-MON HH24:MI')
         as changed_about
from   airports
where  airport_code = 'DXB';
