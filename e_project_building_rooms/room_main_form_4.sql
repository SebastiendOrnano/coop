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
    'liste des projets'            as title,
    '/e_projects/project_main_display_4.sql'     as link;   
 select 
    'hub du projet'            as title,
    '/e_projects/project_hub_display_4.sql?project_id='||$project_id     as link;   
 select 
    'bâtiments du projet'            as title,
    '/e_project_buildings/building_main_display_4.sql?project_id='||$project_id     as link;    
select 
    'lieu de rattachement'            as title,
    '/e_project_building_rooms/room_main_display_3.sql?building_id='||$building_id     as link;

SELECT 
    'form' as component,
    'Créer une salle' as title,
    'Créer' as validate,
    'Clear' as reset,
    '/e_project_building_rooms/room_main_create_0.sql?building_id='||$building_id as action;

SELECT
    'room_name' as name,
    'text' as type,  
    'Nom' as label,
    6 AS width,
    TRUE as required;


 SELECT 
    'room_type'            as name,
    'Nature de la salle'                 as label,
    'select'                       as type,
    3                              AS width,
    'Choisir la nature de la salle dans la liste...'    as  empty_option,
    json_group_array(json_object('label',i.choice_label, 'value', i.choice_value))  AS options
    FROM choices_items AS i
    LEFT JOIN (select choice_category_id, choice_category_name from choices_categories)  AS c 
    ON i.choice_category_id = c.choice_category_id
    where choice_category_name="room_type"
    ORDER BY  i.choice_label ASC;

SELECT
    'room_summary' as name,
    'textarea' as type,
    'Disposition, équipement, lumière...' as description,
    'Présentation de la salle' as label;

SELECT
    'room_todo' as name,
    'textarea' as type,
    'Travaux à faire...' as description,
    'Travaux à faire' as label;

 SELECT 
    'room_accessibility'            as name,
    'Accessibilité'                 as label,
    'select'                       as type,
    3                              AS width,
    'Choisir un statut dans la liste...'    as  empty_option,
    json_group_array(json_object('label',i.choice_label, 'value', i.choice_value))  AS options
    FROM choices_items AS i
    LEFT JOIN (select choice_category_id, choice_category_name from choices_categories)  AS c 
    ON i.choice_category_id = c.choice_category_id
    where choice_category_name="building_accessibility"
    ORDER BY  i.choice_label ASC;

SELECT
    'room_capacity_seats' as name,
    'number' as type,  
    'Nombre max' as label,
    'assis' as suffix,
    3 as width;

SELECT
    'room_capacity_standup' as name,
    'number' as type,  
    'Nombre max' as label,
    'debout' as suffix,
    3 as width;

SELECT
    'room_width' as name,
    'number' as type,  
    'largeur en mm' as label,
    4 as width;

SELECT
    'room_length' as name,
    'number' as type,  
    'longueur en mm' as label,
    4 as width;

SELECT
    'room_height' as name,
    'number' as type,  
    'largeur' as label,
    4 as width;

SELECT
    'room_wall_material' as name,
    'text' as type,  
    'nature des murs' as label,
    6 as width;

SELECT
    'room_wall_material' as name,
    'text' as type,  
    'nature du sol' as label,
    6 as width;
