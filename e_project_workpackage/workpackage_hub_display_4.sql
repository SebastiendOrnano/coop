SELECT 'dynamic' AS component, sqlpage.run_sql('a_shells/shell_4.sql') AS properties;

SET workpackage_name = select workpackage_name from project_workpackage where workpackage_id = $workpackage_id;
set project_id = select project_id from project_workpackage where workpackage_id=workpackage_id;

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
    'datagrid'              as component,
    'datagrid_panel' as id,
    'Tableau de bord du lot de travaux : '||$workpackage_name as title;
select 
    '/e_project_workpackage_stats/stat_workpackage_timeline_display_4.sql?workpackage_id='||$workpackage_id      as link,
    'Planning des séquences chantiers'                  as description,
    'treadmill'                                      as icon,
    'yellow'                                         as color;
SELECT
    '/e_project_workpackage_stats/stat_workpackage_carbon_footprint_display_4.sql?workpackage_id='||$workpackage_id   as link,
    'Bilan carbone du lot de travaux'                      as description,
    'alarm-smoke'                                     as icon,
    'green'                                           as color;
SELECT
    '/e_project_workpackage_stats/stat_workpackage_cost_display_4.sql?workpackage_id='||$workpackage_id  as link,
    'Coûts des travaux par lot de travaux'                      as description,
    'currency-euro'                                     as icon,
    'blue'                                           as color;
select 
    '/e_project_workpackage_stats/stat_workpackage_waste_display_4.sql?workpackage_id='||$workpackage_id          as link,
    'Gestion des déchets'                      as description,
    'archive'                                     as icon,
    'yellow'                                       as color;

SELECT
    '/e_project_workpackage_stats/stat_workpackage_participant_stats1_display_4.sql?workpackage_id='||$workpackage_id   as link,
    'Heures de travail cumulées par séquence'                      as description,
    'clock-24'                                     as icon,
    'red'                                           as color;
SELECT
    '/e_project_workpackage_stats/stat_workpackage_participant_stats2_display_4.sql?workpackage_id='||$workpackage_id  as link,
    'Heures de travail cumulées par type de participant'                      as description,
    'clock-24'                                     as icon,
    'blue'                                         as color;
SELECT
    '/e_project_workpackage_stats/stat_workpackage_participant_stats3_display_4.sql?workpackage_id='||$workpackage_id   as link,
    'Télécharger  toutes les données'                      as description,
    'download'                                     as icon,
    'yellow'                                         as color;


select 
    'datagrid'              as component,
    'datagrid_panel' as id,
    'Gestion du lot de travaux : '||$workpackage_name as title;
select 
    '/e_project_worksequence/worksequence_main_form_4.sql?workpackage_id='||$workpackage_id       as link,
    'Création d''un nouveau séquence'                  as description,
    'subtask'                                      as icon,
    'yellow'                                         as color;

select 
    '/e_project_worksequence/worksequence_archive_display_4.sql?workpackage_id='||$workpackage_id             as link,
    'Visualiser les séquences achivées'           as description,
    'archive'                                     as icon,
    'green'                                              as color;
    
select 
   '/e_project_workpackage_participants/workpackage_participant_main_display_4.sql?workpackage_id='||$workpackage_id            as link,
    'Participants'                  as description,
    'users'                                            as icon,
    'blue'                                              as color;
select 
   '/e_project_workpackage_expenses/expense_main_display_4.sql?workpackage_id='||$workpackage_id            as link,
    'Dépenses - achats'                  as description,
    'tax-euro'                                            as icon,
    'red'                                              as color;
select 
   '/e_project_workpackage_materials/material_main_display_4.sql?workpackage_id='||$workpackage_id            as link,
    'Bilan carbone matériaux'                                       as description,
    'alarm-smoke'                                                       as icon,
    'yellow'                                                        as color;
select 
   '/e_project_workpackage_waste/waste_main_display_4.sql?workpackage_id='||$workpackage_id            as link,
    'Gestion des déchets'                  as description,
    'trash'                                            as icon,
    'blue'                                              as color;

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
    worksequence_id                     AS Id,
    worksequence_name                   AS Nom,
    worksequence_start_date_scheduled   as Date,
    worksequence_start_hour_scheduled    as Heure,
'[Participants](/e_project_worksequence_participants/worksequence_participant_main_display_4.sql?worksequence_id='||worksequence_id|| 
') &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [Edit](/e_project_worksequence/worksequence_main_edit_4.sql?worksequence_id='||worksequence_id|| 
') &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [Delete](/e_project_worksequence/worksequence_main_delete_alert_4.sql?worksequence_id='||worksequence_id||
')'    AS View
FROM project_worksequence
WHERE workpackage_id = $workpackage_id and worksequence_status!='archived'
ORDER BY worksequence_id ASC;