select table_name, num_rows, blocks, to_char(last_analyzed, 'DD-MON-YYYY') as analyzed
from   user_tables
where  table_name in ('FLIGHTS', 'BOOKINGS', 'TICKETS')
order  by table_name;

select column_id, column_name, data_type, nullable, data_default
from   user_tab_columns
where  table_name = 'AIRPORTS'
order  by column_id;
