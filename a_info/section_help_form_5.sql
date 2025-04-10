SELECT 'dynamic' AS component, sqlpage.run_sql('a_shells/shell_5.sql') AS properties;

select 
    'breadcrumb' as component;
select 
    'Home' as title,
    '/'    as link;
select 
    'Gestion Admin'         as title,
    '/a_panels/panel_admin_5.sql' as link;

select 
    'Gestion des sections d''aide'            as title,
    '/a_info/section_help_display_5.sql' as link;



SELECT 
    'form' as component,
    'Section de l''aide pour les dev' as title,
    'Créer' as validate,
    'Clear' as reset,
    '/a_info/section_help_create_0.sql' as action;

SELECT 
    'section_status'        as name,
    'statut de publication actuel'      as label,
    'select'                            as type,
    4                                   AS width,
    'choisir un statut dans la liste...'    as  empty_option,
    json_group_array(json_object('label',i.choice_label, 'value', i.choice_value))  AS options
    FROM choices_items AS i
    LEFT JOIN (select choice_category_id, choice_category_name from choices_categories)  AS c 
    ON i.choice_category_id = c.choice_category_id
    where choice_category_name="status"
    ORDER BY  i.choice_label ASC;

SELECT
    'section_number' as name,
    'number' as type,  
    'Numéro de la section' as label,
    2 as width,
    '1, 2, 3...' AS description;

SELECT
    'section_lang'                               as name,
    'select'                                     as type,  
    'Langue'                                     as label,
    TRUE                                         as required,
    2                                            AS width,
    'choisir une langue dans la liste...'    as  empty_option,
    json_group_array(json_object('label',i.choice_label, 'value', i.choice_value))  AS options
    FROM choices_items AS i
    LEFT JOIN (select choice_category_id, choice_category_name from choices_categories)  AS c 
    ON i.choice_category_id = c.choice_category_id
    where choice_category_name="lang"
    ORDER BY  i.choice_label ASC;

SELECT
    'section_title' as name,
    'text' as type,  
    'Titre de la section' as label,
    'Titre de la section' AS placeholder;

SELECT
    'section_content' as name,
    'textarea' as type,  
    'Contenu de la section' as label,
    'Contenu de la section au format markdown' AS description;



