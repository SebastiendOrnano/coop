SELECT 'dynamic' AS component, sqlpage.run_sql('a_shells/shell_3.sql') AS properties;

SET project_id = SELECT project_id FROM project_workpackages WHERE workpackage_id = $workpackage_id;

select 
    'breadcrumb' as component;
select 
    'Home' as title,
    '/'    as link;
select 
    'Gestion Séditeur'         as title,
    '/a_panels/panel_editor_3.sql' as link;
 select 
    'Retour au projet'            as title,
    '/e_projects/project_main_display_3.sql?project_id='||$project_id     as link;   
select 
    'Gestion des lots de travaux'            as title,
    '/e_project_workpackages/workpackage_main_display_3.sql?project_id='||$project_id     as link;

SELECT 
    'form' as component,
    'Actualiser les données d''un lot de travaux' as title,
    'Mettre à jour' as validate,
    'Clear' as reset,
    '/e_project_workpackages/workpackage_main_update_0.sql?workpackage_id='||$workpackage_id as action;

SELECT
    'workpackage_name' as name,
    'text' as type,  
    'Nom' as label,
    6 AS width,
    TRUE as required,
    (select workpackage_name  FROM project_workpackages WHERE workpackage_id = $workpackage_id) as value;

SELECT 
    'workpackage_type'                as name,
    'Type de travaux'                 as label,
    'select'                           as type,
    3                                  as width,
    TRUE                              as required,
    (select workpackage_type  FROM project_workpackages WHERE workpackage_id = $workpackage_id) as value,
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
    (select workpackage_status  FROM project_workpackages WHERE workpackage_id = $workpackage_id) as value,
    json_group_array(json_object('label',i.choice_label, 'value', i.choice_value))  AS options
    FROM choices_items AS i
    LEFT JOIN (select choice_category_id, choice_category_name from choices_categories)  AS c 
    ON i.choice_category_id = c.choice_category_id
    where choice_category_name="status"
    ORDER BY  i.choice_label ASC;

SELECT
    'workpackage_summary' as name,
    'textarea' as type,  
    'Description' as label,
    (select workpackage_summary  FROM project_workpackages WHERE workpackage_id = $workpackage_id) as value;

SELECT
    'workpackage_todo' as name,
    'textarea' as type,
    'Travaux à faire...' as description,
    (select workpackage_todo  FROM project_workpackages WHERE workpackage_id = $workpackage_id) as value,
    'Travaux à faire' as label;

SELECT 
    'workpackage_cost_estimated' as name,
    'cout estimé'              as label,
    'number'                   as type,
    'euros'                    as suffix,
    (select workpackage_cost_estimated  FROM project_workpackages WHERE workpackage_id = $workpackage_id) as value,
    'cout estimé HT'           as description,
    4                         AS width;

SELECT 
    'workpackage_cost_actual' as name,
    'cout estimé'              as label,
    'number'                   as type,
    'euros'                    as suffix,
    (select workpackage_cost_actual  FROM project_workpackages WHERE workpackage_id = $workpackage_id) as value,
    'cout estimé HT'           as description,
    4                         AS width;
