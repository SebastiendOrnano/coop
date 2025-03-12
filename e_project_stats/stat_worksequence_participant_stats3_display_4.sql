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
    'Téléchargement des temps de travail par sequence' as title;
select 
    '/e_project_stats/stat_worksequence_workhours_csv_0.sql?project_id='||$project_id       as link,
    'télécharger le total des heures par sequence'                 as description,
    'download'                                          as icon,
    'blue'                                                as color;
select 
    'stat_worksequence_participants_workhours_csv_0.sql?project_id='||$project_id        as link,
    'télécharger le total des heures pour tous les participants'                 as description,
    'download'                                          as icon,
    'red'                                                as color;