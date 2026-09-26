-- @setup drop database link if exists loopback
create database link loopback
  connect to nimbus identified by "&nimbus_password"
  using 'localhost:1521/FREEPDB1';

select count(*) as airports_over_the_link from airports@loopback;

select db_link, username, host from user_db_links;
-- @cleanup drop database link if exists loopback
