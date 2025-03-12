SELECT 'dynamic' AS component, sqlpage.run_sql('a_shells/shell_4.sql') AS properties;

SET workpackage_id = SELECT workpackage_id FROM project_worksequences WHERE worksequence_id = $worksequence_id;
SET project_id = select project_id from project_workpackages where workpackage_id=$workpackage_id;

select 
    'breadcrumb' as component;
select 
    'Home' as title,
    '/'    as link;
select 
    'Gestion Superviseur'         as title,
    '/a_panels/panel_supervisor_4.sql' as link;
select 
    'Hub project'            as title,
    '/e_projects/project_hub_display_4.sql?project_id='||$project_id     as link;
select 
    'Lots de travaux'            as title,
    '/e_project_workpackages/workpackage_main_display_4.sql?project_id='||$project_id     as link;   
select 
    'Gestion des séquences'            as title,
    '/e_project_worksequences/worksequence_main_display_4.sql?workpackage_id='||$workpackage_id     as link;

SELECT 
    'form' as component,
    'Actualiser les données d''une séquence' as title,
    'Mettre à jour' as validate,
    'Clear' as reset,
    '/e_project_worksequences/worksequence_main_update_0.sql?worksequence_id='||$worksequence_id as action;

SELECT
    'worksequence_name' as name,
    'text' as type,  
    'Nom' as label,
    6 AS width,
    TRUE as required,
    (select worksequence_name  FROM project_worksequences WHERE worksequence_id = $worksequence_id) as value;

SELECT 
    'worksequence_status'            as name,
    'Statut'                 as label,
    'select'                 as type,
    3 as width,
    TRUE                     as required,
    (select worksequence_status  FROM project_worksequences WHERE worksequence_id = $worksequence_id) as value,
    'Choisir un stype dans la liste...' as  empty_option,
    json_group_array(json_object('label',i.choice_label, 'value', i.choice_value))  AS options
    FROM choices_items AS i
    LEFT JOIN (select choice_category_id, choice_category_name from choices_categories)  AS c 
    ON i.choice_category_id = c.choice_category_id
    where choice_category_name="status"
    ORDER BY  i.choice_label ASC;

SELECT 
    'worksequence_type'            as name,
    'Statut'                 as label,
    'select'                 as type,
    3 as width,
    (select worksequence_type  FROM project_worksequences WHERE worksequence_id = $worksequence_id) as value,
    'Choisir un stype dans la liste...' as  empty_option,
    json_group_array(json_object('label',i.choice_label, 'value', i.choice_value))  AS options
    FROM choices_items AS i
    LEFT JOIN (select choice_category_id, choice_category_name from choices_categories)  AS c 
    ON i.choice_category_id = c.choice_category_id
    where choice_category_name="worksequence_type"
    ORDER BY  i.choice_label ASC;


SELECT
    'worksequence_summary' as name,
    'textarea' as type,  
    'Description' as label,
    (select worksequence_summary  FROM project_worksequences WHERE worksequence_id = $worksequence_id) as value;

SELECT
    'worksequence_todo' as name,
    'textarea' as type,
    'Travaux à faire...' as description,
    (select worksequence_todo  FROM project_worksequences WHERE worksequence_id = $worksequence_id) as value,
    'Travaux à faire' as label;

select 
    'room_id' as name,
    'lieu' as label,
    'select' as type,
    12 AS width,
    TRUE as searchable,
    (select room_id FROM project_worksequences WHERE worksequence_id = $worksequence_id) as value,
   'Saisissez quelques lettres du titre que vous cherchez ou choississez dans la liste' as empty_option,
    json_group_array(json_object('label',b.building_name||' -- '||r.room_name||' -- '||r.room_type , 'value', r.room_id))  AS options
    FROM project_building_rooms AS r
    LEFT JOIN (select building_id, building_name, project_id from project_buildings)  AS b 
    ON r.building_id = b.building_id
    where b.project_id=$project_id
    ORDER BY b.building_id ASC;


SELECT 
    'worksequence_start_date_scheduled' as name,
    'Date de lancement prévue'       as label,
    'date'                      as type,
    6                           AS width,
    (select worksequence_start_date_scheduled  FROM project_worksequences WHERE worksequence_id = $worksequence_id) as value,
   (select regex_value from regex where regex_name='date')         as pattern,
   (select regex_description from regex where regex_name='date')   as description;

SELECT 
    'worksequence_start_date_actual' as name,
    'Date de lancement réelle'       as label,
    'date'                      as type,
    6                           AS width,
    (select worksequence_start_date_actual  FROM project_worksequences WHERE worksequence_id = $worksequence_id) as value,
   (select regex_value from regex where regex_name='date')         as pattern,
   (select regex_description from regex where regex_name='date')   as description;

