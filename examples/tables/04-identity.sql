-- @expect-error
-- @setup drop table if exists promo_codes purge
create table promo_codes (
  promo_id   number generated always as identity (start with 100 increment by 10),
  code       varchar2(12) not null,
  discount   number(3)
);

insert into promo_codes (code, discount) values ('SPRING26', 15), ('FLYDXB', 10);
select * from promo_codes;

insert into promo_codes (promo_id, code, discount) values (1, 'MANUAL', 5);
-- @cleanup drop table if exists promo_codes purge
