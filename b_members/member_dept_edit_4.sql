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
    'Gestion des membres'            as title,
    '/b_members/member_main_display_4.sql' as link;
select 
    'Gestion des employés'            as title,
    '/b_orga_dept/orga_dept_member_display_4.sql?orga_dept_id='||$orga_dept_id as link;


select 
    'form'            as component,
    'Actualiser le profil de : '|| (select member_first_name ||'   '|| member_last_name FROM members WHERE member_id= $member_id) as title ,
    'Mettre à jour le profil' as validate,
    'green'           as validate_color,
    '/b_members/member_dept_update_0.sql?member_id=' || $member_id as action,
    'Clear'           as reset;

select 
    'member_id' as name,
    'hidden' as type,
    $member_id as value,
    'id' as label;

select 
    'orga_dept_id_origin' as name,
    'hidden' as type,
    $orga_dept_id as value,
    'dept_id_orgin' as label;
SELECT 
    'member_gender'        as name,
    'Genre'               as label,
    'select'                as type,
    3                      AS width,
    (select member_gender FROM members  WHERE member_id = $member_id) as value,
    'Choisir un genre...' as empty_option,
    json_group_array(json_object('label',i.choice_label, 'value', i.choice_value))  AS options
    FROM choices_items AS i
    LEFT JOIN (select choice_category_id, choice_category_name from choices_categories)  AS c 
    ON i.choice_category_id = c.choice_category_id
    where choice_category_name="gender"
    ORDER BY  i.choice_label ASC;


 SELECT 
    'member_category'        as name,
    'Categorie'               as label,
    'select'                as type,
    3                     AS width,
    (select member_category FROM members  WHERE member_id = $member_id) as value,
    'Choisir une categorie...' as empty_option,
    json_group_array(json_object('label',i.choice_label, 'value', i.choice_value))  AS options
    FROM choices_items AS i
    LEFT JOIN (select choice_category_id, choice_category_name from choices_categories)  AS c 
    ON i.choice_category_id = c.choice_category_id
    where choice_category_name="member_category"
    ORDER BY  i.choice_label ASC;

 SELECT 
    'member_status'        as name,
    'Status'               as label,
    'select'                as type,
    (select member_status FROM members  WHERE member_id = $member_id) as value,
    3                      AS width,
    'Choisir un statut...' as empty_option,
    json_group_array(json_object('label',i.choice_label, 'value', i.choice_value))  AS options
    FROM choices_items AS i
    LEFT JOIN (select choice_category_id, choice_category_name from choices_categories)  AS c 
    ON i.choice_category_id = c.choice_category_id
    where choice_category_name="status"
    ORDER BY  i.choice_label ASC;

SELECT 
    'member_publish'        as name,
    'Public/privé'               as label,
    'select'                as type,
    (select member_publish FROM members  WHERE member_id = $member_id) as value,
    3                     AS width,
    'Profil public ou caché...' as empty_option,
    '[
    {"label": "Public", "value": "yes"},
    {"label": "Privé", "value": "no"}
    ]' as options;

SELECT
    'member_first_name' as name,
    'text' as type,  
    'Prénom' as label,
    'prénom de l''adhérent' AS placeholder,
    6 AS width,
    (select member_first_name  FROM members WHERE member_id = $member_id) as value;

SELECT
    'member_last_name' as name,
    'text' as type,  
    'Nom' as label,
    6 AS width,
    'Nom de famille de l''adhérent' AS placeholder,
    (Select member_last_name FROM members WHERE member_id = $member_id) as value;

SELECT 
    'member_phone' as name,
    'Téléphone' as label,
    'text' as type, 
    6 AS width,
    'téléphone' AS placeholder, 
   (select regex_value from regex where regex_name='phone')         as pattern,
   (select regex_description from regex where regex_name='phone')          as description,
    (Select member_phone FROM members WHERE member_id = $member_id) as value;

SELECT 
    'member_email' as name,
    'Email' as label,
    'text' as type, 
    6 AS width,
    'email' AS placeholder, 
   (select regex_value from regex where regex_name='email')         as pattern,
   (select regex_description from regex where regex_name='email')          as description,
     (Select member_email FROM members WHERE member_id = $member_id) as value;

SELECT 
    'member_date_birthday' as name,
    'Date de naissance' as label,
    'date'       as type,
    4 AS width,
   (select regex_value from regex where regex_name='date')         as pattern,
   (select regex_description from regex where regex_name='date')          as description,
    (Select member_date_birthday FROM members WHERE member_id = $member_id) as value;

 SELECT 
    'member_date_since' as name,
    'Membre depuis' as label,
    'date'       as type,
    4 AS width,
   (select regex_value from regex where regex_name='date')         as pattern,
   (select regex_description from regex where regex_name='date')          as description,
      (Select member_date_since FROM members WHERE member_id = $member_id) as value;

 SELECT 
    'member_date_last_subscription' as name,
    'Dernière date cotisation' as label,
    'date'       as type,
    4 AS width,
   (select regex_value from regex where regex_name='date')         as pattern,
   (select regex_description from regex where regex_name='date')          as description,
    (Select member_date_last_subscription FROM members WHERE member_id = $member_id) as value;

select 
    'orga_dept_id' as name,
    'nom du département ou de la filiale' as label,
    'select' as type,
    8 AS width,
    1      as value,
    TRUE as searchable,
   'Saisissez quelques lettres du titre que vous cherchez ou choississez dans la liste' as description,
    (Select orga_dept_id FROM members WHERE member_id = $member_id) as value,
     json_group_array(json_object('label',o.orga_name||'('||o.orga_id||')--'||d.orga_dept_name||'('||d.orga_dept_id ||')', 'value', d.orga_dept_id))  AS options
    FROM orga_dept AS d
    LEFT JOIN orga AS o 
    ON d.orga_id = o.orga_id
    ORDER BY  o.orga_name ASC, d.orga_dept_name ASC;
    
SELECT 
    'member_function' as name,
    'text' as type,
    'fonction' as label,
    'fonction ou rôle dans l''organisation' as description,
    'directeur ou chargé de mission' AS placeholder,
    4 AS width,
    (Select member_function FROM members WHERE member_id = $member_id) as value;

SELECT 
    'member_punchline' as name,
    'text' as type,
    'Punch line' as label,
    '3 mots pour qualifier le membre' as description,
(   Select member_punchline FROM members WHERE member_id = $member_id) as value;

SELECT 
    'member_cv_short' as name,
    'textarea' as type,
    'Short CV' as label,
    'Résumé du parcours et des fonctions ' as description,
    (Select member_cv_short FROM members WHERE member_id = $member_id) as value;

SELECT 
    'member_cv_long' as name,
    'textarea' as type,
    'Long CV' as label,
    'CV détaillé' as description,
    (Select member_cv_long FROM members WHERE member_id = $member_id) as value;


