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
    '/b_orga/orga_main_display_4.sql'      as link;


SELECT 
    'form' as component,
    'Créer une organization' as title,
    'Créer' as validate,
    'orga_main_create_0.sql' as action;

select 
    'orga_id' as name,
    'hidden' as type,
    $orga_id as value,
    'id' as label;

SELECT
'orga_name' as name,
'text' as type,  
'Nom' as label,
 9 AS width,
TRUE as required;

SELECT
'orga_acronym' as name,
'text' as type,  
'Sigle' as label,
 3 AS width;

SELECT
'orga_punchline' as name,
'text' as type,  
'Punchline' as label;

SELECT
'orga_summary' as name,
'textarea' as type,  
'Pitch' as label;

SELECT
    'file'                  as type, 
    'orga_logo_url'          as name,
    'Logo'    as label,
    'image/*' as accept;

SELECT 
'orga_adress' as name,
'adress' as label,
'text' as type, 
'adress' AS placeholder;

SELECT 
'orga_postal_code' as name,
'code postal' as label,
 3 AS width,
'text' as type, 
'code postal' AS placeholder;

SELECT 
'orga_town' as name,
'ville' as label,
'text' as type,
 6 AS width,
'ville' AS placeholder;

SELECT 
'orga_country' as name,
'Pays' as label,
'text' as type, 
3 AS width,
'France..' AS placeholder;

SELECT 
    'orga_contact_phone' as name,
    'Téléphone' as label,
    'text' as type, 
    3 AS width,
    'téléphone' AS placeholder, 
   (select regex_value from regex where regex_name='phone')         as pattern,
   (select regex_description from regex where regex_name='phone')          as description;

SELECT 
    'orga_contact_mail' as name,
    'Email' as label,
    'text' as type, 
    5 AS width,
    'email' AS placeholder, 
  (select regex_value from regex where regex_name='email')         as pattern,
   (select regex_description from regex where regex_name='email')          as description;

SELECT 
'orga_latitude' as name,
'Latitude' as label,
'text' as type, 
(select regex_value from regex where regex_name='latitude')         as pattern,
(select regex_description from regex where regex_name='latitude')          as description,
2 as width;

SELECT 
'orga_longitude' as name,
'longitude' as label,
'text' as type, 
(select regex_value from regex where regex_name='longitude')         as pattern,
(select regex_description from regex where regex_name='longitude')          as description,
2 as width;

SELECT 
'orga_legal_status'            as name,
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
    'orga_date_creation' as name,
    'Date de création'       as label,
    'date'                      as type,
    3                            AS width,
  (select regex_value from regex where regex_name='date')         as pattern,
   (select regex_description from regex where regex_name='date')          as description;

SELECT
'orga_no_siret' as name,
'text' as type,  
'SIRET' as label,
3 as width;

SELECT
'orga_no_siren' as name,
'text' as type,  
'SIREN' as label,
3 as width;

SELECT
'orga_no_rna' as name,
'text' as type,  
'RNA (asso 1901)' as label,
3 as width;

SELECT
'orga_no_tva_intracom' as name,
'text' as type,  
'N° TVA Intracom' as label,
3 as width;

SELECT
'orga_code_naf_ape' as name,
'text' as type,  
'Code NAF APE' as label,
3 as width;

SELECT
'orga_number_employees' as name,
'text' as type,  
'Nombre d''empoyés' as label,
3 as width;
















