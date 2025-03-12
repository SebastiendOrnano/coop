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
    'Gestion des membres'            as title,
    '/b_members/member_main_display_4.sql' as link;
select 
    'Gestion de sélections de membres'            as title,
    '/b_members/member_select_display_4.sql' as link;

select 
    'form'                                                      as component,
    'Actualisation des données des membres sélectionnés'        as title ,
    'Actualiser les données de la sélection'                    as validate,
    'green'                                                     as validate_color,
    '/b_members/member_select_update_0.sql'                     as action,
    'Clear'                                                     as reset;


SELECT 
    'member_gender'        as name,
    'Genre'               as label,
    'select'                as type,
    3                      AS width,
    'Choisir un genre...' as empty_option,
    json_group_array(json_object('label',i.choice_label, 'value', i.choice_value))  AS options
    FROM choices_items AS i
    LEFT JOIN (select choice_category_id, choice_category_name from choices_categories)  AS c 
    ON i.choice_category_id = c.choice_category_id
    where choice_category_name="gender"
    ORDER BY  i.choice_label ASC;


 SELECT 
    'member_category'        as name,
    'Categorie'               as label,
    'select'                as type,
    3                     AS width,
    'Choisir une categorie...' as empty_option,
    json_group_array(json_object('label',i.choice_label, 'value', i.choice_value))  AS options
    FROM choices_items AS i
    LEFT JOIN (select choice_category_id, choice_category_name from choices_categories)  AS c 
    ON i.choice_category_id = c.choice_category_id
    where choice_category_name="member_category"
    ORDER BY  i.choice_label ASC;

 SELECT 
    'member_status'        as name,
    'Status'               as label,
    'select'                as type,
    3                      AS width,
    'Choisir un statut...' as empty_option,
    json_group_array(json_object('label',i.choice_label, 'value', i.choice_value))  AS options
    FROM choices_items AS i
    LEFT JOIN (select choice_category_id, choice_category_name from choices_categories)  AS c 
    ON i.choice_category_id = c.choice_category_id
    where choice_category_name="status"
    ORDER BY  i.choice_label ASC;

SELECT 
    'member_publish'        as name,
    'Public/privé'               as label,
    'select'                as type,
    3                     AS width,
    'Profil public ou caché...' as empty_option,
    '[
    {"label": "Public", "value": "yes"},
    {"label": "Privé", "value": "no"}
    ]' as options;



SELECT 
    'member_date_since' as name,
    'Membre depuis'     as label,
    'date'              as type,
    4                   AS width,
   (select regex_value from regex where regex_name='date')         as pattern,
   (select regex_description from regex where regex_name='date')          as description;

SELECT 
    'member_date_last_subscription' as name,
    'Dernière date cotisation'      as label,
    'date'                          as type,
    4                               AS width,
   (select regex_value from regex where regex_name='date')         as pattern,
   (select regex_description from regex where regex_name='date')          as description;

SELECT 
    'member_function'       as name,
    'text'                  as type,
    'fonction'              as label,
    'fonction ou rôle dans l''organisation' as description,
    'directeur ou chargé de mission' AS placeholder,
     4                      AS width;

    
