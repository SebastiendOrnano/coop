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
select 
    'Gestion des catégorie'            as title,
    '/e_project_products/product_category_main_display_3.sql'      as link;

set product_category_parent_id = select product_category_id from project_products_categories where product_category_id = :product_category_id;


SELECT 
    'form' as component,
    '' as validate;
SELECT
    'product_category_id' as name,
    'text' as type,  
    'id ' as label,
    2 AS width,
     (select product_category_id from project_products_categories where product_category_id=:product_category_id) as value;
SELECT
    'product_category_name' as name,
    'text' as type,  
    'Nom de la catégorie parente' as label,
    10 AS width,
     (select product_category_name from project_products_categories where product_category_id=:product_category_id) as value;


SELECT 
    'form' as component,
    'Créer une categorie - étape 2 : définir la catégorie' as title,
    'Créer' as validate,
    '/e_project_products/product_category_main_create2_0.sql' as action;

SELECT
    'product_category_parent_id' as name,
    'hidden' as type,
    $product_category_parent_id as value;

SELECT
    'product_category_name' as name,
    'text' as type,  
    'Nom de la categorie' as label,
    4 AS width,
    TRUE as required;

SELECT
    'product_category_summary' as name,
    'text' as type,  
    'Description de la categorie' as label,
    8 AS width;


