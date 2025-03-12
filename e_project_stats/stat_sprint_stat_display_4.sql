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
    'Retour à la liste des projets'            as title,
    '/e_projects/project_main_display_4.sql'     as link;
 select 
    'Retour au hub du projet'            as title,
    '/e_projects/project_hub_display_4.sql?project_id='||$project_id     as link; 
 select 
    'Gestion des sprints'            as title,
    '/e_project_sprints/sprint_main_display_4.sql?project_id='||$project_id     as link;  


select 
    'datagrid'              as component,
    'panel_project_display' as id,
    'Gestion des phases du projets' as title;


select 
    'divider' as component,
    'Nom du projet de rattachement'    as contents,
    'blue' as color;

select 
    'form'   as component,
    '' as validate;

SELECT
    'project_id' as name,
    TRUE as readonly,
    'Id ' as label,
    1 as width,
   $project_id as value;

SELECT
    'project_name' as name,
    TRUE as readonly,
    'Nom du projet de rattachement' as label,
    11 as width,
    (select project_name  from projects WHERE project_id = $project_id) as value;

SET date_start_mini = SELECT MIN(sprint_date_start_scheduled) from project_sprints where project_id=$project_id;
SET date_start_max = SELECT MAX(sprint_date_end_actual) from project_sprints where project_id=$project_id;



select 
    'chart'             as component,
    'bar'               as type,
    'green'             as color,
    'Statistiques d''avancement des phases du projet' as title,
    TRUE                as horizontal,
    TRUE                as labels;
select 
    sprint_name as label,
    sprint_completion_percentage   as value
FROM project_sprints where project_id=$project_id;






