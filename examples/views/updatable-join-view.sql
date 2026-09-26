update flight_board set status = 'CANCELLED' where flight_id = 2800;

select column_name, updatable, insertable, deletable
from   user_updatable_columns
where  table_name = 'FLIGHT_BOARD'
order  by column_name;
rollback;
