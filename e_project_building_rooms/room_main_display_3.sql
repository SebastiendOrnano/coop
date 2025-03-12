SELECT 'dynamic' AS component, sqlpage.run_sql('a_shells/shell_3.sql') AS properties;


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
    'Retour à la liste des projets'            as title,
    '/e_projects/project_main_display_3.sql'     as link;   
 select 
    'Retour au hub du projet'            as title,
    '/e_projects/project_hub_display_3.sql?project_id='||$project_id     as link;   
 select 
    'Retour aux bâtiments du projet'            as title,
    '/e_project_buildings/building_main_display_3.sql?project_id='||$project_id     as link;   


select 
    'datagrid'              as component,
    'panel_building_display' as id,
    'Gestion des bâtiments' as title;

select 
    '/e_project_building_rooms/room_main_form_3.sql?building_id='||$building_id       as link,
    'Création d''une nouvelle salle'                  as description,
    'building-community'                                      as icon,
    'yellow'                                         as color;


select 
    'divider' as component,
    'Nom du bâtiment de rattachement'    as contents,
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
    'Nom du lieu de rattachement' as label,
    11 as width,
    $building_name as value;
 
select 
    'divider' as component,
    'Liste des pièces ou des salles rattachées au lieu'    as contents,
    'blue' as color;

SELECT 
    'table'               AS component, 
    'Liste des pièces ou des salles rattachées au lieu' AS title, 
    TRUE                  AS sort, 
    'View'                AS markdown, 
    FALSE                 AS search;

SELECT
    room_id            AS Id,
    room_name            AS Nom,
    room_type             as Type,
'[Pict](/e_project_building_rooms_pictures/room_picture_display_3.sql?room_id=' 
||room_id|| 
') &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Edit](/e_project_building_rooms/room_main_edit_3.sql?room_id='||room_id||')'    AS View
FROM project_building_rooms
WHERE building_id = $building_id and room_status!='archive'
ORDER BY room_id ASC;


