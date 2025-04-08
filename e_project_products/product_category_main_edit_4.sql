SELECT 'dynamic' AS component, sqlpage.run_sql('a_shells/shell_4.sql') AS properties;

select 
    'breadcrumb' as component;
select 
    'Home' as title,
    '/'    as link;
select 
    'Gestion admin'         as title,
    '/a_panels/panel_supervisor_4.sql' as link;
select 
    'Listes des project'         as title,
    '/e_project/project_main_display_4.sql'     as link;
select 
    'Listes des matériaux'         as title,
    '/e_project_products/product_main_display_4.sql'     as link;
select 
    'Catégorie de matériaux'         as title,
    '/e_project_products/product_category_main_display_4.sql'     as link;

SELECT 
    'form' as component,
    'Actualiser une categorie de choix' as title,
    'Créer' as validate,
    '/e_project_products/product_category_main_update_0.sql?product_category_id='||$product_category_id as action;


SELECT
'product_category_name' as name,
'text' as type,  
'Nom de la categorie' as label,
(select product_category_name from project_products_categories where product_category_id = $product_category_id) as value,
 4 AS width,
TRUE as required;

SELECT
'product_category_summary' as name,
'text' as type,  
'Description de la catégorie' as label,
(select product_category_summary from project_products_categories where product_category_id = $product_category_id) as value,
 4 AS width;

SELECT
'product_category_status' as name,
'text' as type,  
'Statut de la categorie' as label,
(select product_category_status from project_products_categories where product_category_id = $product_category_id) as value,
 4 AS width,
TRUE as required;


