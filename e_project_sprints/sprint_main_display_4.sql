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
    'datagrid'              as component,
    'panel_project_display' as id,
    'Gestion des phases du projets' as title;

select 
    '/e_project_sprints/sprint_main_form0_4.sql?project_id='||$project_id       as link,
    'Création d''un nouveau sprint'                  as description,
    'subtask'                                      as icon,
    'yellow'                                         as color;

select 
    '/e_project_sprints/sprint_archive_display_4.sql?project_id='||$project_id             as link,
    'Visualiser les sprints achivées'           as description,
    'archive'                                     as icon,
    'green'                                              as color;

select 
    '/e_project_stats/stat_sprint_stat_display_4.sql?project_id='||$project_id             as link,
    'Stat de progression'                      as description,
    'trending-up'                                     as icon,
    'green'                                       as color;

select 
    '/e_project_stats/stat_sprint_timeline_display_4.sql?project_id='||$project_id          as link,
    'Visualiser le planning'                      as description,
    'treadmill'                                     as icon,
    'green'                                       as color;

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
 
select 
    'divider' as component,
    'sprints rattachées au projet'    as contents,
    'blue' as color;

SET sprint_parent_name = select sprint_name from project_sprints where sprint_parent_id=sprint_id;


SELECT 
    'table'               AS component, 
    'Liste des sprints rattachées au projet' AS title, 
    TRUE                  AS sort, 
    'View'                AS markdown, 
    FALSE                 AS search;

SELECT
    sprint_id                     AS Id,
    sprint_parent_id              as Idparent,
    sprint_name                   AS Nom, 
    sprint_date_start_scheduled   as LancementPrevu,
    sprint_duration_scheduled     as DuréePrévue,
    sprint_date_start_scheduled   as LancementRéel,
    sprint_duration_scheduled     as DuréeRéelle,
                           
'[Edit](/e_project_sprints/sprint_main_edit_4.sql?sprint_id=' 
||sprint_id|| 
') &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [Delete](/e_project_sprints/sprint_main_delete_alert_4.sql?sprint_id=' 
||sprint_id||
')'    AS View
FROM project_sprints
WHERE project_id = $project_id and sprint_status!='archive'
ORDER BY  sprint_date_start_scheduled ASC;


