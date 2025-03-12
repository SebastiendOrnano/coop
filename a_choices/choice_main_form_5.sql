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
    'Gestion des choix'            as title,
    '/a_choices/choice_main_display_5.sql'      as link;


SELECT 
    'form' as component,
    'Créer un choix' as title,
    'Créer' as validate,
    '/a_choices/choice_main_create_0.sql' as action;

SELECT
    'choice_label' as name,
    'text' as type,  
    'Nom' as label,
    4 AS width,
    TRUE as required;

SELECT 
    'choice_value'            as name,
    'text' as type,  
    'Valeur' as label,
    4 AS width,
    TRUE as required;

select 
    'choice_category_id'            as name,
    'Catégorie'                  as label,
    'select'                       as type,
    4                             AS width,
    TRUE as required,
'Choisir une categorie dans la liste...'    as  empty_option,
json_group_array(json_object(
    'label', choice_category_name,
    'value', choice_category_id
)) as options
from choices_categories;




















