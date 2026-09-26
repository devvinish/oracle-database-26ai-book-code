select cabin, measure, value
from   (select cabin, count(*) as tickets, round(avg(fare)) as avg_fare
        from tickets group by cabin)
model
  partition by (cabin)
  dimension by (0 as measure_no)
  measures (tickets, avg_fare, cast(null as varchar2(20)) as measure, 0 as value)
  rules iterate (3) (
    measure[iteration_number] = case iteration_number when 0 then 'TICKETS'
                                   when 1 then 'AVG_FARE' else 'REVENUE' end,
    value[iteration_number]   = case iteration_number
                                   when 0 then tickets[0]
                                   when 1 then avg_fare[0]
                                   else tickets[0] * avg_fare[0] end
  )
order  by cabin, measure;
