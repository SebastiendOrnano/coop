SELECT 'dynamic' AS component, sqlpage.run_sql('a_shells/shell_3.sql') AS properties;

SET    building_id = (select building_id  FROM project_building_rooms WHERE room_id = $room_id);

SET building_id = select building_id from project_building_rooms where room_id=$room_id;
SET building_name= select building_name from project_building where building_id=$building_id;
SET project_id = select project_id from project_building where building_id=$building_id;

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
    '/e_project/project_hub_display_3.sql?project_id='||$project_id     as link;  
select 
    '/e_project_building_rooms/room_main_display_3.sql?building_id='||$building_id    as link,
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
    (select building_name  FROM project_building WHERE building_id = $building_id) as value;
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
    'Attacher une image à la salle' as title,
    'Créer' as validate,
    'Clear' as reset,
    '/e_project_building_rooms_pictures/room_picture_create_0.sql?room_id='||$room_id as action;

SELECT
    'room_picture_title' as name,
    'text' as type,  
    'Nom' as label,
    6 AS width,
    TRUE as required;

SELECT 
    'room_picture_format'            as name,
    'Format'                 as label,
    'select'                       as type,
    3                              AS width,
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
    TRUE as required,
    'image/*' as accept;

    SELECT
    'room_summary' as name,
    'textarea' as type,
    'Disposition, équipement, lumière...' as description,
    'Présentation de la salle' as label;