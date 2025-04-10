SET user_role = (
    SELECT user_role FROM users
    INNER JOIN sessions ON users.user_id = sessions.user_id
    WHERE sessions.session_token = sqlpage.cookie('session_token')
); 

SELECT 'redirect' AS component,        
'/a_sessions/session_create_alert.sql' AS link  
WHERE NOT ($user_role = 'viewer') OR sqlpage.cookie('session_token') IS NULL;

SELECT 'dynamic' AS component, sqlpage.run_sql('a_shells/shell_core.sql') AS properties;
