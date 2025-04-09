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
    'Actualiser une référence matériau' as title,
    'Actualiser' as validate,
    'Clear' as reset,
    '/e_project_products/product_main_update_0.sql?product_id='||$product_id as action;

SELECT
    'product_name' as name,
    'text' as type,  
    'Nom' as label,
    (select product_name from project_products where product_id = $product_id) as value,
    12 AS width,
    TRUE as required;

SELECT
    'product_ienes_url' as name,
    'text' as type,  
    'URL Fiche base IENES' as label,
    (select product_ienes_url from project_products where product_id = $product_id) as value,
    12 AS width,
    TRUE as required;

SELECT 
    'product_functional_unit'                as name,
    'Unité fonctionnelle'                 as label,
    'textarea'                           as type,
    (select product_functional_unit from project_products where product_id = $product_id) as value,
    12                                  as width;

SELECT 
    'product_unit'                as name,
    'Unité'                 as label,
    'text'                           as type,
    (select product_unit from project_products where product_id = $product_id) as value,
    4                                  as width;

SELECT 
    'product_climate_change_indicator'                as name,
    'Indicateur réchauffement climatique total'                 as label,
    'text'                           as type,
    (select product_climate_change_indicator from project_products where product_id = $product_id) as value,
    'kg CO2 eq.'                     as suffix,
    4                                as width;

SELECT
    'product_summary' as name,
    'textarea' as type,
    (select product_summary from project_products where product_id = $product_id) as value,
    12                                  as width,
    'Commentaires' as label;