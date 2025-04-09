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
    'Créer une categorie de choix' as title,
    'Créer' as validate,
    '/e_project_products/product_category_main_form3_3.sql' as action;

select 
   'product_category_id' as name,
    'Création d''une catégorie - étape 2 : choisir la catégorie parent' as label,
    'select' as type,
    8 AS width,
    TRUE as searchable,
    'Choisissez dans la liste' as empty_option,
    json_group_array(json_object('label', product_category_name, 'value', product_category_id)) AS options
    FROM (
    SELECT product_category_name, product_category_id
    FROM project_products_categories where product_category_parent_id='' or  product_category_parent_id IS NULL
    ORDER BY product_category_id ASC
    );