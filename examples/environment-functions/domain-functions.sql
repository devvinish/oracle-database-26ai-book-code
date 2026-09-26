-- @setup drop table if exists staff_contacts purge
-- @setup drop domain if exists email_d
create domain email_d as varchar2(60)
  constraint email_d_ck
    check (regexp_like(email_d, '^[^@ ]+@[^@ ]+\.[a-z]+$', 'i'))
  display lower(email_d)
  order upper(email_d);

create table staff_contacts (id number, email email_d);
insert into staff_contacts values (1, 'Layla.Haddad@Nimbus.example'),
                                  (2, 'OMAR@nimbus.example');

select id, email, domain_name(email) as domain, domain_display(email) as display
from   staff_contacts
order  by domain_order(email);

select domain_check(email_d, 'ops@nimbus.example') as good,
       domain_check(email_d, 'bad address')        as bad,
       domain_check_type(email_d, 42)              as number_type
from   dual;
-- @cleanup drop table if exists staff_contacts purge
-- @cleanup drop domain if exists email_d
