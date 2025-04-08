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
    'datagrid'                 as component,
    'panel_product_choice_display'     as id,
    'Gestion des catégories'   as title;
select 
    '/e_project_products/product_category_main_form0_4.sql'     as link,
    'Création d''une nouvelle catégorie'     as description,
    'tournament'                                      as icon,
    'yellow'                                          as color;
select 
    '/e_project_products/product_category_archive_display_4.sql'     as link,
    'Visualiser les categories archivées'           as description,
    'archive'                                       as icon,
    'green'                                         as color;

-- Display list of organizations
SELECT 'table' AS component, 
    'Liste des categories'   AS title, 
    'View'           AS markdown,
    'Nom'           AS markdown,
    TRUE             AS sort, 
    TRUE             AS search;

WITH RECURSIVE tree_category_view AS (
    SELECT 
        product_category_id,
        product_category_parent_id,
        product_category_name,
        0 AS level,
        CAST(product_category_id AS integer) AS order_sequence,
        CAST(product_category_id AS TEXT) AS order_sequence2
    FROM project_products_categories
    WHERE product_category_parent_id IS NULL
    
UNION 

    SELECT 
        p.product_category_id,
        p.product_category_parent_id,
        p.product_category_name,
        level + 1 AS level,
        CAST(order_sequence  || '_' || CAST(p.product_category_id AS integer) AS integer) AS order_sequence,
        CAST(order_sequence2 || '_' || CAST(p.product_category_id AS TEXT) AS TEXT) AS order_sequence2
    FROM project_products_categories as p
    JOIN tree_category_view as t
    ON p.product_category_parent_id = t.product_category_id
)

SELECT
    order_sequence2                                  as order_sequence2,
    CASE
    when product_category_parent_id is NOT NULL or product_category_parent_id !=''
    THEN substr('------------',1,3 * level)||product_category_name            
    ELSE UPPER(product_category_name)  
    END                                              as Nom,
    '[Edit](/e_project_products/product_category_main_edit_4.sql?product_category_id=' || product_category_id || ')&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Delete](/e_project_products/product_category_main_delete_0.sql?product_category_id=' || product_category_id|| ')'    AS View
FROM tree_category_view
ORDER BY order_sequence;
