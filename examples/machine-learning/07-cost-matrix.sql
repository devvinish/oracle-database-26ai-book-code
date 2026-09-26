-- @setup drop table if exists cabin_costs purge
-- predicting ECONOMY for a business traveller costs 5 times more than the opposite error
create table cabin_costs (actual_target_value    varchar2(10),
                          predicted_target_value varchar2(10),
                          cost                   number);
insert into cabin_costs values ('BUSINESS', 'BUSINESS', 0), ('BUSINESS', 'ECONOMY', 5),
                               ('ECONOMY', 'ECONOMY', 0),   ('ECONOMY', 'BUSINESS', 1);
commit;

exec dbms_data_mining.add_cost_matrix('CABIN_CLASS', 'CABIN_COSTS')

select prediction(cabin_class cost model using *) as predicted, count(*) as tickets,
       round(avg(prediction_cost(cabin_class, 'BUSINESS' cost model using *)), 3)
         as avg_cost_if_business
from   ml_tickets
group  by prediction(cabin_class cost model using *);

select * from table(dbms_data_mining.get_model_cost_matrix('CABIN_CLASS')) order by 1, 2;

exec dbms_data_mining.remove_cost_matrix('CABIN_CLASS')
-- @cleanup drop table if exists cabin_costs purge
