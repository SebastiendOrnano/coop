SELECT 'dynamic' AS component, sqlpage.run_sql('a_shells/shell_4.sql') AS properties;

SET user_id = (
    SELECT users.user_id AS userID FROM users
    INNER JOIN sessions ON userID = sessions.user_id
    WHERE sessions.session_token = sqlpage.cookie('session_token')
); 

SET workspace_id=(SELECT workspace_id FROM workmeetings WHERE workmeeting_id=$workmeeting_id);

select
    'breadcrumb' as component;
select 
    'Home' as title,
    '/'    as link;
select 
    'Gestion éditeur'         as title,
    '/a_panels/panel_editor_3.sql' as link;
select 
    '/c_workspaces/workspace_main_display_3.sql'             as link,
    'Retour espaces de travail'           as title;
select 
    '/c_workspaces/workspace_hub_display_3.sql?workspace_id='||$workspace_id  as link,
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
   'Actualiser la réunion'  AS validate,
    '/c_workspaces/workmeeting_update_0.sql?workmeeting_id='||$workmeeting_id as action;

SELECT 
    'workmeeting_date'                 as name,
    'Date de l''évenement'       as label,
    'date'                       as type,
    3                            AS width,
    (SELECT workmeeting_date FROM workmeetings WHERE workmeeting_id=$workmeeting_id ) as value,
    TRUE                        as required,
    '^[0-9]{4}-(((0[13578]|(10|12))-(0[1-9]|[1-2][0-9]|3[0-1]))|(02-(0[1-9]|[1-2][0-9]))|((0[469]|11)-(0[1-9]|[1-2][0-9]|30)))$' as pattern;

SELECT
    'workmeeting_hour_start'           as name,
    'heure début'                as label,
    (SELECT workmeeting_hour_start FROM workmeetings WHERE workmeeting_id=$workmeeting_id ) as value,
    'select'                    as type, 
    2                        as width,
    (SELECT project_meeting_hour_start FROM project_meetings WHERE project_meeting_id=$project_meeting_id ) as value,
    'Choisir une heure dans la liste...'    as empty_option,
    json_group_array(json_object('label',i.choice_label, 'value', i.choice_value))  AS options
    FROM choices_items AS i
    LEFT JOIN (select choice_category_id, choice_category_name from choices_categories)  AS c 
    ON i.choice_category_id = c.choice_category_id
    where choice_category_name="list_hours"
    ORDER BY  i.choice_label ASC;

SELECT
    'workmeeting_hour_end'          as name,
    'heure fin'             as label,
    (SELECT workmeeting_hour_end FROM workmeetings WHERE workmeeting_id=$workmeeting_id ) as value,
    'select'                    as type, 
    2                        as width,
    (SELECT project_meeting_hour_start FROM project_meetings WHERE project_meeting_id=$project_meeting_id ) as value,
    'Choisir une heure dans la liste...'    as empty_option,
    json_group_array(json_object('label',i.choice_label, 'value', i.choice_value))  AS options
    FROM choices_items AS i
    LEFT JOIN (select choice_category_id, choice_category_name from choices_categories)  AS c 
    ON i.choice_category_id = c.choice_category_id
    where choice_category_name="list_hours"
    ORDER BY  i.choice_label ASC;

SELECT
    'workmeeting_duration'          as name,
    'durée'                   as label,
    (SELECT workmeeting_duration FROM workmeetings WHERE workmeeting_id=$workmeeting_id ) as value,
    'select'                    as type, 
    2                        as width,
    (SELECT project_meeting_hour_start FROM project_meetings WHERE project_meeting_id=$project_meeting_id ) as value,
    'Choisir une heure dans la liste...'    as empty_option,
    json_group_array(json_object('label',i.choice_label, 'value', i.choice_value))  AS options
    FROM choices_items AS i
    LEFT JOIN (select choice_category_id, choice_category_name from choices_categories)  AS c 
    ON i.choice_category_id = c.choice_category_id
    where choice_category_name="list_hours"
    ORDER BY  i.choice_label ASC;

