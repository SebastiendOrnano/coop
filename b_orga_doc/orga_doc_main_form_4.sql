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
    'Gestion des documents'            as title,
     '/b_orga_dept/orga_dept_doc_display_4.sql?orga_dept_id='||$orga_dept_id  as link;

SELECT 
    'form' as component,
    'Créer un document' as title,
    'Créer' as validate,
    'Clear' as reset,
    '/b_orga_doc/orga_doc_main_create_0.sql' as action;

SELECT
    'orga_doc_title' as name,
    'text' as type,  
    'Titre' as label,
    'Choisissez un titre explicite pour faciliter les recherches' as description,
    'Rapport d''activité 2024' as placeholder,
    TRUE as required,
    6 AS width;

SELECT
    'orga_doc_author' as name,
    'text' as type,  
    'Author' as label,
    6 AS width;

select 
    'file' as type, 
    'orga_doc_url' as name,
    'document à insérer' as label,
    '*'  as accept,
    'size max : 5 MB' as description,
    TRUE       as required;

select 
    'orga_doc_summary' as name,
    'textarea' as type,
    'Résumé' as label,
    12 AS width;

select 
    'orga_doc_keywords' as name,
    'text' as type,
    'Mots clés' as label,
    'Séparez les mots par une virgule' as description,
    12 AS width;

select 
    'orga_dept_id' as name,
    'nom du département ou de la filiale' as label,
    'select' as type,
    12 AS width,
    TRUE as searchable,
     TRUE       as required,
    TRUE as empty_option,
   'Saisissez quelques lettres et choississez dans la liste' as description,
    json_group_array(json_object('label',o.orga_name||'('||o.orga_id||')--'||d.orga_dept_name||'('||d.orga_dept_id ||')', 'value', d.orga_dept_id))  AS options
    FROM orga_dept AS d
    LEFT JOIN orga AS o 
    ON d.orga_id = o.orga_id
    ORDER BY  o.orga_name ASC, d.orga_dept_name ASC;

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
    json_group_array(json_object('label',i.choice_label, 'value', i.choice_value))  AS options
    FROM choices_items AS i
    LEFT JOIN (select choice_category_id, choice_category_name from choices_categories)  AS c 
    ON i.choice_category_id = c.choice_category_id
    where choice_category_name="status"
    ORDER BY  i.choice_label ASC;





