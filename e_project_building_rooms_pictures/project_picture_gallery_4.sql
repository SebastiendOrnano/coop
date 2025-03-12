SELECT 'dynamic' AS component, sqlpage.run_sql('a_shells/shell_4.sql') AS properties;

SET building_id          = select building_id  FROM project_buildings WHERE project_id = $project_id;
SET room_id              = select room_id from project_building_rooms where building_id=$building_id;
SET room_picture_id      = select room_picture_id from project_building_rooms_pictures where room_id=$room_id;
SET project_name         =   (select project_name  FROM projects WHERE project_id = $project_id);


select 
    'breadcrumb' as component;
select 
    'Home' as title,
    '/'    as link;
select 
    'Gestion Superviseur'         as title,
    '/a_panels/panel_supervisor_4.sql' as link;
 select 
    'Retour au hub du projet'            as title,
    '/e_projects/project_hub_display_4.sql?project_id='||$project_id     as link;   
 

select 
    'datagrid'              as component,
    'Galerie des photos du projet  :'||$project_name        as title;
select 
    p.room_picture_title                     as title,
    p.room_picture_url                       as link,
    p.room_picture_url                       as image_url,
    b.building_name ||'---'|| r.room_name    as footer
    FROM project_building_rooms_pictures     as p
    LEFT JOIN (select room_id, room_name, building_id from project_building_rooms) as r
    on p.room_id = r.room_id
    LEFT JOIN (select building_id, building_name, project_id from project_buildings) as b
    on r.building_id = b.building_id
    WHERE b.project_id = $project_id
    ORDER BY p.room_picture_id ASC;


