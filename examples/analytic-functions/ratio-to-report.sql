select payment_method, sum(amount) as total,
       round(100 * ratio_to_report(sum(amount)) over (), 1) as pct
from   payments
where  amount > 0
group  by payment_method
order  by total desc;
