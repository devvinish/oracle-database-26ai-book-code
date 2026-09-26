select flight_no, minutes_late, abs(minutes_late) as abs_minutes, sign(minutes_late) as sign
from   (select flight_no,
          round((cast(actual_arrival as date) - cast(scheduled_arrival as date)) * 1440)
            as minutes_late
        from   flights
        where  flight_id in (5, 6, 7, 11));
