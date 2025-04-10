
SELECT 'dynamic' AS component, sqlpage.run_sql('a_shells/shell_1.sql') AS properties;

SET user_id = (SELECT user_id FROM sessions WHERE sessions.session_token = sqlpage.cookie('session_token')); 

SET username = (
    SELECT users.username FROM users
    INNER JOIN sessions ON users.user_id = sessions.user_id
    WHERE sessions.session_token = sqlpage.cookie('session_token')
); 


select 
    'datagrid'              as component,
    'Paramètre de votre profil :    '||$username       as title,
    'Changer ses coordonnées, son mot de passe...' as description_md;

select 
    'PASSWORD'  as title,
    'Changer de mot de passe' as description,
    'vector' as icon,
    'red'                    as color,
    '/a_users/user_password_edit_1.sql?user_id='||$user_id   as link;

select 
    'USERNAME' as title,
    '/a_users/user_username_edit_1.sql?user_id='||$user_id     as link,
    'Changer de nom d''utilisateur' as description,
    'list-details'           as icon,
    'green'                    as color;

select 
    'EMAIL' as title,
    '/a_users/user_email_edit_1.sql?user_id='||$user_id      as link,
    'Changer d''email' as description,
    'list-details'           as icon,
    'yellow'                    as color;

select 
    'PROFILE' as title,
    '/a_users/user_profile_edit_1.sql?user_id='||$user_id      as link,
    'Actualiser le profil' as description,
    'list-details'           as icon,
    'yellow'                    as color;
