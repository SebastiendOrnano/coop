SELECT 'dynamic' AS component, sqlpage.run_sql('a_shells/shell_4.sql') AS properties;

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
    'Gestion Superviseur'         as title,
 '/a_panels/panel_supervisor_4.sql' as link;
select 
    'Gestion des personnes physiques'            as title,
    '/d_prm2_sub_employees/prm2_sub_employee_main_display_4.sql?prm2_sub_id='||$prm2_sub_id as link;




SELECT 
    'form' as component,
    'Créer une personne physique' as title,
    'Créer' as validate,
    'Clear' as reset,
    '/d_prm2_sub_employees/prm2_sub_employee_main_create_0.sql?prm2_sub_id='||$prm2_sub_id as action;

 SELECT 
    'prm1_gender'        as name,
    'Genre'               as label,
    'select'                as type,
    2                     AS width,
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
    3                     AS width,
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
   (select regex_value from regex where regex_name='phone')         as pattern,
   (select regex_description from regex where regex_name='phone')          as description;


SELECT 
    'prm1_email' as name,
    'Email' as label,
    'text' as type, 
    8 AS width,
    true as required,
    'email' AS placeholder, 
   (select regex_value from regex where regex_name='email')         as pattern,
   (select regex_description from regex where regex_name='email')          as description;

 SELECT 
    'prm1_date_birthday' as name,
    'Date de naissance' as label,
    'date'       as type, 
    4 AS width,
   (select regex_value from regex where regex_name='date')         as pattern,
   (select regex_description from regex where regex_name='date')          as description;

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



