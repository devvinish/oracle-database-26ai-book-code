-- @connect sysdba
create profile app_profile limit
  failed_login_attempts 5
  password_lock_time    1/24
  password_life_time    90
  sessions_per_user     10;

alter user nimbus_app profile app_profile;

select resource_name, limit from dba_profiles
where  profile = 'APP_PROFILE' and limit <> 'DEFAULT'
order  by resource_name;
