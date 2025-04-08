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
    'Projets'            as title,
    '/e_project/project_main_display_3.sql'     as link;
 select 
    'Hub du projet'            as title,
    '/e_project/project_hub_display_3.sql?project_id='||$project_id     as link; 
select 
    'Hub lot de travaux'    as title,
    '/e_project_workpackage/workpackage_hub_display_3.sql?workpackage_id='||$workpackage_id as link;
select 
    'Déchets'            as title,
    '/e_project_workpackage_waste/waste_main_display_3.sql?workpackage_id='||$workpackage_id    as link;


SELECT 
    'form' as component,
    'Energistrer un déchet' as title,
    'Créer' as validate,
    'Clear' as reset,
    '/e_project_workpackage_waste/waste_main_form_step2_3.sql?workpackage_id='||$workpackage_id as action;


SELECT 
    'waste_category'                as name,
    'Catégorie'                 as label,
    'select'                           as type,
    3                                  as width,
    TRUE                              as required,
    'Choisir un type dans la liste'   AS empty_option,
    json_group_array(json_object('label',product_category_name, 'value', product_category_id))  AS options
    FROM project_products_categories where product_category_parent_id IS NULL or product_category_parent_id ='' ;

