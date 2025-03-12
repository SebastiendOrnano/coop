SELECT 'dynamic' AS component, sqlpage.run_sql('a_shells/shell.sql') AS properties;


SET user_role = SELECT user_role FROM users
    INNER JOIN sessions ON users.user_id = sessions.user_id
    WHERE sessions.session_token = sqlpage.cookie('session_token');


SET redirect_link =
CASE
WHEN $user_role IS NULL OR $user_role='' THEN '/b_events/event_main_list.sql'
WHEN $user_role ='editor' OR $user_role= 'viewer' OR $user_role= 'admin'  THEN '/b_events/event_private_list_1.sql'
WHEN $user_role='supervisor'  THEN '/b_events/event_main_display_4.sql'
END;

select 
    'alert'                                              as component,
    'Confirmation'                                       as title,
    'Votre inscription a bien été prise en compte !
    
[retour à la liste des événements]('||$redirect_link||')' as description_md,
    'alert-triangle'                                      as icon,
    'green'                                               as color;



