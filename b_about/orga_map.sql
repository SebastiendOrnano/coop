SELECT 'dynamic' AS component, sqlpage.run_sql('a_shells/shell.sql') AS properties;


select 
    'map'   as component,
    'Où nous trouver ?' as title,
    11   as zoom,
    44.07  as latitude,
   -1.16  as longitude,
    'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png' as tile_source;
select 
    'Notre siège'             as title,
    'indigo'                 as color,
    'map-pin' as icon,
   44.07  as latitude,
   -1.16   as longitude,
     '![siège](/x_location_pictures/IMGP7840.JPG)' as description_md;
    




