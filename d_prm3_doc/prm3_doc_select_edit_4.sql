SELECT 'dynamic' AS component, sqlpage.run_sql('a_shells/shell_4.sql') AS properties;

select 
    'alert'                     as component,
    TRUE as important,
    'Les modifications dans le formulaire seront appliquées à tous les documents sélectionnées !' as description,
    'alert-triangle'            as icon,
      TRUE                       as dismissible,
    'yellow'                    as color;

SELECT 
    'form' as component,
    'Actualiser les métadonnées d''une série de documents' as title,
    'Actualiser' as validate,
    'Clear' as reset,
    '/d_prm3_doc/prm3_doc_select_update_0.sql?prm3_id='||$prm3_id as action

select 
    'prm3_doc_selected' as name,
    'hidden' as type,
     'yes' as value,
    'prm3_doc_selected' as label;

select 
    'prm3_doc_keywords' as name,
    'text' as type,
    'Mots clés' as label,
    'Séparez les mots par une virgule' as description,
    6 AS width;

SELECT 
    'prm3_doc_status'         as name,
    'Statut de publication'   as label,
    'select'                  as type,
    4                         AS width,
    'Choisir un statut de pubication' as empty_option,
    'Choisir un statut de pubication' as empty_option,
    json_group_array(json_object('label',i.choice_label, 'value', i.choice_value))  AS options
    FROM choices_items AS i
    LEFT JOIN (select choice_category_id, choice_category_name from choices_categories)  AS c 
    ON i.choice_category_id = c.choice_category_id
    where choice_category_name="status_publication"
    ORDER BY  i.choice_label ASC;

SELECT 
    'prm3_doc_category'        as name,
    'Catégorie'                 as label,
    'select'                 as type,
    4                       AS width,
    'Choisir une categorie...' as empty_option,
    json_group_array(json_object('label',i.choice_label, 'value', i.choice_value))  AS options
    FROM choices_items AS i
    LEFT JOIN (select choice_category_id, choice_category_name from choices_categories)  AS c 
    ON i.choice_category_id = c.choice_category_id
    where choice_category_name="doc_category"
    ORDER BY  i.choice_label ASC;

SELECT 
    'prm3_doc_type'        as name,
    'Type de document'   as label,
    'select'                  as type,
    4                         AS width,
    'Choisir un type...' as empty_option,
    json_group_array(json_object('label',i.choice_label, 'value', i.choice_value))  AS options
    FROM choices_items AS i
    LEFT JOIN (select choice_category_id, choice_category_name from choices_categories)  AS c 
    ON i.choice_category_id = c.choice_category_id
    where choice_category_name="doc_type"
    ORDER BY  i.choice_label ASC;

 SELECT 
    'prm3_doc_date_publication' as name,
    'Date de publication' as label,
    'date'       as type, 
    3 AS width,
    '^[0-9]{4}-(((0[13578]|(10|12))-(0[1-9]|[1-2][0-9]|3[0-1]))|(02-(0[1-9]|[1-2][0-9]))|((0[469]|11)-(0[1-9]|[1-2][0-9]|30)))$' as pattern, 
    'format : DD-MM-YYYY' as description;

 SELECT 
    'prm3_doc_date_period' as name,
    'Période concernée' as label,
    'text'       as type,
    2 AS width,
    '^[0-9]{4}$' as pattern, 
    'format : YYYY' as description;

 SELECT 
    'prm3_doc_lang'        as name,
    'Langue'               as label,
    'select'                as type,
    2                       AS width,
    'Choisir une langue...' as empty_option,
    json_group_array(json_object('label',i.choice_label, 'value', i.choice_value))  AS options
    FROM choices_items AS i
    LEFT JOIN (select choice_category_id, choice_category_name from choices_categories)  AS c 
    ON i.choice_category_id = c.choice_category_id
    where choice_category_name="lang"
    ORDER BY  i.choice_label ASC;
   
 SELECT 
    'prm3_doc_format'        as name,
    'Format'                 as label,
    'select'                 as type,
    2                       AS width,
    'Choisir un format...' as empty_option,
    json_group_array(json_object('label',i.choice_label, 'value', i.choice_value))  AS options
    FROM choices_items AS i
    LEFT JOIN (select choice_category_id, choice_category_name from choices_categories)  AS c 
    ON i.choice_category_id = c.choice_category_id
    where choice_category_name="doc_format"
    ORDER BY  i.choice_label ASC;
 

