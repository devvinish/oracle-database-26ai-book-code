-- @setup drop view if exists customer_dv
create json relational duality view customer_dv as
  customers @update
  {
    _id      : customer_id,
    name     : last_name,
    email    : email,
    bookings : bookings @insert @update
               [ { bookingId : booking_id, ref : booking_ref,
                   status : status, total : total_amount } ]
  };

select json_serialize(data returning varchar2(1000) pretty) as doc
from   customer_dv v
where  v.data."_id" = 37;
