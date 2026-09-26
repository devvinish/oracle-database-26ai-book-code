alter table tickets add (meal_code varchar2(4));
select object_name, object_type, status from user_objects where object_name = 'BOOKING_API';

select booking_api.seats_taken(2800) as seats from dual;
select object_name, object_type, status from user_objects where object_name = 'BOOKING_API';

alter table tickets drop column meal_code;
