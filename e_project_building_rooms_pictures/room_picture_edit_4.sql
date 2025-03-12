SELECT 'dynamic' AS component, sqlpage.run_sql('a_shells/shell_4.sql') AS properties;

SET room_id = (select room_id from project_building_rooms_pictures where room_picture_id = $room_picture_id) ;
SET building_id = (select building_id from project_building_rooms where room_id = $room_id) ;
SET project_id = (select project_id from project_buildings where building_id = $building_id) ;


select 
    'breadcrumb' as component;
select 
    'Home' as title,
    '/'    as link;
select 
    'Gestion superviseur'         as title,
    '/a_panels/panel_supervisor_4.sql' as link;
 select 
    'hub du projet'            as title,
    '/e_projects/project_hub_display_4.sql?project_id='||$project_id     as link;  
select 
    '/e_project_building_rooms/room_main_display_4.sql?building_id='||$building_id    as link,
    'liste des lieux'  as title;




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

SELECT 
    'form' as component,
    'Actualiser une image liée une salle' as title,
    'Actualiser' as validate,
    'Clear' as reset,
    '/e_project_building_rooms_pictures/room_picture_update_0.sql?room_picture_id='||$room_picture_id as action;

select 
    'room_id' as name,
    'hidden' as type,
    $room_id as value,
    'id' as label;

SELECT
    'room_picture_title' as name,
    'text' as type,  
    'Nom' as label,
    (select room_picture_title from project_building_rooms_pictures where room_picture_id=$room_picture_id) as value,
    6 AS width,
    TRUE as required;

SELECT 
    'room_picture_status'            as name,
    'Statut'                 as label,
    'select'                 as type,
    3                              AS width,
    TRUE                     as required,
    (select room_picture_status from project_building_rooms_pictures where room_picture_id=$room_picture_id) as value,
    'Choisir un statut dans la liste...'    as empty_option,
    json_group_array(json_object('label',i.choice_label, 'value', i.choice_value))  AS options
    FROM choices_items AS i
    LEFT JOIN (select choice_category_id, choice_category_name from choices_categories)  AS c 
    ON i.choice_category_id = c.choice_category_id
    where choice_category_name="status"
    ORDER BY  i.choice_label ASC;

SELECT 
    'room_picture_format'            as name,
    'Format'                 as label,
    'select'                       as type,
    3                              AS width,
    (select room_picture_format from project_building_rooms_pictures where room_picture_id=$room_picture_id) as value,
    'Choisir un format dans la liste...'    as  empty_option,
    json_group_array(json_object('label',i.choice_label, 'value', i.choice_value))  AS options
    FROM choices_items AS i
    LEFT JOIN (select choice_category_id, choice_category_name from choices_categories)  AS c 
    ON i.choice_category_id = c.choice_category_id
    where choice_category_name="img_format"
    ORDER BY  i.choice_label ASC;

select 
    'file' as type, 
    'room_picture_url' as name,
    'Photo à insérer' as label,
    'image/*' as accept;

SELECT
    'room_summary' as name,
    'textarea' as type,
    (select room_picture_summary from project_building_rooms_pictures where room_picture_id=$room_picture_id) as value,
    'Disposition, équipement, lumière...' as description,
    'Présentation de la salle' as label;






















