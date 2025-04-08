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
    'liste des projets'            as title,
    '/e_project/project_main_display_4.sql'     as link;
 select 
    'hub du projet'            as title,
    '/e_project/project_hub_display_4.sql?project_id='||$project_id     as link; 
select 
    'Gestion des docs'            as title,
    '/e_project_docs/project_doc_main_display_4.sql?project_id='||$project_id     as link;

    
SELECT 
    'form'                                           as component,
    'Actualiser les métadonnées d''un document'      as title,
    'Actualiser'                                     as validate,
    'Clear'                                          as reset,
    '/e_project_docs/project_doc_main_update_0.sql?project_doc_id='||$project_doc_id||'&project_id='||$project_id as action

select 
    'project_doc_id'    as name,
    'hidden'         as type,
    $project_doc_id     as value,
    'id'              as label;

SELECT
    'project_doc_title'                     as name,
    'text'                               as type,  
    'Titre'                              as label,
    (select project_doc_title  FROM project_docs WHERE project_doc_id = $project_doc_id) as value,
    TRUE                                as required,
    6                                   AS width;

SELECT
    'project_doc_author'         as name,
    'text'                    as type,  
    'Author'                  as label,
    (select project_doc_author  FROM project_docs WHERE project_doc_id = $project_doc_id) as value,
    6                        AS width;

select 
    'file'                  as type, 
    'project_doc_url'          as name,
    'document à insérer'    as label,
    '*'                     as accept;

select 
    'project_doc_summary'     as name,
    'textarea'             as type,
    'Résumé'               as label,
    (select project_doc_summary FROM project_docs WHERE project_doc_id = $project_doc_id) as value,
    12                     AS width;

select 
    'project_doc_keywords'   as name,
    'text'                as type,
    'Mots clés'           as label,
    (select project_doc_keywords FROM project_docs WHERE project_doc_id = $project_doc_id) as value,
    'Séparez les mots par une virgule' as description,
    12                    AS width;

 SELECT 
    'project_doc_date_publication' as name,
    'Date de publication'       as label,
    'date'                      as type,
    (select project_doc_date_publication  FROM project_docs WHERE project_doc_id = $project_doc_id) as value,
    3                            AS width,
   (select regex_value from regex where regex_name='date')         as pattern,
   (select regex_description from regex where regex_name='date')          as description;

 SELECT 
    'project_doc_date_period'     as name,
    'Période concernée'        as label,
    'text'                      as type,
    (select project_doc_date_period  FROM project_docs WHERE project_doc_id = $project_doc_id) as value,
    2                         AS width,
   (select regex_value from regex where regex_name='year')         as pattern,
   (select regex_description from regex where regex_name='year')          as description;

 SELECT 
    'project_doc_lang'         as name,
    'Langue'                 as label,
    'select'                 as type,
    2                        AS width,
    (select project_doc_lang FROM project_docs WHERE project_doc_id = $project_doc_id) as value,
    json_group_array(json_object('label',i.choice_label, 'value', i.choice_value))  AS options
    FROM choices_items AS i
    LEFT JOIN (select choice_category_id, choice_category_name from choices_categories)  AS c 
    ON i.choice_category_id = c.choice_category_id
    where choice_category_name="lang"
    ORDER BY  i.choice_label ASC;


 SELECT 
    'project_doc_format'        as name,
    'Format'                 as label,
    'select'                 as type,
    2                       AS width,
   (select project_doc_format FROM project_docs WHERE project_doc_id = $project_doc_id) as value,
  'Choisir un format...' as empty_option,
    json_group_array(json_object('label',i.choice_label, 'value', i.choice_value))  AS options
    FROM choices_items AS i
    LEFT JOIN (select choice_category_id, choice_category_name from choices_categories)  AS c 
    ON i.choice_category_id = c.choice_category_id
    where choice_category_name="doc_format"
    ORDER BY  i.choice_label ASC;
 
SELECT 
    'project_doc_category'      as name,
    'Catégorie'              as label,
    'select'                 as type,
    3                       AS width,
    (select project_doc_category FROM project_docs WHERE project_doc_id = $project_doc_id) as value,
    'Choisir une categorie...' as empty_option,
    json_group_array(json_object('label',i.choice_label, 'value', i.choice_value))  AS options
    FROM choices_items AS i
    LEFT JOIN (select choice_category_id, choice_category_name from choices_categories)  AS c 
    ON i.choice_category_id = c.choice_category_id
    where choice_category_name="doc_category"
    ORDER BY  i.choice_label ASC;

SELECT 
    'project_doc_type'           as name,
    'Type de document'        as label,
    'select'                  as type,
    (select project_doc_type FROM project_docs WHERE project_doc_id = $project_doc_id) as value,
    3                         AS width,
    'Choisir un type...' as empty_option,
    json_group_array(json_object('label',i.choice_label, 'value', i.choice_value))  AS options
    FROM choices_items AS i
    LEFT JOIN (select choice_category_id, choice_category_name from choices_categories)  AS c 
    ON i.choice_category_id = c.choice_category_id
    where choice_category_name="doc_type"
    ORDER BY  i.choice_label ASC;

                                    
SELECT 
    'project_doc_status'    as name,
    'Statut de publication'   as label,
    'select'                  as type,
    3                         AS width,
    (select project_doc_status FROM project_docs WHERE project_doc_id = $project_doc_id) as value,
    'Choisir un statut de publication..' as empty_option,
    json_group_array(json_object('label',i.choice_label, 'value', i.choice_value))  AS options
    FROM choices_items AS i
    LEFT JOIN (select choice_category_id, choice_category_name from choices_categories)  AS c 
    ON i.choice_category_id = c.choice_category_id
    where choice_category_name="status_publication"
    ORDER BY  i.choice_label ASC;


