SELECT 'dynamic' AS component, sqlpage.run_sql('a_shells/shell.sql') AS properties;



SELECT 'alert' as component,
    'Attention' as title,
    'La page à laquelle vous souhaitez accéder est protégée.  
    Vous devez d''abord vous [identifier](/a_sessions/session_create_form.sql)  
    ou  
    si vous n''avez pas encore de compte en [créer un](/a_users/user_create_form.sql).' as description_md,
    'alert-circle' as icon,
    'red' as color
WHERE $user_role IS NULL;