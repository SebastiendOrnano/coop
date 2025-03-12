SELECT 'dynamic' AS component, sqlpage.run_sql('a_shells/shell_3.sql') AS properties;

SET project_id = select project_id FROM project_meetings where project_meeting_id=$project_meeting_id;

select 
    'breadcrumb' as component;
select 
    'Home' as title,
    '/'    as link;
select 
    'Gestion éditeur'         as title,
    '/a_panels/panel_editor_3.sql' as link;
 select 
    'Retour à la liste des projets'            as title,
    '/e_projects/project_main_display_3.sql'     as link;   
 select 
    'Retour au hub du projet'            as title,
    '/e_projects/project_hub_display_3.sql?project_id='||$project_id     as link;
select 
    'Retour à la liste des réunions'            as title,
    '/e_project_meetings/project_meeting_main_display_3.sql?project_id='||$project_id     as link;

select 
    'divider'                             as component,
    'Description de la réunion' as contents,
    'left'                                as position,
    'black'                               as color;

SET lieu = (
    SELECT p.project_meeting_place_name
FROM project_meeting_places as p
LEFT JOIN project_meetings as m
ON p.project_meeting_place_id = m.project_meeting_place_id
WHERE m.project_id = $project_id
);

SET adress = (
    SELECT CONCAT(p.project_meeting_place_adress, '       
', p.project_meeting_place_postal_code, '     ', p.project_meeting_place_town)
    FROM project_meetings as m
    LEFT JOIN (SELECT project_meeting_place_id, project_meeting_place_adress, project_meeting_place_postal_code, project_meeting_place_town  FROM project_meeting_places) as p 
    ON p.project_meeting_place_id = m.project_meeting_place_id
    WHERE m.project_meeting_id = $project_meeting_id
);

SELECT 
    'form' as component,
    '' validate;

SELECT 
    'project_meeting_date'                 as name,
    'Date de l''évenement'       as label,
    'date'                       as type,
    3                            AS width,
    TRUE                         AS readonly,
    (SELECT project_meeting_date FROM project_meetings where project_meeting_id=$project_meeting_id ) as value;
SELECT
    'project_meeting_hour_start'           as name,
    'text'                       as type,  
    'heure début'                as label,
    TRUE                         AS readonly,
    (SELECT project_meeting_hour_start FROM project_meetings where project_meeting_id=$project_meeting_id ) as value,
    2                            as width;

SELECT
    'project_meeting_hour_end'          as name,
    'text'                    as type,  
    'heure fin'             as label,
    TRUE                         AS readonly,
    (SELECT project_meeting_hour_end FROM project_meetings where project_meeting_id=$project_meeting_id ) as value,
    2                        as width;

SELECT
    'project_meeting_duration'          as name,
    'text'                    as type,  
    'durée'                   as label,
    TRUE                         AS readonly,
    (SELECT project_meeting_duration FROM project_meetings where project_meeting_id=$project_meeting_id ) as value,
    2                         as width;

SELECT 
    'project_meeting_alert'      as name,
    'Alerte'                  as label,
    'text'                as type,
    2                        AS width,
    TRUE                         AS readonly,
    (SELECT project_meeting_alert FROM project_meetings where project_meeting_id=$project_meeting_id ) as value;

SELECT
    'project_meeting_title'               as name,
    'text'                     as type,  
    'Nom'                      as label,
    6                           AS width,
    TRUE                         AS readonly,
    (SELECT project_meeting_title FROM project_meetings where project_meeting_id=$project_meeting_id ) as value,
    TRUE                       as required;

SELECT 
    'project_meeting_status'            as name,
    'Statut'                 as label,
    'text'                as type,
    TRUE                     as required,
    2                        AS width,
    TRUE                         AS readonly,
    (SELECT project_meeting_status FROM project_meetings where project_meeting_id=$project_meeting_id ) as value;
SELECT 
    'project_meeting_type'     as name,
    'Type'                 as label,
    'text'               as type,
    2                      AS width,
    TRUE                         AS readonly,
    (SELECT project_meeting_type FROM project_meetings where project_meeting_id=$project_meeting_id ) as value;

SELECT 
    'project_meeting_visio'      as name,
    'Présentiel/Visio '      as label,
    'text'                 as type,
    TRUE                     as required,
    2                        AS width,
    TRUE                         AS readonly,
    (SELECT project_meeting_visio FROM project_meetings where project_meeting_id=$project_meeting_id ) as value;

SELECT
    'project_meeting_visio_url'    as name,
    'text'                     as type,  
    'URL visio (si visio)'                as label,
    TRUE                         AS readonly,
    (SELECT project_meeting_visio_url FROM project_meetings where project_meeting_id=$project_meeting_id ) as value,
    6                          as width;

SELECT
    'project_meeting_visio_code'   as name,
    'text'               as type,  
    'URL code'           as label,
    TRUE                         AS readonly,
    (SELECT project_meeting_visio_code FROM project_meetings where project_meeting_id=$project_meeting_id ) as value,
    4                   as width;

select 
    'project_meeting_place_id'   as name,
    'lieu (si présentiel)'        as label,
    'text'                        as type,
    TRUE                         AS readonly,
    12 AS width,
    (SELECT project_meeting_place_id FROM project_meetings where project_meeting_id=$project_meeting_id ) as value;

SELECT
    'project_meeting_agenda'             as name,
    'textarea'                  as type, 
    TRUE                         AS readonly,
    (SELECT project_meeting_agenda FROM project_meetings where project_meeting_id=$project_meeting_id ) as value,
    'Ordre du jour'               as label;

