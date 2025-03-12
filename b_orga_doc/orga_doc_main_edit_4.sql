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
    'Gestion des docs d''une filiale'            as title,
    '/b_orga_dept/orga_dept_doc_display_4.sql?orga_dept_id='||$orga_dept_id     as link;

SELECT 
    'form'                                           as component,
    'Actualiser les métadonnées d''un document'      as title,
    'Actualiser'                                     as validate,
    'Clear'                                          as reset,
    '/b_orga_doc/orga_doc_main_update_0.sql?orga_doc_id=' || $orga_doc_id as action

select 
    'orga_doc_id'    as name,
    'hidden'         as type,
    $orga_doc_id     as value,
    'id'              as label;

SELECT
    'orga_doc_title'                     as name,
    'text'                               as type,  
    'Titre'                              as label,
    (select orga_doc_title  FROM orga_docs WHERE orga_doc_id = $orga_doc_id) as value,
    TRUE                                as required,
    6                                   AS width;

SELECT
    'orga_doc_author'         as name,
    'text'                    as type,  
    'Author'                  as label,
    (select orga_doc_author  FROM orga_docs WHERE orga_doc_id = $orga_doc_id) as value,
    6                        AS width;

select 
    'file'                  as type, 
    'orga_doc_url'          as name,
    'document à insérer'    as label,
    '*'                     as accept;

select 
    'orga_doc_summary'     as name,
    'textarea'             as type,
    'Résumé'               as label,
    (select orga_doc_summary FROM orga_docs WHERE orga_doc_id = $orga_doc_id) as value,
    12                     AS width;

select 
    'orga_doc_keywords'   as name,
    'text'                as type,
    'Mots clés'           as label,
    (select orga_doc_keywords FROM orga_docs WHERE orga_doc_id = $orga_doc_id) as value,
    'Séparez les mots par une virgule' as description,
    12                    AS width;

select 
    'orga_dept_id' as name,
    'nom du département ou de la filiale' as label,
    'select' as type,
    12 AS width,
    TRUE as searchable,
    (select orga_dept_id FROM orga_docs WHERE orga_doc_id = $orga_doc_id) as value,
    TRUE as empty_option,
    'Saisissez quelques lettres du titre que vous cherchez ou choississez dans la liste' as description,
    json_group_array(json_object('label',o.orga_name||'('||o.orga_id||')--'||d.orga_dept_name||'('||d.orga_dept_id ||')', 'value', d.orga_dept_id))  AS options
    FROM orga_dept AS d
    LEFT JOIN orga AS o 
    ON d.orga_id = o.orga_id
    ORDER BY  o.orga_name ASC, d.orga_dept_name ASC;

 SELECT 
    'orga_doc_date_publication' as name,
    'Date de publication'       as label,
    'date'                      as type,
    (select orga_doc_date_publication  FROM orga_docs WHERE orga_doc_id = $orga_doc_id) as value,
    3                            AS width,
  (select regex_value from regex where regex_name='date')         as pattern,
   (select regex_description from regex where regex_name='date')          as description;

 SELECT 
    'orga_doc_date_period'     as name,
    'Période concernée'        as label,
    'text'                      as type,
    (select orga_doc_date_period  FROM orga_docs WHERE orga_doc_id = $orga_doc_id) as value,
    2                         AS width,
  (select regex_value from regex where regex_name='year')         as pattern,
   (select regex_description from regex where regex_name='year')          as description;

 SELECT 
    'orga_doc_lang'         as name,
    'Langue'                 as label,
    'select'                 as type,
    2                        AS width,
    (select orga_doc_lang FROM orga_docs WHERE orga_doc_id = $orga_doc_id) as value,
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
   (select orga_doc_format FROM orga_docs WHERE orga_doc_id = $orga_doc_id) as value,
  'Choisir un format...' as empty_option,
    json_group_array(json_object('label',i.choice_label, 'value', i.choice_value))  AS options
    FROM choices_items AS i
    LEFT JOIN (select choice_category_id, choice_category_name from choices_categories)  AS c 
    ON i.choice_category_id = c.choice_category_id
    where choice_category_name="doc_format"
    ORDER BY  i.choice_label ASC;
 
SELECT 
    'orga_doc_number_page' as name,
    'number'               as type,
    'Nombre de pages'     as label,
    (select orga_doc_number_page FROM orga_docs WHERE orga_doc_id = $orga_doc_id) as value,
    3                     AS width;


SELECT 
    'orga_doc_category'      as name,
    'Catégorie'              as label,
    'select'                 as type,
    3                       AS width,
    (select orga_doc_category FROM orga_docs WHERE orga_doc_id = $orga_doc_id) as value,
    'Choisir une categorie...' as empty_option,
    json_group_array(json_object('label',i.choice_label, 'value', i.choice_value))  AS options
    FROM choices_items AS i
    LEFT JOIN (select choice_category_id, choice_category_name from choices_categories)  AS c 
    ON i.choice_category_id = c.choice_category_id
    where choice_category_name="doc_category"
    ORDER BY  i.choice_label ASC;

SELECT 
    'orga_doc_type'           as name,
    'Type de document'        as label,
    'select'                  as type,
    (select orga_doc_type FROM orga_docs WHERE orga_doc_id = $orga_doc_id) as value,
    3                         AS width,
    'Choisir un type...' as empty_option,
    json_group_array(json_object('label',i.choice_label, 'value', i.choice_value))  AS options
    FROM choices_items AS i
    LEFT JOIN (select choice_category_id, choice_category_name from choices_categories)  AS c 
    ON i.choice_category_id = c.choice_category_id
    where choice_category_name="doc_type"
    ORDER BY  i.choice_label ASC;

SELECT 
    'orga_doc_edition'       as name,
    'Statut d''édition'      as label,
    'select'                 as type,
    3                        AS width,
    (select orga_doc_edition FROM orga_docs WHERE orga_doc_id = $orga_doc_id) as value,
    'Choisir un statut d''édition...' as empty_option,
    '[
    {"label": "Validé", "value": "valid"},
    {"label": "Brouillon", "value": "draft"},
    {"label": "autre", "value": "unknown"}
    ]'                        as options;
                                     
SELECT 
    'orga_doc_publication'    as name,
    'Statut de publication'   as label,
    'select'                  as type,
    3                         AS width,
    (select orga_doc_publication FROM orga_docs WHERE orga_doc_id = $orga_doc_id) as value,
    'Choisir un statut de publication..' as empty_option,
    json_group_array(json_object('label',i.choice_label, 'value', i.choice_value))  AS options
    FROM choices_items AS i
    LEFT JOIN (select choice_category_id, choice_category_name from choices_categories)  AS c 
    ON i.choice_category_id = c.choice_category_id
    where choice_category_name="publication_status"
    ORDER BY  i.choice_label ASC;


