SELECT 'dynamic' AS component, sqlpage.run_sql('a_shells/shell_4.sql') AS properties;

select 
    'breadcrumb' as component;
select 
    'Home' as title,
    '/'    as link;
select 
    'Gestion Admin'         as title,
    '/a_panels/panel_supervisor_4.sql' as link;
select 
    'Listes des project'         as title,
    '/e_project/project_main_display_4.sql'     as link;
select 
    'Listes des matériaux'         as title,
    '/e_project_products/product_main_display_4.sql'     as link;
select 
    'Catégories matériaux actifs'         as title,
    '/e_project_products/product_category_main_display_4.sql'     as link;



-- Display list of organizations
SELECT 'table' AS component, 
    'Liste des ocategories'   AS title, 
    'View'           AS markdown,
    TRUE             AS sort, 
    TRUE             AS search;

SELECT
    product_category_id               AS Id,
    product_category_name            AS Nom,
    product_category_summary         AS Description,
   '[Edit](/a_choices/product_category_edit_4.sql?product_category_id=' || product_category_id || ')&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Delete](/a_choices/product_category_delete_0.sql?product_category_id=' || product_category_id|| ')'    AS View
FROM project_products_categories
WHERE product_category_name IS NOT NULL AND product_category_status ='archived'
ORDER BY product_category_name  ASC;
