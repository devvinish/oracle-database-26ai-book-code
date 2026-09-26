select v, to_boolean(v) as bool
from   (values ('true'), ('yes'), ('on'), ('1'), ('false'), ('no'), ('off'), ('0')) t (v);
