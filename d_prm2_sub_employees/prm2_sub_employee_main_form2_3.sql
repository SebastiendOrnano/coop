SELECT 'dynamic' AS component, sqlpage.run_sql('a_shells/shell_3.sql') AS properties;

SET prm2_sub_name = select prm2_sub_name from prm2_sub where prm2_sub_id = $prm2_sub_id ;
SET prm2_id = select prm2_id from prm2_sub where prm2_sub_id = $prm2_sub_id;
SET prm2_name = select prm2_name from prm2 where prm2_id=$prm2_id;
SET compagny_name = CONCAT($prm2_name, '---',$prm2_sub_name);

select 
    'breadcrumb' as component;
select 
    'Home' as title,
    '/'    as link;
select 
    'Gestion editeur'         as title,
    '/a_panels/panel_editor_3.sql' as link;
select 
    'Gestion des departements'            as title,
    '/d_prm2_sub/prm2_sub_main_display_3.sql?prm2_id='||$prm2_id  as link;
select 
    'Gestion des employés'            as title,
    '/d_prm2_sub_employees/prm2_sub_employee_main_display_3.sql?prm2_sub_id='||$prm2_sub_id  as link;
 '/d_prm2_employees/prm2_sub_employee_main_display_3.sql' as link;

SELECT 
    'form' as component,
    'Créer une personne physique dans l''entreprise : '||$compagny_name as title,
    'Créer' as validate,
   'Clear' as reset,

    '/d_prm2_sub_employees/prm2_sub_employee_main_create_0.sql' as action;


 SELECT 
    'prm2_sub_id'        as name,
    $prm2_sub_id         as value,
    'hidden'             as type;


 SELECT 
    'prm1_gender'        as name,
    'Genre'               as label,
    'select'                as type,
    2                      AS width,
    'Choisir un genre...' as empty_option,
    json_group_array(json_object('label',i.choice_label, 'value', i.choice_value))  AS options
    FROM choices_items AS i
    LEFT JOIN (select choice_category_id, choice_category_name from choices_categories)  AS c 
    ON i.choice_category_id = c.choice_category_id
    where choice_category_name="gender"
    ORDER BY  i.choice_label ASC;

SELECT
    'prm1_first_name' as name,
    'text' as type,  
    'Prénom' as label,
    5 AS width,
    'prénom' AS placeholder;

SELECT
    'prm1_last_name' as name,
    'text' as type,  
    'Nom' as label,
    TRUE as required,
    5 AS width,
    'Nom de famille ' AS placeholder;


 SELECT 
    'prm1_category'        as name,
    'Categorie'               as label,
    'select'                as type,
    2                     AS width,
    'Choisir une categorie...' as empty_option,
    json_group_array(json_object('label',i.choice_label, 'value', i.choice_value))  AS options
    FROM choices_items AS i
    LEFT JOIN (select choice_category_id, choice_category_name from choices_categories)  AS c 
    ON i.choice_category_id = c.choice_category_id
    where choice_category_name="prm1_category"
    ORDER BY  i.choice_label ASC;

SELECT 
    'prm1_phone' as name,
    'Téléphone' as label,
    'text' as type, 
    4 AS width,
        '+33 6' as value,
    'téléphone' AS placeholder, 
    --'^(?:(?:\+|00)33[\s.-]{0,3}(?:\(0\)[\s.-]{0,3})?|0)[1-9](?:(?:[\s.-]?\d{2}){4}|\d{2}(?:[\s.-]?\d{3}){2})$' as pattern,
    '^(?:(?:\+|00)33|0)\s*[1-9] (?:[\s.-]*\d{2}){4} $' as pattern,
-- TRUE as required,
    'format +33 6 00 00 00 00' as description;

SELECT 
    'prm1_email' as name,
    'Email' as label,
    'text' as type, 
    6 AS width,
    true as required,
    'email' AS placeholder, 
    '^[a-zA-Z0-9\.]+@[a-zA-Z0-9]+\.[a-zA-Z0-9]{2,4}$' as pattern, 
    'format xxx.sss@xxxxx.xx' as description;

 SELECT 
    'prm1_date_birthday' as name,
    'Date de naissance' as label,
    'date'       as type, 
    4 AS width,
    '^[0-9]{4}-(((0[13578]|(10|12))-(0[1-9]|[1-2][0-9]|3[0-1]))|(02-(0[1-9]|[1-2][0-9]))|((0[469]|11)-(0[1-9]|[1-2][0-9]|30)))$' as pattern, 
    'format : DD-MM-YYYY' as description;

SELECT 
    'prm1_function' as name,
    'text' as type,
    'fonction' as label,
    'fonction ' as description,
     3 AS width;

SELECT 
    'prm1_cv_short' as name,
    'textarea' as type,
    'Short CV' as label,
    'Résumé du parcours et des fonctions. Format Markdown (dans la liste générale utilisez [view] pour vérifier le balisage md)' as description,
    (Select prm1_cv_short FROM prm1 WHERE prm1_id = $prm1_id) as value;

SELECT 
    'prm1_cv_long' as name,
    'textarea' as type,
    'Long CV' as label,
    'CV détaillé. Format Markdown (dans la liste générale utilisez [view] pour vérifier le balisage md)' as description,
    (Select prm1_cv_long FROM prm1 WHERE prm1_id = $prm1_id) as value;

select 
    'employee_title'        as name,
    'text'                  as type,
    3                      AS width,
    'titre (dans l''entreprise)'                as label;

 SELECT 
    'employee_function'        as name,
    'Rôle (dans l''entreprise)'                     as label,
    'select'                   as type,
    3                          AS width,
    'Choisir un rôle...'       as empty_option,
    json_group_array(json_object('label',i.choice_label, 'value', i.choice_value))  AS options
    FROM choices_items AS i
    LEFT JOIN (select choice_category_id, choice_category_name from choices_categories)  AS c 
    ON i.choice_category_id = c.choice_category_id
    where choice_category_name="employee_function"
    ORDER BY  i.choice_label ASC;


SELECT 
    'employee_category'        as name,
    'Categorie (dans l''entreprise)'                as label,
    'select'                   as type,
    3                          AS width,
    'Choisir une categorie...' as empty_option,
    json_group_array(json_object('label',i.choice_label, 'value', i.choice_value))  AS options
    FROM choices_items AS i
    LEFT JOIN (select choice_category_id, choice_category_name from choices_categories)  AS c 
    ON i.choice_category_id = c.choice_category_id
    where choice_category_name="employee_category"
    ORDER BY  i.choice_label ASC;

select 
    'employee_date_since' as name,
    'date'                as type,
    3                     as width,
    'Employé depuis : (dans l''entreprise)'    as label;



