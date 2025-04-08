SELECT 'dynamic' AS component, sqlpage.run_sql('a_shells/shell_3.sql') AS properties;

SET project_name = SELECT project_name from project where project_id=$project_id;


select 
    'breadcrumb' as component;
select 
    'Home' as title,
    '/'    as link;
select 
    'Gestion éditeur'         as title,
    '/a_panels/panel_editor_3.sql' as link;
 select 
    'Retour à la liste des projets'            as title,
    '/e_project/project_main_display_3.sql'     as link;   

select 
    'datagrid'              as component,
    'panel_hub_workspace_display' as id,
    'GESTION DU PROJET: '||$project_name as title;

SELECT
    '/e_project_workpackage/workpackage_hub_display_3.sql?project_id='||$project_id as link,
    'travaux - séquences (WKP-WKS)'                    as description,
    'shovel-pitchforks'                                as icon,
    'red'                                              as color;

select 
    '/e_project_meeting/project_meeting_main_display_3.sql?project_id='||$project_id    as link,
    'Réunions'                                    as description,
    'calendar-time'                               as icon,
    'red'                                         as color;

SELECT
    '/e_project_forum/project_forum_main_display_3.sql?project_id='||$project_id   as link,
    'Forum'                      as description,
    'arrows-random'                             as icon,
    'blue'                             as color;

SELECT
    '/e_project_participants/project_participant_main_display_3.sql?project_id='||$project_id   as link,
    'Participants'                      as description,
    'users'                             as icon,
    'green'                             as color;

SELECT
    '/e_project_docs/project_doc_main_display_3.sql?project_id='||$project_id   as link,
    'Documents'                      as description,
    'book'                           as icon,
    'yellow'                         as color;

SELECT
    '/e_project_building/building_main_display_3.sql?project_id='||$project_id   as link,
    'Bâtiments'                      as description,
    'building'                       as icon,
    'orange'                         as color;

SELECT
    '/e_project_building/building_map_display_3.sql?project_id='||$project_id   as link,
    'Localisation des bâtiments'                      as description,
    'map'                                     as icon,
    'orange'                                           as color;

SELECT
    '/e_project_building_rooms_pictures/project_picture_display_3.sql?project_id='||$project_id   as link,
    'Gestion des photos du projet'                    as description,
    'photo-search'                                     as icon,
    'orange'                                           as color;



SELECT
    '/e_project_building_rooms_pictures/project_picture_gallery_3.sql?project_id='||$project_id   as link,
    'Galerie photos'                                  as description,
    'photo-search'                                     as icon,
    'orange'                                           as color;
