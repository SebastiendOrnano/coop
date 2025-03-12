SELECT 'dynamic' AS component, sqlpage.run_sql('a_shells/shell_4.sql') AS properties;

SET project_name = select project_name from projects where project_id=$project_id;

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
    'panel_workpackage_display' as id,
    'Téléchagement des temps de travail par participant' as title;
SELECT
    '/e_project_stats/stat_worksequence_participant_stats1_form1_4.sql?project_id='||$project_id   as link,
    'Télécharger les données par participant'                      as description,
    'download'                                     as icon,
    'green'                                         as color;
SELECT
    '/e_project_stats/stat_worksequence_participant_stats1_form2_4.sql?project_id='||$project_id   as link,
    'Télécharger les données par entrerprise'                      as description,
    'download'                                     as icon,
    'yellow'                                         as color;
SELECT
    '/e_project_stats/stat_worksequence_participant_stats1_form3_step1_4.sql?project_id='||$project_id   as link,
    'Télécharger les données pour un employé d''une entreprise'                      as description,
    'download'                                     as icon,
    'red'                                         as color;
SELECT
    '/e_project_stats/stat_worksequence_participant_stats1_form4_4.sql?project_id='||$project_id   as link,
    'Télécharger les données pour un groupe'                      as description,
    'download'                                     as icon,
    'green'                                         as color;
