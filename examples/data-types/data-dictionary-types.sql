select column_name, data_type, data_length, data_precision, data_scale, char_used, nullable
from   user_tab_columns
where  table_name = 'TICKETS'
order  by column_id;
