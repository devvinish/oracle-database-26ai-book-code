-- @setup drop index if exists tickets_flight_seat_ux
create unique index tickets_flight_seat_ux on tickets (flight_id, seat_no);

select index_name, uniqueness, column_name, column_position
from   user_indexes join user_ind_columns using (index_name, table_name)
where  table_name = 'TICKETS'
order  by index_name, column_position;
