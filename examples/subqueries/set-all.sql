select column_value as code from table(sys.odcivarchar2list('A', 'A', 'A', 'B'))
except all
select column_value from table(sys.odcivarchar2list('A', 'B'));

select column_value as code from table(sys.odcivarchar2list('A', 'A', 'B'))
intersect all
select column_value from table(sys.odcivarchar2list('A', 'A', 'A'));
