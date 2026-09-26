alter table fare_rules modify (notes varchar2(500));
alter table fare_rules rename column notes to remarks;
alter table fare_rules add (currency_code char(3) default 'USD' not null);
alter table fare_rules drop column season;
alter table fare_rules set unused (refundable);

select column_name, data_type, data_length, hidden_column
from   user_tab_cols
where  table_name = 'FARE_RULES'
order  by column_id;
