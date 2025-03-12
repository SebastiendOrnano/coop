SELECT 'dynamic' AS component, sqlpage.run_sql('a_shells/shell_5.sql') AS properties;

select 
    'breadcrumb' as component;
select 
    'Home' as title,
    '/'    as link;
select 
    'Gestion admin'         as title,
    '/a_panels/panel_admin_5.sql' as link;


SELECT 
    'form' as component,
    'Créer une categorie de choix' as title,
    'Créer' as validate,
    '/a_choices/regex_main_create_0.sql' as action;

SELECT
'regex_name' as name,
'text' as type,  
'Nom de la règle' as label,
 4 AS width,
TRUE as required;

SELECT
'regex_value' as name,
'text' as type, 
TRUE as required,
'Règle' as label,
 8 AS width;

SELECT
'regex_description' as name,
'text' as type, 
TRUE as required,
'Description' as label,
 8 AS width;

SELECT
'regex_comment' as name,
'text' as type,  
'Commentaire sur la règle' as label;;


