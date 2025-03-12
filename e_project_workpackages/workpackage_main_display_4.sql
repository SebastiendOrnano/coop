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
    'Gestion des lots de travaux' as title;
select 
    '/e_project_workpackages/workpackage_main_form_4.sql?project_id='||$project_id       as link,
    'Création d''un lot de travaux'                  as description,
    'shovel-pitchforks'                                      as icon,
    'yellow'                                         as color;

select 
    '/e_project_workpackages/workpackage_archive_display_4.sql?project_id='||$project_id             as link,
    'Visualiser les slots de travaux achivées'           as description,
    'archive'                                     as icon,
    'green'                                              as color;

select 
    '/e_project_stats/stat_workpackage_cost_display_4.sql?project_id='||$project_id             as link,
    'Répartition des coûts du projet'                      as description,
    'archive'                                     as icon,
    'green'                                       as color;


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
    'lots de travaux rattachées au projet'    as contents,
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
'[Sequences](/e_project_worksequences/worksequence_main_display_4.sql?workpackage_id=' 
||workpackage_id||
  ') &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Participants](/e_project_workpackage_participants/workpackage_participant_main_display_4.sql?workpackage_id=' 
||workpackage_id||
  ') &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Edit](/e_project_workpackages/workpackage_main_edit_4.sql?workpackage_id=' 
||workpackage_id|| 
') &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [Delete](/e_project_workpackages/workpackage_main_delete_alert_4.sql?workpackage_id=' 
||workpackage_id||
')'    AS View
FROM project_workpackages
WHERE project_id = $project_id and workpackage_status='active'
ORDER BY workpackage_id ASC;

