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
    'Gestion des lieux'            as title,
    '/b_orga_places/orga_place_main_display_4.sql'      as link;





SELECT 
    'form' as component,
    'Créer un lieu' as title,
    'Créer' as validate,
    'Clear' as reset,
    '/b_orga_places/orga_place_main_create_0.sql' as action;

select 
    'place_id' as name,
    'hidden' as type,
    $place_id as value,
    'id' as label;

SELECT
'place_name' as name,
'text' as type,  
'Nom' as label,
 9 AS width,
TRUE as required;

 SELECT 
'place_status'            as name,
'Statut'                 as label,
'select'                 as type,
3                              AS width,
TRUE                     as required,
'Choisir un statut dans la liste...'    as empty_option,
    json_group_array(json_object('label',i.choice_label, 'value', i.choice_value))  AS options
    FROM choices_items AS i
    LEFT JOIN (select choice_category_id, choice_category_name from choices_categories)  AS c 
    ON i.choice_category_id = c.choice_category_id
    where choice_category_name="status"
    ORDER BY  i.choice_label ASC;

SELECT
'place_summary' as name,
'textarea' as type,  
'Présentation du lieu' as label;

SELECT 
'place_adress' as name,
'adress' as label,
'text' as type, 
'adress' AS placeholder;

SELECT 
'place_postal_code' as name,
'code postal' as label,
 3 AS width,
'text' as type, 
'code postal' AS placeholder;

SELECT 
'place_town' as name,
'ville' as label,
'text' as type,
 6 AS width,
'ville' AS placeholder;

SELECT 
'place_country' as name,
'Pays' as label,
'text' as type, 
3 AS width,
'France..' AS placeholder;

SELECT 
    'place_contact_phone' as name,
    'Téléphone' as label,
    'text' as type, 
    3 AS width,
    'téléphone' AS placeholder, 
  (select regex_value from regex where regex_name='phone')         as pattern,
   (select regex_description from regex where regex_name='phone')          as description;

SELECT 
    'place_contact_mail' as name,
    'Email' as label,
    'text' as type, 
    5 AS width,
    'email' AS placeholder, 
  (select regex_value from regex where regex_name='email')         as pattern,
   (select regex_description from regex where regex_name='email')          as description;

SELECT 
'place_latitude' as name,
'Latitude' as label,
'text' as type, 
'latitude' AS placeholder, 
2 as width;

SELECT 
'place_longitude' as name,
'longitude' as label,
'text' as type, 
'longitude' AS placeholder,
2 as width;



 SELECT 
'place_type'            as name,
'Type de lieu'                 as label,
'select'                       as type,
3                              AS width,
'Choisir un type dans la liste...'    as  empty_option,
'Choisir un statut dans la liste...'    as empty_option,
    json_group_array(json_object('label',i.choice_label, 'value', i.choice_value))  AS options
    FROM choices_items AS i
    LEFT JOIN (select choice_category_id, choice_category_name from choices_categories)  AS c 
    ON i.choice_category_id = c.choice_category_id
    where choice_category_name="place_type"
    ORDER BY  i.choice_label ASC;


 SELECT 
'place_accessibility'            as name,
'Accessibilité'                 as label,
'select'                       as type,
3                              AS width,
'Choisir un statut dans la liste...'    as  empty_option,
'[{"label": "Accessible", "value": "yes"},
{"label": "Non accessible", "value": "no"},
{"label": "Non précisé", "value": "N"}
]'  as options;


SELECT
'place_capacity_seats' as name,
'number' as type,  
'assis' as suffix,
'Nombre max ' as label,
3 as width;

SELECT
'place_capacity_standup' as name,
'number' as type,  
'debout' as suffix,
'Nombre max ' as label,
3 as width;
















