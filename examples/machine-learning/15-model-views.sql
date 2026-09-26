select setting_name, setting_value
from   user_mining_model_settings
where  model_name = 'CABIN_CLASS'
and    setting_name in ('ALGO_NAME', 'TREE_TERM_MAX_DEPTH', 'TREE_IMPURITY_METRIC',
                        'PREP_AUTO');

select attribute_name, attribute_type, usage_type, target
from   user_mining_model_attributes
where  model_name = 'CABIN_CLASS'
order  by target desc, attribute_name;
