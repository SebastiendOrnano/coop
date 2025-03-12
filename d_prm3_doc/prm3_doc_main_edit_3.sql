SELECT 'dynamic' AS component, sqlpage.run_sql('a_shells/shell_3.sql') AS properties;

select 
    'breadcrumb' as component;
select 
    'Home' as title,
    '/'    as link;
select 
    'Gestion Superviseur'         as title,
    '/a_panels/panel_supervisor_4.sql' as link;
select 
    'Gestion des docs d''une personne'            as title,
    '/d_prm3_dept/prm3_dept_doc_display_4.sql?prm3_dept_id='||$prm3_dept_id     as link;

SELECT 
    'form'                                           as component,
    'Actualiser les métadonnées d''un document'      as title,
    'Actualiser'                                     as validate,
    'Clear'                                          as reset,
    '/d_prm3_doc/prm3_doc_main_update_0.sql?prm3_doc_id='||$prm3_doc_id as action

SELECT
    'prm3_doc_title'                     as name,
    'text'                               as type,  
    'Titre'                              as label,
    (select prm3_doc_title  FROM prm3_docs WHERE prm3_doc_id = $prm3_doc_id) as value,
    TRUE                                as required,
    6                                   AS width;

SELECT
    'prm3_doc_author'         as name,
    'text'                    as type,  
    'Author'                  as label,
    (select prm3_doc_author  FROM prm3_docs WHERE prm3_doc_id = $prm3_doc_id) as value,
    6                        AS width;

select 
    'file'                  as type, 
    'prm3_doc_url'          as name,
    'document à insérer'    as label,
    '*'                     as accept;

select 
    'prm3_doc_summary'     as name,
    'textarea'             as type,
    'Résumé'               as label,
    (select prm3_doc_summary FROM prm3_docs WHERE prm3_doc_id = $prm3_doc_id) as value,
    12                     AS width;

select 
    'prm3_doc_keywords'   as name,
    'text'                as type,
    'Mots clés'           as label,
    (select prm3_doc_keywords FROM prm3_docs WHERE prm3_doc_id = $prm3_doc_id) as value,
    'Séparez les mots par une virgule' as description,
    12                    AS width;

SELECT 
    'prm3_doc_status'    as name,
    'Statut de publication'   as label,
    'select'                  as type,
    4                         AS width,
    (select prm3_doc_status FROM prm3_docs WHERE prm3_doc_id = $prm3_doc_id) as value,
    'Choisir un statut de pubication' as empty_option,
    json_group_array(json_object('label',i.choice_label, 'value', i.choice_value))  AS options
    FROM choices_items AS i
    LEFT JOIN (select choice_category_id, choice_category_name from choices_categories)  AS c 
    ON i.choice_category_id = c.choice_category_id
    where choice_category_name="status_publication"
    ORDER BY  i.choice_label ASC;

SELECT 
    'prm3_doc_category'      as name,
    'Catégorie'              as label,
    'select'                 as type,
    4                       AS width,
    (select prm3_doc_category FROM prm3_docs WHERE prm3_doc_id = $prm3_doc_id) as value,
    'Choisir une categorie...' as empty_option,
    json_group_array(json_object('label',i.choice_label, 'value', i.choice_value))  AS options
    FROM choices_items AS i
    LEFT JOIN (select choice_category_id, choice_category_name from choices_categories)  AS c 
    ON i.choice_category_id = c.choice_category_id
    where choice_category_name="doc_category"
    ORDER BY  i.choice_label ASC;

SELECT 
    'prm3_doc_type'           as name,
    'Type de document'        as label,
    'select'                  as type,
    (select prm3_doc_type FROM prm3_docs WHERE prm3_doc_id = $prm3_doc_id) as value,
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
    'Date de publication'       as label,
    'date'                      as type,
    (select prm3_doc_date_publication  FROM prm3_docs WHERE prm3_doc_id = $prm3_doc_id) as value,
    3                            AS width,
    '^[0-9]{4}-(((0[13578]|(10|12))-(0[1-9]|[1-2][0-9]|3[0-1]))|(02-(0[1-9]|[1-2][0-9]))|((0[469]|11)-(0[1-9]|[1-2][0-9]|30)))$' as pattern, 
    'format : DD-MM-YYYY'       as description;

 SELECT 
    'prm3_doc_date_period'     as name,
    'Période concernée'        as label,
    'text'                      as type,
    (select prm3_doc_date_period  FROM prm3_docs WHERE prm3_doc_id = $prm3_doc_id) as value,
    2                         AS width,
    '^[0-9]{4}$'              as pattern, 
    'format : YYYY'            as description;

 SELECT 
    'prm3_doc_lang'         as name,
    'Langue'                 as label,
    'select'                 as type,
    2                        AS width,
    (select prm3_doc_lang FROM prm3_docs WHERE prm3_doc_id = $prm3_doc_id) as value,
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
   (select prm3_doc_format FROM prm3_docs WHERE prm3_doc_id = $prm3_doc_id) as value,
  'Choisir un format...' as empty_option,
    json_group_array(json_object('label',i.choice_label, 'value', i.choice_value))  AS options
    FROM choices_items AS i
    LEFT JOIN (select choice_category_id, choice_category_name from choices_categories)  AS c 
    ON i.choice_category_id = c.choice_category_id
    where choice_category_name="doc_format"
    ORDER BY  i.choice_label ASC;
 


                                    



