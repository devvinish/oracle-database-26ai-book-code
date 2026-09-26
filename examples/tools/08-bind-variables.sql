variable min_km number
exec :min_km := 12000

select origin, destination, distance_km from routes where distance_km > :min_km;

print min_km
