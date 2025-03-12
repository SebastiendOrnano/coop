SELECT 'dynamic' AS component, sqlpage.run_sql('a_shells/shell_5.sql') AS properties;

select 
    'breadcrumb' as component;
select 
    'Home' as title,
    '/'    as link;
select 
    'Gestion Admin'            as title,
 '/a_panels/panel_admin_5.sql' as link;
 select 
    'Retour Gestion des utilisateur actifs'         as title,
    '/a_users/user_main_display_5.sql'            as link;


SELECT
    'form'                                as component,
    'Droits de l''utilisateur'            as title,
    'Mettre à jour les droits de l''utilisateur' as validate,
    'green'                              as validate_color,
    '/a_users/user_main_update_0.sql?user_id='||$user_id as action,
    'Clear'                                as reset;

SELECT 
    'username'           AS name,
    'Nom d''utilisateur' AS label,
    TRUE                as readonly,
    12                  AS width,
  (select username FROM users where user_id=$user_id) as value;

 SELECT 
    'user_gender'        as name,
    'Genre'               as label,
    'select'                as type,
    TRUE                as readonly,
    (select user_gender FROM users where user_id=$user_id) as value,
    2                     AS width,
    'Choisir un genre...' as empty_option,
    json_group_array(json_object('label',i.choice_label, 'value', i.choice_value))  AS options
    FROM choices_items AS i
    LEFT JOIN (select choice_category_id, choice_category_name from choices_categories)  AS c 
    ON i.choice_category_id = c.choice_category_id
    where choice_category_name="gender"
    ORDER BY  i.choice_label ASC;

SELECT 
    'user_first_name'    AS name,
    'Prénom'             AS label,
    TRUE                as readonly,
    4                   AS width,
  (select username FROM users where user_id=$user_id) as value;

SELECT 
    'user_last_name'     AS name,
    'Nom de famille'     AS label,
    TRUE                as readonly,
    4                  AS width,
  (select username FROM users where user_id=$user_id) as value;

SELECT 
    'user_short_cv'        as name,
    'CV de l''utilisateur' as label,
    'textarea'             as type,
     TRUE                  as readonly,
    12                     AS width,
 (select user_short_cv FROM users where user_id=$user_id) as value;
 
SELECT 
    'user_role'                   as name,
    'Role'                       as label,
    'select'                     as type,
    3                            AS width,
    (select user_role from users where user_id=$user_id) as value,
    'Choisir un role dans la liste...'    as  empty_option,
    json_group_array(json_object('label',i.choice_label, 'value', i.choice_value))  AS options
    FROM choices_items AS i
    LEFT JOIN (select choice_category_id, choice_category_name from choices_categories)  AS c 
    ON i.choice_category_id = c.choice_category_id
    where choice_category_name="user_role"
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

SELECT 
    'user_status'                   as name,
    'Statut'      as label,
    'select'                     as type,
    3                            AS width,
    (select user_status from users where user_id=$user_id) as value,
    'Choisir un role dans la liste...'    as  empty_option,
    json_group_array(json_object('label',i.choice_label, 'value', i.choice_value))  AS options
    FROM choices_items AS i
    LEFT JOIN (select choice_category_id, choice_category_name from choices_categories)  AS c 
    ON i.choice_category_id = c.choice_category_id
    where choice_category_name="status"
    ORDER BY  i.choice_label ASC;

    
