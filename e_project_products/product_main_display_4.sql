SELECT 'dynamic' AS component, sqlpage.run_sql('a_shells/shell_4.sql') AS properties;

select 
    'breadcrumb' as component;
select 
    'Home' as title,
    '/'    as link;
select 
    'Gestion Superviseur'         as title,
    '/a_panels/panel_supervisor_4.sql' as link;
 select 
    'Retour à la liste des projets'            as title,
    '/e_project/project_main_display_4.sql'     as link;

select 
    'datagrid'              as component,
    'panel_project_display' as id;
select 
    '/e_project_products/product_main_form_step1_4.sql'      as link,
    'Création d''un materiau'                  as description,
    'trash'                                      as icon,
    'yellow'                                         as color;
select 
    '/e_project_products/product_archive_display_4.sql'           as link,
    'Visualiser les materiaux achivées'           as description,
    'archive'                                     as icon,
    'green'                                              as color;
select 
    '/e_project_products/product_category_main_display_4.sql'           as link,
    'Catégories de matériaux'                      as description,
    'list-details'                                     as icon,
    'red'                                       as color;

select 
    'divider' as component,
    'Liste des materiaux employés sur les projets'    as contents,
    'blue' as color;

SELECT 'table' AS component, 
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
    (select product_category_name from project_products_categories where product_category_id=t.product_category_parent_id) as cat1,
    t.product_category_name                                       as Cat2,
    '['||p.product_name||']('||p.product_ienes_url||')'            AS Nom,
    p.product_climate_change_indicator                            as IndicCO2,
    '[Edit](/e_project_products/product_main_edit_4.sql?product_id='||product_id||')&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [Delete](/e_project_products/product_main_delete_alert_4.sql?product_id='||product_id||')'    AS View
FROM tree_category_view as t
LEFT JOIN (select product_id, product_name, product_category_id, product_climate_change_indicator, product_ienes_url, product_status from project_products) as p
on t.product_category_id=p.product_category_id
WHERE p.product_status='active'
ORDER BY t.order_sequence;
