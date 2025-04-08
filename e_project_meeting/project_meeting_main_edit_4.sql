SELECT 'dynamic' AS component, sqlpage.run_sql('a_shells/shell_4.sql') AS properties;

SET user_id = (
    SELECT users.user_id AS userID FROM users
    INNER JOIN sessions ON userID = sessions.user_id
    WHERE sessions.session_token = sqlpage.cookie('session_token')
); 


select 
    'breadcrumb' as component;
select 
    'Home' as title,
    '/'    as link;
select 
    'Gestion Superviseur'         as title,
    '/a_panels/panel_supervisor_4.sql' as link;
 select 
    'Retour à la liste des projets'            as title,
    '/e_project/project_main_display_4.sql'     as link;   
 select 
    'Retour au hub du projet'            as title,
    '/e_project/project_hub_display_4.sql?project_id='||$project_id     as link;
select 
    'Retour à la liste des réunions'            as title,
    '/e_project_meeting/project_meeting_main_display_4.sql?project_id='||$project_id     as link;



select 
    'divider'                             as component,
    'Description de la réunion' as contents,
    'left'                                as position,
    'black'                               as color;

SET lieu = (
    SELECT p.project_meeting_place_name
FROM project_meeting_places as p
LEFT JOIN project_meeting as m
ON p.project_meeting_place_id = m.project_meeting_place_id
WHERE m.project_id = $project_id
);

