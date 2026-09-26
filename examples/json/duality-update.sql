-- change a document: the view updates the rows of CUSTOMERS and BOOKINGS behind it
update customer_dv v
set    v.data = json_transform(v.data, set '$.email' = 'k.new@example.com',
                                       set '$.bookings[0].status' = 'CANCELLED')
where  v.data."_id" = 37;

select c.email, b.booking_ref, b.status
from   customers c join bookings b on b.customer_id = c.customer_id
where  c.customer_id = 37
order  by b.booking_id;
rollback;
