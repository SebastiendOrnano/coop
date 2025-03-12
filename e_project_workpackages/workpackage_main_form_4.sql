SELECT 'dynamic' AS component, sqlpage.run_sql('a_shells/shell_4.sql') AS properties;

select 
    'breadcrumb' as component;
select 
    'Home' as title,
    '/'    as link;
select 
    'Gestion Superviseur'         as title,
    '/a_panels/panel_supervisor_4.sql' as link;
 select 
    'Retour au projet'            as title,
    '/e_projects/project_main_display_4.sql?project_id='||$project_id     as link;   
select 
    'Gestion des lots de travaux'            as title,
    '/e_project_workpackages/workpackage_main_display_4.sql?project_id='||$project_id     as link;

SELECT 
    'form' as component,
    'Créer un lot de travaux' as title,
    'Créer' as validate,
    'Clear' as reset,
    '/e_project_workpackages/workpackage_main_create_0.sql?project_id='||$project_id as action;

SELECT
    'workpackage_name' as name,
    'text' as type,  
    'Nom' as label,
    12 AS width,
    TRUE as required;
SELECT
    'workpackage_summary' as name,
    'textarea' as type,
    'Présentation du lot de travux' as label;

SELECT
    'workpackage_todo' as name,
    'textarea' as type,
    'Travaux à faire...' as description,
    'Travaux à faire' as label;

SELECT 
    'workpackage_type'                as name,
    'Type de travaux'                 as label,
    'select'                           as type,
    3                                  as width,
    TRUE                              as required,
    'Choisir un type dans la liste'   AS empty_option,
    json_group_array(json_object('label',i.choice_label, 'value', i.choice_value))  AS options
    FROM choices_items AS i
    LEFT JOIN (select choice_category_id, choice_category_name from choices_categories)  AS c 
    ON i.choice_category_id = c.choice_category_id
    where choice_category_name="workpackage_type"
    ORDER BY  i.choice_label ASC;

SELECT 
    'workpackage_cost_estimated' as name,
    'cout estimé'              as label,
    'number'                   as type,
    'euros'                    as suffix,
    'cout estimé HT'           as description,
    6                         AS width;
