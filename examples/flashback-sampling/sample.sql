select count(*) as rows_in_10_percent from crew_assignments sample (10) seed (26);

select round(avg(salary)) as sample_avg_salary from employees sample (50) seed (1);
