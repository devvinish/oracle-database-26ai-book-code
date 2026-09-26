create or replace trigger customers_normalize_trg
  before insert or update of email, last_name on customers
  for each row
begin
  :new.email := lower(trim(:new.email));
  if inserting then
    :new.joined_on := trunc(sysdate);
  end if;
end;
/
insert into customers (first_name, last_name, email)
values ('Ana', 'Ruiz', '  Ana.Ruiz@Example.COM ');
select email, joined_on from customers where last_name = 'Ruiz';
rollback;
