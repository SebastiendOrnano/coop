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

SELECT 
    'form' as component,
    'Créer un membre de l''organisation' as title,
    'Créer' as validate,
   'Clear' as reset,
    '/b_members/member_main_create_0.sql' as action;

SELECT 
    'member_gender'        as name,
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
    'member_category'        as name,
    'Categorie'               as label,
    'select'                as type,
    3                     AS width,
    'Choisir une categorie...' as empty_option,
    json_group_array(json_object('label',i.choice_label, 'value', i.choice_value))  AS options
    FROM choices_items AS i
    LEFT JOIN (select choice_category_id, choice_category_name from choices_categories)  AS c 
    ON i.choice_category_id = c.choice_category_id
    where choice_category_name="member_category"
    ORDER BY  i.choice_label ASC;

 SELECT 
    'member_status'        as name,
    'Actif-Inactif'               as label,
    'select'                as type,
    3                      AS width,
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
    3                     AS width,
    'Profil public ou caché...' as empty_option,
    '[
    {"label": "Public", "value": "yes"},
    {"label": "Privé", "value": "no"}
    ]' as options;

select 
    'file' as type, 
    'member_picture_url' as name,
    'Photo à insérer' as label,
    'image/*' as accept;

SELECT
    'member_first_name' as name,
    'text' as type,  
    'Prénom' as label,
    6 AS width,
    'prénom de l''adhérent' AS placeholder;

SELECT
    'member_last_name' as name,
    'text' as type,  
    'Nom' as label,
    TRUE as required,
    6 AS width,
    'Nom de famille de l''adhérent' AS placeholder;

SELECT 
    'member_phone' as name,
    'Téléphone' as label,
    'text' as type, 
    4 AS width,
-- TRUE as required,
   (select regex_value from regex where regex_name='phone')         as pattern,
   (select regex_description from regex where regex_name='phone')          as description;

SELECT 
    'member_email' as name,
    'Email' as label,
    'text' as type, 
    8 AS width,
    TRUE as required,
   (select regex_value from regex where regex_name='email')         as pattern,
   (select regex_description from regex where regex_name='email')          as description;

 SELECT 
    'member_date_birthday' as name,
    'Date de naissance' as label,
    'date'       as type, 
    4 AS width,
   (select regex_value from regex where regex_name='date')         as pattern,
   (select regex_description from regex where regex_name='date')          as description;

 SELECT 
    'member_date_since' as name,
    'Membre depuis' as label,
    'date'       as type, 
    4 AS width,
   (select regex_value from regex where regex_name='date')         as pattern,
   (select regex_description from regex where regex_name='date')          as description;

 SELECT 
    'member_date_last_subscription' as name,
    'Dernière date cotisation' as label,
    'date'       as type,
    4 AS width,
   (select regex_value from regex where regex_name='date')         as pattern,
   (select regex_description from regex where regex_name='date')          as description;

SELECT 
    'member_function' as name,
    'text' as type,
    'fonction' as label,
    'fonction ou rôle dans l''organisation' as description,
    'directeur ou chargé de mission' AS placeholder,
     3 AS width;


select 
    'hidden' as type, 
    'member_picture_title' as name,
    'portrait    de   ' ||(SELECT CONCAT ( member_first_name,'   ',member_last_name)  FROM members WHERE member_id = $member_id) as value,
    'Photo portrait ' as label,
    'formats acceptés : jpg,jpeg,png' as description,
    true as required;

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
    'Résumé du parcours et des fonctions. Format Markdown (dans la liste générale des membres utilisez [preview] pour vérifier le balisage md)' as description,
    (Select member_cv_short FROM members WHERE member_id = $member_id) as value;

SELECT 
    'member_cv_long' as name,
    'textarea' as type,
    'Long CV' as label,
    'CV détaillé. Format Markdown (dans la liste générale des membres utilisez [preview] pour vérifier le balisage md)' as description,
    (Select member_cv_long FROM members WHERE member_id = $member_id) as value;

select 
    'orga_dept_id' as name,
    'nom du département ou de la filiale de rattachement' as label,
    'select' as type,
    6 AS width,
    TRUE as searchable,
   'Saisissez quelques lettres du titre que vous cherchez ou choississez dans la liste' as empty_option,
    json_group_array(json_object('label',o.orga_name||'('||o.orga_id||')--'||d.orga_dept_name||'('||d.orga_dept_id ||')', 'value', d.orga_dept_id))  AS options
    FROM orga_dept AS d
    LEFT JOIN orga AS o 
    ON d.orga_id = o.orga_id
    ORDER BY  o.orga_name ASC, d.orga_dept_name ASC;



