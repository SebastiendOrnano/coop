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
    'Choisir le sprint parent' as title,
    'Créer' as validate,
    'Clear' as reset,
    '/e_project_sprints/sprint_main_form3_4.sql?project_id='||$project_id as action;

select 
   'sprint_id' as name,
    'Choisir le sprint parent' as label,
    'select' as type,
    8 AS width,
    TRUE as searchable,
    'Choississez dans la liste' as empty_option,
    json_group_array(json_object('label',sprint_name, 'value', sprint_id)) AS options
    FROM (
    SELECT sprint_name, sprint_id
    FROM project_sprints where project_id=$project_id
    ORDER BY sprint_id ASC
    );
