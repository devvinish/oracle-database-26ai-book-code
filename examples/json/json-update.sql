update customers c
set    c.loyalty = json_transform(c.loyalty,
                                  set '$.points' = c.loyalty.points.number() + 1000)
where  c.customer_id = 1;

select c.loyalty.points from customers c where customer_id = 1;
rollback;
