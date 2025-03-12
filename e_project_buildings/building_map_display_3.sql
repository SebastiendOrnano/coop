SELECT 'dynamic' AS component, sqlpage.run_sql('a_shells/shell_3.sql') AS properties;

SET tile_latitude = select MAX(building_latitude) from project_buildings where project_id=$project_id;
SET tile_longitude = select MAX(building_longitude) from project_buildings where project_id=$project_id;




select 
    'breadcrumb' as component;
select 
    'Home' as title,
    '/'    as link;
select 
    'Gestion Editeur'         as title,
    '/a_panels/panel_editor_3.sql' as link;
 select 
    'Retour à la liste des projets'            as title,
    '/e_projects/project_main_display_3.sql'     as link;   
 select 
    'Retour au hub du projet'            as title,
    '/e_projects/project_hub_display_3.sql?project_id='||$project_id     as link;
select 
    'Gestion des bâtiments'            as title,
    '/e_project_buildings/building_main_display_3.sql?project_id='||$project_id     as link;

select 
    'map'   as component,
    'Carte de nos projets' as title,
    11   as zoom,
    $tile_latitude  as latitude,
    $tile_longitude  as longitude,
    'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png' as tile_source;

select 
    building_name               as title,
    'indigo'                    as color,
    'map-pin'                   as icon,
    'http://localhost:8080/e_project_buildings/building_main_profile_3.sql?building_id='||building_id as link,
     building_latitude           as latitude,
     building_longitude         as longitude
     from project_buildings
    where project_id=$project_id;
    




