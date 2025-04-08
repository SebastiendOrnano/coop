SELECT 'dynamic' AS component, sqlpage.run_sql('a_shells/shell_4.sql') AS properties;

SET tile_latitude = select MAX(project_meeting_place_latitude) from project_meeting_places;
SET tile_longitude = select MAX(project_meeting_place_longitude) from project_meeting_places;

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
    'Gestion des lieux de réunion'            as title,
    '/e_project_meeting/project_meeting_place_display_4.sql'    as link;

select 
    'map'   as component,
    'Carte des lieux de réunion' as title,
    11   as zoom,
    $tile_latitude  as latitude,
    $tile_longitude  as longitude,
    'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png' as tile_source;

select 
    project_meeting_place_name               as title,
    'indigo'                    as color,
    'map-pin'                   as icon,
    'http://localhost:8080/e_project_meeting/project_meeting_place_profile_4.sql?project_meeting_place_id='||project_meeting_place_id as link,
     project_meeting_place_latitude           as latitude,
     project_meeting_place_longitude         as longitude
     from project_meeting_places;
    




