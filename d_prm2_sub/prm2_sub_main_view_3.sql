SELECT 'dynamic' AS component, sqlpage.run_sql('a_shells/shell_3.sql') AS properties;

SET prm2_id = SELECT prm2_id FROM prm2_sub WHERE prm2_sub_id = $prm2_sub_id;
SET prm2_sub_name = (select prm2_sub_name  FROM prm2_sub  WHERE prm2_sub_id = $prm2_sub_id);
SET prm2_sub_logo_url = (select prm2_sub_logo_url  FROM prm2_sub  WHERE prm2_sub_id = $prm2_sub_id);
SET prm2_name = 
(SELECT prm2_name FROM prm2_sub AS d 
LEFT  JOIN prm2 AS o
ON o.prm2_id = d.prm2_id
WHERE prm2_sub_id = $prm2_sub_id);

select 
    'breadcrumb' as component;
select 
    'Home' as title,
    '/'    as link;
select 
    'Gestion éditeur'       as title,
    '/a_panels/panel_supervisor_3.sql' as link;
select 
    'Gestion des organisations'            as title,
    '/d_prm2/prm2_main_display_3.sql'      as link;
select 
    'Retour à la structure  mère'            as title,
    '/d_prm2_sub/prm2_sub_main_display_3.sql?prm2_id='||$prm2_id      as link;    

select 
    'title'     as component,
     'Rappel du nom de la structure mère'    as contents,
    3           as level;

SELECT 
    'form' as component,
    '' as validate;

SELECT
    'prm2_id' as name,
    'text' as type,  
    'ID' as label,
    1 as width,
    $prm2_id as value;
SELECT
    'prm2_name' as name,
    'text' as type,  
    'Nom de la structure mère' as label,
    11 as width,
    $prm2_name as value;


select 
    'title'                                     as component,
    'Coordonnées générales de l''entreprise'    as contents,
    3                                           as level;

SELECT 
    'text' as component,
    '![logo]('||$prm2_sub_logo_url||')' as contents_md;

SELECT 
    'form' as component,
    '' as validate;

SELECT 
'prm2_sub_status'       as name,
'Statut'                 as label,
'text'                 as type,
2                       AS width,
true                   as readonly,
(select prm2_sub_status   FROM prm2_sub  WHERE prm2_sub_id = $prm2_sub_id) as value;;

SELECT
    'prm2_sub_name' as name,
    'text' as type,  
    'Nom' as label,
    8 AS width,
    true                   as readonly,
    (select prm2_sub_name  FROM prm2_sub  WHERE prm2_sub_id = $prm2_sub_id) as value;

SELECT
    'prm2_sub_acronym' as name,
    'text' as type,  
    'Sigle' as label,
    2 AS width,
    true                   as readonly,
    (select prm2_sub_acronym  FROM prm2_sub  WHERE prm2_sub_id = $prm2_sub_id) as value;

SELECT 
    'prm2_sub_contact_phone' as name,
    'Téléphone contact' as label,
    'text' as type, 
    3 AS width,
    true                   as readonly,
    (Select prm2_sub_contact_phone  FROM prm2_sub  WHERE prm2_sub_id = $prm2_sub_id) as value;

SELECT 
    'prm2_sub_contact_mail' as name,
    'Email contact' as label,
    'text' as type, 
    5 AS width,
    true                   as readonly,
    (Select prm2_sub_contact_mail  FROM prm2_sub  WHERE prm2_sub_id = $prm2_sub_id) as value;


select 
    'title'     as component,
    'Liste des contacts'    as contents,
    3           as level;
SELECT 
    'table'               AS component, 
    TRUE                  AS sort, 
    'View'                AS markdown, 
    TRUE                AS search;

SELECT
    e.employee_id              AS id,
    p.prm1_first_name          AS Prénom,
    P.prm1_last_name           AS Nom,
    e.employee_function        AS Poste,
    p.prm1_phone           AS Phone,
    p.prm1_email           AS Email
FROM prm1  as p
LEFT JOIN (SELECT employee_id, employee_function, employee_status, prm2_sub_id, prm1_id FROM prm2_sub_employees) as e
ON p.prm1_id = e.prm1_id
WHERE e.prm2_sub_id = $prm2_sub_id AND e.employee_status='active' AND e.employee_function !='employee' 
ORDER BY created_at ASC;

select 
    'title'     as component,
    'Données détaillées département de l''organisation  '||$prm2_sub_name   as contents,
    3           as level;

SELECT 
    'form' as component,
    '' as validate;

