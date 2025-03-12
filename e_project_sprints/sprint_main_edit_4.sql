SELECT 'dynamic' AS component, sqlpage.run_sql('a_shells/shell_4.sql') AS properties;

SET project_id = SELECT project_id FROM project_sprints WHERE sprint_id = $sprint_id;

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
    'Gestion des sprints'            as title,
    '/e_project_sprints/sprint_main_display_4.sql?project_id='||$project_id     as link;

SELECT 
    'form' as component,
    'Actualiser les données d''un sprint' as title,
    'Mettre à jour' as validate,
    'Clear' as reset,
    '/e_project_sprints/sprint_main_update_0.sql?sprint_id='||$sprint_id as action;

SELECT
    'sprint_name' as name,
    'text' as type,  
    'Nom' as label,
    6 AS width,
    TRUE as required,
    (select sprint_name  FROM project_sprints WHERE sprint_id = $sprint_id) as value;

SELECT 
    'sprint_status'            as name,
    'Statut'                 as label,
    'select'                 as type,
    3 as width,
    TRUE                     as required,
    (select sprint_status  FROM project_sprints WHERE sprint_id = $sprint_id) as value,
    json_group_array(json_object('label',i.choice_label, 'value', i.choice_value))  AS options
    FROM choices_items AS i
    LEFT JOIN (select choice_category_id, choice_category_name from choices_categories)  AS c 
    ON i.choice_category_id = c.choice_category_id
    where choice_category_name="status"
    ORDER BY  i.choice_label ASC;

SELECT
    'sprint_summary' as name,
    'textarea' as type,  
    'Description' as label,
    (select sprint_summary  FROM project_sprints WHERE sprint_id = $sprint_id) as value;

SELECT
    'sprint_todo' as name,
    'textarea' as type,
    'Travaux à faire...' as description,
    (select sprint_todo  FROM project_sprints WHERE sprint_id = $sprint_id) as value,
    'Travaux à faire' as label;

SELECT 
    'sprint_date_start_scheduled' as name,
    'Date de lancement prévue'       as label,
    'date'                      as type,
    6                           AS width,
    (select sprint_date_start_scheduled  FROM project_sprints WHERE sprint_id = $sprint_id) as value,
   (select regex_value from regex where regex_name='date')         as pattern,
   (select regex_description from regex where regex_name='date')   as description;

SELECT 
    'sprint_date_start_actual'        as name,
    'Date de lancement réelle'        as label,
    'date'                            as type,
    6                                 AS width,
    (select sprint_date_start_actual  FROM project_sprints WHERE sprint_id = $sprint_id) as value,
   (select regex_value from regex where regex_name='date')         as pattern,
   (select regex_description from regex where regex_name='date')   as description;
/*
SELECT 
    'sprint_date_end_scheduled'  as name,
    'Date de fin prévue'         as label,
    'date'                       as type,
    6                            AS width,
    (select sprint_date_end_scheduled  FROM project_sprints WHERE sprint_id = $sprint_id) as value,
   (select regex_value from regex where regex_name='date')         as pattern,
   (select regex_description from regex where regex_name='date')   as description;


SELECT 
    'sprint_date_end_actual' as name,
    'Date de fin réelle'       as label,
    'date'                      as type,
    6                          AS width,
    (select sprint_date_end_actual  FROM project_sprints WHERE sprint_id = $sprint_id) as value,
   (select regex_value from regex where regex_name='date')         as pattern,
   (select regex_description from regex where regex_name='date')   as description;
*/

SELECT 
    'sprint_duration_scheduled' as name,
    'durée prévue (en jours)'              as label,
    'number'                      as type,
    (select sprint_duration_scheduled  FROM project_sprints WHERE sprint_id = $sprint_id) as value,
    'jours'                    as suffix,
    6                        AS width;

SELECT 
    'sprint_duration_actual'        as name,
    'durée réelle (e jours)'        as label,
    'number'                        as type,
    (select sprint_duration_scheduled  FROM project_sprints WHERE sprint_id = $sprint_id) as value,
    'jours'                        as suffix,
    6                              AS width;

SELECT 
    'sprint_completion_percentage'           as name,
    'Pourcentage achèvement'                 as label,
    'number'                                 as type,
    (select sprint_completion_percentage  FROM project_sprints WHERE sprint_id = $sprint_id) as value,
    '%'                                      as suffix,
    4                                        AS width;
