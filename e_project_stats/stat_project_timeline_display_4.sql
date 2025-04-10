SELECT 'dynamic' AS component, sqlpage.run_sql('a_shells/shell_4.sql') AS properties;

SET project_name = select project_name from project where project_id = $project_id;

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
    '/e_project/project_main_display_4.sql'     as link;
 select 
    'Retour au hub du projet'            as title,
    '/e_project/project_hub_display_4.sql?project_id='||$project_id     as link;   

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

SET date_start_mini = 
SELECT MIN(w.workpackage_date_start_scheduled) FROM project_workpackage as w
LEFT JOIN (select project_id from project) as p 
on p.project_id=w.project_id
WHERE p.project_id=$project_id;

SET date_end_max = 
SELECT 
case
WHEN MAX(w.workpackage_date_end_actual) > MAX(w.workpackage_date_end_scheduled)
THEN MAX(w.workpackage_date_end_actual) 
ELSE MAX(w.workpackage_date_end_scheduled) END
FROM project_workpackage as w
LEFT JOIN (select project_id from project) as p 
on p.project_id=w.project_id
WHERE p.project_id=$project_id;


select 
    'chart'            as component,
    'Workpackage Timeline' as title,
    'rangeBar'         as type,
    TRUE               as time,
    'green'            as color,
    'blue'             as color,
    $date_start_mini   as xmin,
    $date_end_max      as xmax;

select 
    w.workpackage_name                       as series,
    w.workpackage_name  ||'    Planififié'    as label,
    w.workpackage_date_start_scheduled        as value,
    w.workpackage_date_end_scheduled          as value
  FROM project_workpackage as w
  left join (select project_id from project) as p
  on w.project_id=p.project_id
  WHERE p.project_id=$project_id;

select 
    w.workpackage_name                       as series,
    w.workpackage_name  ||'    Réel'         as label,
    case
    when  w.workpackage_date_start_actual IS NULL or  w.workpackage_date_start_actual=""
    then  ''
    else w.workpackage_date_start_actual   end       as value,
    case
    when  w.workpackage_date_end_actual  IS NULL or  w.workpackage_date_start_actual=""
   then  ''
   ELSE  w.workpackage_date_end_actual     end       as value
FROM project_workpackage as w
left join (select project_id from project) as p
on w.project_id=p.project_id
WHERE p.project_id=$project_id;
