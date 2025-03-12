SELECT 'dynamic' AS component, sqlpage.run_sql('a_shells/shell_4.sql') AS properties;

select 
    'breadcrumb' as component;
select 
    'Home' as title,
    '/'    as link;
select 
    'Gestion Superviseur'         as title,
    '/a_panels/panel_supervisor_4.sql' as link;
 select 
    'hub du projet'            as title,
    '/e_projects/project_hub_display_4.sql?project_id='||$project_id     as link;  
select 
    '/e_project_building_rooms/room_main_display_4.sql?building_id='||$building_id    as link,
    'liste des lieux'  as title;
select 
    '/e_project_building_rooms_pictures/project_picture_display_4.sql?project_id='||$project_id    as link,
    'gestion des photos du projet'  as title;

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
    (select building_name  FROM project_buildings WHERE building_id = $building_id) as value;


select 
    'form'   as component,
    'choisir la pièce' as validate,
    'clear' as reset,
    '/e_project_building_rooms_pictures/room_picture_create_step2_0.sql?building_id='||$building_id  as action;
select 
    'room_id' as name,
    'choisir la pièce dans le bâtiment' as label,
    'select' as type,
    12 AS width,
    TRUE as searchable,
   'Saisissez quelques lettres du titre que vous cherchez ou choississez dans la liste' as empty_option,
    json_group_array(json_object('label',room_name,'value', room_id))  AS options
    FROM project_building_rooms
    WHERE building_id=$building_id
    ORDER BY  room_name ASC;
