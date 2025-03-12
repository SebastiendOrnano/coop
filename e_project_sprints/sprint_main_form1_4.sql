SELECT 'dynamic' AS component, sqlpage.run_sql('a_shells/shell_4.sql') AS properties;

select 
    'breadcrumb' as component;
select 
    'Home' as title,
    '/'    as link;
select 
    'Gestion superviseur'         as title,
    '/a_panels/panel_supervisor_4.sql' as link;
 select 
    'Retour au projet'            as title,
    '/e_projects/project_hub_display_4.sql?project_id='||$project_id     as link; 
select 
    'Gestion des sprints'            as title,
    '/e_project_sprints/sprint_main_display_4.sql?project_id='||$project_id     as link;

SELECT 
    'form' as component,
    'Créer un sprint' as title,
    'Créer' as validate,
    'Clear' as reset,
    '/e_project_sprints/sprint_main_create1_0.sql?project_id='||$project_id as action;

SELECT
    'sprint_name' as name,
    'text' as type,  
    'Nom' as label,
    12 AS width,
    TRUE as required;
SELECT
    'sprint_summary' as name,
    'textarea' as type,
    'Présentation du sprint' as label;

SELECT
    'sprint_todo' as name,
    'textarea' as type,
    'Travaux à faire...' as description,
    'Travaux à faire' as label;

SELECT 
    'sprint_date_start_scheduled' as name,
    'Date de lancement prévue'       as label,
    'date'                      as type,
    3                            AS width,
        true                        as required,
   (select regex_value from regex where regex_name='date')         as pattern,
   (select regex_description from regex where regex_name='date')   as description;


SELECT 
    'sprint_duration_scheduled' as name,
    'durée'                     as label,
    'number'                    as type,
    'jours'                     as suffix,
    true                        as required,
    'durée en jours'            as description,
    4                           AS width;
