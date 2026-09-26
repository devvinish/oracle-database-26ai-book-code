select *
from   (select to_char(sys_extract_utc(scheduled_departure), 'MM') as month, status
        from   flights)
pivot  (count(*) for month in ('01' as jan, '02' as feb, '03' as mar));
