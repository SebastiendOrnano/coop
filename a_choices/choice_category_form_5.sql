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
    'Créer une categorie de choix' as title,
    'Créer' as validate,
    '/a_choices/choice_category_create_0.sql' as action;


SELECT
'choice_category_name' as name,
'text' as type,  
'Nom de la categorie' as label,
 4 AS width,
TRUE as required;

SELECT
'choice_category_summary' as name,
'text' as type,  
'Description de la categorie' as label,
 8 AS width;


