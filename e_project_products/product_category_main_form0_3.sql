SELECT 'dynamic' AS component, sqlpage.run_sql('a_shells/shell_3.sql') AS properties;

select 
    'breadcrumb' as component;
select 
    'Home' as title,
    '/'    as link;
select 
    'Gestion éditeur'         as title,
    '/a_panels/panel_editor_3.sql' as link;
select 
    'Listes des project'         as title,
    '/e_project/project_main_display_3.sql'     as link;
select 
    'Listes des matériaux'         as title,
    '/e_project_products/product_main_display_3.sql'     as link;


SELECT 
    'form' as component,
    'Créer une categorie de matériaux : étape 1' as title,
    'Créer' as validate,
    '/e_project_products/product_category_main_create0_0.sql' as action;

select 
    'product_choice_category'              as name,
    'radio'                  as type,
    'independant'                   as value,
    'Non lié à une autre catégorie' as description,
    'categorie indépendante'                   as label;
select 
    'product_choice_category' as name,
    'radio'     as type,
    'linked'       as value,
    'Lié à une autre catégorie' as description,
    'sous catégorie'       as label;


