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
    '/e_project/project_main_display_4.sql'     as link;
 select 
    'Retour au hub du projet'            as title,
    '/e_project/project_hub_display_4.sql?project_id='||$project_id     as link; 
select 
    'liste des lots de travaux'    as title,
    '/e_project_workpackage/workpackage_hub_display_4.sql?project_id='||$project_id as link;
select 
    'gestion des séquences'    as title,
    '/e_project_worksequence/worksequence_main_display_4.sql?workpackage_id='||$workpackage_id as link;

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
    'Id ' as label,
    1 as width,
   $workpackage_id as value;
SELECT
    'workpackage_name' as name,
    TRUE as readonly,
    'Nom du lot de travaux' as label,
    11 as width,
    (select workpackage_name  from project_workpackage WHERE workpackage_id = $workpackage_id) as value;

select 
    'chart'             as component,
    'bar'               as type,
    'green'             as color,
    'Avancement des séquences du lot de travaux' as title,
    TRUE                as horizontal,
    TRUE                as labels;
select 
    worksequence_name as label,
    worksequence_completion_percentage   as value
FROM project_worksequence where workpackage_id=$workpackage_id;






