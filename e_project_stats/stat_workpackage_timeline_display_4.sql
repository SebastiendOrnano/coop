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
    'Gestion des lots de travaux'            as title,
    '/e_project_workpackages/workpackage_main_display_4.sql?project_id='||$project_id     as link;  


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

SET date_start_mini = SELECT MIN(workpackage_date_start_scheduled) from project_workpackages where project_id=$project_id;
SET date_start_max = SELECT MAX(workpackage_date_end_actual) from project_workpackages where project_id=$project_id;

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
    s.workpackage_name                         as series,
    s.workpackage_name ||'    Planififié'      as label,
    s.workpackage_date_start_scheduled         as value,
    s.workpackage_date_end_scheduled           as value
FROM project_workpackages as s
LEFT JOIN (select project_id from projects) as p on p.project_id=s.project_id
WHERE p.project_id=s.project_id AND s.workpackage_date_start_scheduled !='' AND s.workpackage_date_start_scheduled IS NOT NULL
ORDER BY s.workpackage_date_start_scheduled ;


select 
    s.workpackage_name                   as series,
    s.workpackage_name ||'    Réel'      as label,
    s.workpackage_date_start_actual      as value,
    s.workpackage_date_end_actual        as value
FROM project_workpackages as s
LEFT JOIN (select project_id from projects) as p on p.project_id=s.project_id
WHERE p.project_id=s.project_id AND s.workpackage_date_start_actual !='' AND s.workpackage_date_start_actual IS NOT NULL
ORDER BY s.workpackage_date_start_actual ;


