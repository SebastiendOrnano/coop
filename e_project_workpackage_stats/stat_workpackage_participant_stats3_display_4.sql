SELECT 'dynamic' AS component, sqlpage.run_sql('a_shells/shell_4.sql') AS properties;

SET project_id = select project_id from project_workpackage where workpackage_id=$workpackage_id;
SET workpackage_name= select workpackage_name FROM project_workpackage where workpackage_id=$workpackage_id;
SET project_name= select project_name FROM project where project_id=$project_id;
SET worksequence_id = select worksequence_id from project_worksequence where workpackage_id=$workpackage_id and worksequence_status='active';
SET worksequence_nb_participants = select  worksequence_nb_participants from project_worksequence where worksequence_id=$worksequence_id  and worksequence_status='active';

select 
    'breadcrumb' as component;
select 
    'Home' as title,
    '/'    as link;
select 
    'Gestion Superviseur'         as title,
    '/a_panels/panel_supervisor_4.sql' as link;
 select 
    'Hub du projet'            as title,
    '/e_project/project_hub_display_4.sql?project_id='||$project_id      as link;
 select 
    'Hub du lot de travaux'            as title,
    '/e_project_workpackage/workpackage_hub_display_4.sql?workpackage_id='||$workpackage_id    as link; 

select 
    'datagrid'              as component,
    'panel_workpackage_display' as id,
    'Téléchargement des temps de travail du lot de travaux' as title;
select 
    '/e_project_workpackage_stats/stat_workpackage_workhours_csv_0.sql?workpackage_id='||$workpackage_id     as link,  
    'télécharger le total des heures du lot de travaux par séquence'                 as description,
    'download'                                          as icon,
    'blue'                                                as color;
select 
    '/e_project_workpackage_stats/stat_workpackage_workhours_participant0_csv_0.sql?workpackage_id='||$workpackage_id     as link,  
    'télécharger le total des heures du lot de travaux par participants'                 as description,
    'download'                                          as icon,
    'red'                                                as color;

SELECT
    '/e_project_workpackage_stats/stat_workpackage_participant_stats1_form1_4.sql?workpackage_id='||$workpackage_id   as link,
    'Télécharger les données par participant'                      as description,
    'download'                                     as icon,
    'green'                                         as color;
SELECT
    '/e_project_workpackage_stats/stat_workpackage_participant_stats1_form2_4.sql?workpackage_id='||$workpackage_id  as link,
    'Télécharger les données par entrerprise'                      as description,
    'download'                                     as icon,
    'yellow'                                         as color;
SELECT
    '/e_project_workpackage_stats/stat_workpackage_participant_stats1_form3_step1_4.sql?workpackage_id='||$workpackage_id  as link,
    'Télécharger les données pour un employé d''une entreprise'                      as description,
    'download'                                     as icon,
    'red'                                         as color;
SELECT
    '/e_project_workpackage_stats/stat_workpackage_participant_stats1_form4_4.sql?workpackage_id='||$workpackage_id  as link,
    'Télécharger les données pour un groupe'                      as description,
    'download'                                     as icon,
    'green'                                         as color;