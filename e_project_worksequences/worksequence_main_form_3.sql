SELECT 'dynamic' AS component, sqlpage.run_sql('a_shells/shell_3.sql') AS properties;

SET project_id = select project_id from project_workpackages where workpackage_id=$workpackage_id;

select 
    'breadcrumb' as component;
select 
    'Home' as title,
    '/'    as link;
select 
    'Gestion éditeur'         as title,
    '/a_panels/panel_editor_3.sql' as link;
 select 
    'Retour au workpackage'            as title,
    '/e_project_workpackages/workpackage_main_display_3.sql?workpackage_id='||$workpackage_id||'&project_id='||$project_id   as link;   
select 
    'Gestion des séquences'            as title,
    '/e_project_worksequences/worksequence_main_display_3.sql?workpackage_id='||$workpackage_id     as link;

SELECT 
    'form' as component,
    'Créer un séquence' as title,
    'Créer' as validate,
    'Clear' as reset,
    '/e_project_worksequences/worksequence_main_create_0.sql?workpackage_id='||$workpackage_id as action;

SELECT
    'worksequence_name' as name,
    'text' as type,  
    'Nom' as label,
    8 AS width,
    TRUE as required;

SELECT 
    'worksequence_type'            as name,
    'Type de sequence'                 as label,
    'select'                 as type,
    4 as width,
    'Choisir un type dans la liste...' as  empty_option,
    json_group_array(json_object('label',i.choice_label, 'value', i.choice_value))  AS options
    FROM choices_items AS i
    LEFT JOIN (select choice_category_id, choice_category_name from choices_categories)  AS c 
    ON i.choice_category_id = c.choice_category_id
    where choice_category_name="worksequence_type"
    ORDER BY  i.choice_label ASC;

SELECT
    'worksequence_summary' as name,
    'textarea' as type,
    'Présentation du séquence' as label;

SELECT
    'worksequence_todo' as name,
    'textarea' as type,
    'Travaux à faire...' as description,
    'Travaux à faire' as label;

select 
    'room_id' as name,
    'lieu' as label,
    'select' as type,
    12 AS width,
    TRUE as searchable,
   'Saisissez quelques lettres du titre que vous cherchez ou choississez dans la liste' as empty_option,
    json_group_array(json_object('label',b.building_name||' -- '||r.room_name||' -- '||r.room_type , 'value', r.room_id))  AS options
    FROM project_building_rooms AS r
    LEFT JOIN (select building_id, building_name, project_id from project_buildings)  AS b 
    ON r.building_id = b.building_id
    where b.project_id=$project_id
    ORDER BY b.building_id ASC;

SELECT 
    'worksequence_start_date_scheduled' as name,
    'Date de lancement prévue'          as label,
    'date'                              as type,
    3                                   AS width,
    TRUE                                as required,
   (select regex_value from regex where regex_name='date')                as pattern,
   (select regex_description from regex where regex_name='date')          as description;

SELECT 
    'worksequence_start_hour_scheduled' as name,
    'Heure de début de la séquence'       as label,
    'select'                      as type,
    3                            AS width,
    'Choisir une heure dans la liste...'    as empty_option,
    json_group_array(json_object('label',i.choice_label, 'value', i.choice_value))  AS options
    FROM choices_items AS i
    LEFT JOIN (select choice_category_id, choice_category_name from choices_categories)  AS c 
    ON i.choice_category_id = c.choice_category_id
    where choice_category_name="list_hours"
    ORDER BY  i.choice_label ASC;

SELECT 
    'worksequence_end_hour_scheduled' as name,
    'Heure de fin de la séquence'       as label,
    'select'                      as type,
    3                            AS width,
    'Choisir une heure dans la liste...'    as empty_option,
    json_group_array(json_object('label',i.choice_label, 'value', i.choice_value))  AS options
    FROM choices_items AS i
    LEFT JOIN (select choice_category_id, choice_category_name from choices_categories)  AS c 
    ON i.choice_category_id = c.choice_category_id
    where choice_category_name="list_hours"
    ORDER BY  i.choice_label ASC;

SELECT 
    'worksequence_duration_scheduled' as name,
    'durée'              as label,
    'select'                      as type,
    'heures'                    as suffix,
    'durée en heures'  as description,
    3                          AS width,
    'Choisir une heure dans la liste...'    as empty_option,
    json_group_array(json_object('label',i.choice_label, 'value', i.choice_value))  AS options
    FROM choices_items AS i
    LEFT JOIN (select choice_category_id, choice_category_name from choices_categories)  AS c 
    ON i.choice_category_id = c.choice_category_id
    where choice_category_name="list_hours"
    ORDER BY  i.choice_label ASC;
