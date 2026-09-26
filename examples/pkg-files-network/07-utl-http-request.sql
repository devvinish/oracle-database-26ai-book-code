select utl_http.request('http://host.docker.internal:8099/flights/NM150/status')
       as response;

select json_value(utl_http.request('http://host.docker.internal:8099/fx?base=USD'),
                  '$.rates.AED') as usd_to_aed;
