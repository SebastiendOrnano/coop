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

select 
    'form'                        as component,
    'Mise à jour d''une section'  as title ,
    'Mettre à jour de la section' as validate,
    'Annuler'                     as reset,
    'green'                       as validate_color,
    '/a_info/section_main_update_0.sql?section_id=' || (select section_id FROM  info_sections WHERE section_id = $section_id)  as action;

select 
    'section_id' as name,
    'hidden' as type,
     4                     AS width,
    (select section_id  FROM  info_sections WHERE section_id = $section_id)   as value,
    'Id' as label;

select 
    'section_category' as name,
    'readonly' as type,
     4                     AS width,
    (select section_category  FROM  info_sections WHERE section_id = $section_id)   as value,
    'Catégorie' as label;

select 
    'section_number'      as name,
    'text'                as type,
    2                    AS width,
    'N° d''ordre de la section' as label,
    (select section_number  FROM  info_sections WHERE section_id = $section_id)   as value;
   
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
    'section_status'        as name,
    'statut de publication actuel'      as label,
    'select'                            as type,
    4                    AS width,
    'choisir un statut dans la liste...'    as  empty_option,
    json_group_array(json_object('label',i.choice_label, 'value', i.choice_value))  AS options
    FROM choices_items AS i
    LEFT JOIN (select choice_category_id, choice_category_name from choices_categories)  AS c 
    ON i.choice_category_id = c.choice_category_id
    where choice_category_name="status"
    ORDER BY  i.choice_label ASC;

SELECT 
    'section_title' as name,
    'text' as type,
    (select section_title  FROM  info_sections WHERE section_id = $section_id)   as value,
    'titre de la section' as label;

SELECT
    'section_content' as name,
    'textarea' as type,  
    'Contenu de la section' as label,
    (select section_content  FROM info_sections WHERE section_id = $section_id) as value;