SELECT
    'prm2_sub_punchline' as name,
    'text' as type,  
    'Slogan' as label,
    true                   as readonly,
    (select prm2_sub_punchline  FROM prm2_sub  WHERE prm2_sub_id = $prm2_sub_id) as value;

    SELECT
    'prm2_sub_summary' as name,
    'textarea' as type,  
    'Pitch' as label,
    true                   as readonly,
    (select prm2_sub_summary  FROM prm2_sub  WHERE prm2_sub_id = $prm2_sub_id) as value;

SELECT 
    'prm2_sub_adress' as name,
    'adress' as label,
    'text' as type, 
    true                   as readonly,
    'adress' AS placeholder, 
    (select prm2_sub_adress  FROM prm2_sub  WHERE prm2_sub_id = $prm2_sub_id) as value;

SELECT 
    'prm2_sub_postal_code' as name,
    'code postal' as label,
    3 AS width,
    'text' as type, 
    true                   as readonly,
    'code postal' AS placeholder, 
    (select prm2_sub_postal_code  FROM prm2_sub  WHERE prm2_sub_id = $prm2_sub_id) as value;

SELECT 
    'prm2_sub_town' as name,
    'ville' as label,
    'text' as type,
    6 AS width,
    true                   as readonly,
    'ville' AS placeholder, 
    (select prm2_sub_town  FROM prm2_sub  WHERE prm2_sub_id = $prm2_sub_id) as value;

SELECT 
    'prm2_sub_country' as name,
    'Pays' as label,
    'text' as type, 
    3 AS width,
    true                   as readonly,
    'France..' AS placeholder, 
    (select prm2_sub_country  FROM prm2_sub  WHERE prm2_sub_id = $prm2_sub_id) as value;

SELECT 
    'prm2_sub_latitude' as name,
    'Latitude' as label,
    'text' as type, 
    true                   as readonly,
    2 as width,
    (select prm2_sub_latitude  FROM prm2_sub  WHERE prm2_sub_id = $prm2_sub_id) as value;

SELECT 
    'prm2_sub_longitude' as name,
    'longitude' as label,
    'text' as type,
    true                   as readonly, 
    2 as width,
    (select prm2_sub_longitude  FROM prm2_sub  WHERE prm2_sub_id = $prm2_sub_id) as value;

SELECT 
    'prm2_sub_legal_status'            as name,
    'Statut légal'                 as label,
    'select'                       as type,
    true                   as readonly,
    3                              AS width,
    (select prm2_sub_legal_status  FROM prm2_sub  WHERE prm2_sub_id = $prm2_sub_id) as value;

SELECT 
    'prm2_sub_date_creation' as name,
    'Date de création'       as label,
    'date'                      as type,
    true                   as readonly,
    (select prm2_sub_date_creation  FROM prm2_sub  WHERE prm2_sub_id = $prm2_sub_id) as value,
    3                            AS width;

SELECT
    'prm2_sub_no_siret' as name,
    'text' as type,  
    'SIRET' as label,
    3 as width,
    true                   as readonly,
    (select prm2_sub_no_siret  FROM prm2_sub  WHERE prm2_sub_id = $prm2_sub_id) as value;

SELECT
    'prm2_sub_no_siren' as name,
    'text' as type,  
    'SIREN' as label,
    3 as width,
    true                   as readonly,
    (select prm2_sub_no_siren  FROM prm2_sub  WHERE prm2_sub_id = $prm2_sub_id) as value;

SELECT
    'prm2_sub_no_rna' as name,
    'text' as type,  
    'RNA (asso 1901)' as label,
    3 as width,
    true                   as readonly,
    (select prm2_sub_no_rna  FROM prm2_sub  WHERE prm2_sub_id = $prm2_sub_id) as value;

SELECT
    'prm2_sub_no_tva_intracom' as name,
    'text' as type,  
    'N° TVA Intracom' as label,
    3 as width,
    true                   as readonly,
    (select prm2_sub_no_tva_intracom  FROM prm2_sub  WHERE prm2_sub_id = $prm2_sub_id) as value;

SELECT
    'prm2_sub_code_naf_ape' as name,
    'text' as type,  
    'Code NAF APE' as label,
    3 as width,
    true                   as readonly,
    (select prm2_sub_code_naf_ape FROM prm2_sub  WHERE prm2_sub_id = $prm2_sub_id) as value;

SELECT
    'prm2_sub_nb_employees' as name,
    'text' as type,  
    'Nombre d''empoyés' as label,
    3 as width,
    true                   as readonly,
    (select prm2_sub_nb_employees FROM prm2_sub  WHERE prm2_sub_id = $prm2_sub_id) as value;
