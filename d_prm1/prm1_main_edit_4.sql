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
    'Gestion des personnes physiques'            as title,
    '/d_prm1/prm1_main_display_4.sql' as link;

select 
    'form'            as component,
    'Actualiser le profil de : '|| (select prm1_first_name ||'   '|| prm1_last_name FROM prm1 WHERE prm1_id= $prm1_id) as title ,
    'Mettre à jour le profil' as validate,
    'green'           as validate_color,
    '/d_prm1/prm1_main_update_0.sql?prm1_id='||$prm1_id as action,
    'Clear'           as reset;

SELECT 
    'prm1_gender'        as name,
    'Genre'               as label,
    'select'                as type,
    3                      AS width,
    (select prm1_gender FROM prm1  WHERE prm1_id = $prm1_id) as value,
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
    (select prm1_category FROM prm1  WHERE prm1_id = $prm1_id) as value,
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
    (select prm1_status FROM prm1  WHERE prm1_id = $prm1_id) as value,
    3                      AS width,
    'Choisir un statut...' as empty_option,
    json_group_array(json_object('label',i.choice_label, 'value', i.choice_value))  AS options
    FROM choices_items AS i
    LEFT JOIN (select choice_category_id, choice_category_name from choices_categories)  AS c 
    ON i.choice_category_id = c.choice_category_id
    where choice_category_name="status"
    ORDER BY  i.choice_label ASC;

SELECT
    'prm1_first_name' as name,
    'text' as type,  
    'Prénom' as label,
    'prénom de l''adhérent' AS placeholder,
    6 AS width,
    (select prm1_first_name  FROM prm1 WHERE prm1_id = $prm1_id) as value;

SELECT
    'prm1_last_name' as name,
    'text' as type,  
    'Nom' as label,
    6 AS width,
    'Nom de famille de l''adhérent' AS placeholder,
    (Select prm1_last_name FROM prm1 WHERE prm1_id = $prm1_id) as value;

SELECT 
    'prm1_phone' as name,
    'Téléphone' as label,
    'text' as type, 
    6 AS width,
    'téléphone' AS placeholder, 

    -- regex moins restrictive '^(?:(?:\+|00)33[\s.-]{0,3}(?:\(0\)[\s.-]{0,3})?|0)[1-9](?:(?:[\s.-]?\d{2}){4}|\d{2}(?:[\s.-]?\d{3}){2})$' as pattern,
    '^(?:(?:\+|00)33|0)\s*[1-9] (?:[\s.-]*\d{2}){4} $' as pattern,
    'format +33 6 00 00 00 00' as description,
    (Select prm1_phone FROM prm1 WHERE prm1_id = $prm1_id) as value;

SELECT 
    'prm1_email' as name,
    'Email' as label,
    'text' as type, 
    6 AS width,
    'email' AS placeholder, 
    '^[a-zA-Z0-9\.]+@[a-zA-Z0-9]+\.[a-zA-Z0-9]{2,4}$' as pattern, 
    'format xxx.sss@xxxxx.xx' as description,
     (Select prm1_email FROM prm1 WHERE prm1_id = $prm1_id) as value;

SELECT 
    'prm1_date_birthday' as name,
    'Date de naissance' as label,
    'date'       as type,
    4 AS width,
    '^[0-9]{4}-(((0[13578]|(10|12))-(0[1-9]|[1-2][0-9]|3[0-1]))|(02-(0[1-9]|[1-2][0-9]))|((0[469]|11)-(0[1-9]|[1-2][0-9]|30)))$' as pattern, 
    'format : DD-MM-YYYY' as description,
    (Select prm1_date_birthday FROM prm1 WHERE prm1_id = $prm1_id) as value;

SELECT 
    'prm1_function' as name,
    'text' as type,
    'fonction' as label,
    'fonction ou rôle' as description,
    4 AS width,
    (Select prm1_function FROM prm1 WHERE prm1_id = $prm1_id) as value;

SELECT 
    'prm1_cv_short' as name,
    'textarea' as type,
    'Short CV' as label,
    'Résumé du parcours et des fonctions ' as description,
    (Select prm1_cv_short FROM prm1 WHERE prm1_id = $prm1_id) as value;

SELECT 
    'prm1_cv_long' as name,
    'textarea' as type,
    'Long CV' as label,
    'CV détaillé' as description,
    (Select prm1_cv_long FROM prm1 WHERE prm1_id = $prm1_id) as value;


