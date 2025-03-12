SELECT 'dynamic' AS component, sqlpage.run_sql('a_shells/shell_4.sql') AS properties;

SET project_id = select project_id from project_workpackages where workpackage_id = $workpackage_id;
SET workpackage_name = select workpackage_name from project_workpackages  where workpackage_id = $workpackage_id;
SET project_name = select project_name from projects where project_id = $project_id;

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
    'Retour à la liste des travaux'            as title,
    '/e_project_workpackages/workpackage_main_display_4.sql?project_id='||$project_id   as link;   


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
    5 as width,
    $project_name as value;
SELECT
    'workpackage_id' as name,
    TRUE as readonly,
    'Id wkp ' as label,
    1 as width,
   $workpackage_id as value;
SELECT
    'workpackage_name' as name,
    TRUE as readonly,
    'Nom du lot de travaux' as label,
    5 as width,
    $workpackage_name as value;

SET date_start_mini = 
SELECT MIN(s.worksequence_start_date_scheduled) FROM project_worksequences as s
LEFT JOIN (select workpackage_id, workpackage_name,  project_id from project_workpackages) as w 
on s.workpackage_id=w.workpackage_id
LEFT JOIN (select project_id from projects) as p 
on p.project_id=w.project_id
WHERE p.project_id=$project_id;


SET date_start_max = 
SELECT MAX(s.worksequence_start_date_actual) FROM project_worksequences as s
LEFT JOIN (select workpackage_id, workpackage_name,  project_id from project_workpackages) as w 
on s.workpackage_id = w.workpackage_id
LEFT JOIN (select project_id from projects) as p 
on p.project_id=w.project_id
WHERE p.project_id=$project_id;

select 
    'chart'            as component,
    'Worksquences Timeline' as title,
    'rangeBar'         as type,
    TRUE               as time,
    'green'             as color,
    'blue'             as color,
    $date_start_mini   as xmin,
    $date_start_max    as xmax;

select 
    s.worksequence_name                       as series,
    s.worksequence_name  ||'    Planififié'    as label,
    CONCAT (s.worksequence_start_date_scheduled,' ',s.worksequence_start_hour_scheduled)    as value,
    CONCAT (s.worksequence_start_date_scheduled,' ',s.worksequence_end_hour_scheduled)     as value
  FROM project_worksequences as s
  WHERE s.workpackage_id=$workpackage_id;

select 
    s.worksequence_name                       as series,
    s.worksequence_name  ||'    Réel'    as label,
    CONCAT (s.worksequence_start_date_actual,' ',s.worksequence_start_hour_actual)    as value,
    CONCAT (s.worksequence_start_date_actual,' ',s.worksequence_end_hour_actual)     as value
  FROM project_worksequences as s
  WHERE s.workpackage_id=$workpackage_id;
