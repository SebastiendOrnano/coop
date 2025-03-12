SELECT 'dynamic' AS component, sqlpage.run_sql('a_shells/shell_4.sql') AS properties;


SET project_id = select project_id from project_workpackages where workpackage_id=$workpackage_id;

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
    'liste des lots de travaux'    as title,
    '/e_project_workpackages/workpackage_main_display_4.sql?project_id='||$project_id as link;


select 
    'datagrid'              as component,
    'panel_workpackage_display' as id,
    'Gestion des séquences d''un lot de travaux' as title;

select 
    '/e_project_worksequences/worksequence_main_form_4.sql?workpackage_id='||$workpackage_id       as link,
    'Création d''un nouveau séquence'                  as description,
    'subtask'                                      as icon,
    'yellow'                                         as color;

select 
    '/e_project_worksequences/worksequence_archive_display_4.sql?workpackage_id='||$workpackage_id             as link,
    'Visualiser les séquences achivées'           as description,
    'archive'                                     as icon,
    'green'                                              as color;

select 
    '/e_project_stats/stat_worksequence_timeline_display_4.sql?workpackage_id='||$workpackage_id             as link,
    'Visualiser le planning'                      as description,
    'treadmill'                                     as icon,
    'green'                                       as color;

select 
    '/e_project_stats/stat_worksequence_stat_display_4.sql?workpackage_id='||$workpackage_id             as link,
    'Visualiser les stats d''avancement'                      as description,
    'trending-up-3'                                     as icon,
    'green'                                       as color;


select 
    'divider' as component,
    'Nom du lot de travaux'    as contents,
    'blue' as color;

select 
    'form'   as component,
    '' as validate;
SELECT
    'workpackage_id' as name,
    TRUE as readonly,
    'Id' as label,
    1 as width,
    (select workpackage_id  from project_workpackages WHERE workpackage_id = $workpackage_id) as value;
SELECT
    'workpackage_name' as name,
    TRUE as readonly,
    'Nom du lot de travaux' as label,
    5 as width,
    (select workpackage_name  from project_workpackages WHERE workpackage_id = $workpackage_id) as value;
SELECT
    'workpackage_type' as name,
    TRUE as readonly,
    'Type de travaux' as label,
    6 as width,
    (select workpackage_type from project_workpackages WHERE workpackage_id = $workpackage_id) as value;
 
select 
    'divider' as component,
    'séquences rattachées au lot de travaux'    as contents,
    'blue' as color;

SELECT 
    'table'               AS component, 
    'Liste des séquences rattachées au lot de travaux' AS title, 
    TRUE                  AS sort, 
    'View'                AS markdown, 
    FALSE                 AS search;

SELECT
    worksequence_id            AS Id,
    worksequence_name            AS Nom,
'[Participants](/e_project_worksequence_participants/worksequence_participant_main_display_4.sql?worksequence_id='||worksequence_id|| 
') &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [Edit](/e_project_worksequences/worksequence_main_edit_4.sql?worksequence_id='||worksequence_id|| 
') &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [Delete](/e_project_worksequences/worksequence_main_delete_alert_4.sql?worksequence_id='||worksequence_id||
')'    AS View
FROM project_worksequences
WHERE workpackage_id = $workpackage_id and worksequence_status!='archived'
ORDER BY worksequence_id ASC;