SET adress = (
    SELECT CONCAT(p.project_meeting_place_adress, '       
', p.project_meeting_place_postal_code, '     ', p.project_meeting_place_town)
    FROM project_meeting as m
    LEFT JOIN (SELECT project_meeting_place_id, project_meeting_place_adress, project_meeting_place_postal_code, project_meeting_place_town  FROM project_meeting_places) as p 
    ON p.project_meeting_place_id = m.project_meeting_place_id
    WHERE m.project_meeting_id = $project_meeting_id
);

SELECT 
    'form' as component,
   'Actualiser la réunion' AS validate,
    '/e_project_meeting/project_meeting_main_update_0.sql?project_meeting_id='||$project_meeting_id as action;

SELECT 
    'project_meeting_date'                 as name,
    'Date de l''évenement'       as label,
    'date'                       as type,
    3                            AS width,
    (SELECT project_meeting_date FROM project_meeting WHERE project_meeting_id=$project_meeting_id ) as value,
    TRUE                        as required,
    (select regex_value from regex where regex_name='date')         as pattern,
   (select regex_description from regex where regex_name='date')          as description;

SELECT
    'project_meeting_hour_start'           as name,
    'select'                    as type, 
    2                        as width,
    'heure début'                as label,
    (SELECT project_meeting_hour_start FROM project_meeting WHERE project_meeting_id=$project_meeting_id ) as value,
    'Choisir une heure dans la liste...'    as empty_option,
    json_group_array(json_object('label',i.choice_label, 'value', i.choice_value))  AS options
    FROM choices_items AS i
    LEFT JOIN (select choice_category_id, choice_category_name from choices_categories)  AS c 
    ON i.choice_category_id = c.choice_category_id
    where choice_category_name="list_hours"
    ORDER BY  i.choice_label ASC;


SELECT
    'project_meeting_hour_end'          as name,
    'select'                    as type, 
    2                        as width,
    'heure fin'             as label,
    (SELECT project_meeting_hour_end FROM project_meeting WHERE project_meeting_id=$project_meeting_id ) as value,
    'Choisir une heure dans la liste...'    as empty_option,
    json_group_array(json_object('label',i.choice_label, 'value', i.choice_value))  AS options
    FROM choices_items AS i
    LEFT JOIN (select choice_category_id, choice_category_name from choices_categories)  AS c 
    ON i.choice_category_id = c.choice_category_id
    where choice_category_name="list_hours"
    ORDER BY  i.choice_label ASC;

SELECT
    'project_meeting_duration'  as name,
    'select'                    as type,  
    2                           as width,
    'durée'                     as label,
    (SELECT project_meeting_duration FROM project_meeting WHERE project_meeting_id=$project_meeting_id ) as value,
    'Choisir une heure dans la liste...'    as empty_option,
    json_group_array(json_object('label',i.choice_label, 'value', i.choice_value))  AS options
    FROM choices_items AS i
    LEFT JOIN (select choice_category_id, choice_category_name from choices_categories)  AS c 
    ON i.choice_category_id = c.choice_category_id
    where choice_category_name="list_hours"
    ORDER BY  i.choice_label ASC;
SELECT 
    'project_meeting_alert'      as name,
    'Alerte'                  as label,
    'select'                 as type,
    2                        AS width,
    (SELECT project_meeting_alert FROM project_meeting WHERE project_meeting_id=$project_meeting_id ) as value,
    'Choisir un statut dans la liste...'    as empty_option,
    json_group_array(json_object('label',i.choice_label, 'value', i.choice_value))  AS options
    FROM choices_items AS i
    LEFT JOIN (select choice_category_id, choice_category_name from choices_categories)  AS c 
    ON i.choice_category_id = c.choice_category_id
    where choice_category_name="workmeeting_alert"
    ORDER BY  i.choice_label ASC;

SELECT
    'project_meeting_title'               as name,
    'text'                     as type,  
    'Nom'                      as label,
    6                           AS width,
    (SELECT project_meeting_title FROM project_meeting WHERE project_meeting_id=$project_meeting_id ) as value,
    TRUE                       as required;

SELECT 
    'project_meeting_status'            as name,
    'Statut'                 as label,
    'select'                 as type,
    TRUE                     as required,
    2                        AS width,
    (SELECT project_meeting_status FROM project_meeting WHERE project_meeting_id=$project_meeting_id ) as value,
    'Choisir un statut dans la liste...'    as empty_option,
    json_group_array(json_object('label',i.choice_label, 'value', i.choice_value))  AS options
    FROM choices_items AS i
    LEFT JOIN (select choice_category_id, choice_category_name from choices_categories)  AS c 
    ON i.choice_category_id = c.choice_category_id
    where choice_category_name="status_publication"
    ORDER BY  i.choice_label ASC;

SELECT 
    'project_meeting_type'     as name,
    'Type'                 as label,
    'select'               as type,
    2                      AS width,
    (SELECT project_meeting_type FROM project_meeting WHERE project_meeting_id=$project_meeting_id ) as value,
    'Choisir un type dans la liste...'    as  empty_option,
    json_group_array(json_object('label',i.choice_label, 'value', i.choice_value))  AS options
    FROM choices_items AS i
    LEFT JOIN (select choice_category_id, choice_category_name from choices_categories)  AS c 
    ON i.choice_category_id = c.choice_category_id
    where choice_category_name="meeting_category"
    ORDER BY  i.choice_label ASC;

SELECT 
    'project_meeting_visio'      as name,
    'Présentiel/Visio '      as label,
    'select'                 as type,
    TRUE                     as required,
    2                        AS width,
    (SELECT project_meeting_visio FROM project_meeting WHERE project_meeting_id=$project_meeting_id ) as value,
    'Choisir  dans la liste...'    as empty_option,
    '[
    {"label": "Présentiel", "value": "no"},
    {"label": "Visio", "value": "yes"}
    ]'  as options;

SELECT
    'project_meeting_visio_url'    as name,
    'text'                     as type,  
    'URL visio (si visio)'                as label,
    (SELECT project_meeting_visio_url FROM project_meeting WHERE project_meeting_id=$project_meeting_id ) as value,
    6                          as width;

SELECT
    'project_meeting_visio_code'   as name,
    'text'               as type,  
    'URL code'           as label,
    (SELECT project_meeting_visio_code FROM project_meeting WHERE project_meeting_id=$project_meeting_id ) as value,
    4                   as width;

select 
    'project_meeting_place_id' as name,
    'lieu (si présentiel)' as label,
    'select' as type,
    12 AS width,
    (SELECT project_meeting_place_id FROM project_meeting WHERE project_meeting_id=$project_meeting_id ) as value,
    TRUE as searchable,
   'Saisissez quelques lettres du titre que vous cherchez ou choississez dans la liste' as empty_option,
    json_group_array(json_object('label',project_meeting_place_name,'value', project_meeting_place_id))  AS options
    FROM project_meeting_places
    ORDER BY  project_meeting_place_name ASC;

SELECT
    'project_meeting_agenda'             as name,
    'textarea'                  as type, 
    (SELECT project_meeting_agenda FROM project_meeting WHERE project_meeting_id=$project_meeting_id ) as value,
    'Ordre du jour'               as label;

