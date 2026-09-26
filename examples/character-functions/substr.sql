select flight_no,
       substr(flight_no, 1, 2)  as airline,
       substr(flight_no, 3)     as number_part,
       substr(flight_no, -2)    as last_two,
       substr(flight_no, 10)    as past_the_end
from   flights
where  flight_id = 1;
