SELECT 'dynamic' AS component, sqlpage.run_sql('a_shells/shell_4.sql') AS properties;

SET project_name = SELECT project_name from projects where project_id=$project_id;


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
    'datagrid'              as component,
    'panel_hub_workspace_display' as id,
    'TABLEAU DE BORD DU PROJET : '||$project_name as title;

SELECT
    '/e_project_stats/stat_sprint_timeline_display_4.sql?project_id='||$project_id  as link,
    'Planning des sprints'                      as description,
    'treadmill'                                     as icon,
    'blue'                                              as color;

/*
SELECT
    '/e_project_stats/stat_workpackage_timeline_display_4.sql?project_id='||$project_id  as link,
    'Planning des lots de travaux'                      as description,
    'treadmill'                                     as icon,
    'yellow'                                              as color;
*/
SELECT
    '/e_project_stats/stat_workpackage_cost_display_4.sql?project_id='||$project_id  as link,
    'Coûts des travaux par lot de travaux'                      as description,
    'currency-euro'                                     as icon,
    'red'                                           as color;

SELECT
    '/e_project_stats/stat_worksequence_participant_stats1_display_4.sql?project_id='||$project_id   as link,
    'Heures de travail cumulées par séquence'                      as description,
    'clock-24'                                     as icon,
    'green'                                           as color;

SELECT
    '/e_project_stats/stat_worksequence_participant_stats2_display_4.sql?project_id='||$project_id   as link,
    'Heures de travail cumulées par type de partcipant'                      as description,
    'clock-24'                                     as icon,
    'blue'                                         as color;

SELECT
    '/e_project_stats/stat_worksequence_participant_stats3_display_4.sql?project_id='||$project_id   as link,
    'Télécharger  toutes les données'                      as description,
    'download'                                     as icon,
    'yellow'                                         as color;
SELECT
    '/e_project_stats/stat_worksequence_participant_stats4_display_4.sql?project_id='||$project_id   as link,
    'Télécharger les données détaillées par participant'                      as description,
    'download'                                     as icon,
    'red'                                         as color;

select 
    'datagrid'              as component,
    'panel_hub_workspace_display' as id,
    'GESTION DU PROJET: '||$project_name as title;

SELECT
    '/e_project_sprints/sprint_main_display_4.sql?project_id='||$project_id  as link,
    'Sprints'                      as description,
    'table-options'                                     as icon,
    'blue'                                              as color;

SELECT
    '/e_project_workpackages/workpackage_main_display_4.sql?project_id='||$project_id as link,
    'travaux - séquences (WKP-WKS)'                    as description,
    'shovel-pitchforks'                                as icon,
    'red'                                              as color;

select 
    '/e_project_meetings/project_meeting_main_display_4.sql?project_id='||$project_id    as link,
    'Réunions'                                    as description,
    'calendar-time'                               as icon,
    'red'                                         as color;

SELECT
    '/e_project_forum/project_forum_main_display_4.sql?project_id='||$project_id   as link,
    'Forum'                      as description,
    'arrows-random'                             as icon,
    'blue'                             as color;

SELECT
    '/e_project_participants/project_participant_main_display_4.sql?project_id='||$project_id   as link,
    'Participants'                      as description,
    'users'                             as icon,
    'green'                             as color;

SELECT
    '/e_project_docs/project_doc_main_display_4.sql?project_id='||$project_id   as link,
    'Documents'                      as description,
    'book'                           as icon,
    'yellow'                         as color;

SELECT
    '/e_project_buildings/building_main_display_4.sql?project_id='||$project_id   as link,
    'Bâtiments'                      as description,
    'building'                       as icon,
    'orange'                         as color;

SELECT
    '/e_project_buildings/buildings_map_display_4.sql?project_id='||$project_id   as link,
    'Localisation des bâtiments'                      as description,
    'map'                                     as icon,
    'orange'                                           as color;

SELECT
    '/e_project_building_rooms_pictures/project_picture_display_4.sql?project_id='||$project_id   as link,
    'Gestion des photos du projet'                    as description,
    'photo-search'                                     as icon,
    'orange'                                           as color;


SELECT
    '/e_project_building_rooms_pictures/project_picture_gallery_4.sql?project_id='||$project_id   as link,
    'Galerie photos'                                  as description,
    'photo-search'                                     as icon,
    'orange'                                           as color;
