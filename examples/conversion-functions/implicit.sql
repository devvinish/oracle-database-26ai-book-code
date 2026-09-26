select flight_id, flight_no from flights where flight_id = '42';

select 'NM' || 101 as text_and_number, '10' + 5 as number_sum,
       date '2026-03-15' + '7' as date_plus
from   dual;
