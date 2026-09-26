select year, cabin, tickets
from   (select 2026 as year, cabin, count(*) as tickets from tickets group by cabin)
model
  dimension by (year, cabin)
  measures (tickets)
  rules upsert (
    tickets[2027, for cabin in ('BUSINESS', 'ECONOMY', 'PREMIUM')] =
      presentv(tickets[2026, cv()], round(tickets[2026, cv()] * 1.2), 50)
  )
order  by year, cabin;
