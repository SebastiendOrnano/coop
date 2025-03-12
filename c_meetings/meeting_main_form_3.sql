SELECT 'dynamic' AS component, sqlpage.run_sql('a_shells/shell_3.sql') AS properties;

select 
    'breadcrumb' as component;
select 
    'Home' as title,
    '/'    as link;
select 
    'Gestion éditeur'         as title,
    '/a_panels/panel_editor_3.sql' as link;
select 
    'gestion des événements'            as title,
    '/c_meetings/meeting_main_display_3.sql'     as link;

SELECT 
    'form'                                as component,
    'Créer un événement'                  as title,
    'Créer'                               as validate,
    'Clear'                               as reset,
    '/c_meetings/meeting_main_create_0.sql'   as action;

SELECT
    'event_name'               as name,
    'text'                     as type,  
    'Nom'                      as label,
    6                           AS width,
    TRUE                       as required;

SELECT 
    'event_public_private'   as name,
    'Public/privé '          as label,
    'hidden'                 as type,
   'private'                 as value;

SELECT 
    'event_status'            as name,
    'Statut'                 as label,
    'select'                 as type,
    TRUE                     as required,
    2                        AS width,
    'Choisir un statut dans la liste...'    as empty_option,
    json_group_array(json_object('label',i.choice_label, 'value', i.choice_value))  AS options
    FROM choices_items AS i
    LEFT JOIN (select choice_category_id, choice_category_name from choices_categories)  AS c 
    ON i.choice_category_id = c.choice_category_id
    where choice_category_name="status"
    ORDER BY  i.choice_label ASC;

SELECT 
    'event_type'            as name,
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
    'event_visio'            as name,
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
    'event_visio_url'          as name,
    'text'                     as type,  
    'URL visio'                as label,
    6                          as width;

SELECT
    'event_visio_code'   as name,
    'text'               as type,  
    'URL code'           as label,
    4                   as width;

select 
    'space_id' as name,
    'lieu' as label,
    'select' as type,
    TRUE as required,
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
    'event_summary'             as name,
    'textarea'                  as type,  
    'Description'               as label;

SELECT
    'file'                       as type, 
    'event_program_url'          as name,
    'Programme'                   as label,
    'format : pdf, jpeg',
    'image/*'                    as accept;

SELECT 
    'event_date'                 as name,
    'Date de l''évenement'       as label,
    'date'                       as type,
    3                            AS width,
    TRUE                        as required,
 (select regex_value from regex where regex_name='date')         as pattern,
   (select regex_description from regex where regex_name='date')          as description;

SELECT
    'event_start_hour'           as name,
    'heure début'                as label,
    'select'                       as type,  
    2                            as width,
    'Choisir une heure dans la liste...'    as empty_option,
    json_group_array(json_object('label',i.choice_label, 'value', i.choice_value))  AS options
    FROM choices_items AS i
    LEFT JOIN (select choice_category_id, choice_category_name from choices_categories)  AS c 
    ON i.choice_category_id = c.choice_category_id
    where choice_category_name="list_hours"
    ORDER BY  i.choice_label ASC;

SELECT
    'event_end_hour'          as name,
    'heure fin'             as label,
    'select'                       as type,  
    2                            as width,
    'Choisir une heure dans la liste...'    as empty_option,
    json_group_array(json_object('label',i.choice_label, 'value', i.choice_value))  AS options
    FROM choices_items AS i
    LEFT JOIN (select choice_category_id, choice_category_name from choices_categories)  AS c 
    ON i.choice_category_id = c.choice_category_id
    where choice_category_name="list_hours"
    ORDER BY  i.choice_label ASC;

SELECT
    'event_duration'          as name,
    'durée'                   as label,
    'select'                       as type,  
    2                            as width,
    'Choisir une heure dans la liste...'    as empty_option,
    json_group_array(json_object('label',i.choice_label, 'value', i.choice_value))  AS options
    FROM choices_items AS i
    LEFT JOIN (select choice_category_id, choice_category_name from choices_categories)  AS c 
    ON i.choice_category_id = c.choice_category_id
    where choice_category_name="list_hours"
    ORDER BY  i.choice_label ASC;

SELECT
    'event_audience_target' as name,
    'text'                  as type,  
    'Public cible'         as label,
    6                      as width;

SELECT
    'event_participants_nb_max' as name,
    'number'                    as type,  
    'Nb max'                    as label,
    'participants'               as suffix,
    3 as width;

SELECT 
    'event_registration'     as name,
    'Inscription'            as label,
    'select'                 as type,
    3                        AS width,
    TRUE                     as required,
    'par défaut : entrée libre'             as description,

    'Choisir un statut dans la liste...'    as empty_option,
    '[
    {"label": "Inscription obligatoire", "value": "yes"},
    {"label": "Entrée libre", "value": "no"}
    ]'  as options;


















