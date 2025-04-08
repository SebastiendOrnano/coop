SELECT 'dynamic' AS component, sqlpage.run_sql('a_shells/shell_3.sql') AS properties;


SET building_id = SELECT building_id FROM project_building_rooms WHERE room_id = $room_id;

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
    '/e_project/project_main_display_3.sql'     as link;   
 select 
    'Retour au hub du projet'            as title,
    '/e_project/project_hub_display_3.sql?project_id='||$project_id     as link;   
 select 
    'Retour aux bâtiments du projet'            as title,
    '/e_project_building/building_main_display_3.sql?project_id='||$project_id     as link;   
select 
    'Gestion du lieu de rattachement'            as title,
    '/e_project_building_rooms/room_main_display_3.sql?building_id='||$building_id     as link;

SELECT 
    'form' as component,
    'Actualiser les données d''une salle' as title,
    'Mettre à jour' as validate,
    'Clear' as reset,
    '/e_project_building_rooms/room_main_update_0.sql?room_id='||$room_id as action;

select 
    'building_id' as name,
    'hidden' as type,
    $pace_id as value,
    'building_id' as label;

SELECT
    'room_id' as name,
    'hidden' as type,  
    'room_id' as label,
    $room_id as value;

SELECT
    'project_id' as name,
    'hidden' as type,  
    'Id' as label,
    $project_id as value;

SELECT
    'room_name' as name,
    'text' as type,  
    'Nom' as label,
    6 AS width,
    TRUE as required,
    (select room_name  FROM project_building_rooms WHERE room_id = $room_id) as value;

 SELECT 
    'room_type'            as name,
    'Nature de la salle'                 as label,
    'select'                       as type,
    3                              AS width,
    (select room_type  FROM project_building_rooms WHERE room_id = $room_id) as value,
    'Choisir la nature de la salle dans la liste...'    as  empty_option,
    json_group_array(json_object('label',i.choice_label, 'value', i.choice_value))  AS options
    FROM choices_items AS i
    LEFT JOIN (select choice_category_id, choice_category_name from choices_categories)  AS c 
    ON i.choice_category_id = c.choice_category_id
    where choice_category_name="room_type"
    ORDER BY  i.choice_label ASC;

 SELECT 
    'room_status'            as name,
    'Statut'                 as label,
    'select'                 as type,
    3 as width,
    TRUE                     as required,
    (select room_status  FROM project_building_rooms WHERE room_id = $room_id) as value,
    json_group_array(json_object('label',i.choice_label, 'value', i.choice_value))  AS options
    FROM choices_items AS i
    LEFT JOIN (select choice_category_id, choice_category_name from choices_categories)  AS c 
    ON i.choice_category_id = c.choice_category_id
    where choice_category_name="status"
    ORDER BY  i.choice_label ASC;


SELECT
    'room_summary' as name,
    'textarea' as type,  
    'Description' as label,
    (select room_summary  FROM project_building_rooms WHERE room_id = $room_id) as value;

SELECT
    'room_todo' as name,
    'textarea' as type,
    'Travaux à faire...' as description,
    (select room_todo  FROM project_building_rooms WHERE room_id = $room_id) as value,
    'Travaux à faire' as label;

SELECT 
    'room_access' as name,
    'Accès à la salle' as label,
    'text' as type, 
    'indications sur l''accès à la salle : 2e étage, couloir de gauche...' AS placeholder, 
    (select room_access  FROM project_building_rooms WHERE room_id = $room_id) as value;

 
SELECT 
    'room_accessibility'            as name,
    'Accessibilité'                 as label,
    'select'                       as type,
    3                              AS width,
    (select room_accessibility  FROM project_building_rooms WHERE room_id = $room_id) as value,
    'Choisir un statut dans la liste...'    as  empty_option,
    '[{"label": "Accessible", "value": "yes"},
    {"label": "Non accessible", "value": "no"},
    {"label": "Non précisé", "value": "N"}
    ]'  as options;

SELECT
    'room_capacity_seats' as name,
    'number' as type,  
    'Nombre max' as label,
    (select room_capacity_seats  FROM project_building_rooms WHERE room_id = $room_id) as value,
    'assis' as suffix,
    3 as width;

SELECT
    'room_capacity_standup' as name,
    'number' as type,  
    'Nombre max' as label,
    (select room_capacity_standup  FROM project_building_rooms WHERE room_id = $room_id) as value,
    'debout' as suffix,
    3 as width;

SELECT
    'room_width' as name,
    'number' as type,  
    'largeur en mm' as label,
        (select room_width  FROM project_building_rooms WHERE room_id = $room_id) as value,
    4 as width;

SELECT
    'room_length' as name,
    'number' as type,  
    'longueur en mm' as label,
        (select room_length  FROM project_building_rooms WHERE room_id = $room_id) as value,
    4 as width;

SELECT
    'room_height' as name,
    'number' as type,  
    'hauteur en mm' as label,
        (select room_height  FROM project_building_rooms WHERE room_id = $room_id) as value,
    4 as width;

SELECT
    'room_wall_material' as name,
    'text' as type,  
    'nature des murs' as label,
        (select room_wall_material  FROM project_building_rooms WHERE room_id = $room_id) as value,
    6 as width;

SELECT
    'room_floor_material' as name,
    'text' as type,  
    'nature du sol' as label,
        (select room_floor_material  FROM project_building_rooms WHERE room_id = $room_id) as value,
    6 as width;