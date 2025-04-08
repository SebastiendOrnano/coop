SELECT 'dynamic' AS component, sqlpage.run_sql('a_shells/shell_4.sql') AS properties;

SET project_id = select project_id from project_building where building_id=$building_id;


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
    'Retour aux bâtiments du projet'            as title,
    '/e_project_building/building_main_display_4.sql?project_id='||$project_id     as link;   


select 
    'datagrid'              as component,
    'panel_building_display' as id,
    'Gestion des bâtiments' as title;

select 
    '/e_project_building_rooms/room_main_form_4.sql?building_id='||$building_id       as link,
    'Création d''une nouvelle salle'                  as description,
    'building-community'                                      as icon,
    'yellow'                                         as color;

select 
     '/e_project_building_rooms/room_archive_display_4.sql?building_id='||$building_id             as link,
    'Visualiser les salles achivées'           as description,
    'archive'                                     as icon,
    'green'                                              as color;

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
    (select building_name  FROM project_building WHERE building_id = $building_id) as value;
 
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
'[Pict](/e_project_building_rooms_pictures/room_picture_display_4.sql?room_id=' 
||room_id|| 
') &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
[Edit](/e_project_building_rooms/room_main_edit_4.sql?room_id=' 
||room_id|| 
') &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [Delete](/e_project_building_rooms/room_main_delete_alert_4.sql?room_id=' 
||room_id||
')'    AS View
FROM project_building_rooms
WHERE building_id = $building_id and room_status!='archive'
ORDER BY room_id ASC;


