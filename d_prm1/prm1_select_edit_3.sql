SELECT 'dynamic' AS component, sqlpage.run_sql('a_shells/shell_3.sql') AS properties;

select 
    'form'                                                      as component,
    'Actualisation des données des personnes sélectionnées'        as title ,
    'Actualiser les données de la sélection'                    as validate,
    'green'                                                     as validate_color,
    '/d_prm1/prm1_select_update_0.sql'                     as action,
    'Clear'                                                     as reset;

SELECT 
    'prm1_gender'        as name,
    'Genre'               as label,
    'select'                as type,
    3                      AS width,
    'Choisir un genre...' as empty_option,
    json_group_array(json_object('label',i.choice_label, 'value', i.choice_value))  AS options
    FROM choices_items AS i
    LEFT JOIN (select choice_category_id, choice_category_name from choices_categories)  AS c 
    ON i.choice_category_id = c.choice_category_id
    where choice_category_name="gender"
    ORDER BY  i.choice_label ASC;

 SELECT 
    'prm1_category'        as name,
    'Categorie'               as label,
    'select'                as type,
    3                     AS width,
    'Choisir une categorie...' as empty_option,
    json_group_array(json_object('label',i.choice_label, 'value', i.choice_value))  AS options
    FROM choices_items AS i
    LEFT JOIN (select choice_category_id, choice_category_name from choices_categories)  AS c 
    ON i.choice_category_id = c.choice_category_id
    where choice_category_name="prm1_category"
    ORDER BY  i.choice_label ASC;

 SELECT 
    'prm1_status'        as name,
    'Status'               as label,
    'select'                as type,
    3                      AS width,
    'Choisir un statut...' as empty_option,
    json_group_array(json_object('label',i.choice_label, 'value', i.choice_value))  AS options
    FROM choices_items AS i
    LEFT JOIN (select choice_category_id, choice_category_name from choices_categories)  AS c 
    ON i.choice_category_id = c.choice_category_id
    where choice_category_name="status"
    ORDER BY  i.choice_label ASC;

SELECT 
    'prm1_function'       as name,
    'text'                  as type,
    'fonction'              as label,
     4                      AS width;

    
