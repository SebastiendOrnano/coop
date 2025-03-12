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
    '/b_orga_doc/orga_doc_select_update_0.sql' as action

select 
    'orga_doc_selected' as name,
    'hidden' as type,
     'yes' as value,
    'orga_doc_selected' as label;

select 
    'orga_doc_author' as name,
    'text' as type,
    'Auteur(s)' as label,
    6 AS width;

select 
    'orga_doc_keywords' as name,
    'text' as type,
    'Mots clés' as label,
    'Séparez les mots par une virgule' as description,
    6 AS width;

 SELECT 
    'orga_doc_date_publication' as name,
    'Date de publication' as label,
    'date'       as type, 
    3 AS width,
  (select regex_value from regex where regex_name='date')         as pattern,
   (select regex_description from regex where regex_name='date')          as description;

 SELECT 
    'orga_doc_date_period' as name,
    'Période concernée' as label,
    'text'       as type,
    2 AS width,
  (select regex_value from regex where regex_name='year')         as pattern,
   (select regex_description from regex where regex_name='year')          as description;

 SELECT 
    'orga_doc_lang'        as name,
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
    'orga_doc_format'        as name,
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
 
SELECT 
    'orga_doc_page_number' as name,
    'number' as type,
    'Nombre de pages' as label,
    '^[0-9]{4})$' as pattern, 
    'format : 1234' as description,
    3 AS width;

SELECT 
    'orga_doc_category'        as name,
    'Catégorie'                 as label,
    'select'                 as type,
    3                       AS width,
    'Choisir une categorie...' as empty_option,
    json_group_array(json_object('label',i.choice_label, 'value', i.choice_value))  AS options
    FROM choices_items AS i
    LEFT JOIN (select choice_category_id, choice_category_name from choices_categories)  AS c 
    ON i.choice_category_id = c.choice_category_id
    where choice_category_name="doc_category"
    ORDER BY  i.choice_label ASC;

SELECT 
    'orga_doc_type'        as name,
    'Type de document'   as label,
    'select'                  as type,
    3                         AS width,
    'Choisir un type...' as empty_option,
    json_group_array(json_object('label',i.choice_label, 'value', i.choice_value))  AS options
    FROM choices_items AS i
    LEFT JOIN (select choice_category_id, choice_category_name from choices_categories)  AS c 
    ON i.choice_category_id = c.choice_category_id
    where choice_category_name="doc_type"
    ORDER BY  i.choice_label ASC;



SELECT 
    'orga_doc_edition'        as name,
    'Statut d''édition'      as label,
    'select'                 as type,
    3                        AS width,
    'Choisir un statut...' as empty_option,
    '[
    {"label": "Validé", "value": "valid"},
    {"label": "Brouillon", "value": "draft"},
    {"label": "autre", "value": "unknown"}
    ]' as options;

SELECT 
    'orga_doc_publication'        as name,
    'Statut de publication'   as label,
    'select'                  as type,
    3                         AS width,
    'Choisir un statut de pubication' as empty_option,
    '[
    {"label": "En ligne", "value": "yes"},
    {"label": "En attente de mise en ligne", "value": "no"},
    {"label": "doc archivé", "value": "archived"}    
    ]' as options;





