SELECT 'dynamic' AS component, sqlpage.run_sql('a_shells/shell_3.sql') AS properties;

select 
    'breadcrumb' as component;
select 
    'Home' as title,
    '/'    as link;
select 
    'Gestion editeur'         as title,
    '/a_panels/panel_editor_3.sql' as link;
select 
    'Gestion des groupements'            as title,
    '/d_prm3/prm3_main_display_3.sql'      as link;

SELECT 
    'form' as component,
    'Actualiser les données d''une organisation' as title,
    'Mettre à jour' as validate,
    'Clear' as reset,
    '/d_prm3/prm3_main_update_0.sql?prm3_id='||$prm3_id  as action;

 SELECT 
    'prm3_status'            as name,
    'Statut'                 as label,
    'select'                 as type,
    2 AS width,
    TRUE                     as required,
    (select prm3_status  FROM prm3 WHERE prm3_id = $prm3_id) as value,
    'Choisir un statut dans la liste...' as  empty_option,
    json_group_array(json_object('label',i.choice_label, 'value', i.choice_value))  AS options
    FROM choices_items AS i
    LEFT JOIN (select choice_category_id, choice_category_name from choices_categories)  AS c 
    ON i.choice_category_id = c.choice_category_id
    where choice_category_name="status"
    ORDER BY  i.choice_label ASC;

SELECT
    'prm3_name' as name,
    'text' as type,  
    'Nom' as label,
    8 AS width,
    TRUE as required,
    (select prm3_name  FROM prm3 WHERE prm3_id = $prm3_id) as value;

SELECT
    'prm3_summary' as name,
    'textarea' as type,  
    'Pitch' as label,
    (select prm3_summary  FROM prm3 WHERE prm3_id = $prm3_id) as value;

SELECT 
    'prm3_type'            as name,
    'Type de groupt'                 as label,
    'select'                       as type,
    3                              AS width,
    (select prm3_type  FROM prm3 WHERE prm3_id = $prm3_id) as value,
    'Choisir un type dans la liste...'    as  empty_option,
    json_group_array(json_object('label',i.choice_label, 'value', i.choice_value))  AS options
    FROM choices_items AS i
    LEFT JOIN (select choice_category_id, choice_category_name from choices_categories)  AS c 
    ON i.choice_category_id = c.choice_category_id
    where choice_category_name="prm3_type"
    ORDER BY  i.choice_label ASC;

SELECT 
    'prm3_category'            as name,
    'Statut légal'                 as label,
    'select'                       as type,
    3                              AS width,
    (select prm3_category  FROM prm3 WHERE prm3_id = $prm3_id) as value,
    'Choisir une categorie dans la liste...'    as  empty_option,
    json_group_array(json_object('label',i.choice_label, 'value', i.choice_value))  AS options
    FROM choices_items AS i
    LEFT JOIN (select choice_category_id, choice_category_name from choices_categories)  AS c 
    ON i.choice_category_id = c.choice_category_id
    where choice_category_name="prm3_category"
    ORDER BY  i.choice_label ASC;

SELECT 
    'prm3_formal'            as name,
    'Formel-Informel'                 as label,
    'select'                       as type,
    3                              AS width,
      (select prm3_formal  FROM prm3 WHERE prm3_id = $prm3_id) as value,
    'Choisir un statut dans la liste...'    as  empty_option,
    '[{"label": "formel", "value": "formal"},
    {"label": "informel", "value": "informal"},
    {"label": "autre", "value": "N"}
    ]'  as options;

SELECT 
    'prm3_date_creation' as name,
    'Date de création'       as label,
    'date'                      as type,
    (select prm3_date_creation  FROM prm3 WHERE prm3_id = $prm3_id) as value,
    3                            AS width,
   (select regex_value from regex where regex_name='date')         as pattern,
   (select regex_description from regex where regex_name='date')          as description;
