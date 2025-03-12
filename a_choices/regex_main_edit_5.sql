SELECT 'dynamic' AS component, sqlpage.run_sql('a_shells/shell_5.sql') AS properties;

select 
    'breadcrumb' as component;
select 
    'Home' as title,
    '/'    as link;
select 
    'Gestion admin'         as title,
    '/a_panels/panel_admin_5.sql' as link;
select 
    'Gestion des règles'            as title,
    '/a_choices/regex_main_display_5.sql'      as link;


SELECT 
    'form' as component,
    'Actualiser un choix' as title,
    'Actualiser' as validate,
    '/a_choices/regex_main_update_0.sql?regex_id='||$regex_id as action;

SELECT
    'regex_name' as name,
    'text' as type,  
    'Nom' as label,
    3 AS width,
    (select regex_name from regex where regex_id=$regex_id) as value,
    TRUE as required;

SELECT 
    'regex_value'            as name,
    'text' as type,  
    'Valeur' as label,
    9 AS width,
    (select regex_value from regex where regex_id=$regex_id) as value,
    TRUE as required;

select 
    'regex_description'                    as name,
    'Description'                             as label,
    'text'                                as type,
    (select regex_description from regex where regex_id=$regex_id) as value;

select 
    'regex_comment'                    as name,
    'Commentaire'                             as label,
    'text'                                as type,
    (select regex_comment from regex where regex_id=$regex_id) as value;

 SELECT 
    'regex_status'            as name,
    'Statut'                 as label,
    'select'                 as type,
    3 AS width,
    TRUE                     as required,
    (select regex_status  FROM regex WHERE regex_id = $regex_id) as value,
    'Choisir un statut dans la liste...' as  empty_option,
    json_group_array(json_object('label',i.choice_label, 'value', i.choice_value))  AS options
    FROM  choices_items AS i 
    LEFT JOIN (select choice_category_id, choice_category_name from choices_categories)  AS c 
    ON i.choice_category_id = c.choice_category_id
    where choice_category_name="status"
    ORDER BY  i.choice_label ASC;




















