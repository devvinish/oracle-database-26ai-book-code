-- distinct customers per month, counted with bitmaps
select month, sum(bitmap_count(bm)) as customers
from   (select trunc(booked_at, 'MM') as month,
               bitmap_bucket_number(customer_id) as bucket,
               bitmap_construct_agg(bitmap_bit_position(customer_id)) as bm
        from   bookings
        group  by trunc(booked_at, 'MM'), bitmap_bucket_number(customer_id))
group  by month
order  by month;
