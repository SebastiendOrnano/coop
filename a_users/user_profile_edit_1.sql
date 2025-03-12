SELECT 'dynamic' AS component, sqlpage.run_sql('a_shells/shell_1.sql') AS properties;

select 
    'form'            as component,
    'Mon profil'            as title,
    'Mettre à jour mon profil' as validate,
    'green'           as validate_color,
    '/a_users/user_profile_update_0.sql?user_id='||$user_id as action,
    'Clear'           as reset;

select 
    'username' as name,
    'Nom d''utilisateur' as label,
    'Doe'       as placeholder,
    TRUE as readonly,
    (select username FROM users where user_id=$user_id) as value,
    12          as width;

 SELECT 
    'user_gender'        as name,
    'Genre'               as label,
    'select'                as type,
    (select user_gender FROM users where user_id=$user_id) as value,
    2                     AS width,
    'Choisir un genre...' as empty_option,
    json_group_array(json_object('label',i.choice_label, 'value', i.choice_value))  AS options
    FROM choices_items AS i
    LEFT JOIN (select choice_category_id, choice_category_name from choices_categories)  AS c 
    ON i.choice_category_id = c.choice_category_id
    where choice_category_name="gender"
    ORDER BY  i.choice_label ASC;


select 
    'user_first_name' as name,
    'Prénom' as label,
    'text' as type,
    'jean'  as placeholder,
    (select user_first_name FROM users where user_id=$user_id) as value,
    4            as width;

select 
    'user_last_name' as name,
    'Nom de famille' as label,
    'text' as type,
    'Dupont'       as placeholder,
    (select user_last_name FROM users where user_id=$user_id) as value,
    4            as width;

SELECT
    'user_phone' as name,
    'text' as type, 
    3 AS width,
    (select user_phone FROM users where user_id=$user_id) as value,
    (select regex_value from regex where regex_name='phone')         as pattern,
    (select regex_description from regex where regex_name='phone')          as description;

SELECT 
    'user_lang'                   as name,
    'Langue'      as label,
    'select'                     as type,
    3                            AS width,
    (select user_level from users where user_id=$user_id) as value,
    'Choisir une langue dans la liste...'    as  empty_option,
    json_group_array(json_object('label',i.choice_label, 'value', i.choice_value))  AS options
    FROM choices_items AS i
    LEFT JOIN (select choice_category_id, choice_category_name from choices_categories)  AS c 
    ON i.choice_category_id = c.choice_category_id
    where choice_category_name="lang"
    ORDER BY  i.choice_label ASC;


SELECT 
    'user_short_cv' AS name,
    'textarea' as type, 
    'Qui êtes-vous ?'as label,
    12 AS width,
    (select user_short_cv FROM users where user_id=$user_id) as value,
    'Une courte description de vos fonctions et votre parcours en lien avec la plate-forme Co-Op' AS placeholder;


    
