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
    '' as validate;
SELECT
    'sprint_id' as name,
    'text' as type,  
    'id ' as label,
    2 AS width,
     (select sprint_id from project_sprints where sprint_id=:sprint_id) as value;
SELECT
    'sprint_name' as name,
    'text' as type,  
    'Nom du sprint précédent' as label,
    10 AS width,
     (select sprint_name from project_sprints where sprint_id=:sprint_id) as value;


SET sprint_parent_id = select sprint_id from project_sprints where sprint_id=:sprint_id;
SET sprint_parent_date_start_scheduled = select DATE(sprint_date_start_scheduled) from project_sprints where sprint_id=:sprint_id;
SET sprint_parent_duration_scheduled = select sprint_duration_scheduled from project_sprints where sprint_id=:sprint_id;
SET sprint_child_date_start_scheduled = DATE($sprint_parent_date_start_scheduled,'+'||$sprint_parent_duration_scheduled||' days');

SELECT 
    'form' as component,
    'Créer un sprint' as title,
    'Créer' as validate,
    'Clear' as reset,
    '/e_project_sprints/sprint_main_create2_0.sql?project_id='||$project_id as action;

SELECT
    'sprint_parent_id' as name,
    'hidden' as type,  
    'Nom' as label,
    $sprint_parent_id as value,
    12 AS width,
    TRUE as required;

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
    'hidden'                      as type,
    true                        as required,
    $sprint_child_date_start_scheduled as value;

SELECT 
    'sprint_duration_scheduled' as name,
    'durée'              as label,
    'number'                      as type,
    'jours'                    as suffix,
    true                        as required,
    'durée en jours'  as description,
    4                          AS width;
