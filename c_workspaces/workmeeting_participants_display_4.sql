SELECT 'dynamic' AS component, sqlpage.run_sql('a_shells/shell_4.sql') AS properties;

SET user_id = (
    SELECT users.user_id AS userID FROM users
    INNER JOIN sessions ON userID = sessions.user_id
    WHERE sessions.session_token = sqlpage.cookie('session_token')
); 

SET workspace_id=(SELECT workspace_id FROM workmeetings WHERE workmeeting_id=$workmeeting_id);

SET coordinator = 
CASE
WHEN (SELECT user_id FROM workmeeting_participants WHERE workmeeting_participant_role='coordinator' AND workmeeting_id=$workmeeting_id)= $user_id 
THEN 'coordinator'
ELSE ''
END;

SET space_id = select space_id from workmeetings where workmeeting_id =$workmeeting_id;

select
    'breadcrumb' as component;
select 
    'Home' as title,
    '/'    as link;
select 
    'Gestion Superviseur'         as title,
    '/a_panels/panel_supervisor_4.sql' as link;
select 
     '/c_workspaces/workspace_main_display_4.sql'             as link,
    'Retour espaces de travail'           as title;
select 
    '/c_workspaces/workspace_hub_display_4.sql?workspace_id='||$workspace_id  as link,
    'Retour espace du groupe de travail'                                      as title;


select 
    'divider'                             as component,
    'Description de la réunion' as contents,
    'left'                                as position,
    'black'                               as color;

SET lieu = (
    SELECT s.space_name
FROM workmeetings e
LEFT JOIN place_spaces s ON s.space_id = e.space_id
WHERE e.workmeeting_id = $workmeeting_id
);

SET adress = (
    SELECT CONCAT(place_adress, '       
', place_postal_code, '     ', place_town)
    FROM workmeetings
    LEFT JOIN (
        SELECT place_adress, place_postal_code, place_town 
        FROM place
    ) ON place_id = workmeetings.place_id
    WHERE workmeeting_id = $workmeeting_id
);

SELECT 
    'form' as component,
    ''  AS validate;

SELECT 
    'workmeeting_date'                 as name,
    'Date de l''évenement'       as label,
    'date'                       as type,
    3                            AS width,
    TRUE AS readonly,
    (SELECT workmeeting_date FROM workmeetings WHERE workmeeting_id=$workmeeting_id ) as value;

SELECT
    'workmeeting_hour_start'           as name,
    'text'                       as type,  
    'heure début'                as label,
    TRUE AS readonly,
    (SELECT workmeeting_hour_start FROM workmeetings WHERE workmeeting_id=$workmeeting_id ) as value,
    2                            as width;

SELECT
    'workmeeting_hour_end'          as name,
    'text'                    as type,  
    'heure fin'             as label,
    TRUE AS readonly,
    (SELECT workmeeting_hour_end FROM workmeetings WHERE workmeeting_id=$workmeeting_id ) as value,
    2                        as width;

SELECT
    'workmeeting_duration'          as name,
    'text'                    as type,  
    'durée'                   as label,
    TRUE AS readonly,
    (SELECT workmeeting_duration FROM workmeetings WHERE workmeeting_id=$workmeeting_id ) as value,
    2                         as width;

SELECT 
    'workmeeting_alert'      as name,
    'Alerte'                  as label,
    'text'                 as type,
    2                        AS width,
    TRUE AS readonly;

SELECT
    'workmeeting_title'               as name,
    'text'                     as type,  
    'Nom'                      as label,
    6                           AS width,
    TRUE AS readonly,
    (SELECT workmeeting_title FROM workmeetings WHERE workmeeting_id=$workmeeting_id ) as value;

SELECT 
    'workmeeting_status'            as name,
    'Statut'                 as label,
    'text'                 as type,
    TRUE                     as required,
    2                        AS width,
    TRUE AS readonly;

SELECT 
    'workmeeting_type'     as name,
    'Type'                 as label,
    'text'               as type,
    2                      AS width,
    TRUE AS readonly;

SELECT 
    'workmeeting_visio'      as name,
    'Présentiel/Visio '      as label,
    'text'                 as type,
    TRUE                     as required,
    2                        AS width,
    TRUE AS readonly;

SELECT
    'workmeeting_visio_url'    as name,
    'text'                     as type,  
    'URL visio (si visio)'                as label,
    TRUE AS readonly,
    (SELECT workmeeting_visio_url FROM workmeetings WHERE workmeeting_id=$workmeeting_id ) as value,
    6                          as width;

SELECT
    'workmeeting_visio_code'   as name,
    'text'               as type,  
    'URL code'           as label,
    TRUE AS readonly,
    (SELECT workmeeting_visio_code FROM workmeetings WHERE workmeeting_id=$workmeeting_id ) as value,
    4                   as width;

select 
    'space_id' as name,
    'lieu (si présentiel)' as label,
    'text' as type,
    TRUE AS readonly,
    12 AS width,
    (SELECT space_name FROM place_spaces WHERE space_id=$space_id ) as value;

SELECT
    'workmeeting_agenda'             as name,
    'textarea'                  as type, 
    TRUE AS readonly,
    (SELECT workmeeting_agenda FROM workmeetings WHERE workmeeting_id=$workmeeting_id ) as value,
    'Ordre du jour'               as label;

select 
    'divider'                             as component,
    'Liste des participants à la réunion' as contents,
    'left'                                as position,
    'black'                               as color;

select 
    'button'                                   as component,
    TRUE                                       as important,
    'sm'                                       as size;
select 
    '/c_workspaces/workmeeting_join_0.sql?workmeeting_id='||$workmeeting_id    as link,
    'green'                                     as color,
    'S''inscrire'                                as title,
    'copy-plus'                                  as icon;

select 
    '/c_workspaces/workmeeting_quit_0.sql?workmeeting_id='||$workmeeting_id    as link,
    'red'                                    as color,
    'Se désincrire'          as title,
    'copy-plus'                                  as icon;

-- Display list of organizations
SELECT 'table' AS component, 
    'Liste des participants'   AS title, 
    'View'           AS markdown;

SELECT
    p.workmeeting_participant_id                    AS Id,
    u.user_first_name                               AS Prénom,
    u.user_last_name                                AS Nom,
    u.user_email                                    AS Mail
FROM workmeeting_participants AS p
LEFT JOIN 
(SELECT user_id, user_first_name, user_last_name, user_email FROM users ) AS u
ON p.user_id = u.user_id
WHERE p.workmeeting_id=$workmeeting_id
ORDER BY created_at ASC;
