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
    'chart'            as component,
    'Project Sprints Timeline' as title,
    'rangeBar'         as type,
    TRUE               as time,
    'green'             as color,
    'blue'             as color,
    TRUE               as labels,
    $date_start_mini   as xmin,
    $date_start_max    as xmax;

select 
    s.sprint_name                         as series,
    s.sprint_name ||'    Planififié'      as label,
    s.sprint_date_start_scheduled         as value,
    s.sprint_date_end_scheduled           as value
FROM project_sprints as s
LEFT JOIN (select project_id from projects) as p on p.project_id=s.project_id
WHERE s.project_id=$project_id AND s.sprint_date_start_scheduled !='' AND s.sprint_date_start_scheduled IS NOT NULL
ORDER BY s.sprint_date_start_scheduled ;


select 
    s.sprint_name                   as series,
    s.sprint_name ||'    Réel'      as label,
    s.sprint_date_start_actual      as value,
    s.sprint_date_end_actual        as value
FROM project_sprints as s
LEFT JOIN (select project_id from projects) as p on p.project_id=s.project_id
WHERE s.project_id=$project_id AND s.sprint_date_start_actual !='' AND s.sprint_date_start_actual IS NOT NULL
ORDER BY s.sprint_date_start_actual ;


