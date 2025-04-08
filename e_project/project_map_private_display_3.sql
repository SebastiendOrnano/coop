SELECT 'dynamic' AS component, sqlpage.run_sql('a_shells/shell_3.sql') AS properties;

select 
    'breadcrumb' as component;
select 
    'Home' as title,
    '/'    as link;
select 
    'Gestion editeur'         as title,
    '/a_panels/panel_editor_3.sql' as link;
select 
    'Retour aux project actifs'         as title,
    '/e_project/project_main_display_3.sql'             as link;



SET max_latitude = select MAX(building_latitude)  from project_building where building_name IS NOT NULL;
SET max_longitude = select MAX(building_longitude)  from project_building where building_name IS NOT NULL;

select 
    'map'   as component,
    'Carte de nos projets' as title,
    11   as zoom,
    $max_latitude as latitude,
    $max_longitude  as longitude,
    'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png' as tile_source;

select 
    building_name             as title,
    'indigo'                    as color,
    'map-pin'                   as icon,
    '/e_project_building/building_main_profile_4.sql?building_id='||building_id as link,
     building_latitude           as latitude,
     building_longitude         as longitude
     from project_building
     where building_name IS NOT NULL;
    




