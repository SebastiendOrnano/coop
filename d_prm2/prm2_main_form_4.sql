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
    'Gestion des organisations'            as title,
    '/d_prm2/prm2_main_display_4.sql'      as link;


SELECT 
    'form' as component,
    'Créer une organization' as title,
    'Créer' as validate,
    'prm2_main_create_0.sql' as action;

select 
    'prm2_id' as name,
    'hidden' as type,
    $prm2_id as value,
    'id' as label;

SELECT
'prm2_name' as name,
'text' as type,  
'Nom' as label,
 9 AS width,
TRUE as required;

SELECT
'prm2_acronym' as name,
'text' as type,  
'Sigle' as label,
 3 AS width;

SELECT
'prm2_punchline' as name,
'text' as type,  
'Punchline' as label;

SELECT
'prm2_summary' as name,
'textarea' as type,  
'Pitch' as label;

SELECT
    'file'                  as type, 
    'prm2_logo_url'          as name,
    'Logo'    as label,
    'image/*' as accept;

SELECT 
'prm2_adress' as name,
'adress' as label,
'text' as type, 
'adress' AS placeholder;

SELECT 
'prm2_postal_code' as name,
'code postal' as label,
 3 AS width,
'text' as type, 
'code postal' AS placeholder;

SELECT 
'prm2_town' as name,
'ville' as label,
'text' as type,
 6 AS width,
'ville' AS placeholder;

SELECT 
'prm2_country' as name,
'Pays' as label,
'text' as type, 
3 AS width,
'France..' AS placeholder;

SELECT 
    'prm2_contact_phone' as name,
    'Téléphone' as label,
    'text' as type, 
    3 AS width,
    'téléphone' AS placeholder, 
    -- regex moins restrictive '^(?:(?:\+|00)33[\s.-]{0,3}(?:\(0\)[\s.-]{0,3})?|0)[1-9](?:(?:[\s.-]?\d{2}){4}|\d{2}(?:[\s.-]?\d{3}){2})$' as pattern,
    '^(?:(?:\+|00)33|0)\s*[1-9] (?:[\s.-]*\d{2}){4} $' as pattern,
    'format +33 6 00 00 00 00' as description;

SELECT 
    'prm2_contact_mail' as name,
    'Email' as label,
    'text' as type, 
    5 AS width,
    'email' AS placeholder, 
    '^[a-zA-Z0-9\.]+@[a-zA-Z0-9]+\.[a-zA-Z0-9]{2,4}$' as pattern, 
    'format xxx.sss@xxxxx.xx' as description;

SELECT 
'prm2_latitude' as name,
'Latitude' as label,
'text' as type, 
(select regex_value from regex where regex_name='latitude')         as pattern,
(select regex_description from regex where regex_name='latitude')          as description, 
2 as width;

SELECT 
'prm2_longitude' as name,
'longitude' as label,
'text' as type, 
(select regex_value from regex where regex_name='longitude')         as pattern,
(select regex_description from regex where regex_name='longitude')          as description,
2 as width;

SELECT 
'prm2_legal_status'            as name,
'Statut légal'                 as label,
'select'                       as type,
3                              AS width,
'Choisir un statut dans la liste...'    as  empty_option,
    json_group_array(json_object('label',i.choice_label, 'value', i.choice_value))  AS options
    FROM choices_items AS i
    LEFT JOIN (select choice_category_id, choice_category_name from choices_categories)  AS c 
    ON i.choice_category_id = c.choice_category_id
    where choice_category_name="legal_status"
    ORDER BY  i.choice_label ASC;

SELECT 
    'prm2_date_creation' as name,
    'Date de création'       as label,
    'date'                      as type,
    3                            AS width,
    '^[0-9]{4}-(((0[13578]|(10|12))-(0[1-9]|[1-2][0-9]|3[0-1]))|(02-(0[1-9]|[1-2][0-9]))|((0[469]|11)-(0[1-9]|[1-2][0-9]|30)))$' as pattern, 
    'format : DD-MM-YYYY'       as description;

SELECT
'prm2_no_siret' as name,
'text' as type,  
'SIRET' as label,
3 as width;

SELECT
'prm2_no_siren' as name,
'text' as type,  
'SIREN' as label,
3 as width;

SELECT
'prm2_no_rna' as name,
'text' as type,  
'RNA (asso 1901)' as label,
3 as width;

SELECT
'prm2_no_tva_intracom' as name,
'text' as type,  
'N° TVA Intracom' as label,
3 as width;

SELECT
'prm2_code_naf_ape' as name,
'text' as type,  
'Code NAF APE' as label,
3 as width;

SELECT
'prm2_number_employees' as name,
'text' as type,  
'Nombre d''empoyés' as label,
3 as width;
















