SET user_role = (
    SELECT user_role FROM users
    INNER JOIN sessions ON users.user_id = sessions.user_id
    WHERE sessions.session_token = sqlpage.cookie('session_token')
); 

-- shell for public page

SELECT 'dynamic' AS component, sqlpage.run_sql('a_shells/shell_core.sql') AS properties;
