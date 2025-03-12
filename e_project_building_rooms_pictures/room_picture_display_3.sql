SELECT 'dynamic' AS component, sqlpage.run_sql('a_shells/shell_3.sql') AS properties;

SET building_id = select building_id from project_building_rooms where room_id=$room_id;
SET building_name= select building_name from project_buildings where building_id=$building_id;
SET project_id = select project_id from project_buildings where building_id=$building_id;


select 
    'breadcrumb' as component;
select 
    'Home' as title,
    '/'    as link;
select 
    'Gestion éditeur'         as title,
    '/a_panels/panel_editor_3.sql' as link;
 select 
    'hub du projet'            as title,
    '/e_projects/project_hub_display_3.sql?project_id='||$project_id     as link;  
select 
    '/e_project_building_rooms/room_main_display_3.sql?building_id='||$building_id    as link,
    'liste des lieux'  as title;
select 
    '/e_project_building_rooms_pictures/project_picture_display_3.sql?project_id='||$project_id    as link,
    'gestion des photos du projet'  as title;

select 
    'datagrid'              as component;
select 
    '/e_project_building_rooms_pictures/room_picture_form_3.sql?room_id='||$room_id     as link,
    'Créer une nouvelle image ou plan'                           as description,
    'photo-search'                                               as icon,
    'yellow'                                                     as color;


select 
    'divider' as component,
    'Nom du bâtiment'    as contents,
    'blue' as color;
select 
    'form'   as component,
    '' as validate;
SELECT
    'building_id' as name,
    TRUE as readonly,
    'Id ' as label,
    1 as width,
     $building_id as value;
SELECT
    'building_name' as name,
    TRUE as readonly,
    'Nom du Bâtiment' as label,
    5 as width,
   $building_name as value;
SELECT
    'room_id' as name,
    TRUE as readonly,
    'Id ' as label,
    1 as width,
    $room_id as value;
SELECT
    'room_name' as name,
    TRUE as readonly,
    'Nom de la pièce' as label,
    5 as width,
    (select room_name  FROM project_building_rooms WHERE room_id = $room_id) as value;
 
select 
    'divider' as component,
    'images rattachées au lieu'    as contents,
    'blue' as color;



SELECT 
    'table'               AS component, 
    'Liste des images rattachées au lieu' AS title, 
    TRUE                  AS sort,
    'Img'                  AS markdown, 
    'View'                AS markdown, 
    FALSE                 AS search;

SELECT
      '![view picture]('||room_picture_url||')' AS Img,
    room_picture_id            AS Id,
    room_picture_title            AS Nom,
    room_picture_format            AS Format,
'[View]('||room_picture_url||')&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
[Edit](/e_project_building_rooms_pictures/room_picture_edit_3.sql?room_picture_id='||room_picture_id||')'    AS View
FROM project_building_rooms_pictures
WHERE room_id = $room_id
ORDER BY room_picture_id ASC;


