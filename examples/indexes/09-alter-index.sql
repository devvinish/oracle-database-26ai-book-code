alter index bookings_booked_at_ix rebuild online;
alter index bookings_booked_at_ix rename to bookings_booked_ix;
alter index bookings_booked_ix unusable;

select index_name, status, visibility
from   user_indexes
where  index_name = 'BOOKINGS_BOOKED_IX';

alter index bookings_booked_ix rebuild;
select index_name, status from user_indexes where index_name = 'BOOKINGS_BOOKED_IX';
