SELECT 'dynamic' AS component, sqlpage.run_sql('a_shells/shell_4.sql') AS properties;


SET project_id = select project_id from projects where project_id=$project_id;
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
     '/e_project_workpackages/workpackage_main_display_4.sql?project_id='||$project_id             as link,
    'Visualiser les lots de travaux actifs'           as title;

select 
    'divider' as component,
    'Nom du projet'    as contents,
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
 
select 
    'divider' as component,
    'lots de travaux archivés'    as contents,
    'blue' as color;

SELECT 
    'table'               AS component, 
    'Liste des lots de travaux rattachées au projet' AS title, 
    TRUE                  AS sort, 
    'View'                AS markdown, 
    FALSE                 AS search;

SELECT
    workpackage_id            AS Id,
    workpackage_name            AS Nom,
    workpackage_type             as Type,
'[Edit](/e_project_workpackages/workpackage_main_edit_4.sql?workpackage_id=' 
||workpackage_id|| 
') &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [Delete](/e_project_workpackages/workpackage_main_delete_alert_4.sql?workpackage_id=' 
||workpackage_id||
')'    AS View
FROM project_workpackages
WHERE project_id = $project_id and workpackage_status='archived'
ORDER BY workpackage_id ASC;



