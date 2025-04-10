SELECT 'dynamic' AS component, sqlpage.run_sql('a_shells/shell_5.sql') AS properties;

select 
    'breadcrumb' as component;
select 
    'Home' as title,
    '/'    as link;
select 
    'Gestion admin'         as title,
    '/a_panels/panel_admin_5.sql' as link;
 select 
    'Liste des sections'            as title,
    '/a_info/section_main_display_5.sql'     as link;   

SELECT 
    'form' as component,
    'Info sur le site - Infos légales - CGU - Help - Overview' as title,
    'Créer' as validate,
    'Clear' as reset,
    '/a_info/section_main_create_0.sql' as action;

SELECT 
    'section_category'           as name,
    'Choix de la catégorie'      as label,
    'select'                     as type,
    TRUE                                         as required,
    4                            AS width,
    'choisir unstatut dans la liste...'    as  empty_option,
    json_group_array(json_object('label',i.choice_label, 'value', i.choice_value))  AS options
    FROM choices_items AS i
    LEFT JOIN (select choice_category_id, choice_category_name from choices_categories)  AS c 
    ON i.choice_category_id = c.choice_category_id
    where choice_category_name="legal_info"
    ORDER BY  i.choice_label ASC;

SELECT 
    'section_status'        as name,
    'statut de publication actuel'      as label,
    'select'                            as type,
    4                                   AS width,
    TRUE                                         as required,
    'choisir unstatut dans la liste...'    as  empty_option,
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
    TRUE                                         as required,
    2 as width,
    '1, 2, 3...' AS description;

SELECT
    'section_lang'                               as name,
    'select'                                     as type,  
    'Langue'                                     as label,
    TRUE                                         as required,
    2                                            AS width,
    'choisir unstatut dans la liste...'    as  empty_option,
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
    TRUE                                         as required,
    'Titre de la section' AS placeholder;

SELECT
    'section_content' as name,
    'textarea' as type,  
    'Contenu de la section' as label,
    'Contenu de la section au format markdown' AS description;

