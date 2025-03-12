SELECT 'dynamic' AS component, sqlpage.run_sql('a_shells/shell.sql') AS properties;

SELECT 
    'form' as component, 
    'Sign In' as title, 
    'Log in' as validate, 
    '/a_sessions/session_main_create_0.sql' as action;

SELECT 
    'user_email' AS name, 
    'email' AS label,
    'at' as prefix_icon, 
    'votre email' as placeholder;

    SELECT 
    'password' AS name, 
    'lock' as prefix_icon, 
    'password' AS type;



