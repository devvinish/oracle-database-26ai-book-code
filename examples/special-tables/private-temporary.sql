create private temporary table ora$ptt_quote (route_id number, fare number)
  on commit preserve definition;

insert into ora$ptt_quote values (1, 520);
select * from ora$ptt_quote;

select table_name, duration from user_private_temp_tables;