SELECT 
    'worksequence_start_hour_scheduled' as name,
    'Heure de lancement prévue'       as label,
    'select'                      as type,
    6                           AS width,
    (select worksequence_start_hour_scheduled  FROM project_worksequences WHERE worksequence_id = $worksequence_id) as value,
    'Choisir une heure dans la liste...'    as empty_option,
    json_group_array(json_object('label',i.choice_label, 'value', i.choice_value))  AS options
    FROM choices_items AS i
    LEFT JOIN (select choice_category_id, choice_category_name from choices_categories)  AS c 
    ON i.choice_category_id = c.choice_category_id
    where choice_category_name="list_hours"
    ORDER BY  i.choice_label ASC;

SELECT 
    'worksequence_start_hour_actual' as name,
    'Heure de lancement réelle'       as label,
    'select'                      as type,
    6                           AS width,
    (select worksequence_start_hour_actual  FROM project_worksequences WHERE worksequence_id = $worksequence_id) as value,
    'Choisir une heure dans la liste...'    as empty_option,
    json_group_array(json_object('label',i.choice_label, 'value', i.choice_value))  AS options
    FROM choices_items AS i
    LEFT JOIN (select choice_category_id, choice_category_name from choices_categories)  AS c 
    ON i.choice_category_id = c.choice_category_id
    where choice_category_name="list_hours"
    ORDER BY  i.choice_label ASC;
 
SELECT 
    'worksequence_end_hour_scheduled' as name,
    'heure de fin prévue'       as label,
    'select'                      as type,
    6                            AS width,
    (select worksequence_end_hour_scheduled FROM project_worksequences WHERE worksequence_id = $worksequence_id) as value,
    'Choisir une heure dans la liste...'    as empty_option,
    json_group_array(json_object('label',i.choice_label, 'value', i.choice_value))  AS options
    FROM choices_items AS i
    LEFT JOIN (select choice_category_id, choice_category_name from choices_categories)  AS c 
    ON i.choice_category_id = c.choice_category_id
    where choice_category_name="list_hours"
    ORDER BY  i.choice_label ASC;
SELECT 
    'worksequence_end_hour_actual' as name,
    'Heure de fin réelle'       as label,
    'select'                      as type,
    6                          AS width,
    (select worksequence_end_hour_actual  FROM project_worksequences WHERE worksequence_id = $worksequence_id) as value,
    'Choisir une heure dans la liste...'    as empty_option,
    json_group_array(json_object('label',i.choice_label, 'value', i.choice_value))  AS options
    FROM choices_items AS i
    LEFT JOIN (select choice_category_id, choice_category_name from choices_categories)  AS c 
    ON i.choice_category_id = c.choice_category_id
    where choice_category_name="list_hours"
    ORDER BY  i.choice_label ASC;

SELECT 
    'worksequence_duration_scheduled' as name,
    'durée prévue'              as label,
    'select'                      as type,
    (select worksequence_duration_scheduled  FROM project_worksequences WHERE worksequence_id = $worksequence_id) as value,
    'heures'                    as suffix,
        6                         AS width,
    'Choisir une heure dans la liste...'    as empty_option,
    json_group_array(json_object('label',i.choice_label, 'value', i.choice_value))  AS options
    FROM choices_items AS i
    LEFT JOIN (select choice_category_id, choice_category_name from choices_categories)  AS c 
    ON i.choice_category_id = c.choice_category_id
    where choice_category_name="list_hours"
    ORDER BY  i.choice_label ASC;

SELECT 
    'worksequence_duration_actual' as name,
    'durée réelle'              as label,
    'select'                      as type,
    (select worksequence_duration_scheduled  FROM project_worksequences WHERE worksequence_id = $worksequence_id) as value,
    'heures'                    as suffix,
    'durée en heures'  as description,
    6                         AS width,
        'Choisir une heure dans la liste...'    as empty_option,
    json_group_array(json_object('label',i.choice_label, 'value', i.choice_value))  AS options
    FROM choices_items AS i
    LEFT JOIN (select choice_category_id, choice_category_name from choices_categories)  AS c 
    ON i.choice_category_id = c.choice_category_id
    where choice_category_name="list_hours"
    ORDER BY  i.choice_label ASC;

SELECT 
    'worksequence_completion_percentage'           as name,
    'Pourcentage d''achèvement'              as label,
    (select worksequence_completion_percentage  FROM project_worksequences WHERE worksequence_id = $worksequence_id) as value,   
    'number'                                 as type,
    '%'                                      as suffix,
    4                          AS width;
