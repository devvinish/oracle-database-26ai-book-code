-- @setup drop function if exists haversine_km
-- @setup drop mle module if exists geo_module
create mle module geo_module language javascript as
export function haversineKm(lat1, lon1, lat2, lon2) {
  const r = Math.PI / 180, dLat = (lat2 - lat1) * r, dLon = (lon2 - lon1) * r;
  const h = Math.sin(dLat / 2) ** 2 +
            Math.cos(lat1 * r) * Math.cos(lat2 * r) * Math.sin(dLon / 2) ** 2;
  return Math.round(2 * 6371 * Math.asin(Math.sqrt(h)));
}
/
create function haversine_km (lat1 number, lon1 number, lat2 number, lon2 number)
  return number
  as mle module geo_module signature 'haversineKm(number, number, number, number)';
/
select a.airport_code || '-' || b.airport_code as route,
       haversine_km(a.latitude, a.longitude, b.latitude, b.longitude) as km
from   airports a, airports b
where  a.airport_code = 'DXB' and b.airport_code in ('LHR', 'SYD');
