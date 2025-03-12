SELECT 'dynamic' AS component, sqlpage.run_sql('a_shells/shell_4.sql') AS properties;

select 
    'breadcrumb' as component;
select 
    'Home' as title,
    '/'    as link;
select 
    'Gestion Éditeur'         as title,
     '/a_panels/panel_editor_4.sql' as link;
select 
    'Liste des espaces de travail'            as title,
    '/c_workspaces/workspace_main_display_4.sql' as link;
select 
    'Retour à l''espace de travail'            as title,
    '/c_workspaces/workspace_hub_display_4.sql?workspace_id='||$workspace_id as link;

SELECT 
    'form'                                as component,
    'Créer un événement'                  as title,
    'Créer'                               as validate,
    'Clear'                               as reset,
    '/c_workspaces/workmeeting_create_0.sql?workspace_id='||$workspace_id as action;

SELECT
    'workmeeting_title'               as name,
    'text'                     as type,  
    'Nom'                      as label,
    6                           AS width,
    TRUE                       as required;

SELECT 
    'workmeeting_status'            as name,
    'Statut'                 as label,
    'select'                 as type,
    TRUE                     as required,
    2                        AS width,
    'Choisir un statut dans la liste...'    as empty_option,
    json_group_array(json_object('label',i.choice_label, 'value', i.choice_value))  AS options
    FROM choices_items AS i
    LEFT JOIN (select choice_category_id, choice_category_name from choices_categories)  AS c 
    ON i.choice_category_id = c.choice_category_id
    where choice_category_name="status_publication"
    ORDER BY  i.choice_label ASC;

SELECT 
    'workmeeting_type'            as name,
    'Type'                 as label,
    'select'               as type,
    2                     AS width,
    'Choisir un type dans la liste...'    as  empty_option,
    json_group_array(json_object('label',i.choice_label, 'value', i.choice_value))  AS options
    FROM choices_items AS i
    LEFT JOIN (select choice_category_id, choice_category_name from choices_categories)  AS c 
    ON i.choice_category_id = c.choice_category_id
    where choice_category_name="meeting_category"
    ORDER BY  i.choice_label ASC;

SELECT 
    'workmeeting_visio'            as name,
    'Présentiel/Visio '     as label,
    'select'                 as type,
    TRUE                     as required,
    2                        AS width,
    'Choisir  dans la liste...'    as empty_option,
    '[
    {"label": "Présentiel", "value": "no"},
    {"label": "Visio", "value": "yes"}
    ]'  as options;

SELECT
    'workmeeting_visio_url'          as name,
    'text'                     as type,  
    'URL visio'                as label,
    6                          as width;

SELECT
    'workmeeting_visio_code'   as name,
    'text'               as type,  
    'URL code'           as label,
    4                   as width;

select 
    'space_id' as name,
    'lieu' as label,
    'select' as type,
    12 AS width,
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
    'Ordre du jour'               as label;

SELECT 
    'workmeeting_date'                 as name,
    'Date de l''évenement'       as label,
    'date'                       as type,
    3                            AS width,
    TRUE                        as required,
   (select regex_value from regex where regex_name='date')         as pattern,
   (select regex_description from regex where regex_name='date')          as description;

SELECT
    'workmeeting_hour_start'           as name, 
    'heure début'                as label,
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