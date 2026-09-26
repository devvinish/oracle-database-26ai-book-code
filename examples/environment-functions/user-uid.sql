select user, uid, ora_invoking_user as invoking_user, ora_invoking_userid as invoking_id,
       userenv('LANG') as lang, userenv('SESSIONID') as session_id
from   dual;
