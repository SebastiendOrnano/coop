SELECT 'dynamic' AS component, sqlpage.run_sql('a_shells/shell_5.sql') AS properties;

select 
    'form'                                                      as component,
    'Actualisation des données des utilisateurs sélectionnés'        as title ,
    'Actualiser les données de la sélection'                    as validate,
    'green'                                                     as validate_color,
    '/a_users/user_select_update_0.sql'                     as action,
    'Clear'                                                     as reset;

SELECT 
    'user_gender'        as name,
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
    'user_status'        as name,
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
    'user_role'            as name,
    'Role'               as label,
    'select'                as type,
    3                      AS width,
    'Choisir un statut...' as empty_option,
    json_group_array(json_object('label',i.choice_label, 'value', i.choice_value))  AS options
    FROM choices_items AS i
    LEFT JOIN (select choice_category_id, choice_category_name from choices_categories)  AS c 
    ON i.choice_category_id = c.choice_category_id
    where choice_category_name="user_role"
    ORDER BY  i.choice_label ASC;

SELECT 
    'user_lang'            as name,
    'Role'               as label,
    'select'                as type,
    3                      AS width,
    'Choisir une langue...' as empty_option,
    json_group_array(json_object('label',i.choice_label, 'value', i.choice_value))  AS options
    FROM choices_items AS i
    LEFT JOIN (select choice_category_id, choice_category_name from choices_categories)  AS c 
    ON i.choice_category_id = c.choice_category_id
    where choice_category_name="lang"
    ORDER BY  i.choice_label ASC;

SELECT 
    'user_group'                   as name,
    'Permission Groupe'      as label,
    'select'                     as type,
    3                            AS width,
    (select user_group from users where user_id=$user_id) as value,
    'Choisir un role dans la liste...'    as  empty_option,
    json_group_array(json_object('label',i.choice_label, 'value', i.choice_value))  AS options
    FROM choices_items AS i
    LEFT JOIN (select choice_category_id, choice_category_name from choices_categories)  AS c 
    ON i.choice_category_id = c.choice_category_id
    where choice_category_name="user_group"
    ORDER BY  i.choice_label ASC;

SELECT 
    'user_level'                   as name,
    'Permission Données'      as label,
    'select'                     as type,
    3                            AS width,
    (select user_level from users where user_id=$user_id) as value,
    'Choisir un role dans la liste...'    as  empty_option,
    json_group_array(json_object('label',i.choice_label, 'value', i.choice_value))  AS options
    FROM choices_items AS i
    LEFT JOIN (select choice_category_id, choice_category_name from choices_categories)  AS c 
    ON i.choice_category_id = c.choice_category_id
    where choice_category_name="user_level"
    ORDER BY  i.choice_label ASC;
