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
    'Enregistrer un materiau - étape 1 : choisir la famille de matériau' as title,
    'Créer' as validate,
    'Clear' as reset,
    '/e_project_products/product_main_form_step2_3.sql' as action;

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
from project_products_categories where product_category_parent_id IS NULL or product_category_parent_id ='';

/*
SELECT 
    'product_category'                as name,
    'Catégorie'                 as label,
    'select'                           as type,
    3                                  as width,
    TRUE                              as required,
    'Choisir un type dans la liste'   AS empty_option,
    json_group_array(json_object('label',i.product_choice_label, 'value', i.product_choice_value))  AS options
    FROM project_products_choices_items AS i
    LEFT JOIN (select product_category_id, product_category_name from project_products_categories)  AS c 
    ON i.product_category_id = c.product_category_id
    where product_category_name="product_category"
    ORDER BY  i.product_choice_label ASC;
*/
