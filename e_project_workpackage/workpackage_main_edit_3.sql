SELECT 'dynamic' AS component, sqlpage.run_sql('a_shells/shell_3.sql') AS properties;

SET project_id = SELECT project_id FROM project_workpackage WHERE workpackage_id = $workpackage_id;

select 
    'breadcrumb' as component;
select 
    'Home' as title,
    '/'    as link;
select 
    'Gestion éditeur'         as title,
    '/a_panels/panel_editor_3.sql' as link;
 select 
    'Projets'            as title,
    '/e_project/project_main_display_3.sql'    as link; 
select 
    'Hub projet'            as title,
    '/e_project/project_hub_display_3.sql?project_id='||$project_id     as link;
select 
    'Hub lot de travaux'            as title,
    '/e_project_workpackage/workpackage_hub_display_3.sql?workpackage_id='||$workpackage_id     as link;

SELECT 
    'form' as component,
    'Actualiser les données d''un lot de travaux' as title,
    'Mettre à jour' as validate,
    'Clear' as reset,
    '/e_project_workpackage/workpackage_main_update_0.sql?workpackage_id='||$workpackage_id as action;

SELECT
    'workpackage_name' as name,
    'text' as type,  
    'Nom' as label,
    12 AS width,
    TRUE as required,
    (select workpackage_name  FROM project_workpackage WHERE workpackage_id = $workpackage_id) as value;

SELECT 
    'workpackage_type'                as name,
    'Type de travaux'                 as label,
    'select'                           as type,
    3                                  as width,
    TRUE                              as required,
    (select workpackage_type  FROM project_workpackage WHERE workpackage_id = $workpackage_id) as value,
    'Choisir un type dans la liste'   AS empty_option,
    json_group_array(json_object('label',i.choice_label, 'value', i.choice_value))  AS options
    FROM choices_items AS i
    LEFT JOIN (select choice_category_id, choice_category_name from choices_categories)  AS c 
    ON i.choice_category_id = c.choice_category_id
    where choice_category_name="workpackage_type"
    ORDER BY  i.choice_label ASC;

SELECT 
    'workpackage_status'            as name,
    'Statut'                 as label,
    'select'                 as type,
    3 as width,
    TRUE                     as required,
    (select workpackage_status  FROM project_workpackage WHERE workpackage_id = $workpackage_id) as value,
    json_group_array(json_object('label',i.choice_label, 'value', i.choice_value))  AS options
    FROM choices_items AS i
    LEFT JOIN (select choice_category_id, choice_category_name from choices_categories)  AS c 
    ON i.choice_category_id = c.choice_category_id
    where choice_category_name="status"
    ORDER BY  i.choice_label ASC;

SELECT 
    'workpackage_mode'                as name,
    'Mode de travaux'                 as label,
    'select'                           as type,
    3                                  as width,
    TRUE                              as required,
    (select workpackage_mode  FROM project_workpackage WHERE workpackage_id = $workpackage_id) as value,
    'Choisir un type dans la liste'   AS empty_option,
    json_group_array(json_object('label',i.choice_label, 'value', i.choice_value))  AS options
    FROM choices_items AS i
    LEFT JOIN (select choice_category_id, choice_category_name from choices_categories)  AS c 
    ON i.choice_category_id = c.choice_category_id
    where choice_category_name="work_mode"
    ORDER BY  i.choice_label ASC;

SELECT
    'workpackage_summary' as name,
    'textarea' as type,  
    'Description' as label,
    (select workpackage_summary  FROM project_workpackage WHERE workpackage_id = $workpackage_id) as value;

SELECT
    'workpackage_todo' as name,
    'textarea' as type,
    'Travaux à faire...' as description,
    (select workpackage_todo  FROM project_workpackage WHERE workpackage_id = $workpackage_id) as value,
    'Travaux à faire' as label;

SELECT 
    'workpackage_date_start_scheduled' as name,
    'date'                      as type,
    'date lancement prévue'     as label,
    true                        as required,
    (select workpackage_date_start_scheduled FROM project_workpackage WHERE workpackage_id = $workpackage_id) as value,
    3                          AS width;

SELECT 
    'workpackage_duration_scheduled' as name,
    'durée prévue'              as label,
    'number'                      as type,
    'jours'                    as suffix,
    (select workpackage_duration_scheduled  FROM project_workpackage WHERE workpackage_id = $workpackage_id) as value,
    true                        as required,
    'durée en jours'  as description,
    3                          AS width;

SELECT 
    'workpackage_date_start_actual' as name,
    'date'                      as type,
    'date lancement réelle'     as label,
    (select workpackage_date_start_actual FROM project_workpackage WHERE workpackage_id = $workpackage_id) as value,
    3                          AS width;

SELECT 
    'workpackage_duration_actual' as name,
    'durée réelle'              as label,
    'number'                      as type,
    'jours'                    as suffix,
    (select workpackage_duration_actual  FROM project_workpackage WHERE workpackage_id = $workpackage_id) as value,
    'durée en jours'  as description,
    3                          AS width;

SELECT 
    'workpackage_cost_estimated' as name,
    'cout estimé'              as label,
    'number'                   as type,
    'euros'                    as suffix,
    (select workpackage_cost_estimated  FROM project_workpackage WHERE workpackage_id = $workpackage_id) as value,
    'cout estimé HT'           as description,
    4                         AS width;

