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
    'Enregistrer un materiau' as title,
    'Créer' as validate,
    'Clear' as reset,
    '/e_project_products/product_main_create_0.sql' as action;

select 
    'product_category_id'            as name,
    'Catégorie'                  as label,
    'select'                       as type,
    4                             AS width,
    TRUE as required,
'Choisir une categorie dans la liste...'    as  empty_option,
json_group_array(json_object(
    'label', product_category_name,
    'value', product_category_id
)) as options
from project_products_categories where product_category_parent_id=:product_category_id;

SELECT
    'product_name' as name,
    'text' as type,  
    'Nom' as label,
    9 AS width,
    TRUE as required;

SELECT
    'product_ienes_url' as name,
    'text' as type,  
    'URL Fiche base IENES' as label,
    12 AS width,
    TRUE as required;

SELECT 
    'product_functional_unit'                as name,
    'Unité fonctionnelle'                 as label,
    'textarea'                           as type,
    12                                  as width;

SELECT 
    'product_unit'                as name,
    'Unité'                 as label,
    'text'                           as type,
    4                                  as width;

SELECT 
    'product_climate_change_indicator'                as name,
    'Indicateur réchauffement climatique total'                 as label,
    'text'                           as type,
    'kg CO2 eq.'                     as suffix,
    4                                as width;

SELECT
    'product_summary' as name,
    'textarea' as type,
    12                                  as width,
    'Commentaires' as label;


