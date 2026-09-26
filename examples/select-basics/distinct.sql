select distinct region from countries order by region;

select distinct type_code, status from aircraft order by 1, 2;

select count(distinct base_airport) as bases from employees;
