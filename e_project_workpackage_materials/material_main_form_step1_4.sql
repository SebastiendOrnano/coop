SELECT 'dynamic' AS component, sqlpage.run_sql('a_shells/shell_4.sql') AS properties;

set workpackage_name = select workpackage_name from project_workpackage where workpackage_id = $workpackage_id;
set project_id=select project_id from project_workpackage where workpackage_id=$workpackage_id ;

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
    'Hub projet'            as title,
    '/e_project/project_hub_display_4.sql?project_id='||$project_id       as link;
select 
    'Hub lot de travaux'            as title,
    '/e_project_workpackage/workpackage_hub_display_4.sql?workpackage_id='||$workpackage_id     as link;
select 
    'Gestion des matériaux'            as title,
    '/e_project_workpackage_material/material_main_display_4.sql?workpackage_id='||$workpackage_id     as link;

SELECT 
    'form' as component,
    'Calcul BC - etape 1 choix du matériaux dans la base' as title,
    'Créer' as validate,
    'Clear' as reset,
    '/e_project_workpackage_materials/material_main_form_step2_4.sql?workpackage_id='||$workpackage_id  as action;


SELECT 
    'product_id'                       as name,
    'Matériau'                       as label,
    'select'                           as type,
    3                                  as width,
    TRUE                              as required,
    'Choisir une catégorie dans la liste'   AS empty_option,
    json_group_array(json_object('label',product_name, 'value', product_id))  AS options
    FROM project_products
    ORDER BY  product_name  ASC;

