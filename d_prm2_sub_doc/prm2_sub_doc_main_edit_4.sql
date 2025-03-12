SELECT 'dynamic' AS component, sqlpage.run_sql('a_shells/shell_4.sql') AS properties;

set prm2_id = (select prm2_id from prm2_sub where prm2_sub_id=$prm2_sub_id);

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
    '/d_prm2_sub_doc/prm2_sub_doc_main_display_4.sql?prm2_sub_id='||$prm2_sub_id||'&prm2_id='||$prm2_id     as link;

SELECT 
    'form'                                           as component,
    'Actualiser les métadonnées d''un document'      as title,
    'Actualiser'                                     as validate,
    'Clear'                                          as reset,
    '/d_prm2_sub_doc/prm2_sub_doc_main_update_0.sql?prm2_sub_doc_id='||$prm2_sub_doc_id||'&prm2_sub_id='||$prm2_sub_id as action

select 
    'prm2_sub_id'    as name,
    'hidden'         as type,
    $prm2_sub_id     as value,
    'id'              as label;

SELECT
    'prm2_sub_doc_title'                     as name,
    'text'                               as type,  
    'Titre'                              as label,
    (select prm2_sub_doc_title  FROM prm2_sub_docs WHERE prm2_sub_doc_id = $prm2_sub_doc_id) as value,
    TRUE                                as required,
    6                                   AS width;

SELECT
    'prm2_sub_doc_author'         as name,
    'text'                    as type,  
    'Author'                  as label,
    (select prm2_sub_doc_author  FROM prm2_sub_docs WHERE prm2_sub_doc_id = $prm2_sub_doc_id) as value,
    6                        AS width;

select 
    'file'                  as type, 
    'prm2_sub_doc_url'          as name,
    'document à insérer'    as label,
    '*'                     as accept;

select 
    'prm2_sub_doc_summary'     as name,
    'textarea'             as type,
    'Résumé'               as label,
    (select prm2_sub_doc_summary FROM prm2_sub_docs WHERE prm2_sub_doc_id = $prm2_sub_doc_id) as value,
    12                     AS width;

select 
    'prm2_sub_doc_keywords'   as name,
    'text'                as type,
    'Mots clés'           as label,
    (select prm2_sub_doc_keywords FROM prm2_sub_docs WHERE prm2_sub_doc_id = $prm2_sub_doc_id) as value,
    'Séparez les mots par une virgule' as description,
    12                    AS width;

 SELECT 
    'prm2_sub_doc_date_publication' as name,
    'Date de publication'       as label,
    'date'                      as type,
    (select prm2_sub_doc_date_publication  FROM prm2_sub_docs WHERE prm2_sub_doc_id = $prm2_sub_doc_id) as value,
    3                            AS width,
   (select regex_value from regex where regex_name='date')         as pattern,
   (select regex_description from regex where regex_name='date')          as description;

 SELECT 
    'prm2_sub_doc_date_period'     as name,
    'Période concernée'        as label,
    'text'                      as type,
    (select prm2_sub_doc_date_period  FROM prm2_sub_docs WHERE prm2_sub_doc_id = $prm2_sub_doc_id) as value,
    2                         AS width,
   (select regex_value from regex where regex_name='year')         as pattern,
   (select regex_description from regex where regex_name='year')          as description;

 SELECT 
    'prm2_sub_doc_lang'         as name,
    'Langue'                 as label,
    'select'                 as type,
    2                        AS width,
    (select prm2_sub_doc_lang FROM prm2_sub_docs WHERE prm2_sub_doc_id = $prm2_sub_doc_id) as value,
    json_group_array(json_object('label',i.choice_label, 'value', i.choice_value))  AS options
    FROM choices_items AS i
    LEFT JOIN (select choice_category_id, choice_category_name from choices_categories)  AS c 
    ON i.choice_category_id = c.choice_category_id
    where choice_category_name="lang"
    ORDER BY  i.choice_label ASC;


 SELECT 
    'prm2_sub_doc_format'        as name,
    'Format'                 as label,
    'select'                 as type,
    2                       AS width,
   (select prm2_sub_doc_format FROM prm2_sub_docs WHERE prm2_sub_doc_id = $prm2_sub_doc_id) as value,
  'Choisir un format...' as empty_option,
    json_group_array(json_object('label',i.choice_label, 'value', i.choice_value))  AS options
    FROM choices_items AS i
    LEFT JOIN (select choice_category_id, choice_category_name from choices_categories)  AS c 
    ON i.choice_category_id = c.choice_category_id
    where choice_category_name="doc_format"
    ORDER BY  i.choice_label ASC;
 
SELECT 
    'prm2_sub_doc_category'      as name,
    'Catégorie'              as label,
    'select'                 as type,
    3                       AS width,
    (select prm2_sub_doc_category FROM prm2_sub_docs WHERE prm2_sub_doc_id = $prm2_sub_doc_id) as value,
    'Choisir une categorie...' as empty_option,
    json_group_array(json_object('label',i.choice_label, 'value', i.choice_value))  AS options
    FROM choices_items AS i
    LEFT JOIN (select choice_category_id, choice_category_name from choices_categories)  AS c 
    ON i.choice_category_id = c.choice_category_id
    where choice_category_name="doc_category"
    ORDER BY  i.choice_label ASC;

SELECT 
    'prm2_sub_doc_type'           as name,
    'Type de document'        as label,
    'select'                  as type,
    (select prm2_sub_doc_type FROM prm2_sub_docs WHERE prm2_sub_doc_id = $prm2_sub_doc_id) as value,
    3                         AS width,
    'Choisir un type...' as empty_option,
    json_group_array(json_object('label',i.choice_label, 'value', i.choice_value))  AS options
    FROM choices_items AS i
    LEFT JOIN (select choice_category_id, choice_category_name from choices_categories)  AS c 
    ON i.choice_category_id = c.choice_category_id
    where choice_category_name="doc_type"
    ORDER BY  i.choice_label ASC;

                                    
SELECT 
    'prm2_sub_doc_status'    as name,
    'Statut de publication'   as label,
    'select'                  as type,
    3                         AS width,
    (select prm2_sub_doc_status FROM prm2_sub_docs WHERE prm2_sub_doc_id = $prm2_sub_doc_id) as value,
    'Choisir un statut de publication..' as empty_option,
    json_group_array(json_object('label',i.choice_label, 'value', i.choice_value))  AS options
    FROM choices_items AS i
    LEFT JOIN (select choice_category_id, choice_category_name from choices_categories)  AS c 
    ON i.choice_category_id = c.choice_category_id
    where choice_category_name="status_publication"
    ORDER BY  i.choice_label ASC;