SELECT 
    'workmeeting_alert'      as name,
    'Alerte'                  as label,
    'select'                 as type,
    2                        AS width,
    (SELECT workmeeting_alert FROM workmeetings WHERE workmeeting_id=$workmeeting_id ) as value,
    'Choisir un statut dans la liste...'    as empty_option,
    json_group_array(json_object('label',i.choice_label, 'value', i.choice_value))  AS options
    FROM choices_items AS i
    LEFT JOIN (select choice_category_id, choice_category_name from choices_categories)  AS c 
    ON i.choice_category_id = c.choice_category_id
    where choice_category_name="workmeeting_alert"
    ORDER BY  i.choice_label ASC;

SELECT
    'workmeeting_title'               as name,
    'text'                     as type,  
    'Nom'                      as label,
    6                           AS width,
    (SELECT workmeeting_title FROM workmeetings WHERE workmeeting_id=$workmeeting_id ) as value,
    TRUE                       as required;

SELECT 
    'workmeeting_status'            as name,
    'Statut'                 as label,
    'select'                 as type,
    TRUE                     as required,
    2                        AS width,
    (SELECT workmeeting_status FROM workmeetings WHERE workmeeting_id=$workmeeting_id ) as value,
    'Choisir un statut dans la liste...'    as empty_option,
    json_group_array(json_object('label',i.choice_label, 'value', i.choice_value))  AS options
    FROM choices_items AS i
    LEFT JOIN (select choice_category_id, choice_category_name from choices_categories)  AS c 
    ON i.choice_category_id = c.choice_category_id
    where choice_category_name="status_publication"
    ORDER BY  i.choice_label ASC;

SELECT 
    'workmeeting_type'     as name,
    'Type'                 as label,
    'select'               as type,
    2                      AS width,
    (SELECT workmeeting_type FROM workmeetings WHERE workmeeting_id=$workmeeting_id ) as value,
    'Choisir un type dans la liste...'    as  empty_option,
    json_group_array(json_object('label',i.choice_label, 'value', i.choice_value))  AS options
    FROM choices_items AS i
    LEFT JOIN (select choice_category_id, choice_category_name from choices_categories)  AS c 
    ON i.choice_category_id = c.choice_category_id
    where choice_category_name="meeting_category"
    ORDER BY  i.choice_label ASC;

SELECT 
    'workmeeting_visio'      as name,
    'Présentiel/Visio '      as label,
    'select'                 as type,
    TRUE                     as required,
    2                        AS width,
    (SELECT workmeeting_visio FROM workmeetings WHERE workmeeting_id=$workmeeting_id ) as value,
    'Choisir  dans la liste...'    as empty_option,
    '[
    {"label": "Présentiel", "value": "no"},
    {"label": "Visio", "value": "yes"}
    ]'  as options;

SELECT
    'workmeeting_visio_url'    as name,
    'text'                     as type,  
    'URL visio (si visio)'                as label,
    (SELECT workmeeting_visio_url FROM workmeetings WHERE workmeeting_id=$workmeeting_id ) as value,
    6                          as width;

SELECT
    'workmeeting_visio_code'   as name,
    'text'               as type,  
    'URL code'           as label,
    (SELECT workmeeting_visio_code FROM workmeetings WHERE workmeeting_id=$workmeeting_id ) as value,
    4                   as width;

select 
    'space_id' as name,
    'lieu (si présentiel)' as label,
    'select' as type,
    12 AS width,
    (SELECT space_id FROM workmeetings WHERE workmeeting_id=$workmeeting_id ) as value,
    TRUE as searchable,
   'Saisissez quelques lettres du titre que vous cherchez ou choississez dans la liste' as empty_option,
    json_group_array(json_object('label',
    CASE
    WHEN p.place_name=s.space_name then  p.place_name
    ELSE 'Lieu : '||p.place_name||'  -- Salle : '||s.space_name
    END, 
    'value', s.space_id))  AS options
    FROM place_spaces AS s
    LEFT JOIN place AS p 
    ON p.place_id = s.place_id
    ORDER BY  p.place_name ASC;

SELECT
    'workmeeting_agenda'             as name,
    'textarea'                  as type, 
    (SELECT workmeeting_agenda FROM workmeetings WHERE workmeeting_id=$workmeeting_id ) as value,
    'Ordre du jour'               as label;
