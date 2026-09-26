-- @expect-error
-- @setup drop table if exists crew_contacts purge
-- @setup drop domain if exists phone_d
create domain phone_d as varchar2(20)
  constraint phone_d_ck check (regexp_like(phone_d, '^\+[0-9 ]{7,18}$'))
  display regexp_replace(phone_d, ' ', '-')
  annotations (description 'International phone number with country code');

create table crew_contacts (employee_id number, mobile phone_d, office domain phone_d);

insert into crew_contacts values (112, '+971 50 123 4567', '+971 4 555 0100');
select employee_id, mobile, domain_display(mobile) as shown from crew_contacts;

insert into crew_contacts (employee_id, mobile) values (113, '050 123 4567');
