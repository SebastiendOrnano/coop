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
    'panel_project_display' as id,
    'Liste des images rattachées au lieu'   as title;
select 
 '/e_project_building_rooms_pictures/room_picture_form_step1_4.sql?project_id='||$project_id   as link,
    'Ajouter une nouvelle image ou plan'                  as description,
    'photo-scan'                                      as icon,
    'yellow'                                         as color;

SELECT 
    'table'               AS component, 
    'Liste des images rattachées au lieu' AS title, 
    TRUE                  AS sort,
    'Img'                  AS markdown, 
    'View'                AS markdown, 
    FALSE                 AS search;

SELECT
    '![view picture]('||p.room_picture_url||')'   AS Img,
    p.room_picture_id                             AS Id,
    p.room_picture_title                          AS Nom,
    p.room_picture_format                         AS Format,
    r.room_name                                   AS Piece,
    b.building_name                               AS Batiment,
'[View]('||p.room_picture_url||')&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
[Edit](/e_project_building_rooms_pictures/room_picture_edit_4.sql?room_picture_id=' 
||p.room_picture_id|| 
') &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [Delete](/e_project_building_rooms_pictures/room_picture_delete_alert_4.sql?room_picture_id=' 
||p.room_picture_id||
')'    AS View
FROM project_building_rooms_pictures as p
LEFT JOIN (select room_id, room_name, building_id from project_building_rooms) as r
on p.room_id = r.room_id
LEFT JOIN (select building_id, building_name, project_id from project_buildings) as b
on r.building_id = b.building_id
WHERE b.project_id = $project_id
ORDER BY p.room_picture_id ASC;


