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
    'Projets'            as title,
    '/e_project/project_main_display_3.sql'    as link; 
select 
    'Hub projet'            as title,
    '/e_project/project_hub_display_3.sql?project_id='||$project_id     as link;

SELECT 
    'form' as component,
    'Créer un workpackage' as title,
    'Créer' as validate,
    'Clear' as reset,
    '/e_project_workpackage/workpackage_main_create1_0.sql?project_id='||$project_id as action;

SELECT
    'workpackage_name' as name,
    'text' as type,  
    'Nom' as label,
    12 AS width,
    TRUE as required;
SELECT
    'workpackage_summary' as name,
    'textarea' as type,
    'Présentation du workpackage' as label;

SELECT
    'workpackage_todo' as name,
    'textarea' as type,
    'Travaux à faire...' as description,
    'Travaux à faire' as label;

SELECT 
    'workpackage_mode'                as name,
    'Mode de travaux'                 as label,
    'select'                           as type,
    3                                  as width,
    TRUE                              as required,
    (select workpackage_type  FROM project_workpackage WHERE workpackage_id = $workpackage_id) as value,
    'Choisir un type dans la liste'   AS empty_option,
    json_group_array(json_object('label',i.choice_label, 'value', i.choice_value))  AS options
    FROM choices_items AS i
    LEFT JOIN (select choice_category_id, choice_category_name from choices_categories)  AS c 
    ON i.choice_category_id = c.choice_category_id
    where choice_category_name="work_mode"
    ORDER BY  i.choice_label ASC;




SELECT 
    'workpackage_date_start_scheduled' as name,
    'Date de lancement prévue'       as label,
    'date'                      as type,
    3                            AS width,
        true                        as required,
   (select regex_value from regex where regex_name='date')         as pattern,
   (select regex_description from regex where regex_name='date')   as description;


SELECT 
    'workpackage_duration_scheduled' as name,
    'durée'                     as label,
    'number'                    as type,
    'jours'                     as suffix,
    true                        as required,
    'durée en jours'            as description,
    4                           AS width;
