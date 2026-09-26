select origin as airport from routes where destination = 'SIN'
union
select destination from routes where origin = 'SYD'
order  by 1;

select origin as airport from routes where destination = 'SIN'
union all
select destination from routes where origin = 'SYD'
order  by 1;
