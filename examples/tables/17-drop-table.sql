drop table fare_rules cascade constraints purge;
select count(*) as fare_rules_tables from user_tables where table_name = 'FARE_RULES';
