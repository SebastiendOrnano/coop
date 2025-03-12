SELECT 'dynamic' AS component, sqlpage.run_sql('a_shells/shell_4.sql') AS properties;

SELECT 
    'form' as component,
    'Créer un partenaire' as title,
    'Créer' as validate,
   'Clear' as reset,
    '/b_orga_partners/orga_partner_create_0.sql' as action;

SELECT
    'orga_partner_name' as name,
    'text' as type,  
    'Nom' as label,
    TRUE as required,
    8 AS width,
    'Nom du partenaires' AS placeholder;

SELECT
    'orga_partner_acronym' as name,
    'text' as type,  
    'Sigle' as label,
    4 AS width,
    'Sigle du partenaires' AS placeholder;

SELECT 
    'orga_partner_punchline' as name,
    'text' as type,
    'Punch line' as label,
    '3 mots pour qualifier le membre' as description;

SELECT
    'orga_partner_scope' as name,
    'text' as type,  
    'Domaine d''activité' as label,
    4 AS width;

 SELECT 
    'orga_partner_type'            as name,
    'Type     '                    as label,
    'select'                       as type,
    2                              AS width,
    TRUE                          as required,
    'Choisir un type...'    as empty_option,
    json_group_array(json_object('label',i.choice_label, 'value', i.choice_value))  AS options
    FROM choices_items AS i
    LEFT JOIN (select choice_category_id, choice_category_name from choices_categories)  AS c 
    ON i.choice_category_id = c.choice_category_id
    where choice_category_name="partner_type"
    ORDER BY  i.choice_label ASC;

 SELECT 
    'orga_partner_category'        as name,
    'Catégorie'                        as label,
    'select'                       as type,
    2                               AS width,
    'Choisir une categorie...' as empty_option,
    json_group_array(json_object('label',i.choice_label, 'value', i.choice_value))  AS options
    FROM choices_items AS i
    LEFT JOIN (select choice_category_id, choice_category_name from choices_categories)  AS c 
    ON i.choice_category_id = c.choice_category_id
    where choice_category_name="partner_category"
    ORDER BY  i.choice_label ASC;

 SELECT 
    'orga_partner_status'        as name,
    'Statut'                      as label,
    'select'                     as type,
    2                            AS width,
    'Choisir un statut...'       as empty_option,
    json_group_array(json_object('label',i.choice_label, 'value', i.choice_value))  AS options
    FROM choices_items AS i
    LEFT JOIN (select choice_category_id, choice_category_name from choices_categories)  AS c 
    ON i.choice_category_id = c.choice_category_id
    where choice_category_name="status"
    ORDER BY  i.choice_label ASC;

 SELECT 
    'orga_partner_date_since' as name,
    'MPartenaire depuis' as label,
    'date'       as type, 
    2 AS width,
  (select regex_value from regex where regex_name='date')         as pattern,
   (select regex_description from regex where regex_name='date')          as description;

select 
    'file' as type, 
    'orga_partner_logo_url' as name,
    'Photo à insérer' as label,
    'image/*' as accept;

select 
    'hidden' as type, 
    'orga_partner_logo_title' as name,
    'logo de   ' ||(SELECT orga_partner_name FROM orga_partners WHERE orga_partner_id = $orga_partner_id) as value,
    'Nom du logo ' as label,
    'formats acceptés : jpg,jpeg,png' as description,
    true as required;

SELECT
    'orga_partner_link' as name,
    'text' as type,  
    'Lien vers le site du partenaire' as label,
    'https://www.mydomain.com' as placeholder;


SELECT 
    'orga_partner_summary' as name,
    'textarea' as type,
    'Pitch' as label,
    'Présentation du partenaire. Format Markdown (dans la liste générale des membres utilisez [preview] pour vérifier le balisage md)' as description;

select 
    'orga_dept_id' as name,
    'nom du département ou de la filiale de rattachement' as label,
    'select' as type,
    true as required,
    6 AS width,
    1      as value,
    TRUE as searchable,
    TRUE as empty_option,
   'Saisissez quelques lettres du titre que vous cherchez ou choississez dans la liste' as description,
    json_group_array(json_object('label',o.orga_name||'('||o.orga_id||')--'||d.orga_dept_name||'('||d.orga_dept_id ||')', 'value', d.orga_dept_id))  AS options
    FROM orga_dept AS d
    LEFT JOIN orga AS o 
    ON d.orga_id = o.orga_id
    ORDER BY  o.orga_name ASC, d.orga_dept_name ASC;



