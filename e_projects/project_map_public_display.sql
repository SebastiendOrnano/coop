SELECT 'dynamic' AS component, sqlpage.run_sql('a_shells/shell.sql') AS properties;


SET max_latitude = select MAX(building_latitude)  from project_buildings where building_name IS NOT NULL;
SET max_longitude = select MAX(building_longitude)  from project_buildings where building_name IS NOT NULL;

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
     building_latitude           as latitude,
     building_longitude         as longitude
     from project_buildings
     where building_name IS NOT NULL;