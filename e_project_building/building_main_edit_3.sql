SELECT 'dynamic' AS component, sqlpage.run_sql('a_shells/shell_3.sql') AS properties;

SET project_id = select project_id from project_building where building_id = $building_id;

select 
    'breadcrumb' as component;
select 
    'Home' as title,
    '/'    as link;
select 
    'Gestion Editeur'         as title,
    '/a_panels/panel_editor_3.sql' as link;
select 
    'Gestion des bâtiments'            as title,
    '/e_project_building/building_main_display_3.sql?project_id='||$project_id     as link;

SELECT 
    'form' as component,
    'Actualiser les données d''un bâtiment' as title,
    'Mettre à jour' as validate,
    'Clear' as reset,
    '/e_project_building/building_main_update_0.sql?building_id='||$building_id  as action;

SELECT
    'building_name' as name,
    'text' as type,  
    'Nom' as label,
    9 AS width,
    TRUE as required,
    (select building_name  FROM project_building WHERE building_id = $building_id) as value;

 SELECT 
    'building_status'        as name,
    'Statut'                 as label,
    'select'                 as type,
    TRUE                     as required,
    3                        AS width,
    (select building_status  FROM project_building WHERE building_id = $building_id) as value,
    'Choisir un statut dans la liste...'    as empty_option,
    json_group_array(json_object('label',i.choice_label, 'value', i.choice_value))  AS options
    FROM choices_items AS i
    LEFT JOIN (select choice_category_id, choice_category_name from choices_categories)  AS c 
    ON i.choice_category_id = c.choice_category_id
    where choice_category_name="status"
    ORDER BY  i.choice_label ASC;

SELECT
    'building_summary' as name,
    'textarea' as type,  
    'Pitch' as label,
    (select building_summary  FROM project_building WHERE building_id = $building_id) as value;

SELECT 
    'building_adress' as name,
    'adress' as label,
    'text' as type, 
    'adress' AS placeholder, 
    (select building_adress  FROM project_building WHERE building_id = $building_id) as value;

SELECT 
    'building_postal_code' as name,
    'code postal' as label,
    3 AS width,
    'text' as type, 
    'code postal' AS placeholder, 
    (select building_postal_code  FROM project_building WHERE building_id = $building_id) as value;

SELECT 
    'building_town' as name,
    'ville' as label,
    'text' as type,
    6 AS width,
    'ville' AS placeholder, 
    (select building_town  FROM project_building WHERE building_id = $building_id) as value;

SELECT 
    'building_country' as name,
    'Pays' as label,
    'text' as type, 
    3 AS width,
    'France..' AS placeholder, 
    (select building_country  FROM project_building WHERE building_id = $building_id) as value;

SELECT 
    'building_contact_phone' as name,
    'Téléphone' as label,
    'text' as type, 
    3 AS width,
    'téléphone' AS placeholder, 
   (select regex_value from regex where regex_name='phone')         as pattern,
   (select regex_description from regex where regex_name='phone')          as description,
   (Select building_contact_phone  FROM project_building WHERE building_id = $building_id) as value;

SELECT 
    'building_contact_mail' as name,
    'Email' as label,
    'text' as type, 
    5 AS width,
    'email' AS placeholder, 
   (select regex_value from regex where regex_name='email')         as pattern,
   (select regex_description from regex where regex_name='email')          as description,
   (Select building_contact_mail  FROM project_building WHERE building_id = $building_id) as value;

SELECT 
    'building_latitude' as name,
    'Latitude' as label,
    'text' as type, 
   (select regex_value from regex where regex_name='latitude')         as pattern,
   (select regex_description from regex where regex_name='latitude')          as description,
    2 as width,
    (select building_latitude  FROM project_building WHERE building_id = $building_id) as value;

SELECT 
    'building_longitude' as name,
    'longitude' as label,
    'text' as type, 
   (select regex_value from regex where regex_name='longitude')         as pattern,
   (select regex_description from regex where regex_name='longitude')          as description,
    2 as width,
    (select building_longitude  FROM project_building WHERE building_id = $building_id) as value;

 SELECT 
    'building_type'            as name,
    'Type de lieu'                 as label,
    'select'                       as type,
    3                              AS width,
    (select building_type  FROM project_building WHERE building_id = $building_id) as value,
    'Choisir un type dans la liste...'    as  empty_option,
    json_group_array(json_object('label',i.choice_label, 'value', i.choice_value))  AS options
    FROM choices_items AS i
    LEFT JOIN (select choice_category_id, choice_category_name from choices_categories)  AS c 
    ON i.choice_category_id = c.choice_category_id
    where choice_category_name="building_type"
    ORDER BY  i.choice_label ASC;

 SELECT 
    'building_accessibility'            as name,
    'Accessibilité'                 as label,
    'select'                       as type,
    3                              AS width,
    (select building_accessibility  FROM project_building WHERE building_id = $building_id) as value,
    json_group_array(json_object('label',i.choice_label, 'value', i.choice_value))  AS options
    FROM choices_items AS i
    LEFT JOIN (select choice_category_id, choice_category_name from choices_categories)  AS c 
    ON i.choice_category_id = c.choice_category_id
    where choice_category_name="building_accessibility"
    ORDER BY  i.choice_label ASC;

SELECT
    'building_capacity_seats' as name,
    'number' as type,  
    (select building_capacity_seats  FROM project_building WHERE building_id = $building_id) as value,
    'Nombre max' as label,
    'Assis' as suffix,
    3 as width;

SELECT
    'building_capacity_standup' as name,
    'number' as type,  
    (select building_capacity_standup  FROM project_building WHERE building_id = $building_id) as value,
    'Nombre max' as label,
    'debout' as suffix,
    3 as width;